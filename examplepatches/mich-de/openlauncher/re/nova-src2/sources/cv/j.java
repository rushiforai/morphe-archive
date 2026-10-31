package cv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final String f48012a;

    /* renamed from: b, reason: collision with root package name */
    public final ft.b f48013b;

    public j(String str, ft.b brand) {
        Intrinsics.g(brand, "brand");
        this.f48012a = str;
        this.f48013b = brand;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f48012a, jVar.f48012a) && this.f48013b == jVar.f48013b;
    }

    public final int hashCode() {
        String str = this.f48012a;
        return this.f48013b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
    }

    public final String toString() {
        return "CvcRecollectionData(lastFour=" + this.f48012a + ", brand=" + this.f48013b + ")";
    }
}
