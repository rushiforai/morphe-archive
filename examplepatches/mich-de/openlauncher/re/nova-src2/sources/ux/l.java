package ux;

import b.c9;
import kotlin.jvm.internal.Intrinsics;
import ps.e0;

/* loaded from: classes4.dex */
public final class l extends e0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f91625a;

    /* renamed from: b, reason: collision with root package name */
    public final Float f91626b;

    /* renamed from: c, reason: collision with root package name */
    public final String f91627c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f91628d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f91629e;

    public l(String str, Float f11, String str2, boolean z11, boolean z12) {
        this.f91625a = str;
        this.f91626b = f11;
        this.f91627c = str2;
        this.f91628d = z11;
        this.f91629e = z12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        return Intrinsics.b(this.f91625a, lVar.f91625a) && Intrinsics.b(this.f91626b, lVar.f91626b) && Intrinsics.b(this.f91627c, lVar.f91627c) && this.f91628d == lVar.f91628d && this.f91629e == lVar.f91629e;
    }

    public final int hashCode() {
        String str = this.f91625a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        Float f11 = this.f91626b;
        int iHashCode2 = (iHashCode + (f11 == null ? 0 : f11.hashCode())) * 31;
        String str2 = this.f91627c;
        return Boolean.hashCode(this.f91629e) + c9.f((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31, 31, this.f91628d);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("World(locationName=");
        sb2.append(this.f91625a);
        sb2.append(", temperatureC=");
        sb2.append(this.f91626b);
        sb2.append(", condition=");
        a80.m.q(this.f91627c, ", isLoading=", ", permissionGranted=", sb2, this.f91628d);
        return a80.m.k(sb2, this.f91629e, ")");
    }

    public /* synthetic */ l(boolean z11, int i5) {
        this(null, null, null, (i5 & 8) != 0, (i5 & 16) != 0 ? false : z11);
    }
}
