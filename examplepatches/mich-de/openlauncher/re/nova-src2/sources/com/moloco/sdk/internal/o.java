package com.moloco.sdk.internal;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class o implements com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c {

    /* renamed from: a, reason: collision with root package name */
    public static final o f36602a = new o("AD_LOAD_LIMIT_REACHED", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final o f36603b = new o("BID_LOAD_ERROR_CANNOT_PROCESS_BID_RESPONSE", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final o f36604c = new o("BID_LOAD_ERROR_PARSE_INVALID_JSON", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final o f36605d = new o("BID_LOAD_ERROR_PARSE_MISSING_REQUIRED_FIELD", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final o f36606e = new o("BID_LOAD_ERROR_CANNOT_PARSE_BID_RESPONSE", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final o f36607f = new o("AD_SHOW_ERROR_NOT_LOADED", 5);

    /* renamed from: g, reason: collision with root package name */
    public static final o f36608g = new o("AD_SHOW_ERROR_ALREADY_DISPLAYING", 6);

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ o[] f36609h;

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f36610i;

    static {
        o[] oVarArrB = b();
        f36609h = oVarArrB;
        f36610i = EnumEntriesKt.a(oVarArrB);
    }

    public o(String str, int i5) {
    }

    public static final /* synthetic */ o[] b() {
        return new o[]{f36602a, f36603b, f36604c, f36605d, f36606e, f36607f, f36608g};
    }

    @NotNull
    public static EnumEntries<o> c() {
        return f36610i;
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f36609h.clone();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c
    @NotNull
    public String a() {
        return name();
    }
}
