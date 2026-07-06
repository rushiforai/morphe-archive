package app.pepper.patches.icons

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Always show all 4 EventTheming icons in picker
 *
 * Stock filter logic for event icons (Black Friday / Summer Sales / Autumn Sales /
 * El Buen Fin):
 *  - if no event currently active: hide all 4 event icons
 *  - if e.g. Black Friday active: show ONLY BlackFriday icon, hide other 3
 *
 * Each `re2` data-class instance has a `boolean f` = isEventThemingAppIcon.
 * The filter loop reads it via `iget-boolean v?, v?, Lre2;->f:Z`.
 *
 * Patch: replace those `iget-boolean ...->f:Z` reads with `const/4 v?, 0x0`.
 * Filter never sees an icon as "event-theming" → all 18 icons (incl. 4 events)
 * always visible.
 */
@Suppress("unused")
val alwaysShowEventIconsPatch = bytecodePatch(
    name = "Always show event-theming icons",
    description = "Shows every event-themed app icon in the picker, even when " +
        "its event is not currently active.",
) {
    compatibleWith(*PEPPER_FAMILY)

    dependsOn(unlockTierIconsPatch) // event icons need to be DEFAULT-tier first

    execute {
        val method = EventIconsFilterFingerprint.method
        val impl = method.implementation!!

        val instructions = impl.instructions.toList()

        // Replace each `iget-boolean v?, v?, L<re2-class>;->f:Z` whose field type is
        // boolean and field name is "f" with `const/4 v<dest>, 0x0`.
        // The owning class type is short-obfuscated (e.g. Lre2;) — we don't pin it
        // by exact name, only by the structural property (single boolean named "f").
        var patched = 0
        for (idx in instructions.indices.reversed()) {
            val insn = instructions[idx]
            if (insn.opcode != Opcode.IGET_BOOLEAN) continue
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference ?: continue
            if (ref.name != "f" || ref.type != "Z") continue
            // Defensive — only short obfuscated class names (avoid generic .f flags
            // on framework classes etc.):
            if (!ref.definingClass.matches(Regex("L[a-z][a-z0-9]{1,3};"))) continue

            val destReg = (insn as OneRegisterInstruction).registerA
            val newInsn = BuilderInstruction11n(Opcode.CONST_4, destReg, 0)
            impl.replaceInstruction(idx, newInsn)
            patched++
        }
        if (patched == 0) {
            throw PatchException(
                "No iget-boolean Lre2;->f:Z instructions found. " +
                "isEventThemingAppIcon field may have been renamed/removed."
            )
        }
    }
}
