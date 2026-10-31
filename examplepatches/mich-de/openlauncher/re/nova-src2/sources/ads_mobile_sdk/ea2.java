package ads_mobile_sdk;

import android.widget.ImageView;
import b.c0;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import ni.i0;
import wi.f;

/* loaded from: classes2.dex */
public final class ea2 {

    /* renamed from: a, reason: collision with root package name */
    public final String f2810a;

    /* renamed from: b, reason: collision with root package name */
    public final qw2 f2811b;

    /* renamed from: c, reason: collision with root package name */
    public final ni.b f2812c;

    /* renamed from: d, reason: collision with root package name */
    public final ni.k f2813d;

    /* renamed from: e, reason: collision with root package name */
    public final mi.a f2814e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f2815f;

    /* renamed from: g, reason: collision with root package name */
    public final List f2816g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f2817h;

    /* renamed from: i, reason: collision with root package name */
    public final ui.b f2818i;

    /* renamed from: j, reason: collision with root package name */
    public final f f2819j;

    /* renamed from: k, reason: collision with root package name */
    public final i0 f2820k;

    /* renamed from: l, reason: collision with root package name */
    public final String f2821l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f2822m;
    public final ImageView.ScaleType n;
    public final int o;

    public ea2(String str, qw2 qw2Var, ni.b bVar, ni.k kVar, mi.a adSize, boolean z11, List list, boolean z12, ui.b bVar2, f fVar, i0 i0Var, String str2, boolean z13, ImageView.ScaleType imageScaleType, int i5) {
        Intrinsics.g(adSize, "adSize");
        Intrinsics.g(imageScaleType, "imageScaleType");
        this.f2810a = str;
        this.f2811b = qw2Var;
        this.f2812c = bVar;
        this.f2813d = kVar;
        this.f2814e = adSize;
        this.f2815f = z11;
        this.f2816g = list;
        this.f2817h = z12;
        this.f2818i = bVar2;
        this.f2819j = fVar;
        this.f2820k = i0Var;
        this.f2821l = str2;
        this.f2822m = z13;
        this.n = imageScaleType;
        this.o = i5;
    }

    public final String a() {
        return this.f2810a;
    }

    public final f b() {
        return this.f2819j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ea2)) {
            return false;
        }
        ea2 ea2Var = (ea2) obj;
        return Intrinsics.b(this.f2810a, ea2Var.f2810a) && this.f2811b == ea2Var.f2811b && this.f2812c == ea2Var.f2812c && Intrinsics.b(this.f2813d, ea2Var.f2813d) && Intrinsics.b(this.f2814e, ea2Var.f2814e) && this.f2815f == ea2Var.f2815f && Intrinsics.b(this.f2816g, ea2Var.f2816g) && this.f2817h == ea2Var.f2817h && this.f2818i == ea2Var.f2818i && Intrinsics.b(this.f2819j, ea2Var.f2819j) && Intrinsics.b(this.f2820k, ea2Var.f2820k) && Intrinsics.b(this.f2821l, ea2Var.f2821l) && this.f2822m == ea2Var.f2822m && this.n == ea2Var.n && this.o == ea2Var.o;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = (this.f2812c.hashCode() + ((this.f2811b.hashCode() + (this.f2810a.hashCode() * 31)) * 31)) * 31;
        ni.k kVar = this.f2813d;
        int iHashCode2 = (this.f2814e.hashCode() + ((iHashCode + (kVar == null ? 0 : kVar.hashCode())) * 31)) * 31;
        boolean z11 = this.f2815f;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iHashCode2 + i5) * 31;
        List list = this.f2816g;
        int iHashCode3 = (i11 + (list == null ? 0 : list.hashCode())) * 31;
        boolean z12 = this.f2817h;
        int i12 = z12;
        if (z12 != 0) {
            i12 = 1;
        }
        int iHashCode4 = (this.f2818i.hashCode() + ((iHashCode3 + i12) * 31)) * 31;
        f fVar = this.f2819j;
        int iHashCode5 = (iHashCode4 + (fVar == null ? 0 : fVar.hashCode())) * 31;
        i0 i0Var = this.f2820k;
        int iE = c0.e((iHashCode5 + (i0Var != null ? i0Var.hashCode() : 0)) * 31, 31, this.f2821l);
        boolean z13 = this.f2822m;
        return Integer.hashCode(this.o) + ((this.n.hashCode() + ((iE + (z13 ? 1 : z13 ? 1 : 0)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("OutOfContextTestingConfiguration(adUnitId=");
        sb2.append(this.f2810a);
        sb2.append(", format=");
        sb2.append(this.f2811b);
        sb2.append(", adChoicesPosition=");
        sb2.append(this.f2812c);
        sb2.append(", adRequest=");
        sb2.append(this.f2813d);
        sb2.append(", adSize=");
        sb2.append(this.f2814e);
        sb2.append(", customMuteThisAd=");
        sb2.append(this.f2815f);
        sb2.append(", customNativeTemplates=");
        sb2.append(this.f2816g);
        sb2.append(", isImageLoadingDisabled=");
        sb2.append(this.f2817h);
        sb2.append(", mediaAspectRatio=");
        sb2.append(this.f2818i);
        sb2.append(", serverSideVerificationOptions=");
        sb2.append(this.f2819j);
        sb2.append(", videoOptions=");
        sb2.append(this.f2820k);
        sb2.append(", bannerPosition=");
        sb2.append(this.f2821l);
        sb2.append(", isImmersiveMode=");
        sb2.append(this.f2822m);
        sb2.append(", imageScaleType=");
        sb2.append(this.n);
        sb2.append(", widthConstraint=");
        return c0.o(sb2, this.o, ")");
    }
}
