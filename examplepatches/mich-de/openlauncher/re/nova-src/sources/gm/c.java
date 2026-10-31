package gm;

import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f57747a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f57748b;

    public c(String str, Map map) {
        this.f57747a = str;
        this.f57748b = map;
    }

    public static c a(String str) {
        return new c(str, Collections.EMPTY_MAP);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return this.f57747a.equals(cVar.f57747a) && this.f57748b.equals(cVar.f57748b);
    }

    public final int hashCode() {
        return this.f57748b.hashCode() + (this.f57747a.hashCode() * 31);
    }

    public final String toString() {
        return "FieldDescriptor{name=" + this.f57747a + ", properties=" + this.f57748b.values() + "}";
    }
}
