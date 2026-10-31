package ads_mobile_sdk;

import android.net.Uri;
import c90.f;
import kotlin.jvm.internal.Intrinsics;
import x80.m0;
import x80.x;

/* loaded from: classes.dex */
public final class cn0 implements x80.y {

    /* renamed from: a, reason: collision with root package name */
    public final bn0 f1949a;

    /* renamed from: b, reason: collision with root package name */
    public final jr0 f1950b;

    public cn0(bn0 firebaseAnalyticsIds, jr0 flags) {
        Intrinsics.g(firebaseAnalyticsIds, "firebaseAnalyticsIds");
        Intrinsics.g(flags, "flags");
        this.f1949a = firebaseAnalyticsIds;
        this.f1950b = flags;
    }

    @Override // x80.y
    public final m0 intercept(x xVar) {
        f fVar = (f) xVar;
        String str = fVar.f19892e.f95509a.f95633i;
        String strR = this.f1950b.R();
        bn0 bn0Var = this.f1949a;
        Uri.Builder builderAppendQueryParameter = Uri.parse(r70.j.F0(str, strR, bn0Var.f1471c, false)).buildUpon().appendQueryParameter("gmp_app_id", bn0Var.f1469a).appendQueryParameter("fbs_aiid", bn0Var.f1470b);
        if (builderAppendQueryParameter.build().getQueryParameter("fbs_aeid") == null) {
            builderAppendQueryParameter.appendQueryParameter("fbs_aeid", bn0Var.f1471c);
        }
        Uri uriBuild = builderAppendQueryParameter.build();
        x80.g0 g0Var = new x80.g0();
        String string = uriBuild.toString();
        Intrinsics.f(string, "toString(...)");
        g0Var.k(string);
        return fVar.b(g0Var.b());
    }
}
