package io.branch.search.internal;

import com.amplitude.eventbridge.EventBridgeChannel;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import io.branch.search.internal.requesthandler.model.Link;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.hd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3186hd implements Yd {

    @Nullable
    public final String A;

    @Nullable
    public final String B;

    @Nullable
    public final String C;

    @NotNull
    public final List<Link> D;

    @Nullable
    public final String E;

    @Nullable
    public final String F;

    @Nullable
    public final String G;

    @Nullable
    public final String H;

    @Nullable
    public final String I;

    @Nullable
    public final String J;

    @Nullable
    public final Object K;

    @Nullable
    public final Object L;

    @NotNull
    public final Map<String, String> M;

    @Nullable
    public final Float N;

    @Nullable
    public final Long O;

    @Nullable
    public final String P;

    @Nullable
    public final String Q;

    @NotNull
    public final List<Yd> R;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f64663a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f64664b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f64665c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final Long f64666d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f64667e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final String f64668f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final EnumC3449x6 f64669g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final String f64670h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final String f64671i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final String f64672j;

    /* renamed from: k, reason: collision with root package name */
    @Nullable
    public final Long f64673k;

    /* renamed from: l, reason: collision with root package name */
    @Nullable
    public final C7 f64674l;

    /* renamed from: m, reason: collision with root package name */
    @Nullable
    public final C7 f64675m;

    @NotNull
    public final List<C3155g> n;

    @Nullable
    public final Boolean o;

    /* renamed from: p, reason: collision with root package name */
    @NotNull
    public final EnumC3396u4 f64676p;

    /* renamed from: q, reason: collision with root package name */
    @Nullable
    public final Boolean f64677q;

    /* renamed from: r, reason: collision with root package name */
    @Nullable
    public final String f64678r;

    /* renamed from: s, reason: collision with root package name */
    @Nullable
    public final String f64679s;

    /* renamed from: t, reason: collision with root package name */
    @Nullable
    public final Integer f64680t;

    /* renamed from: u, reason: collision with root package name */
    @Nullable
    public final String f64681u;

    /* renamed from: v, reason: collision with root package name */
    @Nullable
    public final Integer f64682v;

    /* renamed from: w, reason: collision with root package name */
    @NotNull
    public final Set<EnumC3379t4> f64683w;

    /* renamed from: x, reason: collision with root package name */
    @Nullable
    public final String f64684x;

    /* renamed from: y, reason: collision with root package name */
    @Nullable
    public final String f64685y;

    /* renamed from: z, reason: collision with root package name */
    public final boolean f64686z;

    /* JADX WARN: Illegal instructions before constructor call */
    public C3186hd(@NotNull C3205j searchAd) {
        Intrinsics.g(searchAd, "searchAd");
        String strR = searchAd.r();
        String strZ = searchAd.z();
        String strN = searchAd.n();
        Long lW = searchAd.w();
        String strT = searchAd.t();
        String strL = searchAd.l();
        EnumC3449x6 enumC3449x6O = searchAd.o();
        String strF = searchAd.f();
        Long lA = searchAd.A();
        long jLongValue = lA != null ? lA.longValue() : 0L;
        EmptyList emptyList = EmptyList.f71733a;
        this(strZ, false, strN, lW, strT, strL, enumC3449x6O, null, null, strF, Long.valueOf(jLongValue), null, null, emptyList, null, searchAd.k(), null, null, null, searchAd.u(), null, null, searchAd.j(), null, searchAd.i(), searchAd.B(), searchAd.x(), searchAd.i(), searchAd.c(), searchAd.s(), null, searchAd.p(), strR, searchAd.h(), searchAd.a(), null, searchAd.i(), searchAd.q(), searchAd.b(), searchAd.g(), searchAd.v(), searchAd.m(), searchAd.e(), emptyList);
    }

    public static C3186hd a(C3186hd c3186hd, String str, String str2, Long l9, String str3, String str4, EnumC3449x6 enumC3449x6, String str5, C7 c72, C7 c73, EnumC3396u4 enumC3396u4, Integer num, String str6, String str7, List list, String str8, ArrayList arrayList, int i5, int i11) {
        String str9 = (i5 & 1) != 0 ? c3186hd.f64663a : str;
        boolean z11 = c3186hd.f64664b;
        String str10 = (i5 & 4) != 0 ? c3186hd.f64665c : str2;
        Long l11 = (i5 & 8) != 0 ? c3186hd.f64666d : l9;
        String str11 = (i5 & 16) != 0 ? c3186hd.f64667e : str3;
        String str12 = (i5 & 32) != 0 ? c3186hd.f64668f : str4;
        EnumC3449x6 entityType = (i5 & 64) != 0 ? c3186hd.f64669g : enumC3449x6;
        String str13 = c3186hd.f64670h;
        String str14 = c3186hd.f64671i;
        String str15 = (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? c3186hd.f64672j : str5;
        Long l12 = c3186hd.f64673k;
        C7 c74 = (i5 & 2048) != 0 ? c3186hd.f64674l : c72;
        C7 c75 = (i5 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? c3186hd.f64675m : c73;
        List<C3155g> actions = c3186hd.n;
        Boolean bool = c3186hd.o;
        EnumC3396u4 containerType = (i5 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? c3186hd.f64676p : enumC3396u4;
        Boolean bool2 = c3186hd.f64677q;
        String str16 = c3186hd.f64678r;
        String str17 = c3186hd.f64679s;
        Integer num2 = c3186hd.f64680t;
        String str18 = c3186hd.f64681u;
        Integer num3 = (i5 & 2097152) != 0 ? c3186hd.f64682v : num;
        Set<EnumC3379t4> containerPlacements = c3186hd.f64683w;
        String str19 = str9;
        String str20 = (i5 & 8388608) != 0 ? c3186hd.f64684x : str6;
        String str21 = (i5 & 16777216) != 0 ? c3186hd.f64685y : str7;
        boolean z12 = c3186hd.f64686z;
        String str22 = c3186hd.A;
        String str23 = c3186hd.B;
        String str24 = c3186hd.C;
        List linking = (i5 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0 ? c3186hd.D : list;
        String str25 = c3186hd.E;
        String str26 = c3186hd.F;
        String str27 = c3186hd.G;
        String str28 = (i11 & 2) != 0 ? c3186hd.H : str8;
        String str29 = c3186hd.I;
        String str30 = c3186hd.J;
        Object obj = c3186hd.K;
        Object obj2 = c3186hd.L;
        Map<String, String> analytics = c3186hd.M;
        String str31 = str10;
        Float f11 = c3186hd.N;
        Long l13 = c3186hd.O;
        String str32 = c3186hd.P;
        String str33 = c3186hd.Q;
        List<Yd> subShortcuts = (i11 & 2048) != 0 ? c3186hd.R : arrayList;
        Intrinsics.g(entityType, "entityType");
        Intrinsics.g(actions, "actions");
        Intrinsics.g(containerType, "containerType");
        Intrinsics.g(containerPlacements, "containerPlacements");
        Intrinsics.g(linking, "linking");
        Intrinsics.g(analytics, "analytics");
        Intrinsics.g(subShortcuts, "subShortcuts");
        return new C3186hd(str19, z11, str31, l11, str11, str12, entityType, str13, str14, str15, l12, c74, c75, actions, bool, containerType, bool2, str16, str17, num2, str18, num3, containerPlacements, str20, str21, z12, str22, str23, str24, linking, str25, str26, str27, str28, str29, str30, obj, obj2, analytics, f11, l13, str32, str33, subShortcuts);
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String b() {
        return this.f64668f;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String c() {
        return this.P;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Object d() {
        return this.K;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Long e() {
        return this.O;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3186hd)) {
            return false;
        }
        C3186hd c3186hd = (C3186hd) obj;
        return Intrinsics.b(this.f64663a, c3186hd.f64663a) && this.f64664b == c3186hd.f64664b && Intrinsics.b(this.f64665c, c3186hd.f64665c) && Intrinsics.b(this.f64666d, c3186hd.f64666d) && Intrinsics.b(this.f64667e, c3186hd.f64667e) && Intrinsics.b(this.f64668f, c3186hd.f64668f) && this.f64669g == c3186hd.f64669g && Intrinsics.b(this.f64670h, c3186hd.f64670h) && Intrinsics.b(this.f64671i, c3186hd.f64671i) && Intrinsics.b(this.f64672j, c3186hd.f64672j) && Intrinsics.b(this.f64673k, c3186hd.f64673k) && Intrinsics.b(this.f64674l, c3186hd.f64674l) && Intrinsics.b(this.f64675m, c3186hd.f64675m) && Intrinsics.b(this.n, c3186hd.n) && Intrinsics.b(this.o, c3186hd.o) && this.f64676p == c3186hd.f64676p && Intrinsics.b(this.f64677q, c3186hd.f64677q) && Intrinsics.b(this.f64678r, c3186hd.f64678r) && Intrinsics.b(this.f64679s, c3186hd.f64679s) && Intrinsics.b(this.f64680t, c3186hd.f64680t) && Intrinsics.b(this.f64681u, c3186hd.f64681u) && Intrinsics.b(this.f64682v, c3186hd.f64682v) && Intrinsics.b(this.f64683w, c3186hd.f64683w) && Intrinsics.b(this.f64684x, c3186hd.f64684x) && Intrinsics.b(this.f64685y, c3186hd.f64685y) && this.f64686z == c3186hd.f64686z && Intrinsics.b(this.A, c3186hd.A) && Intrinsics.b(this.B, c3186hd.B) && Intrinsics.b(this.C, c3186hd.C) && Intrinsics.b(this.D, c3186hd.D) && Intrinsics.b(this.E, c3186hd.E) && Intrinsics.b(this.F, c3186hd.F) && Intrinsics.b(this.G, c3186hd.G) && Intrinsics.b(this.H, c3186hd.H) && Intrinsics.b(this.I, c3186hd.I) && Intrinsics.b(this.J, c3186hd.J) && Intrinsics.b(this.K, c3186hd.K) && Intrinsics.b(this.L, c3186hd.L) && Intrinsics.b(this.M, c3186hd.M) && Intrinsics.b(this.N, c3186hd.N) && Intrinsics.b(this.O, c3186hd.O) && Intrinsics.b(this.P, c3186hd.P) && Intrinsics.b(this.Q, c3186hd.Q) && Intrinsics.b(this.R, c3186hd.R);
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final C7 f() {
        return this.f64675m;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Object g() {
        return this.L;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final EnumC3396u4 getContainerType() {
        return this.f64676p;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String h() {
        return this.I;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        String str = this.f64663a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        boolean z11 = this.f64664b;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iHashCode + i5) * 31;
        String str2 = this.f64665c;
        int iHashCode2 = (i11 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Long l9 = this.f64666d;
        int iHashCode3 = (iHashCode2 + (l9 == null ? 0 : l9.hashCode())) * 31;
        String str3 = this.f64667e;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f64668f;
        int iHashCode5 = (this.f64669g.hashCode() + ((iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31)) * 31;
        String str5 = this.f64670h;
        int iHashCode6 = (iHashCode5 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f64671i;
        int iHashCode7 = (iHashCode6 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f64672j;
        int iHashCode8 = (iHashCode7 + (str7 == null ? 0 : str7.hashCode())) * 31;
        Long l11 = this.f64673k;
        int iHashCode9 = (iHashCode8 + (l11 == null ? 0 : l11.hashCode())) * 31;
        C7 c72 = this.f64674l;
        int iHashCode10 = (iHashCode9 + (c72 == null ? 0 : c72.hashCode())) * 31;
        C7 c73 = this.f64675m;
        int iA = C3265m8.a(this.n, (iHashCode10 + (c73 == null ? 0 : c73.hashCode())) * 31, 31);
        Boolean bool = this.o;
        int iHashCode11 = (this.f64676p.hashCode() + ((iA + (bool == null ? 0 : bool.hashCode())) * 31)) * 31;
        Boolean bool2 = this.f64677q;
        int iHashCode12 = (iHashCode11 + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        String str8 = this.f64678r;
        int iHashCode13 = (iHashCode12 + (str8 == null ? 0 : str8.hashCode())) * 31;
        String str9 = this.f64679s;
        int iHashCode14 = (iHashCode13 + (str9 == null ? 0 : str9.hashCode())) * 31;
        Integer num = this.f64680t;
        int iHashCode15 = (iHashCode14 + (num == null ? 0 : num.hashCode())) * 31;
        String str10 = this.f64681u;
        int iHashCode16 = (iHashCode15 + (str10 == null ? 0 : str10.hashCode())) * 31;
        Integer num2 = this.f64682v;
        int iK = h6.c1.k(this.f64683w, (iHashCode16 + (num2 == null ? 0 : num2.hashCode())) * 31, 31);
        String str11 = this.f64684x;
        int iHashCode17 = (iK + (str11 == null ? 0 : str11.hashCode())) * 31;
        String str12 = this.f64685y;
        int iHashCode18 = (iHashCode17 + (str12 == null ? 0 : str12.hashCode())) * 31;
        boolean z12 = this.f64686z;
        int i12 = (iHashCode18 + (z12 ? 1 : z12 ? 1 : 0)) * 31;
        String str13 = this.A;
        int iHashCode19 = (i12 + (str13 == null ? 0 : str13.hashCode())) * 31;
        String str14 = this.B;
        int iHashCode20 = (iHashCode19 + (str14 == null ? 0 : str14.hashCode())) * 31;
        String str15 = this.C;
        int iA2 = C3265m8.a(this.D, (iHashCode20 + (str15 == null ? 0 : str15.hashCode())) * 31, 31);
        String str16 = this.E;
        int iHashCode21 = (iA2 + (str16 == null ? 0 : str16.hashCode())) * 31;
        String str17 = this.F;
        int iHashCode22 = (iHashCode21 + (str17 == null ? 0 : str17.hashCode())) * 31;
        String str18 = this.G;
        int iHashCode23 = (iHashCode22 + (str18 == null ? 0 : str18.hashCode())) * 31;
        String str19 = this.H;
        int iHashCode24 = (iHashCode23 + (str19 == null ? 0 : str19.hashCode())) * 31;
        String str20 = this.I;
        int iHashCode25 = (iHashCode24 + (str20 == null ? 0 : str20.hashCode())) * 31;
        String str21 = this.J;
        int iHashCode26 = (iHashCode25 + (str21 == null ? 0 : str21.hashCode())) * 31;
        Object obj = this.K;
        int iHashCode27 = (iHashCode26 + (obj == null ? 0 : obj.hashCode())) * 31;
        Object obj2 = this.L;
        int iC = x8.h.c(this.M, (iHashCode27 + (obj2 == null ? 0 : obj2.hashCode())) * 31, 31);
        Float f11 = this.N;
        int iHashCode28 = (iC + (f11 == null ? 0 : f11.hashCode())) * 31;
        Long l12 = this.O;
        int iHashCode29 = (iHashCode28 + (l12 == null ? 0 : l12.hashCode())) * 31;
        String str22 = this.P;
        int iHashCode30 = (iHashCode29 + (str22 == null ? 0 : str22.hashCode())) * 31;
        String str23 = this.Q;
        return this.R.hashCode() + ((iHashCode30 + (str23 != null ? str23.hashCode() : 0)) * 31);
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String i() {
        return this.J;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String j() {
        return this.f64679s;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String k() {
        return this.f64665c;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String l() {
        return this.f64667e;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Long m() {
        return this.f64666d;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Float n() {
        return this.N;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final EnumC3449x6 o() {
        return this.f64669g;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final C7 p() {
        return this.f64674l;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String q() {
        return this.f64672j;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Long r() {
        return this.f64673k;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final List<Link> s() {
        return this.D;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final List<Yd> t() {
        return this.R;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SearchEntity(type=");
        sb2.append(this.f64663a);
        sb2.append(", isSSML=");
        sb2.append(this.f64664b);
        sb2.append(", entityId=");
        sb2.append(this.f64665c);
        sb2.append(", resultId=");
        sb2.append(this.f64666d);
        sb2.append(", entityTitle=");
        sb2.append(this.f64667e);
        sb2.append(", entityDescription=");
        sb2.append(this.f64668f);
        sb2.append(", entityType=");
        sb2.append(this.f64669g);
        sb2.append(", entityInternalType=");
        sb2.append(this.f64670h);
        sb2.append(", entityLabel=");
        sb2.append(this.f64671i);
        sb2.append(", entityPackageName=");
        sb2.append(this.f64672j);
        sb2.append(", entityUserId=");
        sb2.append(this.f64673k);
        sb2.append(", entityPrimaryImage=");
        sb2.append(this.f64674l);
        sb2.append(", entitySecondaryImage=");
        sb2.append(this.f64675m);
        sb2.append(", actions=");
        sb2.append(this.n);
        sb2.append(", isStrongMatch=");
        sb2.append(this.o);
        sb2.append(", containerType=");
        sb2.append(this.f64676p);
        sb2.append(", validateLinking=");
        sb2.append(this.f64677q);
        sb2.append(", actionLabel=");
        sb2.append(this.f64678r);
        sb2.append(", shortcutType=");
        sb2.append(this.f64679s);
        sb2.append(", orderRank=");
        sb2.append(this.f64680t);
        sb2.append(", shortcutId=");
        sb2.append(this.f64681u);
        sb2.append(", bucketRank=");
        sb2.append(this.f64682v);
        sb2.append(", containerPlacements=");
        sb2.append(this.f64683w);
        sb2.append(", containerPlacement=");
        sb2.append(this.f64684x);
        sb2.append(", entityClickUrl=");
        sb2.append(this.f64685y);
        sb2.append(", isSearchMore=");
        sb2.append(this.f64686z);
        sb2.append(", screenshotUrl=");
        sb2.append(this.A);
        sb2.append(", clickTrackingUrl=");
        sb2.append(this.B);
        sb2.append(", appClickTrackingUrl=");
        sb2.append(this.C);
        sb2.append(", linking=");
        sb2.append(this.D);
        sb2.append(", entityBundleSourceId=");
        sb2.append(this.E);
        sb2.append(", imageUrl=");
        sb2.append(this.F);
        sb2.append(", label=");
        sb2.append(this.G);
        sb2.append(", callToAction=");
        sb2.append(this.H);
        sb2.append(", adState=");
        sb2.append(this.I);
        sb2.append(", activityClassName=");
        sb2.append(this.J);
        sb2.append(", clickingTrackingUrl=");
        sb2.append(this.K);
        sb2.append(", impressionUrl=");
        sb2.append(this.L);
        sb2.append(", analytics=");
        sb2.append(this.M);
        sb2.append(", averageRating=");
        sb2.append(this.N);
        sb2.append(", ratingsCount=");
        sb2.append(this.O);
        sb2.append(", downloadsCount=");
        sb2.append(this.P);
        sb2.append(", appSizeInMB=");
        sb2.append(this.Q);
        sb2.append(", subShortcuts=");
        return fq.c.e(sb2, this.R, ')');
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final Map<String, String> u() {
        return this.M;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String v() {
        return null;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String w() {
        return this.Q;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final List<C3155g> x() {
        return this.n;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public C3186hd(@Nullable String str, boolean z11, @Nullable String str2, @Nullable Long l9, @Nullable String str3, @Nullable String str4, @NotNull EnumC3449x6 entityType, @Nullable String str5, @Nullable String str6, @Nullable String str7, @Nullable Long l11, @Nullable C7 c72, @Nullable C7 c73, @NotNull List<C3155g> actions, @Nullable Boolean bool, @NotNull EnumC3396u4 containerType, @Nullable Boolean bool2, @Nullable String str8, @Nullable String str9, @Nullable Integer num, @Nullable String str10, @Nullable Integer num2, @NotNull Set<? extends EnumC3379t4> containerPlacements, @Nullable String str11, @Nullable String str12, boolean z12, @Nullable String str13, @Nullable String str14, @Nullable String str15, @NotNull List<? extends Link> linking, @Nullable String str16, @Nullable String str17, @Nullable String str18, @Nullable String str19, @Nullable String str20, @Nullable String str21, @Nullable Object obj, @Nullable Object obj2, @NotNull Map<String, String> analytics, @Nullable Float f11, @Nullable Long l12, @Nullable String str22, @Nullable String str23, @NotNull List<? extends Yd> subShortcuts) {
        Intrinsics.g(entityType, "entityType");
        Intrinsics.g(actions, "actions");
        Intrinsics.g(containerType, "containerType");
        Intrinsics.g(containerPlacements, "containerPlacements");
        Intrinsics.g(linking, "linking");
        Intrinsics.g(analytics, "analytics");
        Intrinsics.g(subShortcuts, "subShortcuts");
        this.f64663a = str;
        this.f64664b = z11;
        this.f64665c = str2;
        this.f64666d = l9;
        this.f64667e = str3;
        this.f64668f = str4;
        this.f64669g = entityType;
        this.f64670h = str5;
        this.f64671i = str6;
        this.f64672j = str7;
        this.f64673k = l11;
        this.f64674l = c72;
        this.f64675m = c73;
        this.n = actions;
        this.o = bool;
        this.f64676p = containerType;
        this.f64677q = bool2;
        this.f64678r = str8;
        this.f64679s = str9;
        this.f64680t = num;
        this.f64681u = str10;
        this.f64682v = num2;
        this.f64683w = containerPlacements;
        this.f64684x = str11;
        this.f64685y = str12;
        this.f64686z = z12;
        this.A = str13;
        this.B = str14;
        this.C = str15;
        this.D = linking;
        this.E = str16;
        this.F = str17;
        this.G = str18;
        this.H = str19;
        this.I = str20;
        this.J = str21;
        this.K = obj;
        this.L = obj2;
        this.M = analytics;
        this.N = f11;
        this.O = l12;
        this.P = str22;
        this.Q = str23;
        this.R = subShortcuts;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String a() {
        return this.H;
    }
}
