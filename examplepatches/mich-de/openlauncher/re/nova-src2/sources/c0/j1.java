package c0;

/* loaded from: classes2.dex */
public final class j1 implements z {

    /* renamed from: a, reason: collision with root package name */
    public final int f18846a;

    public /* synthetic */ j1() {
        this(0);
    }

    public final boolean equals(Object obj) {
        return (obj instanceof j1) && ((j1) obj).f18846a == this.f18846a;
    }

    public final int hashCode() {
        return this.f18846a;
    }

    public j1(int i5) {
        this.f18846a = i5;
    }

    @Override // c0.m
    public final l2 a(i2 i2Var) {
        return new bh.k(this.f18846a, false);
    }
}
