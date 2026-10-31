package com.moloco.sdk.internal.client_metrics_data;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class d {

    /* renamed from: b, reason: collision with root package name */
    public static final d f36294b = new d("Reason", 0, "reason");

    /* renamed from: c, reason: collision with root package name */
    public static final d f36295c = new d("AdType", 1, "ad_type");

    /* renamed from: d, reason: collision with root package name */
    public static final d f36296d = new d("Result", 2, "result");

    /* renamed from: e, reason: collision with root package name */
    public static final d f36297e = new d("Country", 3, "country");

    /* renamed from: f, reason: collision with root package name */
    public static final d f36298f = new d("RetryAttempt", 4, "attempt");

    /* renamed from: g, reason: collision with root package name */
    public static final d f36299g = new d("Step", 5, "step");

    /* renamed from: h, reason: collision with root package name */
    public static final d f36300h = new d("CreativeType", 6, "creative_type");

    /* renamed from: i, reason: collision with root package name */
    public static final d f36301i = new d("MissingFields", 7, "missing_fields");

    /* renamed from: j, reason: collision with root package name */
    public static final d f36302j = new d("ParentViewType", 8, "parent_view_type");

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ d[] f36303k;

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f36304l;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f36305a;

    static {
        d[] dVarArrA = a();
        f36303k = dVarArrA;
        f36304l = EnumEntriesKt.a(dVarArrA);
    }

    public d(String str, int i5, String str2) {
        this.f36305a = str2;
    }

    public static final /* synthetic */ d[] a() {
        return new d[]{f36294b, f36295c, f36296d, f36297e, f36298f, f36299g, f36300h, f36301i, f36302j};
    }

    @NotNull
    public static EnumEntries<d> b() {
        return f36304l;
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f36303k.clone();
    }

    @NotNull
    public final String c() {
        return this.f36305a;
    }
}
