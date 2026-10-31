package o50;

import java.util.List;
import java.util.Locale;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e extends j {

    /* renamed from: r, reason: collision with root package name */
    public static final e f79552r = new e("*", "*");

    /* renamed from: p, reason: collision with root package name */
    public final String f79553p;

    /* renamed from: q, reason: collision with root package name */
    public final String f79554q;

    public e(String str, String str2, List list, String str3) {
        super(str3, list);
        this.f79553p = str;
        this.f79554q = str2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return r70.j.B0(this.f79553p, eVar.f79553p, true) && r70.j.B0(this.f79554q, eVar.f79554q, true) && Intrinsics.b((List) this.o, (List) eVar.o);
    }

    public final int hashCode() {
        Locale locale = Locale.ROOT;
        String lowerCase = this.f79553p.toLowerCase(locale);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        int iHashCode = lowerCase.hashCode();
        String lowerCase2 = this.f79554q.toLowerCase(locale);
        Intrinsics.f(lowerCase2, "toLowerCase(...)");
        return (((List) this.o).hashCode() * 31) + lowerCase2.hashCode() + (iHashCode * 31) + iHashCode;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public e(String contentType, String contentSubtype, List parameters) {
        this(contentType, contentSubtype, parameters, contentType + '/' + contentSubtype);
        Intrinsics.g(contentType, "contentType");
        Intrinsics.g(contentSubtype, "contentSubtype");
        Intrinsics.g(parameters, "parameters");
    }

    public e(String str, String str2) {
        this(str, str2, EmptyList.f71733a);
    }
}
