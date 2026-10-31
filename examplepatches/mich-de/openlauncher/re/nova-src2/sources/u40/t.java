package u40;

import b.c0;
import b.c9;
import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public final String f90628a;

    /* renamed from: b, reason: collision with root package name */
    public final String f90629b;

    /* renamed from: c, reason: collision with root package name */
    public final String f90630c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90631d;

    /* renamed from: e, reason: collision with root package name */
    public final double f90632e;

    /* renamed from: f, reason: collision with root package name */
    public final String f90633f;

    /* renamed from: g, reason: collision with root package name */
    public final String f90634g;

    public t(String str, String str2, String str3, String str4, double d5, String str5, String str6) {
        this.f90628a = str;
        this.f90629b = str2;
        this.f90630c = str3;
        this.f90631d = str4;
        this.f90632e = d5;
        this.f90633f = str5;
        this.f90634g = str6;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t)) {
            return false;
        }
        t tVar = (t) obj;
        return Intrinsics.b(this.f90628a, tVar.f90628a) && Intrinsics.b(this.f90629b, tVar.f90629b) && Intrinsics.b(this.f90630c, tVar.f90630c) && Intrinsics.b(this.f90631d, tVar.f90631d) && Double.valueOf(this.f90632e).equals(Double.valueOf(tVar.f90632e)) && Intrinsics.b(this.f90633f, tVar.f90633f) && Intrinsics.b(this.f90634g, tVar.f90634g);
    }

    public final int hashCode() {
        int iE = c0.e(c0.e(this.f90628a.hashCode() * 31, 31, this.f90629b), 31, this.f90630c);
        String str = this.f90631d;
        return this.f90634g.hashCode() + c0.e(c9.c(this.f90632e, (iE + (str == null ? 0 : str.hashCode())) * 31, 31), 31, this.f90633f);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ShortcutImportData(entityId=");
        sb2.append(this.f90628a);
        sb2.append(", packageName=");
        sb2.append(this.f90629b);
        sb2.append(", displayLabel=");
        sb2.append(this.f90630c);
        sb2.append(", description=");
        sb2.append(this.f90631d);
        sb2.append(", score=");
        sb2.append(this.f90632e);
        sb2.append(", iconUri=");
        sb2.append(this.f90633f);
        sb2.append(", linkingJson=");
        return c1.t(sb2, this.f90634g, ')');
    }
}
