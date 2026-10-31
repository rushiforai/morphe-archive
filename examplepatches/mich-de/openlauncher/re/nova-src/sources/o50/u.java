package o50;

import b.u4;

/* loaded from: classes.dex */
public final class u {

    /* renamed from: d, reason: collision with root package name */
    public static final u f79590d = new u("HTTP", 1, 1);

    /* renamed from: a, reason: collision with root package name */
    public final String f79591a;

    /* renamed from: b, reason: collision with root package name */
    public final int f79592b;

    /* renamed from: c, reason: collision with root package name */
    public final int f79593c;

    public u(String str, int i5, int i11) {
        this.f79591a = str;
        this.f79592b = i5;
        this.f79593c = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return this.f79591a.equals(uVar.f79591a) && this.f79592b == uVar.f79592b && this.f79593c == uVar.f79593c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f79593c) + u4.a(this.f79592b, this.f79591a.hashCode() * 31, 31);
    }

    public final String toString() {
        return this.f79591a + '/' + this.f79592b + '.' + this.f79593c;
    }
}
