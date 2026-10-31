package ads_mobile_sdk;

import android.graphics.Insets;
import android.os.Build;
import b.c0;
import b.k9;
import b.u1;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e8 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f2759a;

    /* renamed from: b, reason: collision with root package name */
    public final float f2760b;

    /* renamed from: c, reason: collision with root package name */
    public final int f2761c;

    /* renamed from: d, reason: collision with root package name */
    public final int f2762d;

    /* renamed from: e, reason: collision with root package name */
    public final int f2763e;

    /* renamed from: f, reason: collision with root package name */
    public final int f2764f;

    /* renamed from: g, reason: collision with root package name */
    public final Insets f2765g;

    /* renamed from: h, reason: collision with root package name */
    public final String f2766h;

    /* renamed from: i, reason: collision with root package name */
    public final Boolean f2767i;

    /* renamed from: j, reason: collision with root package name */
    public final String f2768j;

    /* renamed from: k, reason: collision with root package name */
    public final String f2769k;

    /* renamed from: l, reason: collision with root package name */
    public final ArrayList f2770l;

    /* renamed from: m, reason: collision with root package name */
    public final qz2 f2771m;
    public final boolean n;

    public e8(String str, float f11, int i5, int i11, int i12, int i13, Insets insets, String str2, Boolean bool, String str3, String str4, ArrayList arrayList, qz2 qz2Var, boolean z11) {
        this.f2759a = str;
        this.f2760b = f11;
        this.f2761c = i5;
        this.f2762d = i11;
        this.f2763e = i12;
        this.f2764f = i13;
        this.f2765g = insets;
        this.f2766h = str2;
        this.f2767i = bool;
        this.f2768j = str3;
        this.f2769k = str4;
        this.f2770l = arrayList;
        this.f2771m = qz2Var;
        this.n = z11;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Insets insets;
        Intrinsics.g(signals, "signals");
        signals.format = this.f2759a;
        signals.screenDensity = this.f2760b;
        signals.screenHeight = this.f2762d;
        signals.screenWidth = this.f2761c;
        signals.screenHeightDip = this.f2764f;
        signals.screenWidthDip = this.f2763e;
        if (Build.VERSION.SDK_INT >= 30 && (insets = this.f2765g) != null) {
            signals.safeAreaMarginLeftDip = Integer.valueOf(insets.left);
            signals.safeAreaMarginTopDip = Integer.valueOf(this.f2765g.top);
            signals.safeAreaMarginRightDip = Integer.valueOf(this.f2765g.right);
            signals.safeAreaMarginBottomDip = Integer.valueOf(this.f2765g.bottom);
        }
        signals.responsiveAutoFormat = this.f2766h;
        signals.adaptiveSlot = this.f2767i;
        signals.fluidType = this.f2768j;
        signals.multipleAdSizeString = this.f2769k;
        signals.adSizeArray.addAll(this.f2770l);
        qz2 qz2Var = this.f2771m;
        if (qz2Var != null) {
            signals.roundedCornerTopLeftDip = Integer.valueOf(qz2Var.f8894a);
            signals.roundedCornerTopRightDip = Integer.valueOf(qz2Var.f8895b);
            signals.roundedCornerBottomLeftDip = Integer.valueOf(qz2Var.f8897d);
            signals.roundedCornerBottomRightDip = Integer.valueOf(qz2Var.f8896c);
        }
        signals.isGreaterThanMaxAllowedBannerSize = this.n;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e8)) {
            return false;
        }
        e8 e8Var = (e8) obj;
        return this.f2759a.equals(e8Var.f2759a) && Float.compare(this.f2760b, e8Var.f2760b) == 0 && this.f2761c == e8Var.f2761c && this.f2762d == e8Var.f2762d && this.f2763e == e8Var.f2763e && this.f2764f == e8Var.f2764f && Intrinsics.b(this.f2765g, e8Var.f2765g) && Intrinsics.b(this.f2766h, e8Var.f2766h) && Intrinsics.b(this.f2767i, e8Var.f2767i) && Intrinsics.b(this.f2768j, e8Var.f2768j) && Intrinsics.b(this.f2769k, e8Var.f2769k) && this.f2770l.equals(e8Var.f2770l) && Intrinsics.b(this.f2771m, e8Var.f2771m) && this.n == e8Var.n;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iB = k9.b(this.f2764f, k9.b(this.f2763e, k9.b(this.f2762d, k9.b(this.f2761c, a80.m.d(this.f2760b, this.f2759a.hashCode() * 31, 31)))));
        Insets insets = this.f2765g;
        int iHashCode = (iB + (insets == null ? 0 : insets.hashCode())) * 31;
        String str = this.f2766h;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        Boolean bool = this.f2767i;
        int iHashCode3 = (iHashCode2 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str2 = this.f2768j;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f2769k;
        int iD = k9.d((iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31, this.f2770l);
        qz2 qz2Var = this.f2771m;
        int iHashCode5 = (iD + (qz2Var != null ? qz2Var.hashCode() : 0)) * 31;
        boolean z11 = this.n;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return (iHashCode5 + i5) * 961;
    }

    public final String toString() {
        Insets insets = this.f2765g;
        StringBuilder sb2 = new StringBuilder("AdSizeSignal(formatString=");
        sb2.append(this.f2759a);
        sb2.append(", screenDensity=");
        sb2.append(this.f2760b);
        sb2.append(", screenWidth=");
        c0.A(sb2, this.f2761c, ", screenHeight=", this.f2762d, ", screenWidthDip=");
        c0.A(sb2, this.f2763e, ", screenHeightDip=", this.f2764f, ", safeAreaMarginsDip=");
        sb2.append(insets);
        sb2.append(", responsiveAutoFormat=");
        sb2.append(this.f2766h);
        sb2.append(", isInlineAdaptive=");
        sb2.append(this.f2767i);
        sb2.append(", fluidType=");
        sb2.append(this.f2768j);
        sb2.append(", multipleAdSizeString=");
        sb2.append(this.f2769k);
        sb2.append(", supportedAdSizes=");
        sb2.append(this.f2770l);
        sb2.append(", roundedCornerRadii=");
        sb2.append(this.f2771m);
        sb2.append(", isGreaterThanMaxAllowedBannerSize=");
        sb2.append(this.n);
        sb2.append(", maxSlotWidth=null, maxSlotHeight=null)");
        return sb2.toString();
    }
}
