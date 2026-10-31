package e90;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: d, reason: collision with root package name */
    public static final m90.j f52281d;

    /* renamed from: e, reason: collision with root package name */
    public static final m90.j f52282e;

    /* renamed from: f, reason: collision with root package name */
    public static final m90.j f52283f;

    /* renamed from: g, reason: collision with root package name */
    public static final m90.j f52284g;

    /* renamed from: h, reason: collision with root package name */
    public static final m90.j f52285h;

    /* renamed from: i, reason: collision with root package name */
    public static final m90.j f52286i;

    /* renamed from: a, reason: collision with root package name */
    public final m90.j f52287a;

    /* renamed from: b, reason: collision with root package name */
    public final m90.j f52288b;

    /* renamed from: c, reason: collision with root package name */
    public final int f52289c;

    static {
        m90.j jVar = m90.j.f76130d;
        f52281d = lm.e.n(":");
        f52282e = lm.e.n(":status");
        f52283f = lm.e.n(":method");
        f52284g = lm.e.n(":path");
        f52285h = lm.e.n(":scheme");
        f52286i = lm.e.n(":authority");
    }

    public a(m90.j name, m90.j value) {
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        this.f52287a = name;
        this.f52288b = value;
        this.f52289c = value.c() + name.c() + 32;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f52287a, aVar.f52287a) && Intrinsics.b(this.f52288b, aVar.f52288b);
    }

    public final int hashCode() {
        return this.f52288b.hashCode() + (this.f52287a.hashCode() * 31);
    }

    public final String toString() {
        return this.f52287a.r() + ": " + this.f52288b.r();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public a(String name, String value) {
        this(lm.e.n(name), lm.e.n(value));
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        m90.j jVar = m90.j.f76130d;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public a(m90.j name, String value) {
        this(name, lm.e.n(value));
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        m90.j jVar = m90.j.f76130d;
    }
}
