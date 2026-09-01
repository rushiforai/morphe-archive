package defpackage;

import java.io.Closeable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class adb implements Closeable {
    public final kbb a;
    public final c8a b;
    public final String c;
    public final int d;
    public final ji5 e;
    public final yi5 f;
    public final fdb g;
    public final xjc h;
    public final adb i;
    public final adb j;
    public final adb k;
    public final long l;
    public final long m;
    public final zf3 n;
    public final erd o;
    public b31 p;
    public final boolean q;

    public adb(kbb kbbVar, c8a c8aVar, String str, int i, ji5 ji5Var, yi5 yi5Var, fdb fdbVar, xjc xjcVar, adb adbVar, adb adbVar2, adb adbVar3, long j, long j2, zf3 zf3Var, erd erdVar) {
        kbbVar.getClass();
        c8aVar.getClass();
        str.getClass();
        fdbVar.getClass();
        erdVar.getClass();
        this.a = kbbVar;
        this.b = c8aVar;
        this.c = str;
        this.d = i;
        this.e = ji5Var;
        this.f = yi5Var;
        this.g = fdbVar;
        this.h = xjcVar;
        this.i = adbVar;
        this.j = adbVar2;
        this.k = adbVar3;
        this.l = j;
        this.m = j2;
        this.n = zf3Var;
        this.o = erdVar;
        boolean z = false;
        if (200 <= i && i < 300) {
            z = true;
        }
        this.q = z;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.g.close();
    }

    public final b31 f() {
        b31 b31Var = this.p;
        if (b31Var != null) {
            return b31Var;
        }
        int i = b31.n;
        b31 b31VarU = f49.U(this.f);
        this.p = b31VarU;
        return b31VarU;
    }

    public final ycb m() {
        ycb ycbVar = new ycb();
        ycbVar.c = -1;
        ycbVar.g = fdb.b;
        ycbVar.o = erd.i0;
        ycbVar.a = this.a;
        ycbVar.b = this.b;
        ycbVar.c = this.d;
        ycbVar.d = this.c;
        ycbVar.e = this.e;
        ycbVar.f = iq7.E(this.f);
        ycbVar.g = this.g;
        ycbVar.h = this.h;
        ycbVar.i = this.i;
        ycbVar.j = this.j;
        ycbVar.k = this.k;
        ycbVar.l = this.l;
        ycbVar.m = this.m;
        ycbVar.n = this.n;
        ycbVar.o = this.o;
        return ycbVar;
    }

    public final String toString() {
        return "Response{protocol=" + this.b + ", code=" + this.d + ", message=" + this.c + ", url=" + this.a.a + '}';
    }
}
