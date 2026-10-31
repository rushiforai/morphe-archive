package ew;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public String f53031a;

    /* renamed from: b, reason: collision with root package name */
    public final String f53032b;

    /* renamed from: c, reason: collision with root package name */
    public final String f53033c;

    /* renamed from: d, reason: collision with root package name */
    public String f53034d;

    /* renamed from: e, reason: collision with root package name */
    public String f53035e;

    /* renamed from: f, reason: collision with root package name */
    public final String f53036f;

    /* renamed from: g, reason: collision with root package name */
    public final String f53037g;

    public a(String str, String str2, String str3, String str4, String str5, String str6, String str7) {
        this.f53031a = str;
        this.f53032b = str2;
        this.f53033c = str3;
        this.f53034d = str4;
        this.f53035e = str5;
        this.f53036f = str6;
        this.f53037g = str7;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f53031a, aVar.f53031a) && Intrinsics.b(this.f53032b, aVar.f53032b) && Intrinsics.b(this.f53033c, aVar.f53033c) && Intrinsics.b(this.f53034d, aVar.f53034d) && Intrinsics.b(this.f53035e, aVar.f53035e) && Intrinsics.b(this.f53036f, aVar.f53036f) && Intrinsics.b(this.f53037g, aVar.f53037g);
    }

    public final int hashCode() {
        String str = this.f53031a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f53032b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f53033c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f53034d;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f53035e;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f53036f;
        int iHashCode6 = (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f53037g;
        return iHashCode6 + (str7 != null ? str7.hashCode() : 0);
    }

    public final String toString() {
        String str = this.f53031a;
        String str2 = this.f53034d;
        String str3 = this.f53035e;
        StringBuilder sbW = c0.w("Address(locality=", str, ", country=", this.f53032b, ", addressLine1=");
        c0.D(sbW, this.f53033c, ", addressLine2=", str2, ", administrativeArea=");
        c0.D(sbW, str3, ", dependentLocality=", this.f53036f, ", postalCode=");
        return c0.q(sbW, this.f53037g, ")");
    }
}
