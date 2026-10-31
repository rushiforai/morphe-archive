package vk;

/* loaded from: classes.dex */
public final class a extends k {

    /* renamed from: a, reason: collision with root package name */
    public static final a f92803a = new a();

    @Override // vk.k
    public final Object a() {
        throw new IllegalStateException("Optional.get() cannot be called on an absent value");
    }

    @Override // vk.k
    public final boolean b() {
        return false;
    }

    @Override // vk.k
    public final Object c() {
        return null;
    }

    public final boolean equals(Object obj) {
        return obj == this;
    }

    public final int hashCode() {
        return 2040732332;
    }

    public final String toString() {
        return "Optional.absent()";
    }
}
