/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.all.system

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags

private const val APPLICATION = "Landroid/app/Application;"

private fun escapeSmali(s: String): String = s.replace("\\", "\\\\")
    .replace("\"", "\\\"")
    .replace("\r", "")
    .replace("\n", " ")

@Suppress("unused")
val toastOnLaunchPatch = patch(
    name = "Toast on launch",
    description = "Shows a Toast when the app starts by injecting framework Toast calls into " +
        "the Application subclass's onCreate(). Pure inline smali — adds no classes or methods. " +
        "No-op, never crashes, if the app has no custom Application, does not override onCreate, " +
        "or its onCreate has too few free registers.",
    default = false,
) {
    val message = stringOption(
        key = "message",
        default = "Patched build",
        values = mapOf("Patched build" to "Patched build"),
        title = "Toast message",
        description = "Text shown at launch.",
        required = true,
    )

    val longDuration by booleanOption(
        key = "longDuration",
        default = false,
        title = "Long duration",
        description = "Use Toast.LENGTH_LONG instead of SHORT.",
    )

    execute {
        val text = escapeSmali(message.value ?: "Patched build")
        val dur = if (longDuration == true) "0x1" else "0x0"
        var done = false

        classDefForEach { classDef ->
            if (done || classDef.superclass != APPLICATION) return@classDefForEach

            val candidate = classDef.methods.firstOrNull { m ->
                m.name == "onCreate" &&
                    m.returnType == "V" &&
                    m.implementation != null &&
                    (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                    (
                        m.parameterTypes.isEmpty() ||
                            (
                                m.parameterTypes.size == 1 &&
                                    m.parameterTypes[0] == "Landroid/os/Bundle;"
                                )
                        )
            } ?: return@classDefForEach

            val mc = mutableClassDefBy(classDef)
            val mm = mc.findMutableMethodOf(candidate)
            val impl = mm.implementation ?: return@classDefForEach

            // Virtual method registers:
            // total registers = locals + parameters + `this`.
            // At instruction index 0, all v-registers are dead, so we can use them.
            val paramRegs = candidate.parameterTypes.size + 1
            if (impl.registerCount - paramRegs < 2) return@classDefForEach

            mm.addInstructions(
                0,
                """
                const-string v0, "$text"
                const/4 v1, $dur
                invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
                move-result-object v0
                invoke-virtual {v0}, Landroid/widget/Toast;->show()V
                """.trimIndent(),
            )

            done = true
        }
    }
}
