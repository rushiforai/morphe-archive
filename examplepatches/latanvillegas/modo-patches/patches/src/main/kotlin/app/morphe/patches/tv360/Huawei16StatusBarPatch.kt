package app.morphe.patches.tv360

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation

private const val HUAWEI16_STATUS_ACTIVITY = "Lcom/viettel/tv360/ui/home/HomeBoxActivity;"
private const val HUAWEI16_FULLSCREEN_HELPER =
    "$HUAWEI16_STATUS_ACTIVITY->morpheHuawei16HideStatusBar(Landroid/app/Activity;)V"
private const val HUAWEI16_MODERN_STATUS_HELPER =
    "$HUAWEI16_STATUS_ACTIVITY->morpheHuawei16HideStatusBarApi30(Landroid/app/Activity;)V"

/**
 * Optional Huawei TV360 Bitel 1.6 (161) window-level status bar hiding.
 *
 * HomeBoxActivity is confirmed in the user's untouched classes4.dex.
 * Apply FLAG_FULLSCREEN (0x400), and on API 30+ hide only statusBars through
 * WindowInsetsController. Reapply at verified onCreate/onResume returns.
 *
 * No inherited virtual method is introduced or overridden. The API 30-only
 * calls are guarded; a null controller is ignored until a later resume.
 * Login, bottom navigation, playback and protected components are untouched.
 * Unexpected lifecycle return counts abort instead of guessing.
 *
 * Runtime visual behavior (including insets) still needs a device test.
 */
@Suppress("unused")
val tv360Huawei16HideStatusBarPatch = bytecodePatch(
    name = "TV360 Bitel 1.6 - Hide Status Bar",
    description = "Requests status-bar-only hiding on Android 15 and reapplies it when TV360 resumes; keeps bottom navigation.",
    default = false,
) {
    compatibleWith("com.bitel.tv360"("1.6"))

    execute {
        val onCreate = Fingerprint(
            definingClass = HUAWEI16_STATUS_ACTIVITY,
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
        ).method
        val onResume = Fingerprint(
            definingClass = HUAWEI16_STATUS_ACTIVITY,
            name = "onResume",
            returnType = "V",
            parameters = emptyList(),
        ).method

        fun normalReturns(
            methodName: String,
            method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,
        ): List<Int> {
            val instructions = method.implementation?.instructions?.toList()
                ?: throw PatchException("Huawei 1.6 status bar: $methodName lacks implementation")
            val returns = instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
            if (returns.isEmpty() || returns.size > 16) {
                throw PatchException(
                    "Huawei 1.6 status bar: unexpected $methodName return count ${returns.size}"
                )
            }
            return returns
        }
        val onCreateReturns = normalReturns("onCreate", onCreate)
        val onResumeReturns = normalReturns("onResume", onResume)

        val owner = mutableClassDefBy(HUAWEI16_STATUS_ACTIVITY)
        if (owner.methods.any {
                it.name == "morpheHuawei16HideStatusBar" ||
                    it.name == "morpheHuawei16HideStatusBarApi30"
            }) {
            throw PatchException("Huawei 1.6 status bar: helper already defined")
        }

        val helper = ImmutableMethod(
            HUAWEI16_STATUS_ACTIVITY,
            "morpheHuawei16HideStatusBar",
            listOf(ImmutableMethodParameter("Landroid/app/Activity;", null, null)),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable()
        helper.addInstructions(
            0,
            """
            invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
            move-result-object v0
            const/16 v1, 0x400
            invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V
            return-void
            """.trimIndent(),
        )
        owner.methods.add(helper)

        // Separate helper preserves a single, unconditional return in the
        // original helper so the optional layout companion can extend it.
        val modern = ImmutableMethod(
            HUAWEI16_STATUS_ACTIVITY,
            "morpheHuawei16HideStatusBarApi30",
            listOf(ImmutableMethodParameter("Landroid/app/Activity;", null, null)),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable()
        modern.addInstructionsWithLabels(
            0,
            """
            sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
            const/16 v1, 0x1e
            if-lt v0, v1, :morphe_tv360_status_done
            invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
            move-result-object v0
            invoke-virtual {v0}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;
            move-result-object v0
            if-eqz v0, :morphe_tv360_status_done
            invoke-static {}, Landroid/view/WindowInsets${'$'}Type;->statusBars()I
            move-result v1
            invoke-interface {v0, v1}, Landroid/view/WindowInsetsController;->hide(I)V
            :morphe_tv360_status_done
            return-void
            """.trimIndent(),
        )
        owner.methods.add(modern)

        // No lifecycle overrides: touch only the two existing methods.
        // The modern request runs AFTER the optional 0x500 layout flags.
        for ((method, sites) in listOf(
            onCreate to onCreateReturns,
            onResume to onResumeReturns,
        )) {
            for (index in sites.sortedDescending()) {
                method.addInstructions(
                    index,
                    """
                    invoke-static {p0}, $HUAWEI16_FULLSCREEN_HELPER
                    invoke-static {p0}, $HUAWEI16_MODERN_STATUS_HELPER
                    """.trimIndent(),
                )
            }
        }
    }
}
