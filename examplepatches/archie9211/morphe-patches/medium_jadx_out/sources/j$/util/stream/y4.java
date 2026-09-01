package j$.util.stream;

import j$.util.Objects;
import java.util.function.DoubleConsumer;
import java.util.function.IntConsumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class y4 extends h5 {
    public final /* synthetic */ int b = 0;
    public boolean c;
    public final Object d;
    public final /* synthetic */ a e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y4(q qVar, l5 l5Var) {
        super(l5Var);
        this.e = qVar;
        l5 l5Var2 = this.a;
        Objects.requireNonNull(l5Var2);
        this.d = new j$.util.b0(l5Var2, 1);
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final void n(Object obj) throws Exception {
        int i = this.b;
        l5 l5Var = this.a;
        a aVar = this.e;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                j$.util.j0 j0Var = (j$.util.j0) obj2;
                l1 l1Var = (l1) ((j$.util.n) ((e1) aVar).m).apply(obj);
                if (l1Var != null) {
                    try {
                        if (this.c) {
                            j$.util.x0 x0VarSpliterator = l1Var.sequential().spliterator();
                            while (!l5Var.e() && x0VarSpliterator.tryAdvance((LongConsumer) j0Var)) {
                            }
                        } else {
                            l1Var.sequential().forEach(j0Var);
                        }
                    } catch (Throwable th) {
                        try {
                            l1Var.close();
                            break;
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                        throw th;
                    }
                    break;
                }
                if (l1Var != null) {
                    l1Var.close();
                    return;
                }
                return;
            case 1:
                j$.util.f0 f0Var = (j$.util.f0) obj2;
                IntStream intStream = (IntStream) ((j$.util.n) ((u0) aVar).m).apply(obj);
                if (intStream != null) {
                    try {
                        if (this.c) {
                            j$.util.u0 u0VarSpliterator = intStream.sequential().spliterator();
                            while (!l5Var.e() && u0VarSpliterator.tryAdvance((IntConsumer) f0Var)) {
                            }
                        } else {
                            intStream.sequential().forEach(f0Var);
                        }
                    } catch (Throwable th3) {
                        try {
                            intStream.close();
                            break;
                        } catch (Throwable th4) {
                            th3.addSuppressed(th4);
                        }
                        throw th3;
                    }
                    break;
                }
                if (intStream != null) {
                    intStream.close();
                    return;
                }
                return;
            default:
                j$.util.b0 b0Var = (j$.util.b0) obj2;
                c0 c0Var = (c0) ((j$.util.n) ((q) aVar).m).apply(obj);
                if (c0Var != null) {
                    try {
                        if (this.c) {
                            j$.util.r0 r0VarSpliterator = c0Var.sequential().spliterator();
                            while (!l5Var.e() && r0VarSpliterator.tryAdvance((DoubleConsumer) b0Var)) {
                            }
                        } else {
                            c0Var.sequential().forEach(b0Var);
                        }
                    } catch (Throwable th5) {
                        try {
                            c0Var.close();
                            break;
                        } catch (Throwable th6) {
                            th5.addSuppressed(th6);
                        }
                        throw th5;
                    }
                    break;
                }
                if (c0Var != null) {
                    c0Var.close();
                    return;
                }
                return;
        }
    }

    @Override // j$.util.stream.h5, j$.util.stream.l5
    public final void c(long j) {
        switch (this.b) {
            case 0:
                this.a.c(-1L);
                break;
            case 1:
                this.a.c(-1L);
                break;
            default:
                this.a.c(-1L);
                break;
        }
    }

    @Override // j$.util.stream.h5, j$.util.stream.l5
    public final boolean e() {
        switch (this.b) {
            case 0:
                this.c = true;
                break;
            case 1:
                this.c = true;
                break;
            default:
                this.c = true;
                break;
        }
        return this.a.e();
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y4(u0 u0Var, l5 l5Var) {
        super(l5Var);
        this.e = u0Var;
        l5 l5Var2 = this.a;
        Objects.requireNonNull(l5Var2);
        this.d = new j$.util.f0(l5Var2, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y4(e1 e1Var, l5 l5Var) {
        super(l5Var);
        this.e = e1Var;
        l5 l5Var2 = this.a;
        Objects.requireNonNull(l5Var2);
        this.d = new j$.util.j0(l5Var2, 1);
    }
}
