package io.branch.search.internal;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.s6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3364s6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65742a;

    /* renamed from: b, reason: collision with root package name */
    public final int f65743b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f65744c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f65745d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f65746e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final String f65747f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final String f65748g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f65749h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final List<C3314p6> f65750i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final String f65751j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final String f65752k;

    /* renamed from: l, reason: collision with root package name */
    @Nullable
    public final Long f65753l;

    /* renamed from: m, reason: collision with root package name */
    @Nullable
    public final Integer f65754m;

    @Nullable
    public final String n;

    @NotNull
    public final Map<String, String> o;

    public C3364s6(@NotNull String packageName, int i5, @NotNull String containerType, @NotNull String contentType, @Nullable String str, @NotNull String entityId, @NotNull String requestId, @NotNull String shortcutType, @NotNull List<C3314p6> additionalActions, @NotNull String label, @NotNull String adState, @Nullable Long l9, @Nullable Integer num, @Nullable String str2, @NotNull Map<String, String> extras) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(containerType, "containerType");
        Intrinsics.g(contentType, "contentType");
        Intrinsics.g(entityId, "entityId");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(shortcutType, "shortcutType");
        Intrinsics.g(additionalActions, "additionalActions");
        Intrinsics.g(label, "label");
        Intrinsics.g(adState, "adState");
        Intrinsics.g(extras, "extras");
        this.f65742a = packageName;
        this.f65743b = i5;
        this.f65744c = containerType;
        this.f65745d = contentType;
        this.f65746e = str;
        this.f65747f = entityId;
        this.f65748g = requestId;
        this.f65749h = shortcutType;
        this.f65750i = additionalActions;
        this.f65751j = label;
        this.f65752k = adState;
        this.f65753l = l9;
        this.f65754m = num;
        this.n = str2;
        this.o = extras;
    }

    public static C3364s6 a(C3364s6 c3364s6, Integer num, String str, Map map, int i5) {
        String packageName = c3364s6.f65742a;
        int i11 = c3364s6.f65743b;
        String containerType = c3364s6.f65744c;
        String contentType = c3364s6.f65745d;
        String str2 = c3364s6.f65746e;
        String entityId = c3364s6.f65747f;
        String requestId = c3364s6.f65748g;
        String shortcutType = c3364s6.f65749h;
        List<C3314p6> additionalActions = c3364s6.f65750i;
        String label = c3364s6.f65751j;
        String adState = c3364s6.f65752k;
        Long l9 = c3364s6.f65753l;
        Integer num2 = (i5 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? c3364s6.f65754m : num;
        String str3 = (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? c3364s6.n : str;
        Map extras = (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? c3364s6.o : map;
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(containerType, "containerType");
        Intrinsics.g(contentType, "contentType");
        Intrinsics.g(entityId, "entityId");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(shortcutType, "shortcutType");
        Intrinsics.g(additionalActions, "additionalActions");
        Intrinsics.g(label, "label");
        Intrinsics.g(adState, "adState");
        Intrinsics.g(extras, "extras");
        return new C3364s6(packageName, i11, containerType, contentType, str2, entityId, requestId, shortcutType, additionalActions, label, adState, l9, num2, str3, extras);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3364s6)) {
            return false;
        }
        C3364s6 c3364s6 = (C3364s6) obj;
        return Intrinsics.b(this.f65742a, c3364s6.f65742a) && this.f65743b == c3364s6.f65743b && Intrinsics.b(this.f65744c, c3364s6.f65744c) && Intrinsics.b(this.f65745d, c3364s6.f65745d) && Intrinsics.b(this.f65746e, c3364s6.f65746e) && Intrinsics.b(this.f65747f, c3364s6.f65747f) && Intrinsics.b(this.f65748g, c3364s6.f65748g) && Intrinsics.b(this.f65749h, c3364s6.f65749h) && Intrinsics.b(this.f65750i, c3364s6.f65750i) && Intrinsics.b(this.f65751j, c3364s6.f65751j) && Intrinsics.b(this.f65752k, c3364s6.f65752k) && Intrinsics.b(this.f65753l, c3364s6.f65753l) && Intrinsics.b(this.f65754m, c3364s6.f65754m) && Intrinsics.b(this.n, c3364s6.n) && Intrinsics.b(this.o, c3364s6.o);
    }

    public final int hashCode() {
        int iA = C3248l8.a(this.f65745d, C3248l8.a(this.f65744c, C3214j8.a(this.f65743b, this.f65742a.hashCode() * 31, 31), 31), 31);
        String str = this.f65746e;
        int iA2 = C3248l8.a(this.f65752k, C3248l8.a(this.f65751j, C3265m8.a(this.f65750i, C3248l8.a(this.f65749h, C3248l8.a(this.f65748g, C3248l8.a(this.f65747f, (iA + (str == null ? 0 : str.hashCode())) * 31, 31), 31), 31), 31), 31), 31);
        Long l9 = this.f65753l;
        int iHashCode = (iA2 + (l9 == null ? 0 : l9.hashCode())) * 31;
        Integer num = this.f65754m;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        String str2 = this.n;
        return this.o.hashCode() + ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("EntityAnalyticsData(packageName=");
        sb2.append(this.f65742a);
        sb2.append(", resultId=");
        sb2.append(this.f65743b);
        sb2.append(", containerType=");
        sb2.append(this.f65744c);
        sb2.append(", contentType=");
        sb2.append(this.f65745d);
        sb2.append(", bundleSourceId=");
        sb2.append(this.f65746e);
        sb2.append(", entityId=");
        sb2.append(this.f65747f);
        sb2.append(", requestId=");
        sb2.append(this.f65748g);
        sb2.append(", shortcutType=");
        sb2.append(this.f65749h);
        sb2.append(", additionalActions=");
        sb2.append(this.f65750i);
        sb2.append(", label=");
        sb2.append(this.f65751j);
        sb2.append(", adState=");
        sb2.append(this.f65752k);
        sb2.append(", userHandle=");
        sb2.append(this.f65753l);
        sb2.append(", rank=");
        sb2.append(this.f65754m);
        sb2.append(", reason=");
        sb2.append(this.n);
        sb2.append(", extras=");
        return b.c9.l(sb2, this.o, ')');
    }

    public /* synthetic */ C3364s6(String str, int i5, String str2, String str3, String str4, String str5, String str6, ArrayList arrayList, String str7, String str8, Long l9, Map map) {
        this(str, i5, str2, str3, null, str4, str5, str6, arrayList, str7, str8, l9, null, null, map);
    }
}
