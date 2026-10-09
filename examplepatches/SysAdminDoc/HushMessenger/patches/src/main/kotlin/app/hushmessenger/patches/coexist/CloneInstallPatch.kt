/*
 * The package rename and the encrypted-backup lookup fix are adapted from rushiranpise/morphe-patches,
 * patches/src/main/kotlin/app/template/patches/messenger/misc/ChangePackageNamePatch.kt at
 * e3bb3af54e13ecfac60eb8bf9bdf287330f0529f. GPL-3.0. Modified for HushMessenger, 2026.
 */
package app.hushmessenger.patches.coexist

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.controls.BASE_PROFILE
import app.hushmessenger.patches.controls.PROFILE_346013357
import app.hushmessenger.patches.controls.PROFILE_346013370
import app.hushmessenger.patches.controls.PROFILE_346013374
import app.hushmessenger.patches.controls.PROFILE_346013423
import app.hushmessenger.patches.controls.PROFILE_346213494
import app.hushmessenger.patches.controls.controlProfileFor
import app.hushmessenger.patches.controls.hookId
import app.hushmessenger.patches.controls.resolveShortcutsPath
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.PayloadInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val CLONE_PATCH_NAME = "Clone install under another package name"
internal const val CLONE_DEFAULT_PACKAGE = "com.facebook.orca.hush"
internal const val CLONE_DEFAULT_LABEL = "Messenger Clone"
private const val ORIGINAL = MessengerTarget.PACKAGE
private const val GET_PACKAGE_NAME = "Landroid/content/Context;->getPackageName()Ljava/lang/String;"
private const val SET_PACKAGE = "Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;"
/** The story link button's check that a package is installed, and its store page intent for one. */
private const val INSTALLED_CHECK = "(Landroid/content/pm/PackageManager;Ljava/lang/String;)Z"
private const val STORE_PAGE = "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;"
/** Messenger picks its encrypted-backup preferences by its own package name and throws on any other. */
internal const val BACKUP_PREFS = "autobackupprefs"
internal const val FACEBOOK_BACKUP_PREFS = "fbautobackupprefs"
/** Messenger names its attachment provider after the running package, then checks the name against this list. */
internal const val TAM_AUTHORITY = "$ORIGINAL.tam-attachment"
internal const val TAM_SUFFIX = ".tam-attachment"
internal const val FACEBOOK_TAM_AUTHORITY = "com.facebook.katana.tam-attachment"
/** Install beside Meta apps' names for the two permissions every patched Meta app declares. */
private const val SHARED_PREFIX = "app.hushfacebook."
private const val SETTINGS_SCREENS = "app.hushmessenger.extension.Settings"

/** Messenger itself and the Meta apps it shares accounts with. A clone can't take any of their names. */
private val reservedPackages = setOf(
    ORIGINAL, "com.facebook.katana", "com.facebook.lite", "com.facebook.mlite", "com.facebook.wakizashi",
    "com.instagram.android", "com.instagram.barcelona", "com.whatsapp", "com.whatsapp.w4b",
)
private val packagePattern = Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$")
private val labelPattern = Regex("^[\\p{L}\\p{N}][\\p{L}\\p{N} ._()+!,-]{0,39}$")

internal fun isClonePackage(name: String?) = name != null && name.length <= 150 && packagePattern.matches(name) &&
    reservedPackages.none { it.equals(name, ignoreCase = true) }

internal fun isCloneLabel(label: String?) = label != null && labelPattern.matches(label) && label.trimEnd() == label

private fun fail(detail: String): Nothing =
    throw PatchException("$CLONE_PATCH_NAME: $detail. Start with an unmodified supported APK.")

/** Messenger's own name or one of its own dotted names, moved under [newPackage]. Null for anything else. */
internal fun cloneName(value: String, newPackage: String): String? = when {
    value == ORIGINAL -> newPackage
    value.startsWith("$ORIGINAL.") -> newPackage + value.removePrefix(ORIGINAL)
    else -> null
}

private fun Document.all(tag: String) = getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

private fun Element.children(tag: String) = (0 until childNodes.length)
    .mapNotNull { childNodes.item(it) as? Element }.filter { it.tagName == tag }

private fun Element.isLauncher() = children("intent-filter").any { filter ->
    filter.children("action").any { it.getAttribute("android:name") == "android.intent.action.MAIN" } &&
        filter.children("category").any { it.getAttribute("android:name") == "android.intent.category.LAUNCHER" }
}

/** What the rename changed, for the tests and the patch log. */
internal data class CloneManifest(
    val permissions: Map<String, String>,
    val authorities: Map<String, String>,
    val affinities: Int,
    val pushCategories: Int,
    val labels: Int,
)

private val permissionAttributes = listOf("android:permission", "android:readPermission", "android:writePermission")
private val permissionTags = setOf("permission", "uses-permission", "uses-permission-sdk-23")

/**
 * Moves everything in the manifest that is named after Messenger's package to [newPackage], so the copy installs
 * beside Messenger without a duplicate permission, provider authority or task. Class names stay as they are. They
 * name DEX classes, and the app icon aliases keep the names Messenger's own icon switch looks up.
 */
internal fun Document.renameForClone(newPackage: String, label: String): CloneManifest {
    if (!isClonePackage(newPackage)) fail("$newPackage can't be used as a package name")
    if (!isCloneLabel(label)) fail("\"$label\" can't be used as an app name")
    val manifest = documentElement
    if (manifest.tagName != "manifest" || manifest.getAttribute("package") != ORIGINAL) fail("the manifest isn't Messenger's")
    val application = all("application").singleOrNull() ?: fail("expected one application")

    // Messenger's own permissions move. The two every patched Meta app shares must already carry the shared names,
    // which two apps signed with the same key can both declare.
    val declared = all("permission").map { it.getAttribute("android:name") }
    val permissions = declared.mapNotNull { name -> cloneName(name, newPackage)?.let { name to it } }.toMap()
    val stuck = declared.filter { it !in permissions && !it.startsWith(SHARED_PREFIX) }
    if (stuck.isNotEmpty()) fail("Messenger declares ${stuck.joinToString()} under a name another app can own")
    if (permissions.isEmpty()) fail("Messenger declares no permissions of its own")

    // Providers under <queries> only ask for another app's authority, so only declared ones move.
    val original = mutableListOf<String>()
    val authorities = linkedMapOf<String, String>()
    val providers = application.children("provider").associateWith { provider ->
        val names = provider.getAttribute("android:authorities").split(';').map { it.trim() }.filter { it.isNotEmpty() }
        if (names.isEmpty()) fail("a provider has no authority")
        val moved = names.map { name -> cloneName(name, newPackage) ?: fail("provider authority $name isn't Messenger's own") }
        original += names
        names.zip(moved).forEach { (from, to) -> authorities[from] = to }
        moved.joinToString(";")
    }
    if (authorities.isEmpty() || original.toSet().size != original.size || authorities.values.toSet().size != authorities.size ||
        authorities.values.any { it in authorities.keys }) fail("provider authorities would collide")

    // Everything above can stop the patch. Nothing below can, so a failure leaves the manifest as it was.
    providers.forEach { (provider, moved) -> provider.setAttribute("android:authorities", moved) }
    val everything = all("*")
    for (element in everything) {
        val attributes = permissionAttributes + if (element.tagName in permissionTags) listOf("android:name") else emptyList()
        for (attribute in attributes) permissions[element.getAttribute(attribute)]?.let { element.setAttribute(attribute, it) }
    }

    // Android puts screens with the same affinity in the same task, even across apps.
    var affinities = 0
    for (element in everything) {
        if (!element.hasAttribute("android:taskAffinity")) continue
        val affinity = element.getAttribute("android:taskAffinity")
        if (affinity.isEmpty()) continue
        element.setAttribute("android:taskAffinity", cloneName(affinity, newPackage) ?: "$newPackage.$affinity")
        affinities++
    }

    // Push services address an app by a category equal to its package. Android's satellite hint names it too.
    var pushCategories = 0
    for (filter in all("intent-filter")) for (category in filter.children("category")) {
        if (category.getAttribute("android:name") == ORIGINAL) {
            category.setAttribute("android:name", newPackage)
            pushCategories++
        }
    }
    for (metadata in all("meta-data")) if (metadata.getAttribute("android:value") == ORIGINAL) metadata.setAttribute("android:value", newPackage)

    var labels = 0
    application.setAttribute("android:label", label)
    for (entry in application.children("activity") + application.children("activity-alias")) {
        when {
            entry.getAttribute("android:name").startsWith(SETTINGS_SCREENS) ->
                if (entry.hasAttribute("android:label")) entry.setAttribute("android:label", "$label settings") else continue
            entry.isLauncher() -> entry.setAttribute("android:label", label)
            else -> continue
        }
        labels++
    }
    manifest.setAttribute("package", newPackage)
    return CloneManifest(permissions, authorities, affinities, pushCategories, labels)
}

/** HushMessenger's launcher shortcuts start a screen by package, and a static shortcut can only start its own app. */
internal fun Document.retargetShortcuts(newPackage: String): Int {
    var moved = 0
    for (intent in all("intent")) if (intent.getAttribute("android:targetPackage") == ORIGINAL) {
        intent.setAttribute("android:targetPackage", newPackage)
        moved++
    }
    return moved
}

private fun Method.literals() = implementation?.instructions
    ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.orEmpty()

/** The encrypted-backup preference lookup, which throws NoSuchElementException under any other package name. */
internal fun Method.isBackupLookup() = name == "<init>" && parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(accessFlags) &&
    literals().let { BACKUP_PREFS in it && FACEBOOK_BACKUP_PREFS in it && ORIGINAL in it }

/** Messenger's list of attachment provider authorities, its own first. */
internal fun Method.isAttachmentCheck() = AccessFlags.STATIC.isSet(accessFlags) && returnType == "Z" &&
    parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;") &&
    literals().let { it.count { s -> s == TAM_AUTHORITY } == 1 && TAM_SUFFIX in it && FACEBOOK_TAM_AUTHORITY in it }

private fun Instruction.ownName() = (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
    ((this as ReferenceInstruction).reference as StringReference).string == ORIGINAL

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as OneRegisterInstruction).registerA
    return written == register || opcode.setsWideRegister() && written + 1 == register
}

private val WIDE = Regex("wide|long|double")

/** Wide operands are counted as pairs, so a long or double next to the register reads as a use and stops the patch. */
private fun Instruction.reads(register: Int): Boolean {
    val operands = registers().toMutableList()
    if (this is OneRegisterInstruction && (!opcode.setsRegister() || opcode == Opcode.CHECK_CAST || opcode.name.endsWith("/2addr"))) operands += registerA
    if (this is TwoRegisterInstruction) operands += registerB
    if (this is ThreeRegisterInstruction) operands += registerC
    val wide = WIDE.containsMatchIn(opcode.name)
    return operands.any { it == register || wide && it + 1 == register }
}

/** Redex's string pools: static methods that switch on an int straight to a constant. The keys that give Messenger's name. */
internal fun ownNamePoolKeys(classes: Iterable<ClassDef>): Set<String> = classes.flatMap { it.methods }.flatMap { method ->
    if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "Ljava/lang/String;" ||
        method.parameterTypes.map { it.toString() } != listOf("I")) return@flatMap emptyList()
    val code = method.implementation?.instructions?.toList().orEmpty()
    val switch = code.firstOrNull()?.takeIf { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH } as? OffsetInstruction
        ?: return@flatMap emptyList()
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val indexAt = code.indices.associateBy { addresses[it] }
    val payload = indexAt[switch.codeOffset]?.let(code::get) as? SwitchPayload ?: return@flatMap emptyList()
    payload.switchElements.filter { case ->
        val at = indexAt[case.offset] ?: return@filter false
        code[at].ownName() && code.getOrNull(at + 1)?.let {
            it.opcode == Opcode.RETURN_OBJECT && (it as OneRegisterInstruction).registerA == (code[at] as OneRegisterInstruction).registerA
        } == true
    }.map { "${method.hookId()}#${it.key}" }
}.toSet()

/**
 * Where the setPackage call at [call] last loaded its package name, if that's Messenger's own: a constant, or the result
 * of a string pool lookup by a constant key. Null for any other call or name.
 */
private fun List<Instruction>.ownNameLoad(call: Int, pools: Set<String>): Int? {
    val invoke = getOrNull(call) ?: return null
    val target = (invoke as? ReferenceInstruction)?.reference as? MethodReference
    if (invoke.opcode != Opcode.INVOKE_VIRTUAL || target?.name != "setPackage" || target.toString() != SET_PACKAGE) return null
    val register = invoke.registers()[1]
    val load = (call - 1 downTo 0).firstOrNull { this[it].writes(register) } ?: return null
    if (this[load].ownName()) return load
    if (this[load].opcode != Opcode.MOVE_RESULT_OBJECT || load == 0) return null
    val lookup = this[load - 1]
    val pool = (lookup as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (lookup.opcode != Opcode.INVOKE_STATIC || lookup.registers().size != 1) return null
    val key = (load - 2 downTo 0).firstOrNull { this[it].writes(lookup.registers()[0]) }?.let(::get)
        ?.takeIf { it.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16) } as? NarrowLiteralInstruction
    return load.takeIf { key != null && "$pool#${key.narrowLiteral}" in pools }
}

/** Every setPackage call in [this] that gets Messenger's own name, by instruction index. */
private fun Method.selfIntentCalls(pools: Set<String>): List<Int> {
    val code = implementation?.instructions?.toList() ?: return emptyList()
    return code.indices.filter { code.ownNameLoad(it, pools) != null }
}

/** The backup lookup and attachment check by method, and each setPackage call that sends Messenger to itself by method and index. */
internal fun findCloneSites(classes: Iterable<ClassDef>, pools: Set<String> = ownNamePoolKeys(classes)): Set<String> =
    classes.flatMap { it.methods }.flatMap { method ->
        val calls = method.selfIntentCalls(pools)
        val pinned = method.isBackupLookup() || method.isAttachmentCheck()
        if (calls.isEmpty() && !pinned) emptyList() else (if (pinned) listOf(method.hookId()) else emptyList()) + calls.map { "${method.hookId()}@$it" }
    }.toSet()

private const val ATTACHMENT_CHECK = "->A00(Ljava/lang/String;)Z"
private const val BROADCAST = "->A00(Landroid/content/Intent;Landroid/content/Context;)V"
private const val NOTIFICATION = "->A04(Landroid/os/Bundle;)"
private const val CLICK = "->onClick(Landroid/view/View;)V"

/**
 * Each build family's backup lookup and attachment check, then every setPackage call that sends Messenger to itself:
 * the in-app broadcast sender, the push notification's click and link intents, the bulk delete link in the inbox and
 * the story link button. The native test checks them on all 37 builds.
 */
internal fun expectedCloneSitesFor(versionCode: String): Set<String> {
    validateVersionCode(versionCode)
    return when (controlProfileFor(versionCode)) {
        BASE_PROFILE -> setOf("LX/E6y;-><init>()V", "LX/4M6;$ATTACHMENT_CHECK", "LX/38C;$BROADCAST@1", "LX/6dH;${NOTIFICATION}LX/9KW;@229",
            "LX/6dH;${NOTIFICATION}LX/9KW;@325", "LX/BCT;$CLICK@82", "LX/JgF;$CLICK@164")
        PROFILE_346013370 -> setOf("LX/VLY;-><init>()V", "LX/4MB;$ATTACHMENT_CHECK", "LX/38E;$BROADCAST@1", "LX/6bn;${NOTIFICATION}LX/9Iv;@229",
            "LX/6bn;${NOTIFICATION}LX/9Iv;@325", "LX/BAG;$CLICK@82", "LX/PZK;$CLICK@67")
        PROFILE_346013423 -> setOf("LX/JJK;-><init>()V", "LX/4PA;$ATTACHMENT_CHECK", "LX/39i;$BROADCAST@1", "LX/6dK;${NOTIFICATION}LX/9LJ;@229",
            "LX/6dK;${NOTIFICATION}LX/9LJ;@327", "LX/BE9;$CLICK@82", "LX/ED8;$CLICK@166")
        PROFILE_346013357 -> setOf("LX/E6T;-><init>()V", "LX/4M0;$ATTACHMENT_CHECK", "LX/38E;$BROADCAST@1", "LX/6cr;${NOTIFICATION}LX/9K6;@229",
            "LX/6cr;${NOTIFICATION}LX/9K6;@325", "LX/BC3;$CLICK@82", "LX/Jfb;$CLICK@164")
        PROFILE_346013374 -> setOf("LX/VFG;-><init>()V", "LX/4Ny;$ATTACHMENT_CHECK", "LX/38F;$BROADCAST@1", "LX/6do;${NOTIFICATION}LX/9L0;@229",
            "LX/6do;${NOTIFICATION}LX/9L0;@327", "LX/BCM;$CLICK@82", "LX/PLK;$CLICK@63")
        PROFILE_346213494 -> setOf("LX/E9W;-><init>()V", "LX/4Di;$ATTACHMENT_CHECK", "LX/38G;$BROADCAST@1", "LX/8fw;${NOTIFICATION}LX/9Op;@228",
            "LX/8fw;${NOTIFICATION}LX/9Op;@324", "LX/BCY;$CLICK@81", "LX/JTZ;$CLICK@168")
        else -> fail("version code $versionCode has no checked clone sites")
    }
}

private fun Method.register(index: Int, what: String): Int {
    val register = (implementation!!.instructions.elementAt(index) as OneRegisterInstruction).registerA
    if (register > 255) fail("${hookId()} keeps $what in v$register")
    return register
}

/** Where Messenger's original name goes over the result of getPackageName, and the register it lands in. */
internal fun Method.backupLookupSite(): Pair<Int, Int> {
    if (!isBackupLookup()) fail("${hookId()} is no longer the backup lookup")
    val code = implementation!!.instructions.toList()
    val calls = code.indices.filter { (code[it] as? ReferenceInstruction)?.reference?.toString() == GET_PACKAGE_NAME }
    val call = calls.singleOrNull() ?: fail("the backup lookup reads its package name ${calls.size} times")
    if (code.getOrNull(call + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) fail("the backup lookup ignores its package name")
    return call + 2 to register(call + 1, "the package name")
}

/** Where the attachment check loads Messenger's authority, and the register it lands in. */
internal fun Method.attachmentSite(): Pair<Int, Int> {
    if (!isAttachmentCheck()) fail("${hookId()} is no longer the attachment provider check")
    val at = implementation!!.instructions.indexOfFirst {
        it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == TAM_AUTHORITY
    }
    if (at < 0) fail("the attachment check loads Messenger's authority some other way")
    return at to register(at, "the authority")
}

/**
 * Every instruction that can read what [register] holds right after [load], following branches, switch cases and catch
 * handlers until something overwrites it.
 */
internal fun Method.readersOf(load: Int, register: Int): List<Int> {
    val implementation = implementation!!
    val code = implementation.instructions.toList()
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val indexAt = code.indices.associateBy { addresses[it] }
    fun at(address: Int) = indexAt[address] ?: fail("${hookId()} jumps into the middle of an instruction")
    val readers = sortedSetOf<Int>()
    val seen = mutableSetOf<Int>()
    val pending = ArrayDeque(listOf(load + 1))
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (index >= code.size || !seen.add(index)) continue
        val instruction = code[index]
        if (instruction is PayloadInstruction) continue
        // A throwing instruction leaves the register as it was for its catch handler, even one that would overwrite it.
        if (instruction.opcode.canThrow()) implementation.tryBlocks
            .filter { addresses[index] >= it.startCodeAddress && addresses[index] < it.startCodeAddress + it.codeUnitCount }
            .forEach { block -> block.exceptionHandlers.forEach { pending.add(at(it.handlerCodeAddress)) } }
        if (instruction.reads(register)) readers += index
        if (instruction.writes(register)) continue
        if (instruction is OffsetInstruction && instruction.opcode != Opcode.FILL_ARRAY_DATA) {
            val landing = at(addresses[index] + instruction.codeOffset)
            if (instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH) {
                // Case offsets count from the switch instruction, not from its payload.
                (code[landing] as? SwitchPayload ?: fail("${hookId()} has a switch without its table"))
                    .switchElements.forEach { pending.add(at(addresses[index] + it.offset)) }
            } else pending.add(landing)
        }
        if (instruction.opcode.canContinue()) pending.add(index + 1)
    }
    return readers.toList()
}

/** What an instruction does with Messenger's name: sends an intent to it, checks it's installed, or opens its store page. */
private fun Instruction.ownNameUse(register: Int): String? {
    val method = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (registers().indexOf(register) != 1 || registers().count { it == register } != 1) return null
    val prototype = method.parameterTypes.joinToString("", "(", ")") + method.returnType
    return when {
        opcode == Opcode.INVOKE_VIRTUAL && method.toString() == SET_PACKAGE -> "setPackage"
        opcode == Opcode.INVOKE_STATIC && prototype == INSTALLED_CHECK -> "installed"
        (opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE) && prototype == STORE_PAGE -> "store"
        else -> null
    }
}

/**
 * Where the setPackage call at [call] loads Messenger's name, and the register it lands in. Nothing else may read that
 * name, except the story link button's check that the app is installed and its store page fallback. Those ask about the
 * running app too, so they follow the clone with it.
 */
internal fun Method.selfIntentSite(call: Int, pools: Set<String>): Pair<Int, Int> {
    val code = implementation?.instructions?.toList() ?: fail("${hookId()} has no code")
    val load = code.ownNameLoad(call, pools) ?: fail("${hookId()}@$call no longer sends to Messenger's own package")
    val register = register(load, "its package name")
    val readers = readersOf(load, register)
    val uses = readers.map { code[it].ownNameUse(register) }
    if (readers.lastOrNull() != call || uses != listOf("setPackage") && uses != listOf("installed", "store", "setPackage")) {
        fail("${hookId()} uses Messenger's name for more than the intent at $call")
    }
    return load to register
}

/**
 * Ported from the auto-restore crash fix: the lookup sees Messenger's name and keeps Messenger's backup preferences,
 * and the attachment check accepts the clone's own provider in place of Messenger's. Each setPackage call that sends
 * Messenger to itself sends to the clone instead, so the clone's own receivers and screens get its broadcasts and links.
 */
internal fun applyCloneSites(
    lookup: MutableMethod,
    check: MutableMethod,
    newPackage: String,
    selfIntents: List<Pair<MutableMethod, Int>> = emptyList(),
    pools: Set<String> = emptySet(),
) {
    if (!isClonePackage(newPackage)) fail("$newPackage can't be used as a package name")
    if (selfIntents.map { (method, call) -> method.hookId() to call }.toSet().size != selfIntents.size) fail("an intent site is listed twice")
    // Every site passes before any changes.
    val (lookupAt, lookupRegister) = lookup.backupLookupSite()
    val (checkAt, checkRegister) = check.attachmentSite()
    val loads = selfIntents.map { (method, call) -> method to method.selfIntentSite(call, pools) }
    lookup.addInstruction(lookupAt, "const-string/jumbo v$lookupRegister, \"$ORIGINAL\"")
    check.replaceInstruction(checkAt, "const-string/jumbo v$checkRegister, \"$newPackage$TAM_SUFFIX\"")
    // In place of the constant, or of the pool lookup's result, so labels stay put. Last first, as a longer instruction
    // can move the padding before a switch table.
    for ((method, site) in loads.sortedByDescending { it.second.first }) {
        method.replaceInstruction(site.first, "const-string/jumbo v${site.second}, \"$newPackage\"")
    }
}

private class CloneRequest(val packageName: String, val label: String)

private var cloneRequest: CloneRequest? = null

/** Hands the checked name and label to the manifest rename, which runs once every other patch has executed. */
internal fun requestClone(packageName: String, label: String) {
    if (!isClonePackage(packageName)) fail("$packageName can't be used as a package name")
    if (!isCloneLabel(label)) fail("\"$label\" can't be used as an app name")
    cloneRequest = CloneRequest(packageName, label)
}

internal val cloneResources = resourcePatch(description = "Move Messenger's manifest to the clone's package name") {
    execute {
        cloneRequest = null
    }
    // After every other patch has added its providers, shortcuts and permission names.
    finalize {
        val request = cloneRequest ?: return@finalize
        cloneRequest = null
        val shortcutsPath = resolveShortcutsPath(listApkEntries("res/")) { path -> document(path).use { it } }
        document("AndroidManifest.xml").use { it.renameForClone(request.packageName, request.label) }
        document(shortcutsPath).use { it.retargetShortcuts(request.packageName) }
    }
}

@Suppress("unused")
val cloneInstallPatch = bytecodePatch(
    name = CLONE_PATCH_NAME,
    description = "Installs a second copy of Messenger beside the first, under its own package name and app name. " +
        "Messenger's own permissions, providers, task affinities and push categories move to the new name, and encrypted " +
        "chat backups still find their settings. Push notifications may not reach the copy. Facebook's sign-in shortcut " +
        "and other Meta apps won't see its account, and a Root Mount install can't use it. Sign it with the same key as " +
        "your other patched Meta apps.",
    default = false,
) {
    category("Fixes")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(installBesideMetaAppsPatch, cloneResources)

    val packageName by stringOption(
        key = "clonePackageName",
        default = CLONE_DEFAULT_PACKAGE,
        title = "Package name",
        description = "The copy's package name, such as com.facebook.orca.hush. It can't be Messenger's own or another Meta app's.",
        required = true,
    ) { isClonePackage(it) }

    val appLabel by stringOption(
        key = "cloneAppName",
        default = CLONE_DEFAULT_LABEL,
        title = "App name",
        description = "The name under the copy's home screen icon. Up to 40 letters, numbers, spaces and simple punctuation.",
        required = true,
    ) { isCloneLabel(it) }

    execute {
        val target = packageName?.takeIf(::isClonePackage) ?: fail("$packageName can't be used as a package name")
        val label = appLabel?.takeIf(::isCloneLabel) ?: fail("\"$appLabel\" can't be used as an app name")
        val expected = expectedCloneSitesFor(packageMetadata.versionCode)
        // The story link button gets Messenger's name from a string pool in some builds, so every class is read.
        val classes = mutableListOf<ClassDef>().apply { classDefForEach { add(it) } }
        val pools = ownNamePoolKeys(classes)
        if (findCloneSites(classes, pools) != expected) {
            fail("the backup lookup, attachment check or Messenger's intents to itself differ from the tested build")
        }
        val methods = expected.map { it.substringBefore('@') }.distinct()
            .associateWith { id -> mutableClassDefBy(id.substringBefore("->")).methods.single { it.hookId() == id } }
        val (calls, checks) = expected.partition { '@' in it }
        applyCloneSites(methods.getValue(checks.single { it.endsWith("-><init>()V") }), methods.getValue(checks.single { it.endsWith(ATTACHMENT_CHECK) }),
            target, calls.map { methods.getValue(it.substringBefore('@')) to it.substringAfter('@').toInt() }, pools)
        requestClone(target, label)
    }
}
