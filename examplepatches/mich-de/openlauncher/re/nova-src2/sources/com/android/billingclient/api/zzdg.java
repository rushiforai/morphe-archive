package com.android.billingclient.api;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import com.google.android.gms.internal.play_billing.a2;
import com.google.android.gms.internal.play_billing.b2;
import com.google.android.gms.internal.play_billing.d4;
import com.google.android.gms.internal.play_billing.m0;

/* loaded from: classes2.dex */
final class zzdg {
    public static Bundle zza(b2 b2Var, d4 d4Var) {
        Bundle bundle = new Bundle();
        bundle.putByteArray("REQUEST_METADATA", b2Var.b());
        bundle.putByteArray("REQUEST_PARAMS", d4Var.b());
        return bundle;
    }

    public static b2 zzb(String str, int i5, Context context, String str2) {
        String strValueOf;
        a2 a2VarQ = b2.q();
        a2VarQ.d();
        b2.u((b2) a2VarQ.f33564b, str);
        a2VarQ.d();
        b2.v((b2) a2VarQ.f33564b);
        String packageName = context.getPackageName();
        a2VarQ.d();
        b2.s((b2) a2VarQ.f33564b, packageName);
        a2VarQ.d();
        b2.t((b2) a2VarQ.f33564b, str2);
        try {
            strValueOf = String.valueOf(context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode);
        } catch (PackageManager.NameNotFoundException unused) {
            m0.h("DelegationApiParamsBuilder", "No version code is found!");
            strValueOf = null;
        }
        if (strValueOf != null) {
            a2VarQ.d();
            b2.r((b2) a2VarQ.f33564b, strValueOf);
        }
        return (b2) a2VarQ.a();
    }
}
