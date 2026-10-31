package com.android.billingclient.api;

import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.q4;
import com.google.android.gms.internal.play_billing.r4;
import com.google.android.gms.internal.play_billing.s4;
import com.google.android.gms.internal.play_billing.u4;
import com.google.android.gms.internal.play_billing.v4;
import com.google.android.gms.internal.play_billing.w4;
import com.google.android.gms.internal.play_billing.x4;
import com.google.android.gms.internal.play_billing.z4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
public final /* synthetic */ class zzcy {
    public static final /* synthetic */ int zza = 0;

    static {
        int i5 = zzcz.zza;
    }

    public static String zza(Exception exc) {
        if (exc == null) {
            return null;
        }
        try {
            String simpleName = exc.getClass().getSimpleName();
            String message = exc.getMessage();
            if (message == null) {
                message = b.f42142b;
            }
            String str = simpleName + ":" + message;
            int i5 = m0.f33450a;
            return str.length() > 40 ? str.substring(0, 40) : str;
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to get truncated exception info", th2);
            return null;
        }
    }

    public static r4 zzb(w4 w4Var, int i5, BillingResult billingResult, String str, z4 z4Var) {
        try {
            v4 v4VarR = x4.r();
            v4VarR.g(billingResult.getResponseCode());
            String debugMessage = billingResult.getDebugMessage();
            v4VarR.d();
            x4.t((x4) v4VarR.f33564b, debugMessage);
            if (billingResult.getOnPurchasesUpdatedSubResponseCode() != 0) {
                int onPurchasesUpdatedSubResponseCode = billingResult.getOnPurchasesUpdatedSubResponseCode();
                v4VarR.d();
                x4.v((x4) v4VarR.f33564b, onPurchasesUpdatedSubResponseCode);
            }
            if (w4Var != null) {
                v4VarR.f(w4Var);
            }
            if (str != null) {
                v4VarR.d();
                x4.s((x4) v4VarR.f33564b, str);
            }
            q4 q4VarT = r4.t();
            q4VarT.f(v4VarR);
            q4VarT.h(i5);
            if (!z4Var.equals(z4.BROADCAST_ACTION_UNSPECIFIED)) {
                q4VarT.d();
                r4.w((r4) q4VarT.f33564b, z4Var);
            }
            return (r4) q4VarT.a();
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to create logging payload", th2);
            return null;
        }
    }

    public static u4 zzc(int i5, z4 z4Var) {
        try {
            s4 s4VarR = u4.r();
            s4VarR.d();
            u4.q((u4) s4VarR.f33564b, i5);
            if (!z4Var.equals(z4.BROADCAST_ACTION_UNSPECIFIED)) {
                s4VarR.d();
                u4.t((u4) s4VarR.f33564b, z4Var);
            }
            return (u4) s4VarR.a();
        } catch (Exception e3) {
            m0.i("BillingLogger", "Unable to create logging payload", e3);
            return null;
        }
    }
}
