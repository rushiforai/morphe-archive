package com.moloco.sdk.internal.client_metrics_data;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f36290a = new c("success", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final c f36291b = new c("failure", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ c[] f36292c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f36293d;

    static {
        c[] cVarArrA = a();
        f36292c = cVarArrA;
        f36293d = EnumEntriesKt.a(cVarArrA);
    }

    public c(String str, int i5) {
    }

    public static final /* synthetic */ c[] a() {
        return new c[]{f36290a, f36291b};
    }

    @NotNull
    public static EnumEntries<c> b() {
        return f36293d;
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f36292c.clone();
    }
}
