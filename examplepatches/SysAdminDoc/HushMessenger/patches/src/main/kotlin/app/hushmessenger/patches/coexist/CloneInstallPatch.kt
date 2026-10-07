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
import app.morphe.patcher.StringComparisonType
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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val CLONE_PATCH_NAME = "Clone install under another package name"
internal const val CLONE_DEFAULT_PACKAGE = "com.facebook.orca.hush"
internal const val CLONE_DEFAULT_LABEL = "Messenger Clone"
private const val ORIGINAL = MessengerTarget.PACKAGE
private const val GET_PACKAGE_NAME = "Landroid/content/Context;->getPackageName()Ljava/lang/String;"
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

internal fun findCloneSites(classes: Iterable<ClassDef>): Set<String> = classes.flatMap { it.methods }
    .filter { it.isBackupLookup() || it.isAttachmentCheck() }.map { it.hookId() }.toSet()

/** Each build family's backup lookup and attachment check. The native test checks them on all 37 builds. */
internal fun expectedCloneSitesFor(versionCode: String): Set<String> {
    validateVersionCode(versionCode)
    val (lookup, check) = when (controlProfileFor(versionCode)) {
        BASE_PROFILE -> "LX/E6y;" to "LX/4M6;"
        PROFILE_346013370 -> "LX/VLY;" to "LX/4MB;"
        PROFILE_346013423 -> "LX/JJK;" to "LX/4PA;"
        PROFILE_346013357 -> "LX/E6T;" to "LX/4M0;"
        PROFILE_346013374 -> "LX/VFG;" to "LX/4Ny;"
        PROFILE_346213494 -> "LX/E9W;" to "LX/4Di;"
        else -> fail("version code $versionCode has no checked clone sites")
    }
    return setOf("$lookup-><init>()V", "$check->A00(Ljava/lang/String;)Z")
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
 * Ported from the auto-restore crash fix: the lookup sees Messenger's name and keeps Messenger's backup preferences,
 * and the attachment check accepts the clone's own provider in place of Messenger's.
 */
internal fun applyCloneSites(lookup: MutableMethod, check: MutableMethod, newPackage: String) {
    if (!isClonePackage(newPackage)) fail("$newPackage can't be used as a package name")
    // Both sites pass before either changes.
    val (lookupAt, lookupRegister) = lookup.backupLookupSite()
    val (checkAt, checkRegister) = check.attachmentSite()
    lookup.addInstruction(lookupAt, "const-string/jumbo v$lookupRegister, \"$ORIGINAL\"")
    check.replaceInstruction(checkAt, "const-string/jumbo v$checkRegister, \"$newPackage$TAM_SUFFIX\"")
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
        val candidates = listOf(FACEBOOK_BACKUP_PREFS, TAM_AUTHORITY)
            .flatMap { classDefByStrings(it, StringComparisonType.EQUALS) }.distinctBy { it.type }
        if (findCloneSites(candidates) != expected) fail("the backup lookup or attachment check differs from the tested build")
        val methods = expected.map { id -> mutableClassDefBy(id.substringBefore("->")).methods.single { it.hookId() == id } }
        applyCloneSites(methods.single { it.name == "<init>" }, methods.single { it.name != "<init>" }, target)
        requestClone(target, label)
    }
}
