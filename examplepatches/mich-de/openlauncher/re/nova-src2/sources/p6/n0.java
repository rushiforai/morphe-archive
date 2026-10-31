package p6;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f82204a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f82205b;

    /* renamed from: c, reason: collision with root package name */
    public final int f82206c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f82207d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f82208e;

    /* renamed from: f, reason: collision with root package name */
    public final int f82209f;

    /* renamed from: g, reason: collision with root package name */
    public final int f82210g;

    public n0(boolean z11, boolean z12, int i5, boolean z13, boolean z14, int i11, int i12) {
        this.f82204a = z11;
        this.f82205b = z12;
        this.f82206c = i5;
        this.f82207d = z13;
        this.f82208e = z14;
        this.f82209f = i11;
        this.f82210g = i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof n0)) {
            return false;
        }
        n0 n0Var = (n0) obj;
        return this.f82204a == n0Var.f82204a && this.f82205b == n0Var.f82205b && this.f82206c == n0Var.f82206c && this.f82207d == n0Var.f82207d && this.f82208e == n0Var.f82208e && this.f82209f == n0Var.f82209f && this.f82210g == n0Var.f82210g;
    }

    public final int hashCode() {
        return ((((((((((((((((this.f82204a ? 1 : 0) * 31) + (this.f82205b ? 1 : 0)) * 31) + this.f82206c) * 923521) + (this.f82207d ? 1 : 0)) * 31) + (this.f82208e ? 1 : 0)) * 31) + this.f82209f) * 31) + this.f82210g) * 31) - 1) * 31) - 1;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(n0.class.getSimpleName());
        sb2.append("(");
        if (this.f82204a) {
            sb2.append("launchSingleTop ");
        }
        if (this.f82205b) {
            sb2.append("restoreState ");
        }
        int i5 = this.f82210g;
        int i11 = this.f82209f;
        if (i11 != -1 || i5 != -1) {
            sb2.append("anim(enterAnim=0x");
            sb2.append(Integer.toHexString(i11));
            sb2.append(" exitAnim=0x");
            sb2.append(Integer.toHexString(i5));
            sb2.append(" popEnterAnim=0x");
            sb2.append(Integer.toHexString(-1));
            sb2.append(" popExitAnim=0x");
            sb2.append(Integer.toHexString(-1));
            sb2.append(")");
        }
        String string = sb2.toString();
        Intrinsics.f(string, "sb.toString()");
        return string;
    }
}
