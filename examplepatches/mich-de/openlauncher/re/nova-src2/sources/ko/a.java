package ko;

import h6.c1;
import java.util.Set;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f71661a;

    /* renamed from: b, reason: collision with root package name */
    public final String f71662b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f71663c;

    /* renamed from: d, reason: collision with root package name */
    public final String f71664d;

    /* renamed from: e, reason: collision with root package name */
    public final String f71665e;

    public a(String str, String str2, Set categories, String str3, String str4, int i5) {
        str2 = (i5 & 2) != 0 ? null : str2;
        categories = (i5 & 4) != 0 ? EmptySet.f71734a : categories;
        str3 = (i5 & 8) != 0 ? null : str3;
        str4 = (i5 & 16) != 0 ? null : str4;
        Intrinsics.g(categories, "categories");
        this.f71661a = str;
        this.f71662b = str2;
        this.f71663c = categories;
        this.f71664d = str3;
        this.f71665e = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f71661a, aVar.f71661a) && Intrinsics.b(this.f71662b, aVar.f71662b) && Intrinsics.b(this.f71663c, aVar.f71663c) && Intrinsics.b(this.f71664d, aVar.f71664d) && Intrinsics.b(this.f71665e, aVar.f71665e);
    }

    public final int hashCode() {
        String str = this.f71661a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f71662b;
        int iK = c1.k(this.f71663c, (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31, 31);
        String str3 = this.f71664d;
        int iHashCode2 = (iK + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f71665e;
        return iHashCode2 + (str4 != null ? str4.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("IntentSpec(action=");
        sb2.append(this.f71661a);
        sb2.append(", data=");
        sb2.append(this.f71662b);
        sb2.append(", categories=");
        sb2.append(this.f71663c);
        sb2.append(", packageName=");
        sb2.append(this.f71664d);
        sb2.append(", mimeType=");
        return c1.t(sb2, this.f71665e, ')');
    }
}
