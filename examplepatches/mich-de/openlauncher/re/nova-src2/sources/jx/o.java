package jx;

/* loaded from: classes4.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f70421a;

    public o(boolean z11) {
        this.f70421a = z11;
    }

    public final boolean a() {
        return this.f70421a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof o) && this.f70421a == ((o) obj).f70421a;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f70421a);
    }

    public final String toString() {
        return a80.m.i("EvaluationResult(isConditionMet=", ")", this.f70421a);
    }
}
