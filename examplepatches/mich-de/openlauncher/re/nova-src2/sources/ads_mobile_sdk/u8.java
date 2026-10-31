package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class u8 {

    /* renamed from: a, reason: collision with root package name */
    public static final lm.e f10239a;

    /* renamed from: b, reason: collision with root package name */
    public static final u8 f10240b;

    /* renamed from: c, reason: collision with root package name */
    public static final u8 f10241c;

    /* renamed from: d, reason: collision with root package name */
    public static final u8 f10242d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ u8[] f10243e;

    static {
        u8 u8Var = new u8("UNKNOWN", 0);
        f10240b = u8Var;
        u8 u8Var2 = new u8("BANNER", 1);
        u8 u8Var3 = new u8("INTERSTITIAL", 2);
        u8 u8Var4 = new u8("NATIVE", 3);
        f10241c = u8Var4;
        u8 u8Var5 = new u8("REWARDED", 4);
        u8 u8Var6 = new u8("APP_OPEN", 5);
        f10242d = u8Var6;
        u8[] u8VarArr = {u8Var, u8Var2, u8Var3, u8Var4, u8Var5, u8Var6, new u8("REWARDED_INTERSTITIAL", 6), new u8("SWIPEABLE_INTERSTITIAL", 7)};
        f10243e = u8VarArr;
        EnumEntriesKt.a(u8VarArr);
        f10239a = new lm.e(10);
    }

    public static u8[] values() {
        return (u8[]) f10243e.clone();
    }
}
