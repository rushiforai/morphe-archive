package u80;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class a extends c {

    /* renamed from: a, reason: collision with root package name */
    public final String f90676a;

    /* renamed from: b, reason: collision with root package name */
    public final String f90677b;

    /* renamed from: c, reason: collision with root package name */
    public final String f90678c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90679d;

    /* renamed from: e, reason: collision with root package name */
    public final String f90680e;

    public a(String str, String str2, String str3, String str4, String str5) {
        this.f90676a = str;
        this.f90677b = str2;
        this.f90678c = str3;
        this.f90679d = str4;
        this.f90680e = str5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f90676a, aVar.f90676a) && Intrinsics.b(this.f90677b, aVar.f90677b) && Intrinsics.b(this.f90678c, aVar.f90678c) && Intrinsics.b(this.f90679d, aVar.f90679d) && Intrinsics.b(this.f90680e, aVar.f90680e);
    }

    public final int hashCode() {
        int iE = c0.e(c0.e(this.f90676a.hashCode() * 31, 31, this.f90677b), 31, this.f90678c);
        String str = this.f90679d;
        return this.f90680e.hashCode() + ((iE + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("File(id=", this.f90676a, ", displayName=", this.f90677b, ", path=");
        c0.D(sbW, this.f90678c, ", openUri=", this.f90679d, ", iconUri=");
        return c0.q(sbW, this.f90680e, ")");
    }
}
