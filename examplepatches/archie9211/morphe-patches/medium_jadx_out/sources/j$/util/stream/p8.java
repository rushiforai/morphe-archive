package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class p8 extends b {
    public final a j;
    public final IntFunction k;
    public final boolean l;
    public long m;
    public boolean n;
    public volatile boolean o;

    public p8(a aVar, a aVar2, Spliterator spliterator, IntFunction intFunction) {
        super(aVar2, spliterator);
        this.j = aVar;
        this.k = intFunction;
        this.l = y6.ORDERED.k(aVar2.f);
    }

    @Override // j$.util.stream.d
    public final Object a() {
        y1 y1VarJ = this.a.J(-1L, this.k);
        l5 l5VarN = this.j.N(this.a.f, y1VarJ);
        a aVar = this.a;
        boolean zB = aVar.B(this.b, aVar.S(l5VarN));
        this.n = zB;
        if (zB) {
            g();
        }
        g2 g2VarBuild = y1VarJ.build();
        this.m = g2VarBuild.count();
        return g2VarBuild;
    }

    @Override // j$.util.stream.d
    public final d c(Spliterator spliterator) {
        return new p8(this, spliterator);
    }

    @Override // j$.util.stream.b
    public final void f() {
        this.i = true;
        if (this.l && this.o) {
            d(v3.G(this.j.I()));
        }
    }

    @Override // j$.util.stream.b
    public final Object h() {
        return v3.G(this.j.I());
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0041  */
    @Override // j$.util.stream.d, java.util.concurrent.CountedCompleter
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onCompletion(java.util.concurrent.CountedCompleter r9) {
        /*
            r8 = this;
            j$.util.stream.d r0 = r8.d
            if (r0 != 0) goto L6
            goto L8b
        L6:
            j$.util.stream.p8 r0 = (j$.util.stream.p8) r0
            boolean r0 = r0.n
            j$.util.stream.d r1 = r8.e
            j$.util.stream.p8 r1 = (j$.util.stream.p8) r1
            boolean r1 = r1.n
            r0 = r0 | r1
            r8.n = r0
            boolean r0 = r8.l
            r1 = 0
            if (r0 == 0) goto L2a
            boolean r0 = r8.i
            if (r0 == 0) goto L2a
            r8.m = r1
            j$.util.stream.a r0 = r8.j
            j$.util.stream.z6 r0 = r0.I()
            j$.util.stream.z2 r0 = j$.util.stream.v3.G(r0)
            goto L88
        L2a:
            boolean r0 = r8.l
            if (r0 == 0) goto L41
            j$.util.stream.d r0 = r8.d
            j$.util.stream.p8 r0 = (j$.util.stream.p8) r0
            boolean r3 = r0.n
            if (r3 == 0) goto L41
            long r1 = r0.m
            r8.m = r1
            java.lang.Object r0 = r0.i()
            j$.util.stream.g2 r0 = (j$.util.stream.g2) r0
            goto L88
        L41:
            j$.util.stream.d r0 = r8.d
            j$.util.stream.p8 r0 = (j$.util.stream.p8) r0
            long r3 = r0.m
            j$.util.stream.d r5 = r8.e
            j$.util.stream.p8 r5 = (j$.util.stream.p8) r5
            long r6 = r5.m
            long r3 = r3 + r6
            r8.m = r3
            long r3 = r0.m
            int r3 = (r3 > r1 ? 1 : (r3 == r1 ? 0 : -1))
            if (r3 != 0) goto L5d
            java.lang.Object r0 = r5.i()
            j$.util.stream.g2 r0 = (j$.util.stream.g2) r0
            goto L88
        L5d:
            long r3 = r5.m
            int r1 = (r3 > r1 ? 1 : (r3 == r1 ? 0 : -1))
            if (r1 != 0) goto L6a
            java.lang.Object r0 = r0.i()
            j$.util.stream.g2 r0 = (j$.util.stream.g2) r0
            goto L88
        L6a:
            j$.util.stream.a r0 = r8.j
            j$.util.stream.z6 r0 = r0.I()
            j$.util.stream.d r1 = r8.d
            j$.util.stream.p8 r1 = (j$.util.stream.p8) r1
            java.lang.Object r1 = r1.i()
            j$.util.stream.g2 r1 = (j$.util.stream.g2) r1
            j$.util.stream.d r2 = r8.e
            j$.util.stream.p8 r2 = (j$.util.stream.p8) r2
            java.lang.Object r2 = r2.i()
            j$.util.stream.g2 r2 = (j$.util.stream.g2) r2
            j$.util.stream.i2 r0 = j$.util.stream.v3.E(r0, r1, r2)
        L88:
            r8.d(r0)
        L8b:
            r0 = 1
            r8.o = r0
            super.onCompletion(r9)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.stream.p8.onCompletion(java.util.concurrent.CountedCompleter):void");
    }

    public p8(p8 p8Var, Spliterator spliterator) {
        super(p8Var, spliterator);
        this.j = p8Var.j;
        this.k = p8Var.k;
        this.l = p8Var.l;
    }
}
