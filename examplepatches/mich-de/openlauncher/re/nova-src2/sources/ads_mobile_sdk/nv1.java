package ads_mobile_sdk;

import b.u1;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import ni.i0;

/* loaded from: classes.dex */
public final class nv1 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final Integer f7683a;

    /* renamed from: b, reason: collision with root package name */
    public final List f7684b;

    /* renamed from: c, reason: collision with root package name */
    public final List f7685c;

    /* renamed from: d, reason: collision with root package name */
    public final Boolean f7686d;

    /* renamed from: e, reason: collision with root package name */
    public final String f7687e;

    /* renamed from: f, reason: collision with root package name */
    public final Boolean f7688f;

    /* renamed from: g, reason: collision with root package name */
    public final Integer f7689g;

    /* renamed from: h, reason: collision with root package name */
    public final Boolean f7690h;

    /* renamed from: i, reason: collision with root package name */
    public final i0 f7691i;

    /* renamed from: j, reason: collision with root package name */
    public final Boolean f7692j;

    /* renamed from: k, reason: collision with root package name */
    public final Integer f7693k;

    /* renamed from: l, reason: collision with root package name */
    public final Boolean f7694l;

    /* renamed from: m, reason: collision with root package name */
    public final Integer f7695m;

    public nv1(Integer num, ArrayList arrayList, List list, Boolean bool, String str, Boolean bool2, Integer num2, Boolean bool3, i0 i0Var, Boolean bool4, Integer num3, Boolean bool5, Integer num4) {
        this.f7683a = num;
        this.f7684b = arrayList;
        this.f7685c = list;
        this.f7686d = bool;
        this.f7687e = str;
        this.f7688f = bool2;
        this.f7689g = num2;
        this.f7690h = bool3;
        this.f7691i = i0Var;
        this.f7692j = bool4;
        this.f7693k = num3;
        this.f7694l = bool5;
        this.f7695m = num4;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        ti.q qVar;
        Intrinsics.g(signals, "signals");
        signals.nativeVersion = this.f7683a;
        List<String> list = this.f7684b;
        if (list != null) {
            signals.nativeTemplates = list;
        }
        signals.nativeCustomTemplates = this.f7685c;
        signals.enableNativeMediaOrientation = this.f7686d;
        signals.nativeMediaOrientation = this.f7687e;
        signals.customMuteThisAdRequested = this.f7688f;
        signals.customClickGestureDirection = this.f7689g;
        signals.customClickGestureAllowTaps = this.f7690h;
        i0 i0Var = this.f7691i;
        if (i0Var != null) {
            qVar = new ti.q(i0Var.c(), i0Var.a(), i0Var.b());
        } else {
            qVar = null;
        }
        signals.videoOptionsSignal = qVar;
        signals.isImageLoadingDisabled = this.f7692j;
        signals.adChoicesPlacement = this.f7693k;
        signals.usesMediaView = this.f7694l;
        signals.numberOfAdsRequested = this.f7695m;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nv1)) {
            return false;
        }
        nv1 nv1Var = (nv1) obj;
        return Intrinsics.b(this.f7683a, nv1Var.f7683a) && Intrinsics.b(this.f7684b, nv1Var.f7684b) && Intrinsics.b(this.f7685c, nv1Var.f7685c) && Intrinsics.b(this.f7686d, nv1Var.f7686d) && Intrinsics.b(this.f7687e, nv1Var.f7687e) && Intrinsics.b(this.f7688f, nv1Var.f7688f) && Intrinsics.b(this.f7689g, nv1Var.f7689g) && Intrinsics.b(this.f7690h, nv1Var.f7690h) && Intrinsics.b(this.f7691i, nv1Var.f7691i) && Intrinsics.b(this.f7692j, nv1Var.f7692j) && Intrinsics.b(this.f7693k, nv1Var.f7693k) && Intrinsics.b(this.f7694l, nv1Var.f7694l) && Intrinsics.b(this.f7695m, nv1Var.f7695m);
    }

    public final int hashCode() {
        Integer num = this.f7683a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        List list = this.f7684b;
        int iHashCode2 = (iHashCode + (list == null ? 0 : list.hashCode())) * 31;
        List list2 = this.f7685c;
        int iHashCode3 = (iHashCode2 + (list2 == null ? 0 : list2.hashCode())) * 31;
        Boolean bool = this.f7686d;
        int iHashCode4 = (iHashCode3 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str = this.f7687e;
        int iHashCode5 = (iHashCode4 + (str == null ? 0 : str.hashCode())) * 31;
        Boolean bool2 = this.f7688f;
        int iHashCode6 = (iHashCode5 + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        Integer num2 = this.f7689g;
        int iHashCode7 = (iHashCode6 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Boolean bool3 = this.f7690h;
        int iHashCode8 = (iHashCode7 + (bool3 == null ? 0 : bool3.hashCode())) * 31;
        i0 i0Var = this.f7691i;
        int iHashCode9 = (iHashCode8 + (i0Var == null ? 0 : i0Var.hashCode())) * 31;
        Boolean bool4 = this.f7692j;
        int iHashCode10 = (iHashCode9 + (bool4 == null ? 0 : bool4.hashCode())) * 31;
        Integer num3 = this.f7693k;
        int iHashCode11 = (iHashCode10 + (num3 == null ? 0 : num3.hashCode())) * 31;
        Boolean bool5 = this.f7694l;
        int iHashCode12 = (iHashCode11 + (bool5 == null ? 0 : bool5.hashCode())) * 31;
        Integer num4 = this.f7695m;
        return iHashCode12 + (num4 != null ? num4.hashCode() : 0);
    }

    public final String toString() {
        return "NativeAdSignal(nativeVersion=" + this.f7683a + ", nativeTemplateIds=" + this.f7684b + ", nativeCustomTemplates=" + this.f7685c + ", enableNativeMediaOrientation=" + this.f7686d + ", nativeMediaOrientation=" + this.f7687e + ", customMuteThisAdRequested=" + this.f7688f + ", customClickGestureDirection=" + this.f7689g + ", customClickGestureAllowTaps=" + this.f7690h + ", videoOptions=" + this.f7691i + ", isImageLoadingDisabled=" + this.f7692j + ", adChoicesPlacement=" + this.f7693k + ", usesMediaView=" + this.f7694l + ", numberOfAdsRequested=" + this.f7695m + ")";
    }
}
