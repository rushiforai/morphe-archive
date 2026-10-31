package io.branch.search.internal;

import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.ed, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3135ed {

    /* renamed from: a, reason: collision with root package name */
    public final int f64396a;

    /* renamed from: b, reason: collision with root package name */
    public final int f64397b;

    /* renamed from: c, reason: collision with root package name */
    public final int f64398c;

    /* renamed from: d, reason: collision with root package name */
    public final int f64399d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final List<String> f64400e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final List<String> f64401f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Map<String, String> f64402g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final Set<String> f64403h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final Map<String, Set<String>> f64404i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final Map<String, Set<Integer>> f64405j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f64406k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final String f64407l;

    public C3135ed() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3135ed)) {
            return false;
        }
        C3135ed c3135ed = (C3135ed) obj;
        return this.f64396a == c3135ed.f64396a && this.f64397b == c3135ed.f64397b && this.f64398c == c3135ed.f64398c && this.f64399d == c3135ed.f64399d && Intrinsics.b(this.f64400e, c3135ed.f64400e) && Intrinsics.b(this.f64401f, c3135ed.f64401f) && Intrinsics.b(this.f64402g, c3135ed.f64402g) && Intrinsics.b(this.f64403h, c3135ed.f64403h) && Intrinsics.b(this.f64404i, c3135ed.f64404i) && Intrinsics.b(this.f64405j, c3135ed.f64405j) && this.f64406k == c3135ed.f64406k && Intrinsics.b(this.f64407l, c3135ed.f64407l);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iC = x8.h.c(this.f64402g, C3265m8.a(this.f64401f, C3265m8.a(this.f64400e, C3214j8.a(this.f64399d, C3214j8.a(this.f64398c, C3214j8.a(this.f64397b, Integer.hashCode(this.f64396a) * 31, 31), 31), 31), 31), 31), 31);
        Set<String> set = this.f64403h;
        int iHashCode = (iC + (set == null ? 0 : set.hashCode())) * 31;
        Map<String, Set<String>> map = this.f64404i;
        int iHashCode2 = (iHashCode + (map == null ? 0 : map.hashCode())) * 31;
        Map<String, Set<Integer>> map2 = this.f64405j;
        int iHashCode3 = (iHashCode2 + (map2 != null ? map2.hashCode() : 0)) * 31;
        boolean z11 = this.f64406k;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return this.f64407l.hashCode() + ((iHashCode3 + i5) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SearchConfig(appsLimit=");
        sb2.append(this.f64396a);
        sb2.append(", relatedAppsLimit=");
        sb2.append(this.f64397b);
        sb2.append(", shortcutLimits=");
        sb2.append(this.f64398c);
        sb2.append(", shortcutsPerAppLimit=");
        sb2.append(this.f64399d);
        sb2.append(", searchMoreApps=");
        sb2.append(this.f64400e);
        sb2.append(", containerOrder=");
        sb2.append(this.f64401f);
        sb2.append(", containerTypes=");
        sb2.append(this.f64402g);
        sb2.append(", containersWithAds=");
        sb2.append(this.f64403h);
        sb2.append(", supportedAdsTypesByContainer=");
        sb2.append(this.f64404i);
        sb2.append(", adsOrderByContainer=");
        sb2.append(this.f64405j);
        sb2.append(", isDeduplicationEnabled=");
        sb2.append(this.f64406k);
        sb2.append(", matchingType=");
        return h6.c1.t(sb2, this.f64407l, ')');
    }

    /* JADX WARN: Multi-variable type inference failed */
    public C3135ed(int i5, int i11, int i12, int i13, @NotNull List<String> searchMoreApps, @NotNull List<String> containerOrder, @NotNull Map<String, String> containerTypes, @Nullable Set<String> set, @Nullable Map<String, ? extends Set<String>> map, @Nullable Map<String, ? extends Set<Integer>> map2, boolean z11, @NotNull String matchingType) {
        Intrinsics.g(searchMoreApps, "searchMoreApps");
        Intrinsics.g(containerOrder, "containerOrder");
        Intrinsics.g(containerTypes, "containerTypes");
        Intrinsics.g(matchingType, "matchingType");
        this.f64396a = i5;
        this.f64397b = i11;
        this.f64398c = i12;
        this.f64399d = i13;
        this.f64400e = searchMoreApps;
        this.f64401f = containerOrder;
        this.f64402g = containerTypes;
        this.f64403h = set;
        this.f64404i = map;
        this.f64405j = map2;
        this.f64406k = z11;
        this.f64407l = matchingType;
    }

    public C3135ed(int i5) {
        this(10, 10, 4, -1, ul.b.Q("search_more-com.google.android.googlequicksearchbox-web", "search_more-com.android.vending-app", "search_more-org.wikipedia-app", "search_more-com.google.android.apps.maps-app", "search_more-com.google.android.youtube-app", "search_more-com.spotify.music-app", "search_more-com.google.android.apps.youtube.music-app", "search_more-com.google.android.apps.translate-app", "search_more-com.netflix.mediaclient-app"), ul.b.Q("hero_ad", "app_search", "shortcut_search", "related_apps", "search_more"), MapsKt.j0(new Pair("hero_ad", "4"), new Pair("shortcut_search", "6"), new Pair("search_more", "8"), new Pair("app_search", "12"), new Pair("related_apps", "13")), null, null, null, true, "RELAXED_MULTI_PREFIX");
    }
}
