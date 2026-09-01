package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ih0 implements lm8 {
    public static final ih0 a = new ih0();
    public static final gf4 b = gf4.a("packageName");
    public static final gf4 c = gf4.a("versionName");
    public static final gf4 d = gf4.a("appBuildVersion");
    public static final gf4 e = gf4.a("deviceManufacturer");
    public static final gf4 f = gf4.a("currentProcessDetails");
    public static final gf4 g = gf4.a("appProcessDetails");

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        gm gmVar = (gm) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.a(b, gmVar.a);
        mm8Var.a(c, gmVar.b);
        mm8Var.a(d, gmVar.c);
        mm8Var.a(e, Build.MANUFACTURER);
        mm8Var.a(f, gmVar.d);
        mm8Var.a(g, gmVar.e);
    }
}
