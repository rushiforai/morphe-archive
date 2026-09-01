package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d39 {
    public final Context a;
    public final cxd b;
    public final String c;
    public final eh3 d;
    public final z19 e;

    public d39(Context context, cxd cxdVar, String str, eh3 eh3Var, z19 z19Var) {
        context.getClass();
        cxdVar.getClass();
        eh3Var.getClass();
        z19Var.getClass();
        this.a = context;
        this.b = cxdVar;
        this.c = str;
        this.d = eh3Var;
        this.e = z19Var;
    }

    public final c39 a(f29 f29Var, l09 l09Var) {
        return new c39(this.a, this.b, this.c, this.d, l09Var, f29Var, u29.EDIT, false, this.e);
    }

    public final c39 b(f29 f29Var, l09 l09Var) {
        return new c39(this.a, this.b, this.c, this.d, l09Var, f29Var, u29.VIEW, true, this.e);
    }
}
