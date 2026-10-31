package u00;

import android.net.Uri;
import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final String f90316a;

    /* renamed from: b, reason: collision with root package name */
    public final Uri f90317b;

    /* renamed from: c, reason: collision with root package name */
    public final String f90318c;

    /* renamed from: d, reason: collision with root package name */
    public final gz.e f90319d;

    public u(String str, Uri uri, String str2, gz.e eVar) {
        this.f90316a = str;
        this.f90317b = uri;
        this.f90318c = str2;
        this.f90319d = eVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return Intrinsics.b(this.f90316a, uVar.f90316a) && Intrinsics.b(this.f90317b, uVar.f90317b) && Intrinsics.b(this.f90318c, uVar.f90318c) && this.f90319d == uVar.f90319d;
    }

    public final int hashCode() {
        return this.f90319d.hashCode() + c0.e((this.f90317b.hashCode() + (this.f90316a.hashCode() * 31)) * 31, 31, this.f90318c);
    }

    public final String toString() {
        return "IconThemePackageInfo(label=" + this.f90316a + ", iconUri=" + this.f90317b + ", packageName=" + this.f90318c + ", type=" + this.f90319d + ")";
    }
}
