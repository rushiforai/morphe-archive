package yw;

import java.io.Serializable;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c implements Serializable {

    /* renamed from: c, reason: collision with root package name */
    public static final vp.a f97662c;

    /* renamed from: d, reason: collision with root package name */
    public static final c f97663d;

    /* renamed from: e, reason: collision with root package name */
    public static final c f97664e;

    /* renamed from: f, reason: collision with root package name */
    public static final c f97665f;

    /* renamed from: g, reason: collision with root package name */
    public static final c f97666g;

    /* renamed from: h, reason: collision with root package name */
    public static final c f97667h;

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ c[] f97668i;

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ i70.a f97669j;

    /* renamed from: a, reason: collision with root package name */
    public final int f97670a;

    /* renamed from: b, reason: collision with root package name */
    public final String f97671b;

    static {
        c cVar = new c("NETWORK_ERROR", 0, 7, "No internet connection");
        c cVar2 = new c("INVALID_DATA", 1, 8, "Invalid data is not accepted by endpoints");
        c cVar3 = new c("CHALLENGE_ERROR", 2, 9, "Challenge encountered error on setup");
        c cVar4 = new c("INTERNAL_ERROR", 3, 10, "hCaptcha client encountered an internal error");
        c cVar5 = new c("SESSION_TIMEOUT", 4, 15, "Session Timeout");
        f97663d = cVar5;
        c cVar6 = new c("TOKEN_TIMEOUT", 5, 16, "Token Timeout");
        f97664e = cVar6;
        c cVar7 = new c("CHALLENGE_CLOSED", 6, 30, "Challenge Closed");
        f97665f = cVar7;
        c cVar8 = new c("RATE_LIMITED", 7, 31, "Rate Limited");
        c cVar9 = new c("INVALID_CUSTOM_THEME", 8, 32, "Invalid custom theme");
        c cVar10 = new c("INSECURE_HTTP_REQUEST_ERROR", 9, 33, "Insecure resource requested");
        f97666g = cVar10;
        c cVar11 = new c("ERROR", 10, 29, "Unknown error");
        f97667h = cVar11;
        c[] cVarArr = {cVar, cVar2, cVar3, cVar4, cVar5, cVar6, cVar7, cVar8, cVar9, cVar10, cVar11};
        f97668i = cVarArr;
        f97669j = EnumEntriesKt.a(cVarArr);
        f97662c = new vp.a();
    }

    public c(String str, int i5, int i11, String str2) {
        this.f97670a = i11;
        this.f97671b = str2;
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f97668i.clone();
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f97671b;
    }
}
