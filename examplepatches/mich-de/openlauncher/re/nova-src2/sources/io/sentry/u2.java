package io.sentry;

/* loaded from: classes4.dex */
public abstract class u2 implements Comparable {
    @Override // java.lang.Comparable
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public int compareTo(u2 u2Var) {
        return Long.valueOf(d()).compareTo(Long.valueOf(u2Var.d()));
    }

    public long b(u2 u2Var) {
        return d() - u2Var.d();
    }

    public long c(u2 u2Var) {
        return (u2Var == null || compareTo(u2Var) >= 0) ? d() : u2Var.d();
    }

    public abstract long d();
}
