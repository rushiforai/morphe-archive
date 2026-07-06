package app.pepper.patches.debug

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import app.morphe.patcher.patch.stringOption
import app.pepper.patches.shared.ensureRegisters

/**
 * Enable hidden debug menu in MainActivity
 *
 * R8 minifier strips the inflate call from MainActivity.onCreateOptionsMenu in
 * the release build. Result: the 3-dot debug menu in MainActivity never shows
 * any items, even though the menu XML (R.menu.activity_main_debug) and the
 * handler code (qy6.b) remain in the APK.
 *
 * This patch re-inserts:
 *   getMenuInflater().inflate(R.menu.activity_main_debug, menu)
 */
@Suppress("unused")
val enableDebugMenuPatch = bytecodePatch(
    name = "Enable debug menu",
    description = "Re-enables the hidden debug menu in the main activity.",
    default = false,
) {
    compatibleWith(*PEPPER_FAMILY)

    val debugMenuResIdOption by stringOption(
        key = "debugMenuResId",
        default = "0x7f0f0006",
        title = "Debug menu resource ID (hex)",
        description = "Resource ID of R.menu.activity_main_debug. " +
            "Default 0x7f0f0006 works for v8.12.00; if it shifts, look up the new ID " +
            "in the APK's res/values/public.xml under name=\"activity_main_debug\".",
        required = true,
    )

    execute {
        val resIdStr = debugMenuResIdOption ?: throw PatchException("debugMenuResId option missing")
        val resId = if (resIdStr.startsWith("0x") || resIdStr.startsWith("0X")) {
            resIdStr.substring(2).toLong(16).toInt()
        } else {
            resIdStr.toInt()
        }

        val method = MainActivityOnCreateOptionsMenuFingerprint.method
        val impl = method.implementation!!

        // Original method body has .locals 0 (registerCount=2: v0=this, v1=Menu).
        // We need 2 scratch registers, so we MUST grow registerCount to 4 — but
        // existing original bytecode v0/v1 references are NOT auto-remapped by
        // dexlib2, so we wipe the original body and write a self-contained
        // replacement using p0/p1 (which the smali compiler maps to the new
        // higher v-registers automatically).
        repeat(impl.instructions.size) { impl.removeInstruction(0) }
        method.ensureRegisters(4)

        // New body:
        //   v0 = this.getMenuInflater()
        //   v1 = R.menu.activity_main_debug
        //   v0.inflate(v1, p1)
        //   return true
        // We skip super.onCreateOptionsMenu() because we don't know the precise
        // super-class signature in the obfuscated build (it's wrapped via several
        // base classes); returning true unconditionally is the standard pattern
        // for "menu inflated, please show it".
        method.addInstructions(
            0,
            """
            invoke-virtual { p0 }, Lcom/pepper/apps/android/presentation/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;
            move-result-object v0
            const v1, $resId
            invoke-virtual { v0, v1, p1 }, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V
            const/4 v0, 0x1
            return v0
            """.trimIndent()
        )
    }
}
