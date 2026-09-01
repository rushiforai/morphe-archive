package com.android.billingclient.api;

import defpackage.cbg;
import defpackage.d0g;
import defpackage.fbg;
import defpackage.lbg;
import defpackage.rxf;
import defpackage.sag;
import defpackage.uag;
import defpackage.wag;
import defpackage.xag;
import defpackage.zag;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zzcy {
    public static final /* synthetic */ int zza = 0;

    static {
        int i = d0g.k0;
    }

    public static String zza(Exception exc) {
        if (exc == null) {
            return null;
        }
        try {
            String simpleName = exc.getClass().getSimpleName();
            String message = exc.getMessage();
            if (message == null) {
                message = "";
            }
            String str = simpleName + ":" + message;
            int i = rxf.a;
            return str.length() > 40 ? str.substring(0, 40) : str;
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to get truncated exception info", th);
            return null;
        }
    }

    public static uag zzb(cbg cbgVar, int i, BillingResult billingResult, String str, lbg lbgVar) {
        try {
            zag zagVarR = fbg.r();
            zagVarR.e(billingResult.getResponseCode());
            String debugMessage = billingResult.getDebugMessage();
            zagVarR.b();
            fbg.t((fbg) zagVarR.b, debugMessage);
            if (billingResult.getOnPurchasesUpdatedSubResponseCode() != 0) {
                int onPurchasesUpdatedSubResponseCode = billingResult.getOnPurchasesUpdatedSubResponseCode();
                zagVarR.b();
                fbg.v((fbg) zagVarR.b, onPurchasesUpdatedSubResponseCode);
            }
            if (cbgVar != null) {
                zagVarR.d(cbgVar);
            }
            if (str != null) {
                zagVarR.b();
                fbg.s((fbg) zagVarR.b, str);
            }
            sag sagVarT = uag.t();
            sagVarT.d(zagVarR);
            sagVarT.g(i);
            if (!lbgVar.equals(lbg.BROADCAST_ACTION_UNSPECIFIED)) {
                sagVarT.b();
                uag.w((uag) sagVarT.b, lbgVar);
            }
            return (uag) sagVarT.a();
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to create logging payload", th);
            return null;
        }
    }

    public static xag zzc(int i, lbg lbgVar) {
        try {
            wag wagVarR = xag.r();
            wagVarR.b();
            xag.q((xag) wagVarR.b, i);
            if (!lbgVar.equals(lbg.BROADCAST_ACTION_UNSPECIFIED)) {
                wagVarR.b();
                xag.t((xag) wagVarR.b, lbgVar);
            }
            return (xag) wagVarR.a();
        } catch (Exception e) {
            rxf.j("BillingLogger", "Unable to create logging payload", e);
            return null;
        }
    }
}
