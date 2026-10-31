package rg;

/* loaded from: classes3.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final Object f85889a;

    /* renamed from: b, reason: collision with root package name */
    public final String f85890b;

    public i(Object obj, String str) {
        this.f85889a = obj;
        this.f85890b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return this.f85889a == iVar.f85889a && this.f85890b.equals(iVar.f85890b);
    }

    public final int hashCode() {
        return this.f85890b.hashCode() + (System.identityHashCode(this.f85889a) * 31);
    }
}
