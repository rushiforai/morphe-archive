package ni;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class u {

    /* renamed from: b, reason: collision with root package name */
    public static final u f78326b;

    /* renamed from: c, reason: collision with root package name */
    public static final u f78327c;

    /* renamed from: d, reason: collision with root package name */
    public static final u f78328d;

    /* renamed from: e, reason: collision with root package name */
    public static final u f78329e;

    /* renamed from: f, reason: collision with root package name */
    public static final u f78330f;

    /* renamed from: g, reason: collision with root package name */
    public static final u f78331g;

    /* renamed from: h, reason: collision with root package name */
    public static final u f78332h;

    /* renamed from: i, reason: collision with root package name */
    public static final u f78333i;

    /* renamed from: j, reason: collision with root package name */
    public static final u f78334j;

    /* renamed from: k, reason: collision with root package name */
    public static final u f78335k;

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ u[] f78336l;

    /* renamed from: a, reason: collision with root package name */
    public final int f78337a;

    static {
        u uVar = new u("INTERNAL_ERROR", 0, 0);
        f78326b = uVar;
        u uVar2 = new u("INVALID_REQUEST", 1, 1);
        f78327c = uVar2;
        u uVar3 = new u("NETWORK_ERROR", 2, 2);
        f78328d = uVar3;
        u uVar4 = new u("NO_FILL", 3, 3);
        f78329e = uVar4;
        u uVar5 = new u("TIMEOUT", 4, 4);
        f78330f = uVar5;
        u uVar6 = new u("CANCELLED", 5, 5);
        f78331g = uVar6;
        u uVar7 = new u("NOT_FOUND", 6, 7);
        u uVar8 = new u("APP_ID_MISSING", 7, 8);
        f78332h = uVar8;
        u uVar9 = new u("REQUEST_ID_MISMATCH", 8, 10);
        f78333i = uVar9;
        u uVar10 = new u("INVALID_AD_RESPONSE", 9, 11);
        f78334j = uVar10;
        u uVar11 = new u("AD_RESPONSE_ALREADY_USED", 10, 12);
        f78335k = uVar11;
        u[] uVarArr = {uVar, uVar2, uVar3, uVar4, uVar5, uVar6, uVar7, uVar8, uVar9, uVar10, uVar11};
        f78336l = uVarArr;
        EnumEntriesKt.a(uVarArr);
    }

    public u(String str, int i5, int i11) {
        this.f78337a = i11;
    }

    public static u[] values() {
        return (u[]) f78336l.clone();
    }
}
