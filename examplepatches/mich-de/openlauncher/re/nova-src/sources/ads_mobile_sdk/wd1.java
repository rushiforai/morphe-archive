package ads_mobile_sdk;

import kotlin.NoWhenBranchMatchedException;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class wd1 {

    /* renamed from: a, reason: collision with root package name */
    public static final wd1 f11213a;

    /* renamed from: b, reason: collision with root package name */
    public static final wd1 f11214b;

    /* renamed from: c, reason: collision with root package name */
    public static final wd1 f11215c;

    /* renamed from: d, reason: collision with root package name */
    public static final wd1 f11216d;

    /* renamed from: e, reason: collision with root package name */
    public static final wd1 f11217e;

    /* renamed from: f, reason: collision with root package name */
    public static final wd1 f11218f;

    /* renamed from: g, reason: collision with root package name */
    public static final wd1 f11219g;

    /* renamed from: h, reason: collision with root package name */
    public static final wd1 f11220h;

    /* renamed from: i, reason: collision with root package name */
    public static final wd1 f11221i;

    /* renamed from: j, reason: collision with root package name */
    public static final wd1 f11222j;

    /* renamed from: k, reason: collision with root package name */
    public static final wd1 f11223k;

    /* renamed from: l, reason: collision with root package name */
    public static final wd1 f11224l;

    /* renamed from: m, reason: collision with root package name */
    public static final wd1 f11225m;
    public static final wd1 n;
    public static final /* synthetic */ wd1[] o;

    static {
        wd1 wd1Var = new wd1("INTERNAL_ERROR", 0);
        f11213a = wd1Var;
        wd1 wd1Var2 = new wd1("INVALID_REQUEST", 1);
        f11214b = wd1Var2;
        wd1 wd1Var3 = new wd1("NO_FILL", 2);
        f11215c = wd1Var3;
        wd1 wd1Var4 = new wd1("APP_ID_MISSING", 3);
        f11216d = wd1Var4;
        wd1 wd1Var5 = new wd1("NETWORK_ERROR", 4);
        f11217e = wd1Var5;
        wd1 wd1Var6 = new wd1("INVALID_AD_UNIT_ID", 5);
        wd1 wd1Var7 = new wd1("INVALID_AD_SIZE", 6);
        wd1 wd1Var8 = new wd1("MEDIATION_SHOW_ERROR", 7);
        wd1 wd1Var9 = new wd1("NOT_READY", 8);
        wd1 wd1Var10 = new wd1("AD_RESPONSE_ALREADY_USED", 9);
        f11218f = wd1Var10;
        wd1 wd1Var11 = new wd1("APP_NOT_FOREGROUND", 10);
        wd1 wd1Var12 = new wd1("INTERNAL_SHOW_ERROR", 11);
        wd1 wd1Var13 = new wd1("MEDIATION_NO_FILL", 12);
        f11219g = wd1Var13;
        wd1 wd1Var14 = new wd1("INVALID_AD_RESPONSE", 13);
        f11220h = wd1Var14;
        wd1 wd1Var15 = new wd1("REQUEST_ID_MISMATCH", 14);
        f11221i = wd1Var15;
        wd1 wd1Var16 = new wd1("TIMEOUT", 15);
        f11222j = wd1Var16;
        wd1 wd1Var17 = new wd1("CANCELLED", 16);
        f11223k = wd1Var17;
        wd1 wd1Var18 = new wd1("WEB_VIEW_DESTROYED_ERROR", 17);
        f11224l = wd1Var18;
        wd1 wd1Var19 = new wd1("ADAPTER_INITIALIZATION_ERROR", 18);
        f11225m = wd1Var19;
        wd1 wd1Var20 = new wd1("INVALID_DATA_URL", 19);
        n = wd1Var20;
        wd1[] wd1VarArr = {wd1Var, wd1Var2, wd1Var3, wd1Var4, wd1Var5, wd1Var6, wd1Var7, wd1Var8, wd1Var9, wd1Var10, wd1Var11, wd1Var12, wd1Var13, wd1Var14, wd1Var15, wd1Var16, wd1Var17, wd1Var18, wd1Var19, wd1Var20};
        o = wd1VarArr;
        EnumEntriesKt.a(wd1VarArr);
    }

    public static wd1[] values() {
        return (wd1[]) o.clone();
    }

    public final ni.u a() {
        switch (ordinal()) {
            case 0:
                return ni.u.f78326b;
            case 1:
                return ni.u.f78327c;
            case 2:
                return ni.u.f78329e;
            case 3:
                return ni.u.f78332h;
            case 4:
                return ni.u.f78328d;
            case 5:
                return ni.u.f78327c;
            case 6:
                return ni.u.f78327c;
            case 7:
                return ni.u.f78326b;
            case 8:
                return ni.u.f78326b;
            case 9:
                return ni.u.f78335k;
            case 10:
                return ni.u.f78326b;
            case 11:
                return ni.u.f78326b;
            case 12:
                return ni.u.f78329e;
            case 13:
                return ni.u.f78334j;
            case 14:
                return ni.u.f78333i;
            case 15:
                return ni.u.f78330f;
            case 16:
                return ni.u.f78331g;
            case 17:
                return ni.u.f78326b;
            case 18:
                return ni.u.f78326b;
            case 19:
                return ni.u.f78326b;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }
}
