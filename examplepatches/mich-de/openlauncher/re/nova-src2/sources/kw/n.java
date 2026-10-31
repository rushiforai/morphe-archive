package kw;

import java.util.Map;

/* loaded from: classes4.dex */
public final class n implements o {

    /* renamed from: a, reason: collision with root package name */
    public final Object f72496a;

    public n(Map map) {
        this.f72496a = map;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.Map] */
    @Override // kw.o
    public final Map a() {
        return this.f72496a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof n) && this.f72496a.equals(((n) obj).f72496a);
    }

    public final int hashCode() {
        return this.f72496a.hashCode();
    }

    public final String toString() {
        return "OnValues(values=" + this.f72496a + ")";
    }
}
