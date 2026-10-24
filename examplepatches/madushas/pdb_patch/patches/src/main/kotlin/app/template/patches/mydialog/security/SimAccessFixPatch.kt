package app.template.patches.mydialog.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import app.template.patches.shared.clearBody

/**
 * The pre-login flow gates on `NativeUtilsModule.getIMSIList`: the JS calls it and
 * shows "App Error: NO IMSI" + exits when the error callback fires. The original
 * implementation reads the subscriber id (IMSI) through reflection:
 * `TelephonyManager.getSubscriberId(subId)`.
 *
 * On Android 11+ (targetSdk 30+) that API requires READ_PRIVILEGED_PHONE_STATE or
 * carrier privileges — plain READ_PHONE_STATE is no longer sufficient. Carrier
 * privileges are bound to the *signing certificate* (SIM ARA-M / carrier config),
 * so a re-signed patched build loses them: `getSubscriberId` throws
 * SecurityException, `getIMSIList` hits its error path, and the app dies with
 * NO IMSI even on a real phone with a SIM. (The stock Play build keeps its
 * carrier privilege, which is why only patched builds see this.)
 *
 * What the flow actually consumes is the operator prefix (MCC+MNC, the first five
 * IMSI digits) — that is exactly what the public, permission-free
 * `TelephonyManager.getSimOperator()` returns. So replace the method body with a
 * call to `getSimOperator()`; when it returns empty (no SIM, e.g. emulator), fall
 * back to Dialog's "41305" so SIM-less devices still pass the gate.
 *
 * Result: the patched app posts the same operator prefix the stock app would see
 * on that phone, without pretending to have an IMSI it cannot read.
 */
@Suppress("unused")
val myDialogSimAccessFixPatch = bytecodePatch(
    name = "Fix SIM identifier access",
    description = "Replaces the IMSI lookup with the public getSimOperator() call so " +
        "the pre-login flow passes on Android 11+ where re-signed builds lost " +
        "carrier privileges ('App Error: NO IMSI'). Falls back to Dialog's 41305 " +
        "on SIM-less devices.",
    default = true,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

    execute {
        val m = app.morphe.patcher.Fingerprint(
            definingClass = "Lnet/omobio/dialogsc/utils/NativeUtilsModule;",
            name = "getIMSIList",
            returnType = "V",
            parameters = listOf(
                "Lcom/facebook/react/bridge/Callback;",
                "Lcom/facebook/react/bridge/Callback;",
            ),
        ).method
        // Instance method: p0=this, p1=success, p2=error. v0..v2 are free locals
        // (the original body's registers are dropped with the body).
        m.clearBody()
        m.addInstructions(
            0,
            """
            invoke-virtual {p0}, Lnet/omobio/dialogsc/utils/NativeUtilsModule;->getReactApplicationContext()Landroid/content/Context;
            move-result-object v0
            const-string v1, "phone"
            invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Landroid/telephony/TelephonyManager;
            invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;
            move-result-object v1
            if-eqz v1, :fallback
            invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
            move-result v2
            if-nez v2, :fallback
            goto :emit
            :fallback
            const-string v1, "41305"
            :emit
            new-instance v0, Lcom/facebook/react/bridge/WritableNativeArray;
            invoke-direct {v0}, Lcom/facebook/react/bridge/WritableNativeArray;-><init>()V
            invoke-virtual {v0, v1}, Lcom/facebook/react/bridge/WritableNativeArray;->pushString(Ljava/lang/String;)V
            const/4 v1, 0x1
            new-array v1, v1, [Ljava/lang/Object;
            const/4 v2, 0x0
            aput-object v0, v1, v2
            invoke-interface {p1, v1}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V
            return-void
            """.trimIndent(),
        )
    }
}
