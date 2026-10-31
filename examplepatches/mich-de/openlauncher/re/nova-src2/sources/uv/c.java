package uv;

import b.c0;
import r70.j;
import r70.k;

/* loaded from: classes4.dex */
public final class c implements e {

    /* renamed from: d, reason: collision with root package name */
    public static final uo.f f91568d = uo.f.f91426d;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f91569a;

    /* renamed from: b, reason: collision with root package name */
    public byte f91570b = 0;

    /* renamed from: c, reason: collision with root package name */
    public byte f91571c = 0;

    public c(boolean z11) {
        this.f91569a = z11;
    }

    public static boolean a(String str) {
        return (j.A0(str, "=", false) || k.K0(str, " ", false) || k.K0(str, "+", false) || k.K0(str, "\n", false) || k.K0(str, "/", false)) ? false : true;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return this.f91569a == cVar.f91569a && this.f91570b == cVar.f91570b && this.f91571c == cVar.f91571c;
    }

    public final int hashCode() {
        return Byte.hashCode(this.f91571c) + ((Byte.hashCode(this.f91570b) + (Boolean.hashCode(this.f91569a) * 31)) * 31);
    }

    public final String toString() {
        byte b11 = this.f91570b;
        byte b12 = this.f91571c;
        StringBuilder sb2 = new StringBuilder("DefaultMessageTransformer(isLiveMode=");
        sb2.append(this.f91569a);
        sb2.append(", counterSdkToAcs=");
        sb2.append((int) b11);
        sb2.append(", counterAcsToSdk=");
        return c0.o(sb2, b12, ")");
    }
}
