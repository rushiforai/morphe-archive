/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tvqa.patches.tvquickactions

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.tvqa.patches.shared.Constants.TVQUICKACTIONS_3_8
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The preferences holder. Its speed-up flag decides whether input goes to the local server. */
private const val PREFERENCES_CLASS = "Ldev/vodik7/tvquickactions/T;"

/** `T.B`, filled from the "use_adb_speed_up" preference: "send input to the server on port 15000". */
private const val SPEED_UP_FIELD = "B"

/** The singleton that owns the port probe. */
private const val SERVER_SINGLETON_CLASS = "Lo3/q;"
private const val SERVER_SINGLETON_FIELD = "a"
private const val SERVER_CLASS = "Lh3/e;"

/**
 * `h3.e.n()`: binds port 15000 and closes it again, so it answers "is something already serving
 * on that port" - which is exactly the question a client of the speed-up server needs to ask.
 * The app already uses the same call as its own guard in a few places.
 */
private const val SERVER_PROBE = "n"

/** Every request to the speed-up server is built from one of these two prefixes. */
private const val SERVER_URL = "http://localhost:15000/"
private const val SERVER_URL_LOOPBACK = "http://127.0.0.1:15000/"

/**
 * The classes that inject input, and only those.
 *
 * `V3/Q` starts the server itself and reads the same flag to decide whether to keep doing so;
 * gating that read on "is the port taken" would stop the server from ever being started. Handlers
 * that run once per service start are left alone for the same reason - a port that is still closed
 * at that moment must not change what the service sets up.
 */
private val INPUT_CLASSES = setOf(
    "Lw5/x;",                                            // keycodes from the dialpad and menus
    "Ldev/vodik7/tvquickactions/ui/CursorLayout;",        // pointer, tap, swipe
    "Ldev/vodik7/tvquickactions/services/GamepadService;",// gamepad and cursor events
    "LA3/z;",                                             // key actions from broadcasts
)

private val LIFECYCLE_METHODS = setOf(
    "<init>", "<clinit>", "onCreate", "onDestroy", "onStartCommand", "onBind", "onUnbind",
)

/** How many instructions may sit between the flag read and the branch that consumes it. */
private const val LOOKAHEAD = 3

/** `invoke-virtual` addresses v0-v15 only, so a wider register cannot be used for the probe. */
private const val INVOKE_REGISTER_LIMIT = 15

/**
 * With "Use ADB speed up" on, the app stops injecting input itself and sends every key, tap and
 * swipe to an HTTP server it starts as the shell user on `localhost:15000`. That server is a
 * separate process; while it is not up, the requests are fired into a closed port and dropped
 * without an error, and the fallback the app is built around - the IME, the accessibility service,
 * or a plain `input` command - is never reached. The user sees a remote whose numpad and pointer
 * do nothing.
 *
 * The switch the app uses to choose between the two is a single preference flag, read at each
 * injection site. This patch replaces that read, at every site that builds a `localhost:15000`
 * request, with the library's own port probe; the request is then only attempted when a server is
 * actually listening, and the site's existing alternative runs otherwise.
 *
 * The read is kept register-for-register identical (`sget-object` / `invoke-virtual` / `move-result`
 * into the register the flag was in), so the branch that follows it, and the verifier's view of the
 * method, are unchanged.
 */
@Suppress("unused")
val adbInputFallbackPatch = bytecodePatch(
    name = "Input without the ADB server",
    description = "Keeps key, pointer and gamepad input working when the \"ADB speed up\" server " +
            "is not running. The app only asks whether speed-up is enabled, not whether the " +
            "server it starts as the shell user on localhost:15000 is up, and it drops the " +
            "request without falling back when the port is closed - so numpad keys and mouse " +
            "input do nothing. Each of those requests is now gated on the app's own port probe, " +
            "and the injection site's ordinary path runs while no server is listening.",
    default = true
) {
    compatibleWith(TVQUICKACTIONS_3_8)

    execute {
        var patched = 0
        var tooWide = 0
        var sites = 0

        val candidates = (
                classDefByStrings(SERVER_URL, StringComparisonType.CONTAINS) +
                        classDefByStrings(SERVER_URL_LOOPBACK, StringComparisonType.CONTAINS)
                ).distinctBy { it.type }.filter { it.type in INPUT_CLASSES }

        for (classDef in candidates) {
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods.toList()) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                // Only the injection sites talk to the speed-up server; a flag read anywhere else
                // (starting or stopping that server) must keep its meaning.
                if (instructions.none { it.isServerRequest() }) continue

                val gates = instructions.indices.filter { index ->
                    val read = instructions[index]
                    if (!read.isSpeedUpRead()) return@filter false

                    val register = (read as TwoRegisterInstruction).registerA
                    val branched = (index + 1..minOf(index + LOOKAHEAD, instructions.lastIndex)).any { next ->
                        val branch = instructions[next]
                        branch.isZeroBranch() && (branch as OneRegisterInstruction).registerA == register
                    }

                    // A site that already asks the port first needs nothing.
                    branched && (index + 1..minOf(index + LOOKAHEAD + 6, instructions.lastIndex))
                        .none { instructions[it].isServerProbe() }
                }
                if (gates.isEmpty()) continue

                sites++

                // Descending order: each rewrite adds two instructions after the gate, so the
                // indices of the gates still to do must not move.
                for (gate in gates.sortedDescending()) {
                    val register = (instructions[gate] as TwoRegisterInstruction).registerA

                    if (register > INVOKE_REGISTER_LIMIT) {
                        tooWide++
                        continue
                    }

                    method.replaceInstruction(
                        gate,
                        "sget-object v$register, $SERVER_SINGLETON_CLASS->$SERVER_SINGLETON_FIELD:$SERVER_CLASS"
                    )
                    method.addInstructions(
                        gate + 1,
                        """
                            invoke-virtual {v$register}, $SERVER_CLASS->$SERVER_PROBE()Z
                            move-result v$register
                        """.trimIndent()
                    )
                    patched++
                }
            }

        }

        if (patched == 0) {
            throw PatchException(
                "Found no speed-up input site to guard " +
                        "(${candidates.size} classes with a server URL, $sites gated methods, $tooWide wide gates). " +
                        "Patch tvQuickActions Pro 3.8.0."
            )
        }
    }
}

/** A string constant that a request to the speed-up server is built from. */
private fun Instruction.isServerRequest(): Boolean {
    val value = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
        ?: return false

    return value.startsWith(SERVER_URL) || value.startsWith(SERVER_URL_LOOPBACK)
}

/** `iget-boolean vX, ..., Ldev/vodik7/tvquickactions/T;->B:Z`. */
private fun Instruction.isSpeedUpRead(): Boolean {
    if (!isOpcode("iget-boolean")) return false

    val field = (this as? ReferenceInstruction)?.reference as? FieldReference ?: return false

    return field.definingClass == PREFERENCES_CLASS &&
            field.name == SPEED_UP_FIELD &&
            field.type == "Z"
}

/** `h3.e.n()` itself, so a site that already probes the port is left as it is. */
private fun Instruction.isServerProbe(): Boolean {
    val method = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false

    return method.definingClass == SERVER_CLASS && method.name == SERVER_PROBE &&
            method.returnType == "Z" && method.parameterTypes.isEmpty()
}

/** `if-eqz` and `if-nez`, the two branches an `iget-boolean` is tested with. */
private fun Instruction.isZeroBranch(): Boolean = isOpcode("if-eqz", "if-nez")

/**
 * The mnemonic of an instruction, compared regardless of the separator the dex library renders
 * (`iget-boolean` here, `IGET_BOOLEAN` in some versions).
 */
private fun Instruction.isOpcode(vararg names: String): Boolean {
    val normalized = opcode.name.replace('-', '_').uppercase()

    return names.any { it.replace('-', '_').uppercase() == normalized }
}
