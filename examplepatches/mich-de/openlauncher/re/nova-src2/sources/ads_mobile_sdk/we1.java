package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class we1 {

    /* renamed from: a, reason: collision with root package name */
    public static final we1 f11239a;

    /* renamed from: b, reason: collision with root package name */
    public static final we1 f11240b;

    /* renamed from: c, reason: collision with root package name */
    public static final we1 f11241c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ we1[] f11242d;

    static {
        we1 we1Var = new we1("INITIALIZATION_NOT_STARTED", 0);
        f11239a = we1Var;
        we1 we1Var2 = new we1("INITIALIZATION_STARTED", 1);
        f11240b = we1Var2;
        we1 we1Var3 = new we1("INITIALIZATION_COMPLETE", 2);
        f11241c = we1Var3;
        we1[] we1VarArr = {we1Var, we1Var2, we1Var3};
        f11242d = we1VarArr;
        EnumEntriesKt.a(we1VarArr);
    }

    public static we1[] values() {
        return (we1[]) f11242d.clone();
    }
}
