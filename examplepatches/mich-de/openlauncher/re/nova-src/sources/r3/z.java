package r3;

import e10.z2;
import kotlin.jvm.internal.Intrinsics;
import m3.o0;

/* loaded from: classes.dex */
public final class z {

    /* renamed from: a, reason: collision with root package name */
    public final m3.g f85471a;

    /* renamed from: b, reason: collision with root package name */
    public final long f85472b;

    /* renamed from: c, reason: collision with root package name */
    public final o0 f85473c;

    public z(m3.g gVar, long j11, o0 o0Var) {
        o0 o0Var2;
        this.f85471a = gVar;
        this.f85472b = z2.D(gVar.f75880b.length(), j11);
        if (o0Var != null) {
            o0Var2 = new o0(z2.D(gVar.f75880b.length(), o0Var.f75946a));
        } else {
            o0Var2 = null;
        }
        this.f85473c = o0Var2;
    }

    public static z a(z zVar, String str) {
        long j11 = zVar.f85472b;
        o0 o0Var = zVar.f85473c;
        zVar.getClass();
        return new z(new m3.g(str), j11, o0Var);
    }

    public static z b(z zVar, m3.g gVar, long j11, int i5) {
        if ((i5 & 1) != 0) {
            gVar = zVar.f85471a;
        }
        if ((i5 & 2) != 0) {
            j11 = zVar.f85472b;
        }
        o0 o0Var = (i5 & 4) != 0 ? zVar.f85473c : null;
        zVar.getClass();
        return new z(gVar, j11, o0Var);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z)) {
            return false;
        }
        z zVar = (z) obj;
        return o0.b(this.f85472b, zVar.f85472b) && Intrinsics.b(this.f85473c, zVar.f85473c) && Intrinsics.b(this.f85471a, zVar.f85471a);
    }

    public final int hashCode() {
        int iHashCode = this.f85471a.hashCode() * 31;
        int i5 = o0.f75945c;
        int iD = b.c0.d(iHashCode, 31, this.f85472b);
        o0 o0Var = this.f85473c;
        return iD + (o0Var != null ? Long.hashCode(o0Var.f75946a) : 0);
    }

    public final String toString() {
        return "TextFieldValue(text='" + ((Object) this.f85471a) + "', selection=" + ((Object) o0.h(this.f85472b)) + ", composition=" + this.f85473c + ')';
    }

    public z(String str, long j11, int i5) {
        this((i5 & 1) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str, (i5 & 2) != 0 ? o0.f75944b : j11, (o0) null);
    }

    public z(String str, long j11, o0 o0Var) {
        this(new m3.g(str), j11, o0Var);
    }
}
