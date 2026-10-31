package com.stripe.android.model;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class f2 {

    /* renamed from: b, reason: collision with root package name */
    public static final e2 f44032b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ f2[] f44033c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i70.a f44034d;

    /* renamed from: a, reason: collision with root package name */
    public final String f44035a;

    static {
        f2[] f2VarArr = {new f2("ApiConnectionError", 0, "api_connection_error"), new f2("ApiError", 1, "api_error"), new f2("AuthenticationError", 2, "authentication_error"), new f2("CardError", 3, "card_error"), new f2("IdempotencyError", 4, "idempotency_error"), new f2("InvalidRequestError", 5, "invalid_request_error"), new f2("RateLimitError", 6, "rate_limit_error")};
        f44033c = f2VarArr;
        f44034d = EnumEntriesKt.a(f2VarArr);
        f44032b = new e2();
    }

    public f2(String str, int i5, String str2) {
        this.f44035a = str2;
    }

    public static f2 valueOf(String str) {
        return (f2) Enum.valueOf(f2.class, str);
    }

    public static f2[] values() {
        return (f2[]) f44033c.clone();
    }
}
