package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;
import t70.p0;

/* loaded from: classes.dex */
public final class k61 {

    /* renamed from: a, reason: collision with root package name */
    public final String f5519a;

    /* renamed from: b, reason: collision with root package name */
    public final p0 f5520b;

    /* renamed from: c, reason: collision with root package name */
    public final String f5521c;

    /* renamed from: d, reason: collision with root package name */
    public final com.google.gson.r f5522d;

    /* renamed from: e, reason: collision with root package name */
    public final String f5523e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f5524f;

    public k61(String str, p0 p0Var, String str2, com.google.gson.r rVar, String str3, boolean z11) {
        this.f5519a = str;
        this.f5520b = p0Var;
        this.f5521c = str2;
        this.f5522d = rVar;
        this.f5523e = str3;
        this.f5524f = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k61)) {
            return false;
        }
        k61 k61Var = (k61) obj;
        return Intrinsics.b(this.f5519a, k61Var.f5519a) && Intrinsics.b(this.f5520b, k61Var.f5520b) && Intrinsics.b(this.f5521c, k61Var.f5521c) && Intrinsics.b(this.f5522d, k61Var.f5522d) && Intrinsics.b(this.f5523e, k61Var.f5523e) && this.f5524f == k61Var.f5524f;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        String str = this.f5519a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        p0 p0Var = this.f5520b;
        int iHashCode2 = (iHashCode + (p0Var == null ? 0 : p0Var.hashCode())) * 31;
        String str2 = this.f5521c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        com.google.gson.r rVar = this.f5522d;
        int iHashCode4 = (iHashCode3 + (rVar == null ? 0 : rVar.f34795a.hashCode())) * 31;
        String str3 = this.f5523e;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 31;
        boolean z11 = this.f5524f;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iHashCode5 + i5;
    }

    public final String toString() {
        return "InlineAd(html=" + this.f5519a + ", bodyDeferred=" + this.f5520b + ", baseUrl=" + this.f5521c + ", adJson=" + this.f5522d + ", adConfigKey=" + this.f5523e + ", hasMultiAdConfigKey=" + this.f5524f + ")";
    }
}
