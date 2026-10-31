package ads_mobile_sdk;

import b.c0;
import b.t2;
import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class ia2 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f4694a;

    /* renamed from: b, reason: collision with root package name */
    public final String f4695b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f4696c;

    /* renamed from: d, reason: collision with root package name */
    public final String f4697d;

    /* renamed from: e, reason: collision with root package name */
    public final String f4698e;

    /* renamed from: f, reason: collision with root package name */
    public final String f4699f;

    /* renamed from: g, reason: collision with root package name */
    public final String f4700g;

    /* renamed from: h, reason: collision with root package name */
    public final String f4701h;

    /* renamed from: i, reason: collision with root package name */
    public final String f4702i;

    public ia2(String str, String str2, Integer num, String str3, String str4, String str5, String appName, String str6, String str7) {
        Intrinsics.g(appName, "appName");
        this.f4694a = str;
        this.f4695b = str2;
        this.f4696c = num;
        this.f4697d = str3;
        this.f4698e = str4;
        this.f4699f = str5;
        this.f4700g = appName;
        this.f4701h = str6;
        this.f4702i = str7;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.packageName = this.f4694a;
        signals.versionName = this.f4695b;
        signals.versionCode = this.f4696c;
        signals.displayLabel = this.f4697d;
        signals.installerPackage = this.f4698e;
        signals.initiatorPackage = this.f4699f;
        signals.appName = this.f4700g;
        signals.appWebPropertyCode = this.f4701h;
        signals.applicationCode = this.f4702i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ia2)) {
            return false;
        }
        ia2 ia2Var = (ia2) obj;
        return Intrinsics.b(this.f4694a, ia2Var.f4694a) && Intrinsics.b(this.f4695b, ia2Var.f4695b) && Intrinsics.b(this.f4696c, ia2Var.f4696c) && Intrinsics.b(this.f4697d, ia2Var.f4697d) && Intrinsics.b(this.f4698e, ia2Var.f4698e) && Intrinsics.b(this.f4699f, ia2Var.f4699f) && Intrinsics.b(this.f4700g, ia2Var.f4700g) && Intrinsics.b(this.f4701h, ia2Var.f4701h) && Intrinsics.b(this.f4702i, ia2Var.f4702i);
    }

    public final int hashCode() {
        int iHashCode = this.f4694a.hashCode() * 31;
        String str = this.f4695b;
        int iHashCode2 = (this.f4696c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31)) * 31;
        String str2 = this.f4697d;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f4698e;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f4699f;
        int iA = t2.a(this.f4700g, (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31);
        String str5 = this.f4701h;
        int iHashCode5 = (iA + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f4702i;
        return iHashCode5 + (str6 != null ? str6.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("PackageInfoSignal(packageName=", this.f4694a, ", versionName=", this.f4695b, ", versionCode=");
        sbW.append(this.f4696c);
        sbW.append(", displayLabel=");
        sbW.append(this.f4697d);
        sbW.append(", installerPackage=");
        c0.D(sbW, this.f4698e, ", initiatorPackage=", this.f4699f, ", appName=");
        c0.D(sbW, this.f4700g, ", appWebPropertyCode=", this.f4701h, ", applicationCode=");
        return c0.q(sbW, this.f4702i, ")");
    }
}
