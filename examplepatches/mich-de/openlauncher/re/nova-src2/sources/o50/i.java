package o50;

import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final String f79574a;

    /* renamed from: b, reason: collision with root package name */
    public final String f79575b;

    public i(String name, String value) {
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        this.f79574a = name;
        this.f79575b = value;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return r70.j.B0(iVar.f79574a, this.f79574a, true) && r70.j.B0(iVar.f79575b, this.f79575b, true);
    }

    public final int hashCode() {
        Locale locale = Locale.ROOT;
        String lowerCase = this.f79574a.toLowerCase(locale);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        int iHashCode = lowerCase.hashCode();
        String lowerCase2 = this.f79575b.toLowerCase(locale);
        Intrinsics.f(lowerCase2, "toLowerCase(...)");
        return lowerCase2.hashCode() + (iHashCode * 31) + iHashCode;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("HeaderValueParam(name=");
        sb2.append(this.f79574a);
        sb2.append(", value=");
        return b.c0.q(sb2, this.f79575b, ", escapeValue=false)");
    }
}
