package com.moloco.sdk.internal.services.bidtoken;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.moloco.sdk.internal.services.bidtoken.b, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class EnumC2954b {

    /* renamed from: b, reason: collision with root package name */
    public static final EnumC2954b f37667b = new EnumC2954b("UNKNOWN", 0, -100);

    /* renamed from: c, reason: collision with root package name */
    public static final EnumC2954b f37668c = new EnumC2954b("HTTP_REQUEST_TIMEOUT", 1, -101);

    /* renamed from: d, reason: collision with root package name */
    public static final EnumC2954b f37669d = new EnumC2954b("UNKNOWN_HOST", 2, -102);

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ EnumC2954b[] f37670e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f37671f;

    /* renamed from: a, reason: collision with root package name */
    public final int f37672a;

    static {
        EnumC2954b[] enumC2954bArrA = a();
        f37670e = enumC2954bArrA;
        f37671f = EnumEntriesKt.a(enumC2954bArrA);
    }

    public EnumC2954b(String str, int i5, int i11) {
        this.f37672a = i11;
    }

    public static final /* synthetic */ EnumC2954b[] a() {
        return new EnumC2954b[]{f37667b, f37668c, f37669d};
    }

    @NotNull
    public static EnumEntries<EnumC2954b> b() {
        return f37671f;
    }

    public static EnumC2954b valueOf(String str) {
        return (EnumC2954b) Enum.valueOf(EnumC2954b.class, str);
    }

    public static EnumC2954b[] values() {
        return (EnumC2954b[]) f37670e.clone();
    }

    public final int c() {
        return this.f37672a;
    }
}
