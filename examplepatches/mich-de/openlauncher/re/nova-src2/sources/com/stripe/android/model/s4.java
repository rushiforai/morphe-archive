package com.stripe.android.model;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class s4 {

    /* renamed from: b, reason: collision with root package name */
    public static final r4 f44054b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ s4[] f44055c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i70.a f44056d;

    /* renamed from: a, reason: collision with root package name */
    public final String f44057a;

    static {
        s4[] s4VarArr = {new s4("ApiConnectionError", 0, "api_connection_error"), new s4("ApiError", 1, "api_error"), new s4("AuthenticationError", 2, "authentication_error"), new s4("CardError", 3, "card_error"), new s4("IdempotencyError", 4, "idempotency_error"), new s4("InvalidRequestError", 5, "invalid_request_error"), new s4("RateLimitError", 6, "rate_limit_error")};
        f44055c = s4VarArr;
        f44056d = EnumEntriesKt.a(s4VarArr);
        f44054b = new r4();
    }

    public s4(String str, int i5, String str2) {
        this.f44057a = str2;
    }

    public static s4 valueOf(String str) {
        return (s4) Enum.valueOf(s4.class, str);
    }

    public static s4[] values() {
        return (s4[]) f44055c.clone();
    }
}
