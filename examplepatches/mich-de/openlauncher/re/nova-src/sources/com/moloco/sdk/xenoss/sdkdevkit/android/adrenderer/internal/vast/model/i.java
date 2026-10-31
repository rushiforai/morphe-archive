package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public static final i f40755a = new i("Image", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final i f40756b = new i("JS", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ i[] f40757c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f40758d;

    static {
        i[] iVarArrA = a();
        f40757c = iVarArrA;
        f40758d = EnumEntriesKt.a(iVarArrA);
    }

    public i(String str, int i5) {
    }

    public static final /* synthetic */ i[] a() {
        return new i[]{f40755a, f40756b};
    }

    @NotNull
    public static EnumEntries<i> b() {
        return f40758d;
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f40757c.clone();
    }
}
