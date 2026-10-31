package kw;

/* loaded from: classes4.dex */
public final class e0 implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f72356a;

    public e0(boolean z11) {
        this.f72356a = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e0) && this.f72356a == ((e0) obj).f72356a;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f72356a);
    }

    public final String toString() {
        return a80.m.i("Full(selectsFirstOptionAsDefault=", ")", this.f72356a);
    }
}
