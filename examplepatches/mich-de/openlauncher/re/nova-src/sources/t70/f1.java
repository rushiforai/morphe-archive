package t70;

import kotlin.Unit;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class f1 implements Runnable, Comparable, a1 {

    @Nullable
    private volatile Object _heap;

    /* renamed from: a, reason: collision with root package name */
    public long f88792a;

    /* renamed from: b, reason: collision with root package name */
    public int f88793b = -1;

    public f1(long j11) {
        this.f88792a = j11;
    }

    public final int b(long j11, g1 g1Var, h1 h1Var) {
        synchronized (this) {
            if (this._heap == m0.f88826b) {
                return 2;
            }
            synchronized (g1Var) {
                try {
                    f1[] f1VarArr = g1Var.f96838a;
                    f1 f1Var = f1VarArr != null ? f1VarArr[0] : null;
                    if (h1.f88800i.get(h1Var) == 1) {
                        return 1;
                    }
                    if (f1Var == null) {
                        g1Var.f88796c = j11;
                    } else {
                        long j12 = f1Var.f88792a;
                        if (j12 - j11 < 0) {
                            j11 = j12;
                        }
                        if (j11 - g1Var.f88796c > 0) {
                            g1Var.f88796c = j11;
                        }
                    }
                    long j13 = this.f88792a;
                    long j14 = g1Var.f88796c;
                    if (j13 - j14 < 0) {
                        this.f88792a = j14;
                    }
                    g1Var.a(this);
                    return 0;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }

    public final void c(g1 g1Var) {
        if (this._heap == m0.f88826b) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        this._heap = g1Var;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        long j11 = this.f88792a - ((f1) obj).f88792a;
        if (j11 > 0) {
            return 1;
        }
        return j11 < 0 ? -1 : 0;
    }

    @Override // t70.a1
    public final void dispose() {
        synchronized (this) {
            try {
                Object obj = this._heap;
                w50.g gVar = m0.f88826b;
                if (obj == gVar) {
                    return;
                }
                g1 g1Var = obj instanceof g1 ? (g1) obj : null;
                if (g1Var != null) {
                    synchronized (g1Var) {
                        Object obj2 = this._heap;
                        if ((obj2 instanceof y70.z ? (y70.z) obj2 : null) != null) {
                            g1Var.b(this.f88793b);
                        }
                    }
                }
                this._heap = gVar;
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public String toString() {
        return a2.c.n(new StringBuilder("Delayed[nanos="), this.f88792a, AbstractJsonLexerKt.END_LIST);
    }
}
