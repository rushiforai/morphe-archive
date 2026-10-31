package u80;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class b extends c {

    /* renamed from: a, reason: collision with root package name */
    public final String f90681a;

    /* renamed from: b, reason: collision with root package name */
    public final String f90682b;

    /* renamed from: c, reason: collision with root package name */
    public final String f90683c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90684d;

    /* renamed from: e, reason: collision with root package name */
    public final String f90685e;

    /* renamed from: f, reason: collision with root package name */
    public final String f90686f;

    public b(String str, String str2, String str3, String str4, String str5, String str6) {
        this.f90681a = str;
        this.f90682b = str2;
        this.f90683c = str3;
        this.f90684d = str4;
        this.f90685e = str5;
        this.f90686f = str6;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f90681a, bVar.f90681a) && Intrinsics.b(this.f90682b, bVar.f90682b) && Intrinsics.b(this.f90683c, bVar.f90683c) && Intrinsics.b(this.f90684d, bVar.f90684d) && Intrinsics.b(this.f90685e, bVar.f90685e) && Intrinsics.b(this.f90686f, bVar.f90686f);
    }

    public final int hashCode() {
        int iE = c0.e(c0.e(this.f90681a.hashCode() * 31, 31, this.f90682b), 31, this.f90683c);
        String str = this.f90684d;
        return this.f90686f.hashCode() + c0.e((iE + (str == null ? 0 : str.hashCode())) * 31, 31, this.f90685e);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("Folder(id=", this.f90681a, ", displayName=", this.f90682b, ", path=");
        c0.D(sbW, this.f90683c, ", openUri=", this.f90684d, ", iconUri=");
        return c0.s(sbW, this.f90685e, ", sharedFolderId=", this.f90686f, ")");
    }
}
