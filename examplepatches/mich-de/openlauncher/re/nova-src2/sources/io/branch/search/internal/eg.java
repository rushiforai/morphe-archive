package io.branch.search.internal;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import io.branch.search.internal.C7;
import io.branch.search.internal.requesthandler.model.Link;
import java.util.List;
import java.util.Map;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class eg implements Yd {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f64427a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f64428b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Long f64429c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f64430d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final EnumC3449x6 f64431e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final Long f64432f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final String f64433g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final String f64434h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final String f64435i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final String f64436j;

    /* renamed from: k, reason: collision with root package name */
    @Nullable
    public final String f64437k;

    /* renamed from: l, reason: collision with root package name */
    @Nullable
    public final String f64438l;

    /* renamed from: m, reason: collision with root package name */
    @Nullable
    public final Long f64439m;

    @NotNull
    public final List<Link> n;

    @Nullable
    public final Object o;

    /* renamed from: p, reason: collision with root package name */
    @Nullable
    public final Object f64440p;

    /* renamed from: q, reason: collision with root package name */
    @Nullable
    public final C7 f64441q;

    /* renamed from: r, reason: collision with root package name */
    @Nullable
    public final C7 f64442r;

    /* renamed from: s, reason: collision with root package name */
    @NotNull
    public final List<C3155g> f64443s;

    /* renamed from: t, reason: collision with root package name */
    @Nullable
    public final Boolean f64444t;

    /* renamed from: u, reason: collision with root package name */
    @NotNull
    public final EnumC3396u4 f64445u;

    /* renamed from: v, reason: collision with root package name */
    @Nullable
    public final String f64446v;

    /* renamed from: w, reason: collision with root package name */
    @NotNull
    public final Map<String, String> f64447w;

    /* renamed from: x, reason: collision with root package name */
    @NotNull
    public final List<Yd> f64448x;

    public static final class a {
    }

    public eg(@NotNull C3205j adResult) {
        C7 dVar;
        String str;
        C7 aVar;
        Intrinsics.g(adResult, "adResult");
        String strA = adResult.a();
        String strF = adResult.f();
        Long lW = adResult.w();
        String strD = adResult.d();
        EnumC3449x6 enumC3449x6O = adResult.o();
        Long lY = adResult.y();
        String strN = adResult.n();
        String strT = adResult.t();
        String strL = adResult.l();
        Long lA = adResult.A();
        List<Link> listS = adResult.s();
        String strI = adResult.i();
        String strQ = adResult.q();
        String strP = adResult.p();
        if (strP == null) {
            String strF2 = adResult.f();
            dVar = null;
            if (strF2 != null) {
                Long lA2 = adResult.A();
                long jLongValue = lA2 != null ? lA2.longValue() : 0L;
                str = strA;
                aVar = new C7.a(jLongValue, strF2, null);
            }
            this(str, strF, lW, strD, enumC3449x6O, lY, strN, strT, strL, null, null, null, lA, listS, strI, strQ, aVar, null, EmptyList.f71733a, null, adResult.k(), adResult.h(), adResult.b());
        }
        dVar = new C7.d(strP, adResult.a() != null ? "LOCAL_ZERO_STATE_AD" : "LOCAL_ZERO_STATE_LINK");
        str = strA;
        aVar = dVar;
        this(str, strF, lW, strD, enumC3449x6O, lY, strN, strT, strL, null, null, null, lA, listS, strI, strQ, aVar, null, EmptyList.f71733a, null, adResult.k(), adResult.h(), adResult.b());
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v5, types: [io.branch.search.internal.C7] */
    public static eg a(eg egVar, Long l9, C7.d dVar, Boolean bool, int i5) {
        Object obj;
        C7.d dVar2;
        String str;
        Boolean bool2;
        String str2 = egVar.f64427a;
        String str3 = egVar.f64428b;
        Long l11 = (i5 & 4) != 0 ? egVar.f64429c : l9;
        String str4 = egVar.f64430d;
        EnumC3449x6 entityType = egVar.f64431e;
        Long l12 = egVar.f64432f;
        String str5 = egVar.f64433g;
        String str6 = egVar.f64434h;
        String str7 = egVar.f64435i;
        String str8 = egVar.f64436j;
        String str9 = egVar.f64437k;
        String str10 = egVar.f64438l;
        Long l13 = egVar.f64439m;
        List<Link> linking = egVar.n;
        Object obj2 = egVar.o;
        Object obj3 = egVar.f64440p;
        if ((i5 & SQLiteDatabase.OPEN_FULLMUTEX) != 0) {
            obj = obj3;
            dVar2 = egVar.f64441q;
        } else {
            obj = obj3;
            dVar2 = dVar;
        }
        C7 c72 = egVar.f64442r;
        List<C3155g> actions = egVar.f64443s;
        if ((i5 & 524288) != 0) {
            str = str3;
            bool2 = egVar.f64444t;
        } else {
            str = str3;
            bool2 = bool;
        }
        EnumC3396u4 containerType = egVar.f64445u;
        Long l14 = l11;
        String str11 = egVar.f64446v;
        Map<String, String> analytics = egVar.f64447w;
        Intrinsics.g(entityType, "entityType");
        Intrinsics.g(linking, "linking");
        Intrinsics.g(actions, "actions");
        Intrinsics.g(containerType, "containerType");
        Intrinsics.g(analytics, "analytics");
        return new eg(str2, str, l14, str4, entityType, l12, str5, str6, str7, str8, str9, str10, l13, linking, obj2, obj, dVar2, c72, actions, bool2, containerType, str11, analytics);
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String b() {
        return this.f64435i;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String c() {
        return null;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Object d() {
        return this.o;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Long e() {
        return null;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof eg)) {
            return false;
        }
        eg egVar = (eg) obj;
        return Intrinsics.b(this.f64427a, egVar.f64427a) && Intrinsics.b(this.f64428b, egVar.f64428b) && Intrinsics.b(this.f64429c, egVar.f64429c) && Intrinsics.b(this.f64430d, egVar.f64430d) && this.f64431e == egVar.f64431e && Intrinsics.b(this.f64432f, egVar.f64432f) && Intrinsics.b(this.f64433g, egVar.f64433g) && Intrinsics.b(this.f64434h, egVar.f64434h) && Intrinsics.b(this.f64435i, egVar.f64435i) && Intrinsics.b(this.f64436j, egVar.f64436j) && Intrinsics.b(this.f64437k, egVar.f64437k) && Intrinsics.b(this.f64438l, egVar.f64438l) && Intrinsics.b(this.f64439m, egVar.f64439m) && Intrinsics.b(this.n, egVar.n) && Intrinsics.b(this.o, egVar.o) && Intrinsics.b(this.f64440p, egVar.f64440p) && Intrinsics.b(this.f64441q, egVar.f64441q) && Intrinsics.b(this.f64442r, egVar.f64442r) && Intrinsics.b(this.f64443s, egVar.f64443s) && Intrinsics.b(this.f64444t, egVar.f64444t) && this.f64445u == egVar.f64445u && Intrinsics.b(this.f64446v, egVar.f64446v) && Intrinsics.b(this.f64447w, egVar.f64447w);
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final C7 f() {
        return this.f64442r;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Object g() {
        return this.f64440p;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final EnumC3396u4 getContainerType() {
        return this.f64445u;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String h() {
        return this.f64427a;
    }

    public final int hashCode() {
        String str = this.f64427a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f64428b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        Long l9 = this.f64429c;
        int iHashCode3 = (iHashCode2 + (l9 == null ? 0 : l9.hashCode())) * 31;
        String str3 = this.f64430d;
        int iHashCode4 = (this.f64431e.hashCode() + ((iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31)) * 31;
        Long l11 = this.f64432f;
        int iHashCode5 = (iHashCode4 + (l11 == null ? 0 : l11.hashCode())) * 31;
        String str4 = this.f64433g;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f64434h;
        int iHashCode7 = (iHashCode6 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f64435i;
        int iHashCode8 = (iHashCode7 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f64436j;
        int iHashCode9 = (iHashCode8 + (str7 == null ? 0 : str7.hashCode())) * 31;
        String str8 = this.f64437k;
        int iHashCode10 = (iHashCode9 + (str8 == null ? 0 : str8.hashCode())) * 31;
        String str9 = this.f64438l;
        int iHashCode11 = (iHashCode10 + (str9 == null ? 0 : str9.hashCode())) * 31;
        Long l12 = this.f64439m;
        int iA = C3265m8.a(this.n, (iHashCode11 + (l12 == null ? 0 : l12.hashCode())) * 31, 31);
        Object obj = this.o;
        int iHashCode12 = (iA + (obj == null ? 0 : obj.hashCode())) * 31;
        Object obj2 = this.f64440p;
        int iHashCode13 = (iHashCode12 + (obj2 == null ? 0 : obj2.hashCode())) * 31;
        C7 c72 = this.f64441q;
        int iHashCode14 = (iHashCode13 + (c72 == null ? 0 : c72.hashCode())) * 31;
        C7 c73 = this.f64442r;
        int iA2 = C3265m8.a(this.f64443s, (iHashCode14 + (c73 == null ? 0 : c73.hashCode())) * 31, 31);
        Boolean bool = this.f64444t;
        int iHashCode15 = (this.f64445u.hashCode() + ((iA2 + (bool == null ? 0 : bool.hashCode())) * 31)) * 31;
        String str10 = this.f64446v;
        return this.f64447w.hashCode() + ((iHashCode15 + (str10 != null ? str10.hashCode() : 0)) * 31);
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String i() {
        return this.f64436j;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String j() {
        return this.f64437k;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String k() {
        return this.f64433g;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String l() {
        String str = this.f64434h;
        return str == null ? this.f64430d : str;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Long m() {
        return this.f64429c;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Float n() {
        return null;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final EnumC3449x6 o() {
        return this.f64431e;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final C7 p() {
        return this.f64441q;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String q() {
        return this.f64428b;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final Long r() {
        Long l9 = this.f64439m;
        return Long.valueOf(l9 != null ? l9.longValue() : 0L);
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final List<Link> s() {
        return this.n;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final List<Yd> t() {
        return this.f64448x;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ZeroStateEntity(adState=");
        sb2.append(this.f64427a);
        sb2.append(", appStoreId=");
        sb2.append(this.f64428b);
        sb2.append(", resultId=");
        sb2.append(this.f64429c);
        sb2.append(", appName=");
        sb2.append(this.f64430d);
        sb2.append(", entityType=");
        sb2.append(this.f64431e);
        sb2.append(", slot=");
        sb2.append(this.f64432f);
        sb2.append(", entityId=");
        sb2.append(this.f64433g);
        sb2.append(", name=");
        sb2.append(this.f64434h);
        sb2.append(", entityDescription=");
        sb2.append(this.f64435i);
        sb2.append(", activityClassName=");
        sb2.append(this.f64436j);
        sb2.append(", shortcutType=");
        sb2.append(this.f64437k);
        sb2.append(", shortcutLabel=");
        sb2.append(this.f64438l);
        sb2.append(", userId=");
        sb2.append(this.f64439m);
        sb2.append(", linking=");
        sb2.append(this.n);
        sb2.append(", clickingTrackingUrl=");
        sb2.append(this.o);
        sb2.append(", impressionUrl=");
        sb2.append(this.f64440p);
        sb2.append(", entityPrimaryImage=");
        sb2.append(this.f64441q);
        sb2.append(", entitySecondaryImage=");
        sb2.append(this.f64442r);
        sb2.append(", actions=");
        sb2.append(this.f64443s);
        sb2.append(", validateLinking=");
        sb2.append(this.f64444t);
        sb2.append(", containerType=");
        sb2.append(this.f64445u);
        sb2.append(", callToAction=");
        sb2.append(this.f64446v);
        sb2.append(", analytics=");
        return b.c9.l(sb2, this.f64447w, ')');
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final Map<String, String> u() {
        return this.f64447w;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String v() {
        return null;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String w() {
        return null;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final List<C3155g> x() {
        return this.f64443s;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String a() {
        return this.f64446v;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public eg(@Nullable String str, @Nullable String str2, @Nullable Long l9, @Nullable String str3, @NotNull EnumC3449x6 entityType, @Nullable Long l11, @Nullable String str4, @Nullable String str5, @Nullable String str6, @Nullable String str7, @Nullable String str8, @Nullable String str9, @Nullable Long l12, @NotNull List<? extends Link> linking, @Nullable Object obj, @Nullable Object obj2, @Nullable C7 c72, @Nullable C7 c73, @NotNull List<C3155g> actions, @Nullable Boolean bool, @NotNull EnumC3396u4 containerType, @Nullable String str10, @NotNull Map<String, String> analytics) {
        Intrinsics.g(entityType, "entityType");
        Intrinsics.g(linking, "linking");
        Intrinsics.g(actions, "actions");
        Intrinsics.g(containerType, "containerType");
        Intrinsics.g(analytics, "analytics");
        this.f64427a = str;
        this.f64428b = str2;
        this.f64429c = l9;
        this.f64430d = str3;
        this.f64431e = entityType;
        this.f64432f = l11;
        this.f64433g = str4;
        this.f64434h = str5;
        this.f64435i = str6;
        this.f64436j = str7;
        this.f64437k = str8;
        this.f64438l = str9;
        this.f64439m = l12;
        this.n = linking;
        this.o = obj;
        this.f64440p = obj2;
        this.f64441q = c72;
        this.f64442r = c73;
        this.f64443s = actions;
        this.f64444t = bool;
        this.f64445u = containerType;
        this.f64446v = str10;
        this.f64447w = analytics;
        this.f64448x = EmptyList.f71733a;
    }
}
