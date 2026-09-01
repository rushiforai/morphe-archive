package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jh0 implements lm8 {
    public static final jh0 a = new jh0();
    public static final gf4 b = gf4.a("appId");
    public static final gf4 c = gf4.a("deviceModel");
    public static final gf4 d = gf4.a("sessionSdkVersion");
    public static final gf4 e = gf4.a("osVersion");
    public static final gf4 f = gf4.a("logEnvironment");
    public static final gf4 g = gf4.a("androidAppInfo");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        w60 w60Var = (w60) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, w60Var.a);
        mm8Var.a(c, Build.MODEL);
        mm8Var.a(d, "3.0.6");
        mm8Var.a(e, Build.VERSION.RELEASE);
        mm8Var.a(f, w60Var.b);
        mm8Var.a(g, w60Var.c);
    }
}
