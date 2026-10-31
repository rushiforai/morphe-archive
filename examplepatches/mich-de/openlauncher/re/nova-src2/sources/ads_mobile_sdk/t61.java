package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class t61 {

    /* renamed from: a, reason: collision with root package name */
    public static final t61 f9791a;

    /* renamed from: b, reason: collision with root package name */
    public static final t61 f9792b;

    /* renamed from: c, reason: collision with root package name */
    public static final t61 f9793c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ t61[] f9794d;

    static {
        t61 t61Var = new t61("AD_REQUESTED", 0);
        f9791a = t61Var;
        t61 t61Var2 = new t61("AD_LOADED", 1);
        f9792b = t61Var2;
        t61 t61Var3 = new t61("AD_LOAD_FAILED", 2);
        f9793c = t61Var3;
        t61[] t61VarArr = {t61Var, t61Var2, t61Var3};
        f9794d = t61VarArr;
        EnumEntriesKt.a(t61VarArr);
    }

    public static t61[] values() {
        return (t61[]) f9794d.clone();
    }
}
