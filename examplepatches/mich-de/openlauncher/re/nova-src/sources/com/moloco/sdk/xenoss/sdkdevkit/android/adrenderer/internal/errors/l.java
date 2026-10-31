package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class l implements c {

    /* renamed from: a, reason: collision with root package name */
    public static final l f38804a = new l("VAST_AD_EXOPLAYER_VIDEO_LAYER_ERROR", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final l f38805b = new l("VAST_AD_EXOPLAYER_STYLED_PLAYER_VIEW_INFLATE_EXCEPTION_ERROR", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final l f38806c = new l("VAST_AD_EXOPLAYER_SET_MEDIA_ITEM_EXCEPTION_ERROR", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final l f38807d = new l("VAST_AD_EXOPLAYER_SET_MEDIA_FILE_NOT_EXISTS_ERROR", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final l f38808e = new l("VAST_AD_COMPOSE_VIEW_NOT_AVAILABLE", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ l[] f38809f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f38810g;

    static {
        l[] lVarArrB = b();
        f38809f = lVarArrB;
        f38810g = EnumEntriesKt.a(lVarArrB);
    }

    public l(String str, int i5) {
    }

    public static final /* synthetic */ l[] b() {
        return new l[]{f38804a, f38805b, f38806c, f38807d, f38808e};
    }

    @NotNull
    public static EnumEntries<l> c() {
        return f38810g;
    }

    public static l valueOf(String str) {
        return (l) Enum.valueOf(l.class, str);
    }

    public static l[] values() {
        return (l[]) f38809f.clone();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c
    @NotNull
    public String a() {
        return name();
    }
}
