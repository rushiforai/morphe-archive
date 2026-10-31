package ads_mobile_sdk;

import b.k9;

/* loaded from: classes2.dex */
public final class fs3 {

    /* renamed from: a, reason: collision with root package name */
    public final es3 f3488a;

    /* renamed from: b, reason: collision with root package name */
    public final int f3489b;

    /* renamed from: c, reason: collision with root package name */
    public final int f3490c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f3491d;

    public /* synthetic */ fs3(es3 es3Var, int i5, int i11, int i12) {
        this(es3Var, (i12 & 2) != 0 ? 0 : i5, (i12 & 4) != 0 ? 0 : i11, false);
    }

    public final boolean a() {
        return this.f3488a == es3.f2964a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof fs3)) {
            return false;
        }
        fs3 fs3Var = (fs3) obj;
        return this.f3488a == fs3Var.f3488a && this.f3489b == fs3Var.f3489b && this.f3490c == fs3Var.f3490c && this.f3491d == fs3Var.f3491d;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iB = k9.b(this.f3490c, k9.b(this.f3489b, this.f3488a.hashCode() * 31));
        boolean z11 = this.f3491d;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iB + i5;
    }

    public final String toString() {
        return "WebViewSize(type=" + this.f3488a + ", widthInPixels=" + this.f3489b + ", heightInPixels=" + this.f3490c + ", isFluidHeight=" + this.f3491d + ")";
    }

    public fs3(es3 es3Var, int i5, int i11, boolean z11) {
        this.f3488a = es3Var;
        this.f3489b = i5;
        this.f3490c = i11;
        this.f3491d = z11;
    }
}
