package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class f implements c {

    /* renamed from: a, reason: collision with root package name */
    public static final f f38750a = new f("NATIVE_AD_ORTB_RESPONSE_NULL_ERROR", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final f f38751b = new f("NATIVE_AD_IMAGE_ASSET_MEDIA_FETCH_ERROR", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final f f38752c = new f("NATIVE_AD_IMAGE_PREPARE_ASSET_UNKNOWN_ERROR", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final f f38753d = new f("NATIVE_AD_VIDEO_ASSET_MEDIA_NOT_ENOUGH_ERROR", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final f f38754e = new f("NATIVE_AD_VIDEO_ASSET_MEDIA_FETCH_ERROR", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final f f38755f = new f("NATIVE_AD_COMPOSE_VIEW_NOT_AVAILABLE_ERROR", 5);

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ f[] f38756g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f38757h;

    static {
        f[] fVarArrB = b();
        f38756g = fVarArrB;
        f38757h = EnumEntriesKt.a(fVarArrB);
    }

    public f(String str, int i5) {
    }

    public static final /* synthetic */ f[] b() {
        return new f[]{f38750a, f38751b, f38752c, f38753d, f38754e, f38755f};
    }

    @NotNull
    public static EnumEntries<f> c() {
        return f38757h;
    }

    public static f valueOf(String str) {
        return (f) Enum.valueOf(f.class, str);
    }

    public static f[] values() {
        return (f[]) f38756g.clone();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c
    @NotNull
    public String a() {
        return name();
    }
}
