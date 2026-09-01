package defpackage;

import android.content.Context;
import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nt3 {
    public final /* synthetic */ ju3 a;
    public final /* synthetic */ rz2 b;
    public final /* synthetic */ Context c;
    public final /* synthetic */ ug7 d;
    public final /* synthetic */ l78 e;
    public final /* synthetic */ ug7 f;

    public nt3(ju3 ju3Var, rz2 rz2Var, Context context, ug7 ug7Var, l78 l78Var, ug7 ug7Var2) {
        this.a = ju3Var;
        this.b = rz2Var;
        this.c = context;
        this.d = ug7Var;
        this.e = l78Var;
        this.f = ug7Var2;
    }

    public final void a() {
        ju3 ju3Var = this.a;
        n92 n92Var = null;
        vx0.c0(f76.F(ju3Var), null, null, new gu3(ju3Var, n92Var, 0), 3);
        try {
            Uri uriZ = vx0.Z(this.c);
            this.e.setValue(uriZ);
            this.d.a(uriZ, null);
        } catch (Exception e) {
            vx0.c0(f76.F(ju3Var), null, null, new xs3(e, ju3Var, n92Var, 2), 3);
        }
    }

    public final void b() {
        ju3 ju3Var = this.a;
        vx0.c0(f76.F(ju3Var), null, null, new gu3(ju3Var, null, 0), 3);
        this.f.a(vp7.d(), null);
    }

    public final void c() {
        ju3 ju3Var = this.a;
        vx0.c0(f76.F(ju3Var), null, null, new gu3(ju3Var, null, 2), 3);
    }

    public final void d() {
        ju3 ju3Var = this.a;
        vx0.c0(f76.F(ju3Var), null, null, new gu3(ju3Var, null, 3), 3);
    }
}
