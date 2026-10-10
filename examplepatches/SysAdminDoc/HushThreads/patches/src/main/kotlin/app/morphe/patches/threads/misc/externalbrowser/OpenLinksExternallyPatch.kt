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
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Open links in browser"

internal const val OPEN_LINK =
    "Lapp/morphe/extension/hushthreads/misc/ExternalBrowser;->open(Landroid/content/Context;Ljava/lang/String;)Z"

/** What the launcher logs when it can't hand the browser Threads' session. Only the launcher says it. */
internal const val LAUNCHER_MESSAGE = "ThreadsBrowserLauncher: cookie injection failed; system WebView unavailable"

/**
 * Threads' browser launcher: a static method taking the context, the ad the link belongs to (or
 * null), the session, where the tap came from, three strings and the link, and a callback. Post
 * links, link cards and profile links all come through it, and it decides whether the link shows in
 * Threads' browser activity, in a sheet over the feed or in the immersive browser screen.
 */
internal object BrowserLauncherFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;", "L", "Lcom/instagram/common/session/UserSession;", "L",
        "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "L",
    ),
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
        val context = method.parameterRegister(0)
        val link = method.parameterRegister(method.linkParameter())
        // Nothing has run at the launcher's first instruction, so no local holds anything yet.
        method.requireLocals(PATCH, 2)
        method.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, v$context
                move-object/from16 v1, v$link
                invoke-static { v0, v1 }, $OPEN_LINK
                move-result v0
                if-eqz v0, :launch
                return-void
            """,
            ExternalLabel("launch", method.getInstruction(0)),
        )

        enableStatus("openLinksExternally")
    }
}

/** The register the static method's parameter [index] arrives in. */
internal fun Method.parameterRegister(index: Int): Int {
    val widths = parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    return localRegisterCount() + widths.take(index).sum()
}

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
