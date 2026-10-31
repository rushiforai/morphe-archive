package gv;

/* loaded from: classes4.dex */
public final class f0 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f57867a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f57868b;

    public f0(boolean z11, boolean z12) {
        this.f57867a = z11;
        this.f57868b = z12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f0)) {
            return false;
        }
        f0 f0Var = (f0) obj;
        return this.f57867a == f0Var.f57867a && this.f57868b == f0Var.f57868b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f57868b) + (Boolean.hashCode(this.f57867a) * 31);
    }

    public final String toString() {
        return "Metadata(isReloadingAfterProcessDeath=" + this.f57867a + ", initializedViaCompose=" + this.f57868b + ")";
    }
}
