package j$.util.stream;

import j$.util.Spliterator;
import java.util.concurrent.CountedCompleter;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class v5 extends b {
    public final a j;
    public final IntFunction k;
    public final long l;
    public final long m;
    public long n;
    public volatile boolean o;

    public v5(v5 v5Var, Spliterator spliterator) {
        super(v5Var, spliterator);
        this.j = v5Var.j;
        this.k = v5Var.k;
        this.l = v5Var.l;
        this.m = v5Var.m;
    }

    @Override // j$.util.stream.d
    public final Object a() {
        if (b()) {
            y6 y6Var = y6.SIZED;
            a aVar = this.j;
            int i = aVar.c;
            int i2 = y6Var.e;
            y1 y1VarJ = this.j.J((i & i2) == i2 ? aVar.G(this.b) : -1L, this.k);
            l5 l5VarN = this.j.N(this.a.f, y1VarJ);
            a aVar2 = this.a;
            aVar2.B(this.b, aVar2.S(l5VarN));
            return y1VarJ.build();
        }
        y1 y1VarJ2 = this.j.J(-1L, this.k);
        if (this.l == 0) {
            l5 l5VarN2 = this.j.N(this.a.f, y1VarJ2);
            a aVar3 = this.a;
            aVar3.B(this.b, aVar3.S(l5VarN2));
        } else {
            this.a.R(this.b, y1VarJ2);
        }
        g2 g2VarBuild = y1VarJ2.build();
        this.n = g2VarBuild.count();
        this.o = true;
        this.b = null;
        return g2VarBuild;
    }

    @Override // j$.util.stream.d
    public final d c(Spliterator spliterator) {
        return new v5(this, spliterator);
    }

    @Override // j$.util.stream.b
    public final void f() {
        this.i = true;
        if (this.o) {
            d(v3.G(this.j.I()));
        }
    }

    @Override // j$.util.stream.b
    public final Object h() {
        return v3.G(this.j.I());
    }

    public final long j(long j) {
        if (this.o) {
            return this.n;
        }
        v5 v5Var = (v5) this.d;
        v5 v5Var2 = (v5) this.e;
        if (v5Var == null || v5Var2 == null) {
            return this.n;
        }
        long j2 = v5Var.j(j);
        return j2 >= j ? j2 : v5Var2.j(j) + j2;
    }

    @Override // j$.util.stream.d, java.util.concurrent.CountedCompleter
    public final void onCompletion(CountedCompleter countedCompleter) {
        v5 v5Var;
        g2 g2VarG;
        d dVar = this.d;
        if (dVar != null) {
            this.n = ((v5) dVar).n + ((v5) this.e).n;
            if (this.i) {
                this.n = 0L;
                g2VarG = v3.G(this.j.I());
            } else {
                g2VarG = this.n == 0 ? v3.G(this.j.I()) : ((v5) this.d).n == 0 ? (g2) ((v5) this.e).i() : v3.E(this.j.I(), (g2) ((v5) this.d).i(), (g2) ((v5) this.e).i());
            }
            g2 g2VarJ = g2VarG;
            if (b()) {
                g2VarJ = g2VarJ.j(this.l, this.m >= 0 ? Math.min(g2VarJ.count(), this.l + this.m) : this.n, this.k);
            }
            d(g2VarJ);
            this.o = true;
        }
        if (this.m >= 0 && !b()) {
            long j = this.l + this.m;
            long j2 = this.o ? this.n : j(j);
            if (j2 >= j) {
                g();
            } else {
                v5 v5Var2 = (v5) ((d) getCompleter());
                Object obj = this;
                while (true) {
                    if (v5Var2 == null) {
                        if (j2 >= j) {
                            break;
                        }
                    } else {
                        if (obj == v5Var2.e && (v5Var = (v5) v5Var2.d) != null) {
                            long j3 = v5Var.j(j) + j2;
                            if (j3 >= j) {
                                break;
                            } else {
                                j2 = j3;
                            }
                        }
                        obj = v5Var2;
                        v5Var2 = (v5) ((d) v5Var2.getCompleter());
                    }
                }
                g();
            }
        }
        super.onCompletion(countedCompleter);
    }

    public v5(a aVar, a aVar2, Spliterator spliterator, IntFunction intFunction, long j, long j2) {
        super(aVar2, spliterator);
        this.j = aVar;
        this.k = intFunction;
        this.l = j;
        this.m = j2;
    }
}
