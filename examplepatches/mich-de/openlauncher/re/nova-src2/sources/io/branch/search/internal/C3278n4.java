package io.branch.search.internal;

import io.branch.search.internal.P1;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.n4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3278n4 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65316a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f65317b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f65318c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f65319d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f65320e;

    /* renamed from: f, reason: collision with root package name */
    public final int f65321f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f65322g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final String f65323h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final String f65324i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final String f65325j;

    /* renamed from: k, reason: collision with root package name */
    @Nullable
    public final String f65326k;

    /* renamed from: l, reason: collision with root package name */
    @Nullable
    public final Map<String, String> f65327l;

    /* renamed from: m, reason: collision with root package name */
    @Nullable
    public final P1.a f65328m;

    @Nullable
    public final Long n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f65329p;

    /* renamed from: q, reason: collision with root package name */
    @Nullable
    public final String f65330q;

    /* renamed from: r, reason: collision with root package name */
    @Nullable
    public final Map<String, Object> f65331r;

    /* renamed from: s, reason: collision with root package name */
    @Nullable
    public final Map<String, Object> f65332s;

    public C3278n4() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3278n4)) {
            return false;
        }
        C3278n4 c3278n4 = (C3278n4) obj;
        return Intrinsics.b(this.f65316a, c3278n4.f65316a) && Intrinsics.b(this.f65317b, c3278n4.f65317b) && Intrinsics.b(this.f65318c, c3278n4.f65318c) && Intrinsics.b(this.f65319d, c3278n4.f65319d) && Intrinsics.b(this.f65320e, c3278n4.f65320e) && this.f65321f == c3278n4.f65321f && this.f65322g == c3278n4.f65322g && Intrinsics.b(this.f65323h, c3278n4.f65323h) && Intrinsics.b(this.f65324i, c3278n4.f65324i) && Intrinsics.b(this.f65325j, c3278n4.f65325j) && Intrinsics.b(this.f65326k, c3278n4.f65326k) && Intrinsics.b(this.f65327l, c3278n4.f65327l) && this.f65328m == c3278n4.f65328m && Intrinsics.b(this.n, c3278n4.n) && this.o == c3278n4.o && this.f65329p == c3278n4.f65329p && Intrinsics.b(this.f65330q, c3278n4.f65330q) && Intrinsics.b(this.f65331r, c3278n4.f65331r) && Intrinsics.b(this.f65332s, c3278n4.f65332s);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = this.f65316a.hashCode() * 31;
        String str = this.f65317b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f65318c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f65319d;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f65320e;
        int iA = C3214j8.a(this.f65321f, (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31, 31);
        boolean z11 = this.f65322g;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iA + i5) * 31;
        String str5 = this.f65323h;
        int iHashCode5 = (i11 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f65324i;
        int iHashCode6 = (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f65325j;
        int iHashCode7 = (iHashCode6 + (str7 == null ? 0 : str7.hashCode())) * 31;
        String str8 = this.f65326k;
        int iHashCode8 = (iHashCode7 + (str8 == null ? 0 : str8.hashCode())) * 31;
        Map<String, String> map = this.f65327l;
        int iHashCode9 = (iHashCode8 + (map == null ? 0 : map.hashCode())) * 31;
        P1.a aVar = this.f65328m;
        int iHashCode10 = (iHashCode9 + (aVar == null ? 0 : aVar.hashCode())) * 31;
        Long l9 = this.n;
        int iHashCode11 = (iHashCode10 + (l9 == null ? 0 : l9.hashCode())) * 31;
        boolean z12 = this.o;
        int i12 = z12;
        if (z12 != 0) {
            i12 = 1;
        }
        int i13 = (iHashCode11 + i12) * 31;
        boolean z13 = this.f65329p;
        int i14 = (i13 + (z13 ? 1 : z13 ? 1 : 0)) * 31;
        String str9 = this.f65330q;
        int iHashCode12 = (i14 + (str9 == null ? 0 : str9.hashCode())) * 31;
        Map<String, Object> map2 = this.f65331r;
        int iHashCode13 = (iHashCode12 + (map2 == null ? 0 : map2.hashCode())) * 31;
        Map<String, Object> map3 = this.f65332s;
        return iHashCode13 + (map3 != null ? map3.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ConfigurationData(branchKey=");
        sb2.append(this.f65316a);
        sb2.append(", countryCode=");
        sb2.append(this.f65317b);
        sb2.append(", simCountryCode=");
        sb2.append(this.f65318c);
        sb2.append(", networkCountryCode=");
        sb2.append(this.f65319d);
        sb2.append(", locale=");
        sb2.append(this.f65320e);
        sb2.append(", isAdTrackingLimited=");
        sb2.append(this.f65321f);
        sb2.append(", personalization=");
        sb2.append(this.f65322g);
        sb2.append(", countryToAttribute=");
        sb2.append(this.f65323h);
        sb2.append(", carrierToAttribute=");
        sb2.append(this.f65324i);
        sb2.append(", brandToAttribute=");
        sb2.append(this.f65325j);
        sb2.append(", modelToAttribute=");
        sb2.append(this.f65326k);
        sb2.append(", customAttribution=");
        sb2.append(this.f65327l);
        sb2.append(", trackingStatus=");
        sb2.append(this.f65328m);
        sb2.append(", trackingStatusLastOptedInTimestamp=");
        sb2.append(this.n);
        sb2.append(", shouldUseApplicationInfoLabelForSearch=");
        sb2.append(this.o);
        sb2.append(", useAppIconForSettingsShortcut=");
        sb2.append(this.f65329p);
        sb2.append(", gaid=");
        sb2.append(this.f65330q);
        sb2.append(", requestExtra=");
        sb2.append(this.f65331r);
        sb2.append(", debugOverrideJson=");
        return b.c9.l(sb2, this.f65332s, ')');
    }

    public /* synthetic */ C3278n4(int i5) {
        this(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null, null, null, null, -1, false, null, null, null, null, null, null, null, false, false, null, null, null);
    }

    public C3278n4(@NotNull String branchKey, @Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4, int i5, boolean z11, @Nullable String str5, @Nullable String str6, @Nullable String str7, @Nullable String str8, @Nullable Map<String, String> map, @Nullable P1.a aVar, @Nullable Long l9, boolean z12, boolean z13, @Nullable String str9, @Nullable Map<String, ? extends Object> map2, @Nullable Map<String, ? extends Object> map3) {
        Intrinsics.g(branchKey, "branchKey");
        this.f65316a = branchKey;
        this.f65317b = str;
        this.f65318c = str2;
        this.f65319d = str3;
        this.f65320e = str4;
        this.f65321f = i5;
        this.f65322g = z11;
        this.f65323h = str5;
        this.f65324i = str6;
        this.f65325j = str7;
        this.f65326k = str8;
        this.f65327l = map;
        this.f65328m = aVar;
        this.n = l9;
        this.o = z12;
        this.f65329p = z13;
        this.f65330q = str9;
        this.f65331r = map2;
        this.f65332s = map3;
    }
}
