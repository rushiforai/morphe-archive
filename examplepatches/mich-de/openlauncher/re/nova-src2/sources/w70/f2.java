package w70;

import kotlin.collections.builders.ListBuilder;

/* loaded from: classes.dex */
public final class f2 implements z1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f93899a;

    public f2(long j11) {
        this.f93899a = j11;
        if (j11 < 0) {
            throw new IllegalArgumentException(h6.c1.o(j11, "stopTimeout(", " ms) cannot be negative").toString());
        }
    }

    @Override // w70.z1
    public final m a(x70.a0 a0Var) {
        return u1.k(new z(u1.A(a0Var, new e2(this, null)), new h50.d(2, null, 3)));
    }

    public final boolean equals(Object obj) {
        if (obj instanceof f2) {
            return this.f93899a == ((f2) obj).f93899a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(Long.MAX_VALUE) + (Long.hashCode(this.f93899a) * 31);
    }

    public final String toString() {
        ListBuilder listBuilder = new ListBuilder(2);
        long j11 = this.f93899a;
        if (j11 > 0) {
            listBuilder.add("stopTimeout=" + j11 + "ms");
        }
        return h6.c1.t(new StringBuilder("SharingStarted.WhileSubscribed("), b70.g.f1(ul.b.m(listBuilder), null, null, null, 0, null, 63), ')');
    }
}
