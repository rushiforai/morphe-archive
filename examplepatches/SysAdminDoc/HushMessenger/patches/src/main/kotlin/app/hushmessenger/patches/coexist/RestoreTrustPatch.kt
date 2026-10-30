/*
 * Adapted from Hushfacebook's RestoreTrustPatch.kt, itself forked from Andrew Liang's
 * morphe-patches (GPL-3.0). Modified for HushMessenger (Messenger), 2026.
 */
package app.hushmessenger.patches.coexist

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.controls.indexOfAnchor
import app.hushmessenger.patches.controls.jumpTargets
import app.hushmessenger.patches.controls.redexStringTables
import app.hushmessenger.patches.controls.settingsExtension
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PACKAGE_INFO = "Landroid/content/pm/PackageInfo;"

private const val ORIGINAL_SIGNERS = "Lapp/hushmessenger/extension/MessengerSignature;->" +
    "originalSigners(Landroid/content/pm/PackageInfo;)Ljava/util/List;"

internal const val FBNS_SIGNERS = "Lapp/hushmessenger/extension/MessengerSignature;->" +
    "fbnsSigners(Landroid/content/pm/PackageInfo;[Landroid/content/pm/Signature;)[Landroid/content/pm/Signature;"

internal const val FAMILY_LINK_LAUNCHED = "Lapp/hushmessenger/extension/FamilyLinks;->" +
    "launched(ZLandroid/content/Context;Landroid/content/Intent;)V"

private const val CONTEXT = "Landroid/content/Context;"
private const val INTENT = "Landroid/content/Intent;"
private const val URI = "Landroid/net/Uri;"

/**
 * Messenger's trust checks read the signers of a package through a method that prefers the
 * SigningInfo API and falls back to the old signatures array. It is the only no-parameter method
 * that calls both signer-list getters and reads the legacy array. Class and method names are Redex
 * obfuscated, so the fingerprint uses only Android framework references.
 */
internal object PackageSignersFingerprint : Fingerprint(
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/pm/SigningInfo;",
            name = "getApkContentsSigners",
        ),
        methodCall(
            definingClass = "Landroid/content/pm/SigningInfo;",
            name = "getSigningCertificateHistory",
        ),
        fieldAccess(
            definingClass = "Landroid/content/pm/PackageInfo;",
            name = "signatures",
        ),
    ),
)

/**
 * FBNS's check of a package it may hand pushes to: the SHA-256 of the package's one signer, looked
 * up in Meta's certificates. It reads `PackageInfo.signatures` itself and logs as PackageInfoUtil.
 * Its class and its name are Redex names.
 */
internal object FbnsPackageCheckFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        fieldAccess(
            definingClass = "Landroid/content/pm/PackageInfo;",
            name = "signatures",
        ),
        string("PackageInfoUtil"),
        string("Failed to create SHA-256 hash"),
    ),
)

internal const val THREADS_LINK_TAG = "ThreadsLinkLauncher"
internal const val INSTAGRAM_LINK_TAG = "InstagramLinkLauncher"

/**
 * Messenger's Threads and Instagram link launchers: each takes the tapped link, builds a view intent
 * for its app and hands it to Meta's family launcher, logging under its own tag when that throws.
 * The app's package is checked apart from the fingerprint ([requireLinkPackage]), since some 585
 * builds load Threads' from a string table instead of a literal.
 */
internal object ThreadsLinkLauncherFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(CONTEXT, URI),
    filters = listOf(string(THREADS_LINK_TAG)),
)

internal object InstagramLinkLauncherFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(CONTEXT, URI),
    filters = listOf(string(INSTAGRAM_LINK_TAG)),
)

@Suppress("unused")
val restoreTrustPatch = bytecodePatch(
    name = "Restore screens on re-signed builds",
    description = "Patching and signing Messenger yourself can break some of its screens. This makes Messenger's signature check pass again, including for a Facebook you patched with the same key, and lets Threads and Instagram video links open in a Threads or Instagram you patched yourself. Works as soon as you patch it in, with no switch.",
    default = true,
) {
    category("Fixes")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension)

    execute {
        val method = PackageSignersFingerprint.method
        val owner = mutableClassDefBy(method.definingClass)

        // The hook reads the field off `this` with iget-object, so it has to be an instance field.
        val packageInfoFields = owner.fields.filter { it.type == PACKAGE_INFO && !AccessFlags.STATIC.isSet(it.accessFlags) }
        check(packageInfoFields.size == 1) {
            "Expected 1 PackageInfo instance field on ${method.definingClass}, found ${packageInfoFields.size}"
        }
        val packageInfo = packageInfoFields.single().name

        val signers = method.returnType
        val constructor = mutableClassDefBy(signers).methods.singleOrNull {
            it.name == "<init>" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;", "Z", "Z")
        }
        check(constructor != null) { "$signers has no (List, boolean, boolean) constructor" }

        val threads = ThreadsLinkLauncherFingerprint.method
        val instagram = InstagramLinkLauncherFingerprint.method
        val tables = redexStringTables(mutableListOf<ClassDef>().apply { classDefForEach { add(it) } })
        threads.requireLinkPackage("Threads", "com.instagram.barcelona", THREADS_LINK_TAG, tables)
        instagram.requireLinkPackage("Instagram", "com.instagram.android", INSTAGRAM_LINK_TAG, tables)
        // Both launchers are checked before either changes.
        val sites = listOf(threads.linkLaunchSites("Threads"), instagram.linkLaunchSites("Instagram"))

        method.answerOriginalSigners(packageInfo, signers)
        FbnsPackageCheckFingerprint.method.routeFbnsSigners()
        threads.reportLinkLaunches(sites[0])
        instagram.reportLinkLaunches(sites[1])
    }
}

/** Stops the patch unless the launcher loads [pkg], as a literal or a [redexStringTables] lookup, before its [tag]. */
internal fun Method.requireLinkPackage(app: String, pkg: String, tag: String, tables: Map<String, Map<Int, String>>) {
    val code = implementation?.instructions?.toList().orEmpty()
    val named = code.indexOfAnchor(pkg, tables)
    val tagged = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == tag }
    if (named < 0 || named > tagged) throw PatchException("Restore screens on re-signed builds: $app's link launcher doesn't load $pkg before its tag")
}

/** Where a link launcher hands its intent to the family launcher, and the three registers of that call. */
internal class LinkLaunchSite(val index: Int, val launcher: Int, val context: Int, val intent: Int)

/**
 * The calls in a Threads or Instagram link launcher that hand the view intent to Meta's family
 * launcher: instance `(Context, Intent)Z` calls whose answer is dropped by the return-void straight
 * after each. Since 584 Instagram's has two, one for when an Instagram is installed and one for
 * when none is. The context is the launcher's own Context parameter and the intent is the one the
 * method built from the link with a static `(Uri)Intent` call, not written again before a launch,
 * and nothing after a launch jumps back to it. The launcher
 * register is dead after the call, so it can take the answer. `invoke-static` names 4-bit
 * registers, so all three must be v15 or lower. Anything else stops the patch before any edit.
 */
internal fun MutableMethod.linkLaunchSites(app: String): List<LinkLaunchSite> {
    fun refuse(why: String): Nothing = throw PatchException("Restore screens on re-signed builds: $app's link launcher $why")
    if (AccessFlags.STATIC.isSet(accessFlags)) refuse("is static")
    val code = implementation!!.instructions.toList()
    fun Instruction.method() = ((this as? ReferenceInstruction)?.reference as? MethodReference)
    val launches = code.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction.method()?.let {
            it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT, INTENT)
        } == true
    }
    if (launches.isEmpty()) refuse("has no launches")
    val builds = code.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.INVOKE_STATIC && instruction.method()?.let {
            it.returnType == INTENT && it.parameterTypes.map(CharSequence::toString) == listOf(URI)
        } == true
    }
    val build = builds.singleOrNull()?.index ?: refuse("builds ${builds.size} intents from its link, expected 1")
    val targets = jumpTargets()
    return launches.map { (index, launch) ->
        if (code.getOrNull(index + 1)?.opcode != Opcode.RETURN_VOID) refuse("uses its launch's answer")
        if (index + 1 in targets) refuse("jumps to the return after its launch")
        val call = launch as FiveRegisterInstruction
        val site = LinkLaunchSite(index, call.registerC, call.registerD, call.registerE)
        if (setOf(site.launcher, site.context, site.intent).size != 3 || maxOf(site.launcher, site.context, site.intent) > 15) {
            refuse("launches with v${site.launcher}, v${site.context} and v${site.intent}, which the call can't name")
        }
        if (site.context != implementation!!.registerCount - 2) refuse("launches with a Context other than its own")
        val result = code.getOrNull(build + 1)
        if (build > index || result?.opcode != Opcode.MOVE_RESULT_OBJECT || (result as OneRegisterInstruction).registerA != site.intent) {
            refuse("launches an intent other than the one it built from the link")
        }
        // The catch block after the return reuses the register for its log message, which can't reach the launch.
        val rewrites = (build + 2 until index).count { i ->
            code[i].opcode.setsRegister() && (code[i] as? OneRegisterInstruction)?.registerA == site.intent
        }
        if (rewrites != 0) refuse("writes its intent's register again before its launch")
        if (backJumps(code, index)) refuse("jumps back to its launch from after it")
        site
    }
}

/** Whether a branch or switch case after [index] lands at or before it. */
private fun backJumps(code: List<Instruction>, index: Int): Boolean {
    val addresses = IntArray(code.size + 1)
    for (i in code.indices) addresses[i + 1] = addresses[i] + code[i].codeUnits
    val indexAt = code.indices.associateBy { addresses[it] }
    return (index + 1 until code.size).any { i ->
        val jump = code[i] as? OffsetInstruction ?: return@any false
        val landing = addresses[i] + jump.codeOffset
        val cases = if (jump.opcode == Opcode.PACKED_SWITCH || jump.opcode == Opcode.SPARSE_SWITCH) {
            // Case offsets count from the switch instruction, not from its payload.
            (indexAt[landing]?.let(code::get) as? SwitchPayload)?.switchElements?.map { addresses[i] + it.offset }.orEmpty()
        } else {
            listOf(landing)
        }
        cases.any { it <= addresses[index] }
    }
}

/**
 * Hands each family launch's dropped answer, with the context and intent it got, to the extension.
 * The last site goes first so the earlier indices still point at their launches.
 */
internal fun MutableMethod.reportLinkLaunches(sites: List<LinkLaunchSite>) {
    for (site in sites.sortedByDescending { it.index }) {
        addInstructions(
            site.index + 1,
            """
                move-result v${site.launcher}
                invoke-static { v${site.launcher}, v${site.context}, v${site.intent} }, $FAMILY_LINK_LAUNCHED
            """,
        )
    }
}

/**
 * For Messenger itself, or a Facebook carrying this build's key while it calls Messenger, answer
 * with the original certificate and skip the body. For any other package or read, the extension
 * answers null and the body runs as before. The two flags are false, as the
 * body sets them for a single signer.
 *
 * The injection is at index 0, where no local is live yet, so v0 to v2 are free once the method is
 * known to have three locals. `iget-object` takes 4-bit registers, so `this` is copied down into v0
 * first: in a method with more than sixteen registers `p0` sits above v15, and the patcher's smali
 * compiler leaves out an instruction whose register doesn't fit, without a word.
 */
internal fun MutableMethod.answerOriginalSigners(packageInfo: String, signers: String) {
    // The smali below copies p0 as `this`, which a static method doesn't have.
    if (AccessFlags.STATIC.isSet(accessFlags)) throw PatchException(
        "Restore screens on re-signed builds: $definingClass->$name is static, expected an instance method"
    )
    val paramWidth = parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val locals = implementation!!.registerCount - 1 - paramWidth
    if (locals < 3) throw PatchException(
        "Restore screens on re-signed builds: $definingClass->$name has $locals local register(s), needs 3"
    )
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, $definingClass->$packageInfo:$PACKAGE_INFO
            invoke-static { v0 }, $ORIGINAL_SIGNERS
            move-result-object v1
            if-eqz v1, :original
            new-instance v0, $signers
            const/4 v2, 0x0
            invoke-direct { v0, v1, v2, v2 }, $signers-><init>(Ljava/util/List;ZZ)V
            return-object v0
        """,
        ExternalLabel("original", getInstruction(0)),
    )
}

/**
 * FBNS, the push service Meta's apps share, checks each package it may hand pushes to against
 * Meta's certificates, reading `PackageInfo.signatures` itself. On a re-signed build Messenger
 * fails its own check. The array that read gives goes through the extension, which answers the
 * original certificate for this build and the system's answer for any other package.
 *
 * The call goes straight after the read and names its two registers. `invoke-static` takes 4-bit
 * registers, so both must be v15 or lower, and the read must not overwrite the package it read
 * from, which the call still needs. A jump landing straight after the read would skip the call.
 */
internal fun MutableMethod.routeFbnsSigners() {
    val code = implementation!!.instructions.toList()
    val reads = code.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.IGET_OBJECT &&
            ((instruction as ReferenceInstruction).reference as FieldReference).let {
                it.definingClass == PACKAGE_INFO && it.name == "signatures"
            }
    }
    val (index, read) = reads.singleOrNull()
        ?: throw PatchException("Restore screens on re-signed builds: expected one read of PackageInfo.signatures in FBNS's package check, found ${reads.size}")
    val signatures = (read as TwoRegisterInstruction).registerA
    val info = read.registerB
    if (signatures == info || signatures > 15 || info > 15) throw PatchException(
        "Restore screens on re-signed builds: FBNS's package check reads signatures into v$signatures from v$info, which the call can't name"
    )
    if (index + 1 in jumpTargets()) throw PatchException(
        "Restore screens on re-signed builds: FBNS's package check jumps past its signatures read"
    )
    addInstructions(
        index + 1,
        """
            invoke-static { v$info, v$signatures }, $FBNS_SIGNERS
            move-result-object v$signatures
        """,
    )
}
