package o2;

import b.u4;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n0 extends l0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f79332a;

    /* renamed from: b, reason: collision with root package name */
    public final List f79333b;

    /* renamed from: c, reason: collision with root package name */
    public final int f79334c;

    /* renamed from: d, reason: collision with root package name */
    public final i2.p f79335d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79336e;

    /* renamed from: f, reason: collision with root package name */
    public final i2.p f79337f;

    /* renamed from: g, reason: collision with root package name */
    public final float f79338g;

    /* renamed from: h, reason: collision with root package name */
    public final float f79339h;

    /* renamed from: i, reason: collision with root package name */
    public final int f79340i;

    /* renamed from: j, reason: collision with root package name */
    public final int f79341j;

    /* renamed from: k, reason: collision with root package name */
    public final float f79342k;

    /* renamed from: l, reason: collision with root package name */
    public final float f79343l;

    /* renamed from: m, reason: collision with root package name */
    public final float f79344m;
    public final float n;

    public n0(String str, List list, int i5, i2.p pVar, float f11, i2.p pVar2, float f12, float f13, int i11, int i12, float f14, float f15, float f16, float f17) {
        this.f79332a = str;
        this.f79333b = list;
        this.f79334c = i5;
        this.f79335d = pVar;
        this.f79336e = f11;
        this.f79337f = pVar2;
        this.f79338g = f12;
        this.f79339h = f13;
        this.f79340i = i11;
        this.f79341j = i12;
        this.f79342k = f14;
        this.f79343l = f15;
        this.f79344m = f16;
        this.n = f17;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && n0.class == obj.getClass()) {
            n0 n0Var = (n0) obj;
            return Intrinsics.b(this.f79332a, n0Var.f79332a) && Intrinsics.b(this.f79335d, n0Var.f79335d) && this.f79336e == n0Var.f79336e && Intrinsics.b(this.f79337f, n0Var.f79337f) && this.f79338g == n0Var.f79338g && this.f79339h == n0Var.f79339h && this.f79340i == n0Var.f79340i && this.f79341j == n0Var.f79341j && this.f79342k == n0Var.f79342k && this.f79343l == n0Var.f79343l && this.f79344m == n0Var.f79344m && this.n == n0Var.n && this.f79334c == n0Var.f79334c && Intrinsics.b(this.f79333b, n0Var.f79333b);
        }
        return false;
    }

    public final int hashCode() {
        int iC = u4.c(this.f79332a.hashCode() * 31, 31, this.f79333b);
        i2.p pVar = this.f79335d;
        int iD = a80.m.d(this.f79336e, (iC + (pVar != null ? pVar.hashCode() : 0)) * 31, 31);
        i2.p pVar2 = this.f79337f;
        return Integer.hashCode(this.f79334c) + a80.m.d(this.n, a80.m.d(this.f79344m, a80.m.d(this.f79343l, a80.m.d(this.f79342k, u4.a(this.f79341j, u4.a(this.f79340i, a80.m.d(this.f79339h, a80.m.d(this.f79338g, (iD + (pVar2 != null ? pVar2.hashCode() : 0)) * 31, 31), 31), 31), 31), 31), 31), 31), 31);
    }
}
