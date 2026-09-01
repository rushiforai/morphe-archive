package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i93 {
    public final x67 a;
    public final b38 b;
    public final no3 c;
    public final bn1 d;
    public final rx e;
    public final zx8 f;
    public final zi5 g;
    public final q14 h;
    public final fa4 i;
    public final an4 j;
    public final Iterable k;
    public final n0c l;
    public final zi5 m;
    public final bb n;
    public final fa9 o;
    public final q74 p;
    public final cf8 q;
    public final List r;
    public final h04 s;
    public final hn1 t;

    public i93(x67 x67Var, b38 b38Var, bn1 bn1Var, rx rxVar, zx8 zx8Var, q14 q14Var, an4 an4Var, Iterable iterable, n0c n0cVar, bb bbVar, fa9 fa9Var, q74 q74Var, cf8 cf8Var, hpe hpeVar, List list, h04 h04Var) {
        no3 no3Var = no3.c;
        zi5 zi5Var = zi5.e;
        fa4 fa4Var = fa4.m;
        b38Var.getClass();
        q74Var.getClass();
        cf8Var.getClass();
        h04Var.getClass();
        this.a = x67Var;
        this.b = b38Var;
        this.c = no3Var;
        this.d = bn1Var;
        this.e = rxVar;
        this.f = zx8Var;
        this.g = zi5Var;
        this.h = q14Var;
        this.i = fa4Var;
        this.j = an4Var;
        this.k = iterable;
        this.l = n0cVar;
        this.m = s92.a;
        this.n = bbVar;
        this.o = fa9Var;
        this.p = q74Var;
        this.q = cf8Var;
        this.r = list;
        this.s = h04Var;
        this.t = new hn1(this);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public i93(x67 x67Var, b38 b38Var, pkf pkfVar, s26 s26Var, zx8 zx8Var, Iterable iterable, n0c n0cVar, bb bbVar, fa9 fa9Var, q74 q74Var, cf8 cf8Var, hpe hpeVar, int i) {
        cf8 cf8Var2;
        jzb jzbVar = jzb.d;
        h04 h04Var = y3b.g;
        if ((i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0) {
            cf8.b.getClass();
            cf8Var2 = bf8.b;
        } else {
            cf8Var2 = cf8Var;
        }
        this(x67Var, b38Var, pkfVar, s26Var, zx8Var, q14.d0, jzbVar, iterable, n0cVar, bbVar, fa9Var, q74Var, cf8Var2, hpeVar, d46.Q(d33.a), (i & 524288) != 0 ? rz5.e : h04Var);
    }
}
