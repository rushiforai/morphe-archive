package app.template.patches.mubi.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import app.template.patches.shared.clearBody
import com.android.tools.smali.dexlib2.AccessFlags

// Skip MUBI's pre-roll promotional clip.
//
// MUBI plays a short promotional clip before some titles. The clip is chosen by
// app-side logic (the API returns it alongside the playable item), so the gate
// lives in a MUBI class that either names a pre-roll concept or carries
// "preroll" / "pre-roll" / "pre_roll" string constants.
//
// This patch is deliberately narrow: it only forces boolean gates whose *name*
// references a pre-roll, plus a handful of generic gate names inside a class
// whose type itself contains "preroll". It never touches playback, media items
// or server responses, so a build that implements pre-roll differently is left
// completely stock.
//
// WHAT THIS DOES NOT DO: it cannot remove a pre-roll that the server injects as
// a separate media item or that is baked into the stream. Those show up in the
// player itself, not behind a boolean.
//
// Fail-safe: with no matching class or gate, the patch has no effect.

private val PRE_ROLL_STRINGS = listOf(
    "preroll",
    "pre-roll",
    "pre_roll",
    "preRoll",
)

private val GENERIC_GATE_NAMES = setOf(
    "shouldShow",
    "shouldPlay",
    "canShow",
    "canPlay",
    "isEnabled",
    "isVisible",
    "isShown",
)

@Suppress("unused")
val mubiSkipPreRollPatch = bytecodePatch(
    name = "Skip pre-roll promos",
    description = "Disables MUBI's app-side pre-roll gate when it is a boolean check. " +
        "Pre-roll injected by the server or embedded in the stream is unaffected.",
    default = true,
) {
    compatibleWith(MUBI_COMPATIBILITY)

    execute {
        val candidateClasses = PRE_ROLL_STRINGS
            .flatMap { literal -> classDefByStrings(literal) }
            .map { classDef -> classDef.type }
            .toSet()

        candidateClasses.forEach { className ->
            val classDef = mutableClassDefByOrNull(className) ?: return@forEach
            val classLooksLikePreRoll = className.contains("preroll", ignoreCase = true)

            classDef.methods.forEach methodLoop@ { method ->
                if (method.returnType != "Z") return@methodLoop
                if (method.accessFlags and AccessFlags.ABSTRACT.value != 0) return@methodLoop

                val nameMatches = method.name.contains("preroll", ignoreCase = true) ||
                    (classLooksLikePreRoll && method.name in GENERIC_GATE_NAMES)
                if (!nameMatches) return@methodLoop

                val implementation = method.implementation ?: return@methodLoop
                val isStatic = method.accessFlags and AccessFlags.STATIC.value != 0
                val parameterRegisterCount = method.parameterTypes.size + if (isStatic) 0 else 1
                if (implementation.registerCount - parameterRegisterCount < 1) return@methodLoop

                method.clearBody()
                method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            }
        }
    }
}
