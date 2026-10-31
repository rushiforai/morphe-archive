package pw;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f83105a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f83106b;

    public a(String str, boolean z11) {
        this.f83105a = str;
        this.f83106b = z11;
    }

    public static a a(String str, a aVar) {
        boolean z11 = aVar.f83106b;
        aVar.getClass();
        return new a(str, z11);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f83105a, aVar.f83105a) && this.f83106b == aVar.f83106b;
    }

    public final int hashCode() {
        String str = this.f83105a;
        return Boolean.hashCode(this.f83106b) + ((str == null ? 0 : str.hashCode()) * 31);
    }

    public final String toString() {
        return "FormFieldEntry(value=" + this.f83105a + ", isComplete=" + this.f83106b + ")";
    }
}
