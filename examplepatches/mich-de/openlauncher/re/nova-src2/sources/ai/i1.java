package ai;

import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

/* loaded from: classes3.dex */
public final class i1 extends FutureTask implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final long f13007a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f13008b;

    /* renamed from: c, reason: collision with root package name */
    public final String f13009c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ k1 f13010d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i1(k1 k1Var, Runnable runnable, boolean z11, String str) {
        super(runnable, null);
        this.f13010d = k1Var;
        long andIncrement = k1.f13068k.getAndIncrement();
        this.f13007a = andIncrement;
        this.f13009c = str;
        this.f13008b = z11;
        if (andIncrement == Long.MAX_VALUE) {
            o0 o0Var = ((m1) k1Var.f13368a).f13138f;
            m1.l(o0Var);
            o0Var.f13190f.a("Tasks index overflow");
        }
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        i1 i1Var = (i1) obj;
        boolean z11 = i1Var.f13008b;
        boolean z12 = this.f13008b;
        if (z12 != z11) {
            return !z12 ? 1 : -1;
        }
        long j11 = i1Var.f13007a;
        long j12 = this.f13007a;
        if (j12 < j11) {
            return -1;
        }
        if (j12 > j11) {
            return 1;
        }
        o0 o0Var = ((m1) this.f13010d.f13368a).f13138f;
        m1.l(o0Var);
        o0Var.f13191g.b(Long.valueOf(j12), "Two tasks share the same index. index");
        return 0;
    }

    @Override // java.util.concurrent.FutureTask
    public final void setException(Throwable th2) {
        o0 o0Var = ((m1) this.f13010d.f13368a).f13138f;
        m1.l(o0Var);
        o0Var.f13190f.b(th2, this.f13009c);
        super.setException(th2);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i1(k1 k1Var, Callable callable, boolean z11) {
        super(callable);
        this.f13010d = k1Var;
        long andIncrement = k1.f13068k.getAndIncrement();
        this.f13007a = andIncrement;
        this.f13009c = "Task exception on worker thread";
        this.f13008b = z11;
        if (andIncrement == Long.MAX_VALUE) {
            o0 o0Var = ((m1) k1Var.f13368a).f13138f;
            m1.l(o0Var);
            o0Var.f13190f.a("Tasks index overflow");
        }
    }
}
