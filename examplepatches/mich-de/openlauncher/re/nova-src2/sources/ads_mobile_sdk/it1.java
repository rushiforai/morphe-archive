package ads_mobile_sdk;

import android.os.Bundle;
import android.view.View;
import b.k9;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;
import t70.p0;

/* loaded from: classes.dex */
public final class it1 {

    /* renamed from: a, reason: collision with root package name */
    public int f4932a;

    /* renamed from: b, reason: collision with root package name */
    public gt1 f4933b;

    /* renamed from: c, reason: collision with root package name */
    public String f4934c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashMap f4935d;

    /* renamed from: e, reason: collision with root package name */
    public Double f4936e;

    /* renamed from: f, reason: collision with root package name */
    public wf1 f4937f;

    /* renamed from: g, reason: collision with root package name */
    public wf1 f4938g;

    /* renamed from: h, reason: collision with root package name */
    public md1 f4939h;

    /* renamed from: i, reason: collision with root package name */
    public final LinkedHashMap f4940i;

    /* renamed from: j, reason: collision with root package name */
    public tx0 f4941j;

    /* renamed from: k, reason: collision with root package name */
    public View f4942k;

    /* renamed from: l, reason: collision with root package name */
    public sy0 f4943l;

    /* renamed from: m, reason: collision with root package name */
    public ni.h0 f4944m;
    public q82 n;
    public p0 o;

    /* renamed from: p, reason: collision with root package name */
    public final ArrayList f4945p;

    /* renamed from: q, reason: collision with root package name */
    public tf1 f4946q;

    /* renamed from: r, reason: collision with root package name */
    public Bundle f4947r;

    /* renamed from: s, reason: collision with root package name */
    public float f4948s;

    /* renamed from: t, reason: collision with root package name */
    public View f4949t;

    /* renamed from: u, reason: collision with root package name */
    public ni.b f4950u;

    /* renamed from: v, reason: collision with root package name */
    public String f4951v;

    /* renamed from: w, reason: collision with root package name */
    public com.google.gson.r f4952w;

    public it1() {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        ArrayList arrayList = new ArrayList();
        Bundle bundle = new Bundle();
        this.f4932a = -1;
        this.f4933b = null;
        this.f4934c = null;
        this.f4935d = linkedHashMap;
        this.f4936e = null;
        this.f4937f = null;
        this.f4938g = null;
        this.f4939h = null;
        this.f4940i = linkedHashMap2;
        this.f4941j = null;
        this.f4942k = null;
        this.f4943l = null;
        this.f4944m = null;
        this.n = null;
        this.o = null;
        this.f4945p = arrayList;
        this.f4946q = null;
        this.f4947r = bundle;
        this.f4948s = 0.0f;
        this.f4949t = null;
        this.f4950u = null;
        this.f4951v = null;
        this.f4952w = null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof it1)) {
            return false;
        }
        it1 it1Var = (it1) obj;
        return this.f4932a == it1Var.f4932a && this.f4933b == it1Var.f4933b && Intrinsics.b(this.f4934c, it1Var.f4934c) && Intrinsics.b(this.f4935d, it1Var.f4935d) && Intrinsics.b(this.f4936e, it1Var.f4936e) && Intrinsics.b(this.f4937f, it1Var.f4937f) && Intrinsics.b(this.f4938g, it1Var.f4938g) && Intrinsics.b(this.f4939h, it1Var.f4939h) && Intrinsics.b(this.f4940i, it1Var.f4940i) && Intrinsics.b(this.f4941j, it1Var.f4941j) && Intrinsics.b(this.f4942k, it1Var.f4942k) && Intrinsics.b(this.f4943l, it1Var.f4943l) && Intrinsics.b(this.f4944m, it1Var.f4944m) && Intrinsics.b(this.n, it1Var.n) && Intrinsics.b(this.o, it1Var.o) && Intrinsics.b(this.f4945p, it1Var.f4945p) && Intrinsics.b(this.f4946q, it1Var.f4946q) && Intrinsics.b(this.f4947r, it1Var.f4947r) && Float.compare(this.f4948s, it1Var.f4948s) == 0 && Intrinsics.b(this.f4949t, it1Var.f4949t) && this.f4950u == it1Var.f4950u && Intrinsics.b(this.f4951v, it1Var.f4951v) && Intrinsics.b(this.f4952w, it1Var.f4952w);
    }

    public final int hashCode() {
        int iHashCode = Integer.hashCode(this.f4932a) * 31;
        gt1 gt1Var = this.f4933b;
        int iHashCode2 = (iHashCode + (gt1Var == null ? 0 : gt1Var.hashCode())) * 31;
        String str = this.f4934c;
        int iHashCode3 = (this.f4935d.hashCode() + ((iHashCode2 + (str == null ? 0 : str.hashCode())) * 31)) * 31;
        Double d5 = this.f4936e;
        int iHashCode4 = (iHashCode3 + (d5 == null ? 0 : d5.hashCode())) * 31;
        wf1 wf1Var = this.f4937f;
        int iHashCode5 = (iHashCode4 + (wf1Var == null ? 0 : wf1Var.hashCode())) * 31;
        wf1 wf1Var2 = this.f4938g;
        int iHashCode6 = (iHashCode5 + (wf1Var2 == null ? 0 : wf1Var2.hashCode())) * 31;
        md1 md1Var = this.f4939h;
        int iHashCode7 = (this.f4940i.hashCode() + ((iHashCode6 + (md1Var == null ? 0 : md1Var.hashCode())) * 31)) * 31;
        tx0 tx0Var = this.f4941j;
        int iHashCode8 = (iHashCode7 + (tx0Var == null ? 0 : tx0Var.hashCode())) * 31;
        View view = this.f4942k;
        int iHashCode9 = (iHashCode8 + (view == null ? 0 : view.hashCode())) * 31;
        sy0 sy0Var = this.f4943l;
        int iHashCode10 = (iHashCode9 + (sy0Var == null ? 0 : sy0Var.hashCode())) * 31;
        ni.h0 h0Var = this.f4944m;
        int iHashCode11 = (iHashCode10 + (h0Var == null ? 0 : h0Var.hashCode())) * 31;
        q82 q82Var = this.n;
        int iHashCode12 = (iHashCode11 + (q82Var == null ? 0 : q82Var.hashCode())) * 31;
        p0 p0Var = this.o;
        int iD = k9.d((iHashCode12 + (p0Var == null ? 0 : p0Var.hashCode())) * 31, this.f4945p);
        tf1 tf1Var = this.f4946q;
        int iD2 = a80.m.d(this.f4948s, (this.f4947r.hashCode() + ((iD + (tf1Var == null ? 0 : tf1Var.hashCode())) * 31)) * 31, 31);
        View view2 = this.f4949t;
        int iHashCode13 = (iD2 + (view2 == null ? 0 : view2.hashCode())) * 31;
        ni.b bVar = this.f4950u;
        int iHashCode14 = (iHashCode13 + (bVar == null ? 0 : bVar.hashCode())) * 31;
        String str2 = this.f4951v;
        int iHashCode15 = (iHashCode14 + (str2 == null ? 0 : str2.hashCode())) * 31;
        com.google.gson.r rVar = this.f4952w;
        return iHashCode15 + (rVar != null ? rVar.f34795a.hashCode() : 0);
    }

    public final String toString() {
        return "NativeAdAssets(templateId=" + this.f4932a + ", nativeAdType=" + this.f4933b + ", customTemplateId=" + this.f4934c + ", stringAssets=" + this.f4935d + ", starRating=" + this.f4936e + ", image=" + this.f4937f + ", icon=" + this.f4938g + ", attributionInfo=" + this.f4939h + ", customImageAssets=" + this.f4940i + ", mediaWebView=" + this.f4941j + ", mediaView=" + this.f4942k + ", gmaWebViewVideoController=" + this.f4943l + ", videoController=" + this.f4944m + ", omidSettings=" + this.n + ", omidDisplayWebView=" + this.o + ", muteThisAdReasons=" + this.f4945p + ", defaultMuteThisAdReason=" + this.f4946q + ", extras=" + this.f4947r + ", mediaContentAspectRatio=" + this.f4948s + ", adChoicesContent=" + this.f4949t + ", pubProvidedAttributionInfoPlacement=" + this.f4950u + ", watermark=" + this.f4951v + ", adSpecificResponseInfoExtras=" + this.f4952w + ")";
    }
}
