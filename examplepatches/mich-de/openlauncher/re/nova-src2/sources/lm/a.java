package lm;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f75034a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f75035b;

    public a(String str, ArrayList arrayList) {
        if (str == null) {
            throw new NullPointerException("Null userAgent");
        }
        this.f75034a = str;
        this.f75035b = arrayList;
    }

    public static a a(String str, ArrayList arrayList) {
        return new a(str, arrayList);
    }

    public final List b() {
        return this.f75035b;
    }

    public final String c() {
        return this.f75034a;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f75034a.equals(aVar.f75034a) && this.f75035b.equals(aVar.f75035b);
    }

    public final int hashCode() {
        return ((this.f75034a.hashCode() ^ 1000003) * 1000003) ^ this.f75035b.hashCode();
    }

    public final String toString() {
        return "HeartBeatResult{userAgent=" + this.f75034a + ", usedDates=" + this.f75035b + "}";
    }
}
