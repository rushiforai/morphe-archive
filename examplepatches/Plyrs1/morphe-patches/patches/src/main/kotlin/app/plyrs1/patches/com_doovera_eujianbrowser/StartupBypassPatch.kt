package app.plyrs1.patches.com_doovera_eujianbrowser

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_EUJIANBROWSER

/**
 * Bypasses all startup environment, VM, emulator, hook, and cloner checks
 * in SplashActivity.
 *
 * ## Register Layout Note (.locals 18)
 * With .locals 18, parameters p0 and p1 are mapped to v18 and v19.
 * Standard 35c instructions (invoke-direct, iput-object) only accept 4-bit
 * register indices (v0..v15). Therefore:
 *   - We use move-object/from16 v1, p0 to copy `this` into low register v1
 *   - We use invoke-super/range {p0 .. p1} for the super.onCreate call
 *   - All subsequent instructions reference v1 (<= 15) instead of p0
 */
@Suppress("unused")
val bypassStartupSecurityPatch = bytecodePatch(
    name = "Bypass Startup Security Checks",
    description = "Skips environment, VM, emulator, hook, and cloner detection in SplashActivity. " +
            "Allows the app to run on emulators, rooted devices, and virtual environments.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        SplashActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v1, p0
                invoke-super/range {p0 .. p1}, Lg/k;->onCreate(Landroid/os/Bundle;)V
                new-instance v0, LB0/f;
                invoke-direct {v0, v1}, LB0/f;-><init>(Lg/k;)V
                iput-object v0, v1, Lcom/doovera/eujianbrowser/SplashActivity;->z:LB0/f;
                new-instance v0, LB/a;
                const/16 v2, 0xe
                invoke-direct {v0, v2, v1}, LB/a;-><init>(ILjava/lang/Object;)V
                new-instance v2, Landroid/os/Handler;
                invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
                move-result-object v3
                invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
                const-wide/16 v3, 0x12c
                invoke-virtual {v2, v0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
                return-void
            """
        )
    }
}
