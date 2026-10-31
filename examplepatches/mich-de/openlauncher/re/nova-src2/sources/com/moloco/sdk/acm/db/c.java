package com.moloco.sdk.acm.db;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f36032a = new c("TIMER", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final c f36033b = new c("COUNT", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ c[] f36034c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f36035d;

    static {
        c[] cVarArrA = a();
        f36034c = cVarArrA;
        f36035d = EnumEntriesKt.a(cVarArrA);
    }

    public c(String str, int i5) {
    }

    public static final /* synthetic */ c[] a() {
        return new c[]{f36032a, f36033b};
    }

    @NotNull
    public static EnumEntries<c> b() {
        return f36035d;
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f36034c.clone();
    }
}
