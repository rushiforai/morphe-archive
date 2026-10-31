package ju;

import b.c0;
import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final String f69952a;

    /* renamed from: b, reason: collision with root package name */
    public final String f69953b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f69954c;

    /* renamed from: d, reason: collision with root package name */
    public final String f69955d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f69956e;

    public j(int i5, String authUrl, String str, String str2) {
        boolean z11 = (i5 & 8) != 0;
        str2 = (i5 & 16) != 0 ? null : str2;
        boolean z12 = (i5 & 32) == 0;
        Intrinsics.g(authUrl, "authUrl");
        this.f69952a = authUrl;
        this.f69953b = str;
        this.f69954c = z11;
        this.f69955d = str2;
        this.f69956e = z12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f69952a, jVar.f69952a) && Intrinsics.b(this.f69953b, jVar.f69953b) && this.f69954c == jVar.f69954c && Intrinsics.b(this.f69955d, jVar.f69955d) && this.f69956e == jVar.f69956e;
    }

    public final int hashCode() {
        int iHashCode = this.f69952a.hashCode() * 31;
        String str = this.f69953b;
        int iF = c9.f(c9.f((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, false), 31, this.f69954c);
        String str2 = this.f69955d;
        return Boolean.hashCode(this.f69956e) + ((iF + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("WebAuthParams(authUrl=", this.f69952a, ", returnUrl=", this.f69953b, ", shouldCancelSource=false, shouldCancelIntentOnUserNavigation=");
        c9.s(", referrer=", this.f69955d, ", forceInAppWebView=", sbW, this.f69954c);
        return a80.m.k(sbW, this.f69956e, ")");
    }
}
