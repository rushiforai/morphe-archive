/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tvqa.patches.tvquickactions

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.tvqa.patches.shared.Constants.TVQUICKACTIONS
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The server's own logger. Its debug level decides whether anything is written at all. */
private const val SERVER_LOG = "LU3/c;"

/** Holds the shell command that starts the native ADB server. */
private const val SERVER_START = "LV3/Q;"

/** The redirect the start command ends with, which throws the server's output away. */
private const val DISCARD_OUTPUT = " >/dev/null 2>&1"

/** Where the output is sent instead, so a repo copy of it can be read off the device. */
private const val KEEP_OUTPUT = " >>/data/local/tmp/tvqa-server.log 2>&1"

/**
 * The debug level the server's logger is built with. At 3 every message is dropped: `U3/c.a`
 * only writes when `d(2)` succeeds, and it also owns the file descriptor the message would go to.
 */
private const val SILENT_LEVEL = 3

/** The level that lets those messages through, both to logcat and to the stream. */
private const val DEBUG_LEVEL = 2

/**
 * Makes the native ADB server's own log readable.
 *
 * With "Use ADB speed up" on, the app starts `dev.vodik7.tvquickactions.server.Server` through
 * adbd, waits on the shell stream, and restarts the server whenever that stream ends. On the TV
 * the server is restarted every ~7 s and never gets to serve anything, which is why actions that
 * inject through it (a keycode from the dialpad, for one) do nothing at all.
 *
 * Nothing about why it ends can be read from a normal logcat, for two separate reasons: the
 * server's logger is built at level 3, where its own debug message is dropped before it is
 * written, and the shell command that starts the server ends with `>/dev/null 2>&1`, so the
 * stream the app is blocked on carries no output either.
 *
 * This patch lifts both: the logger is built at level 2, and the server's output is appended to
 * `/data/local/tmp/tvqa-server.log` instead of being discarded. The file is written by the shell
 * user, which is what `rish` runs as, so it can be read without root.
 *
 * It is a diagnostic, not a fix: it changes nothing about how the app behaves, and it should be
 * left out once the server has been made to stay up.
 */
@Suppress("unused")
val adbServerLogPatch = bytecodePatch(
    name = "ADB server log",
    description = "Writes the native ADB server's own log to /data/local/tmp/tvqa-server.log and " +
            "lets its debug messages through. The server is started again every few seconds and " +
            "nothing of what it says is reachable otherwise: its logger is built at a level that " +
            "drops every message, and its output is sent to /dev/null. Use this to find out why " +
            "it ends, not as a fix.",
    default = true
) {
    compatibleWith(TVQUICKACTIONS)

    execute {
        lowerServerLogLevel()
        keepServerOutput()
    }
}

/**
 * Builds the server's logger at level 2, so `U3/c.a` writes the message to logcat and to the
 * stream. The field is set twice in the constructor; lowering the one constant covers both.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.lowerServerLogLevel() {
    val clinit = mutableClassDefBy(SERVER_LOG).methods.firstOrNull { it.name == "<clinit>" }
        ?: throw PatchException("Could not find $SERVER_LOG-><clinit>")

    val instructions = clinit.implementation?.instructions?.toList()
        ?: throw PatchException("$SERVER_LOG-><clinit> has no body")

    // Find all writes to the level field instead of assuming the first write's opcode
    // representation is identical across dexlib/patcher versions.
    val stores = instructions.withIndex().filter { (_, instruction) ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode.name.startsWith("SPUT", ignoreCase = true) &&
            field?.definingClass == SERVER_LOG && field.name == "c" && field.type == "I"
    }
    if (stores.isEmpty()) {
        throw PatchException("Could not find a static write to $SERVER_LOG->c in <clinit>")
    }

    // The current 3.8.0 APK emits const/4 immediately before each sput. Also tolerate a small
    // instruction gap (e.g. a move) while still requiring the expected literal, so unrelated
    // constants in the initializer cannot be changed accidentally.
    val levelIndexAndInstruction = stores.firstNotNullOfOrNull { (storeIndex, _) ->
        (maxOf(0, storeIndex - 3) until storeIndex).reversed().firstNotNullOfOrNull { index ->
            val instruction = instructions[index]
            val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral
            if (literal == SILENT_LEVEL) {
                (instruction as? OneRegisterInstruction)?.let { index to it }
            } else {
                null
            }
        }
    } ?: throw PatchException(
        "Found writes to $SERVER_LOG->c but no nearby $SILENT_LEVEL log-level constant in <clinit>"
    )

    val (levelIndex, level) = levelIndexAndInstruction
    val register = level.registerA
    clinit.replaceInstruction(levelIndex, "const/4 v$register, 0x${DEBUG_LEVEL.toString(16)}")
}

/**
 * Sends the server's output to a file instead of /dev/null. The app is blocked reading the shell
 * stream and every start command is built in the one method that holds this string.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.keepServerOutput() {
    val start = mutableClassDefBy(SERVER_START).methods.firstOrNull {
        it.name == "o" && it.returnType.toString() == "Ljava/lang/Object;"
    } ?: throw PatchException("Could not find $SERVER_START->o")

    val instructions = start.implementation?.instructions?.toList()
        ?: throw PatchException("$SERVER_START->o has no body")

    val redirect = instructions.indexOfFirst { it.stringConstant() == DISCARD_OUTPUT }
    if (redirect < 0) throw PatchException("Could not find the shell command's output redirect")

    val register = (instructions[redirect] as OneRegisterInstruction).registerA
    start.replaceInstruction(redirect, "const-string v$register, \"$KEEP_OUTPUT\"")
}

private fun Instruction.stringConstant() =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
