package ads_mobile_sdk;

import b.c0;
import b.t2;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class v03 {

    /* renamed from: a, reason: collision with root package name */
    public final String f10536a;

    /* renamed from: b, reason: collision with root package name */
    public final String f10537b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f10538c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f10539d;

    /* renamed from: e, reason: collision with root package name */
    public final List f10540e;

    public v03(String str, String str2, boolean z11, boolean z12, List allowedHeaders) {
        Intrinsics.g(allowedHeaders, "allowedHeaders");
        this.f10536a = str;
        this.f10537b = str2;
        this.f10538c = z11;
        this.f10539d = z12;
        this.f10540e = allowedHeaders;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v03)) {
            return false;
        }
        v03 v03Var = (v03) obj;
        return Intrinsics.b(this.f10536a, v03Var.f10536a) && Intrinsics.b(this.f10537b, v03Var.f10537b) && this.f10538c == v03Var.f10538c && this.f10539d == v03Var.f10539d && Intrinsics.b(this.f10540e, v03Var.f10540e);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = t2.a(this.f10537b, this.f10536a.hashCode() * 31);
        boolean z11 = this.f10538c;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iA + i5) * 31;
        boolean z12 = this.f10539d;
        return this.f10540e.hashCode() + ((i11 + (z12 ? 1 : z12 ? 1 : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("SafeBrowsingConfig(clickString=", this.f10536a, ", reportUrl=", this.f10537b, ", nonMaliciousReportingEnabled=");
        a80.m.s(sbW, this.f10538c, ", autoClickProtectionEnabled=", this.f10539d, ", allowedHeaders=");
        return a80.m.j(sbW, this.f10540e, ")");
    }

    public v03() {
        this(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false, false, EmptyList.f71733a);
    }
}
