package vk;

/* loaded from: classes3.dex */
public final class o extends k {

    /* renamed from: a, reason: collision with root package name */
    public final Object f92822a;

    public o(Object obj) {
        this.f92822a = obj;
    }

    @Override // vk.k
    public final Object a() {
        return this.f92822a;
    }

    @Override // vk.k
    public final boolean b() {
        return true;
    }

    @Override // vk.k
    public final Object c() {
        return this.f92822a;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof o) {
            return this.f92822a.equals(((o) obj).f92822a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f92822a.hashCode() + 1502476572;
    }

    public final String toString() {
        return "Optional.of(" + this.f92822a + ")";
    }
}
