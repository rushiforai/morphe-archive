package c0;

import p1.s2;
import p1.y2;

/* loaded from: classes.dex */
public final class n implements y2 {

    /* renamed from: a, reason: collision with root package name */
    public final i2 f18877a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.e1 f18878b;

    /* renamed from: c, reason: collision with root package name */
    public s f18879c;

    /* renamed from: d, reason: collision with root package name */
    public long f18880d;

    /* renamed from: e, reason: collision with root package name */
    public long f18881e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f18882f;

    public /* synthetic */ n(i2 i2Var, Object obj, s sVar, int i5) {
        this(i2Var, obj, (i5 & 4) != 0 ? null : sVar, Long.MIN_VALUE, Long.MIN_VALUE, false);
    }

    public final Object a() {
        return this.f18877a.f18833b.invoke(this.f18879c);
    }

    @Override // p1.y2
    public final Object getValue() {
        return ((s2) this.f18878b).getValue();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AnimationState(value=");
        sb2.append(((s2) this.f18878b).getValue());
        sb2.append(", velocity=");
        sb2.append(a());
        sb2.append(", isRunning=");
        sb2.append(this.f18882f);
        sb2.append(", lastFrameTimeNanos=");
        sb2.append(this.f18880d);
        sb2.append(", finishedTimeNanos=");
        return a2.c.n(sb2, this.f18881e, ')');
    }

    public n(i2 i2Var, Object obj, s sVar, long j11, long j12, boolean z11) {
        s sVarD;
        this.f18877a = i2Var;
        this.f18878b = androidx.compose.runtime.d.k(obj);
        if (sVar != null) {
            sVarD = f.d(sVar);
        } else {
            sVarD = (s) i2Var.f18832a.invoke(obj);
            sVarD.d();
        }
        this.f18879c = sVarD;
        this.f18880d = j11;
        this.f18881e = j12;
        this.f18882f = z11;
    }
}
