package app.pepper.patches.icons

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Disable auto-restore of event icon on app start
 *
 * The class "ShouldRestoreEventThemingAppIconToDefaultUseCase" (obfuscated to
 * `jc8` in v8.12.00) has a method `h(boolean, Continuation)Object` invoked on
 * app launch. It checks:
 *   if (currentIconIsEvent && (event == null || event.activeUntilDate < now))
 *     return TRUE → app shows "Our event mode is over!" dialog,
 *                   restores default icon, restarts.
 *
 * Without this patch: user picks SummerSales icon, next launch shows the dialog
 * and reverts to default (because Summer Sales has ended on the calendar).
 *
 * Patch: replace the whole method body with `return new xob(Boolean.FALSE)`
 * via prepending an unconditional return — the use-case never requests restore.
 */
@Suppress("unused")
val keepEventIconAfterRestartPatch = bytecodePatch(
    name = "Keep event icon after restart",
    description = "Keeps the chosen event-themed app icon after the event ends.",
) {
    compatibleWith(*PEPPER_FAMILY)

    execute {
        val method = ShouldRestoreEventIconFingerprint.method
        val impl = method.implementation!!

        // Discover xob (result-wrapper) class type by locating an invoke-direct to a
        // 1-arg `<init>(Ljava/lang/Object;)V` in the original body. That's the
        // canonical signature of the xob success-wrapper used in coroutine flow.
        // Earlier heuristics on `new-instance` alone were too greedy and matched
        // unrelated continuation impls (e.g. `c2b`).
        val xobClass: String = impl.instructions
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
            .firstOrNull { ref ->
                ref.name == "<init>" &&
                    ref.returnType == "V" &&
                    ref.parameterTypes.size == 1 &&
                    ref.parameterTypes[0].toString() == "Ljava/lang/Object;" &&
                    ref.definingClass.matches(Regex("L[a-z][a-z0-9]{1,3};"))
            }
            ?.definingClass
            ?: throw PatchException(
                "Couldn't infer xob result-wrapper class type from method body. " +
                "Search for invoke-direct {..., L<short>;-><init>(Ljava/lang/Object;)V} " +
                "in jc8.h() returned no match — coroutine result-wrapper signature changed?"
            )

        // Prepend an unconditional return — original body becomes dead code:
        //   v0 = new xob; v1 = Boolean.FALSE; xob.<init>(v0, v1); return v0
        method.addInstructions(
            0,
            """
            new-instance v0, $xobClass
            sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            invoke-direct { v0, v1 }, $xobClass-><init>(Ljava/lang/Object;)V
            return-object v0
            """.trimIndent()
        )
    }
}
