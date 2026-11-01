/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0).
 */
package app.morphe.patches.threads.misc.externalbrowser

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.localRegisterCount
import app.morphe.patches.threads.misc.extension.requireLocals
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Open links in browser"

internal const val OPEN_LINK =
    "Lapp/morphe/extension/hushthreads/misc/ExternalBrowser;->open(Landroid/content/Context;Ljava/lang/String;)Z"

/** What the launcher logs when it can't hand the browser Threads' session. Only the launcher says it. */
internal const val LAUNCHER_MESSAGE = "ThreadsBrowserLauncher: cookie injection failed; system WebView unavailable"

/**
 * Threads' browser launcher. On 452 and earlier it is a static method taking the context, the ad
 * the link belongs to (or null), the session, where the tap came from, three strings and the link,
 * and a callback. On 453 it is an instance method that keeps the context and the link in fields of
 * its own class. Post links, link cards and profile links all come through it, and it decides
 * whether the link shows in Threads' browser activity, in a sheet over the feed or in the immersive
 * browser screen.
 */
internal object BrowserLauncherFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(string(LAUNCHER_MESSAGE)),
)

/**
 * Opens the web links you tap in the phone's browser.
 *
 * The extension is asked first thing in Threads' browser launcher, before it picks how to show the
 * link, so one hook covers the browser activity, the sheet and the immersive screen. It answers
 * true when the link went out, and the launcher returns. Otherwise the launcher goes on as before:
 * for Meta's own sites, a link that isn't a web link, a phone with no browser, the switch off,
 * paused, or before the settings are ready.
 *
 * Found by reading 449 and 448 (2026-10-02): the launcher's first instructions move the link into a
 * register and parse it with java.net.URI, and that's how the hook finds which string is the link.
 * 453 (2026-10-26) reads the link from an instance field instead and keeps its context in another.
 *
 * Three places on 451 through 453 make the browser's Intent without the launcher (2026-10-14): the lead form
 * and privacy policy helper, the ad browser a call to action opens, and the media viewer's swipe up
 * on an ad. Each asks the extension the same way, with its own context and link, right before its
 * stock browser work, and goes on to its own ending for an opened browser when the link went out.
 * See [directBrowserSites].
 */
@Suppress("unused")
val openLinksExternallyPatch = bytecodePatch(
    name = "Open links in browser",
    description = "Opens links you tap in your regular browser instead of inside Threads, and skips Threads' link " +
        "tracking. Threads, Instagram and other Meta pages still open in Threads. On by default. Turn it " +
        "off in HushThreads settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.threads())
    dependsOn(threadsExtensionPatch)

    execute {
        val method = BrowserLauncherFingerprint.method
        // Every caller that skips the launcher is found and proven before anything changes.
        val direct = directBrowserSites(method)
        // Nothing has run at the launcher's first instruction, so no local holds anything yet.
        val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
        method.requireLocals(PATCH, if (isStatic) 2 else 3)
        val hook = if (isStatic) {
            val linkIndex = method.linkParameter()
            val context = method.parameterRegister(0)
            val link = method.parameterRegister(linkIndex)
            """
                move-object/from16 v0, v$context
                move-object/from16 v1, v$link
            """
        } else {
            // 453 keeps the launcher's context and link in fields of its own class rather than in
            // parameters: the link is the String it parses, and the context is the class's one.
            // iget-object only reaches four-bit registers, so keep `this` in v2 and read through it.
            val link = method.linkField()
            val context = method.contextField()
            """
                move-object/from16 v2, p0
                iget-object v0, v2, $context
                iget-object v1, v2, $link
            """
        }
        method.addInstructionsWithLabels(
            0,
            hook + """
                invoke-static { v0, v1 }, $OPEN_LINK
                move-result v0
                if-eqz v0, :launch
                return-void
            """,
            ExternalLabel("launch", method.getInstruction(0)),
        )
        direct.forEach { it.inject() }

        enableStatus("openLinksExternally")
    }
}

/** The register the static method's parameter [index] arrives in. */
internal fun Method.parameterRegister(index: Int): Int {
    val widths = parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    return localRegisterCount() + widths.take(index).sum()
}

/** The String field the instance launcher parses with `java.net.URI`, followed back from the parse. */
internal fun Method.linkField(): FieldReference {
    val instructions = implementation!!.instructions.toList()
    val parse = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_DIRECT &&
            instruction.getReference<MethodReference>()?.let {
                it.definingClass == "Ljava/net/URI;" && it.name == "<init>" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
            } == true
    }
    if (parse < 0) throw PatchException("$PATCH: $definingClass->$name never parses a link with java.net.URI")

    var register = (instructions[parse] as FiveRegisterInstruction).registerD
    for (at in parse - 1 downTo 0) {
        val instruction = instructions[at]
        when (instruction.opcode) {
            Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 -> {
                val move = instruction as TwoRegisterInstruction
                if (move.registerA == register) register = move.registerB
            }
            Opcode.IGET_OBJECT -> {
                val read = instruction as TwoRegisterInstruction
                val field = instruction.getReference<FieldReference>() ?: continue
                if (read.registerA == register && field.type == "Ljava/lang/String;") return field
            }
            Opcode.NEW_INSTANCE -> Unit
            else -> throw PatchException(
                "$PATCH: $definingClass->$name runs ${instruction.opcode.name} at $at before it parses the link",
            )
        }
    }
    throw PatchException("$PATCH: $definingClass->$name parses a String that isn't one of its fields")
}

/** The one Context field of the instance launcher's class. */
internal fun Method.contextField(): FieldReference =
    implementation!!.instructions.mapNotNull { it.getReference<FieldReference>() }.distinct()
        .singleOrNull { it.type == "Landroid/content/Context;" }
        ?: throw PatchException("$PATCH: $definingClass->$name reads no single Context field")

/**
 * Which of the launcher's parameters is the link: the string it parses with `java.net.URI` before
 * anything else, followed back through the register moves in front of that.
 */
internal fun Method.linkParameter(): Int {
    val instructions = implementation!!.instructions.toList()
    val parse = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_DIRECT &&
            instruction.getReference<MethodReference>()?.let {
                it.definingClass == "Ljava/net/URI;" && it.name == "<init>" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
            } == true
    }
    if (parse < 0) throw PatchException("$PATCH: $definingClass->$name never parses a link with java.net.URI")

    var register = (instructions[parse] as FiveRegisterInstruction).registerD
    for (at in parse - 1 downTo 0) {
        val instruction = instructions[at]
        when (instruction.opcode) {
            Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 -> {
                val move = instruction as TwoRegisterInstruction
                if (move.registerA == register) register = move.registerB
            }
            Opcode.NEW_INSTANCE -> if ((instruction as OneRegisterInstruction).registerA == register) {
                throw PatchException("$PATCH: $definingClass->$name parses a new object, not a parameter")
            }
            else -> throw PatchException(
                "$PATCH: $definingClass->$name runs ${instruction.opcode.name} at $at before it parses the link",
            )
        }
    }

    val index = (parameterTypes.indices).singleOrNull { parameterRegister(it) == register }
        ?: throw PatchException("$PATCH: $definingClass->$name parses v$register, which no parameter arrives in")
    if (parameterTypes[index].toString() != "Ljava/lang/String;") {
        throw PatchException("$PATCH: $definingClass->$name parses parameter $index, a ${parameterTypes[index]}")
    }
    return index
}
