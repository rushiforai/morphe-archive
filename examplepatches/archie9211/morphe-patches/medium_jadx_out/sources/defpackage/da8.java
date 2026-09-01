package defpackage;

import android.os.Bundle;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class da8 {
    public final ba8 a;
    public final va8 b;
    public final Bundle c;
    public vx6 d;
    public final la8 e;
    public final String f;
    public final Bundle g;
    public final fpb h;
    public boolean i;
    public final ky6 j;
    public vx6 k;
    public final ipb l;
    public final w5d m;

    public da8(ba8 ba8Var) {
        this.a = ba8Var;
        this.b = ba8Var.b;
        this.c = ba8Var.c;
        this.d = ba8Var.d;
        this.e = ba8Var.e;
        this.f = ba8Var.f;
        this.g = ba8Var.g;
        this.h = new fpb(new gpb(ba8Var, new i5b(14, ba8Var)));
        w5d w5dVar = new w5d(new oo7(16));
        this.j = new ky6(ba8Var, true);
        this.k = vx6.INITIALIZED;
        this.l = (ipb) w5dVar.getValue();
        this.m = new w5d(new oo7(17));
    }

    public final Bundle a() {
        Bundle bundle = this.c;
        if (bundle == null) {
            return null;
        }
        Bundle bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
        bundleE.putAll(bundle);
        return bundleE;
    }

    public final void b() {
        if (!this.i) {
            fpb fpbVar = this.h;
            fpbVar.a.a();
            this.i = true;
            if (this.e != null) {
                kyd.R(this.a);
            }
            fpbVar.a(this.g);
        }
        int iOrdinal = this.d.ordinal();
        int iOrdinal2 = this.k.ordinal();
        ky6 ky6Var = this.j;
        if (iOrdinal < iOrdinal2) {
            ky6Var.g(this.d);
        } else {
            ky6Var.g(this.k);
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(n1b.a.b(ba8.class).j());
        sb.append("(" + this.f + ')');
        sb.append(" destination=");
        sb.append(this.b);
        return sb.toString();
    }
}
