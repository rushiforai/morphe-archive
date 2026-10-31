package androidx.recyclerview.widget;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public int f14873a;

    /* renamed from: b, reason: collision with root package name */
    public int f14874b;

    /* renamed from: c, reason: collision with root package name */
    public Object f14875c;

    /* renamed from: d, reason: collision with root package name */
    public int f14876d;

    public a(Object obj, int i5, int i11, int i12) {
        this.f14873a = i5;
        this.f14874b = i11;
        this.f14876d = i12;
        this.f14875c = obj;
    }

    public final boolean equals(Object obj) {
        if (this != obj) {
            if (!(obj instanceof a)) {
                return false;
            }
            a aVar = (a) obj;
            int i5 = this.f14873a;
            if (i5 != aVar.f14873a) {
                return false;
            }
            if (i5 != 8 || Math.abs(this.f14876d - this.f14874b) != 1 || this.f14876d != aVar.f14874b || this.f14874b != aVar.f14876d) {
                if (this.f14876d != aVar.f14876d || this.f14874b != aVar.f14874b) {
                    return false;
                }
                Object obj2 = this.f14875c;
                if (obj2 != null) {
                    if (!obj2.equals(aVar.f14875c)) {
                        return false;
                    }
                } else if (aVar.f14875c != null) {
                    return false;
                }
            }
        }
        return true;
    }

    public final int hashCode() {
        return (((this.f14873a * 31) + this.f14874b) * 31) + this.f14876d;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(Integer.toHexString(System.identityHashCode(this)));
        sb2.append("[");
        int i5 = this.f14873a;
        sb2.append(i5 != 1 ? i5 != 2 ? i5 != 4 ? i5 != 8 ? "??" : "mv" : "up" : "rm" : "add");
        sb2.append(",s:");
        sb2.append(this.f14874b);
        sb2.append("c:");
        sb2.append(this.f14876d);
        sb2.append(",p:");
        sb2.append(this.f14875c);
        sb2.append("]");
        return sb2.toString();
    }
}
