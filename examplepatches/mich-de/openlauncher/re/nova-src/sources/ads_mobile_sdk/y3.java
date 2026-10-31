package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class y3 {

    /* renamed from: a, reason: collision with root package name */
    public static final y3 f11934a;

    /* renamed from: b, reason: collision with root package name */
    public static final y3 f11935b;

    /* renamed from: c, reason: collision with root package name */
    public static final y3 f11936c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ y3[] f11937d;

    static {
        y3 y3Var = new y3("IDLE", 0);
        f11934a = y3Var;
        y3 y3Var2 = new y3("ALLOWED", 1);
        f11935b = y3Var2;
        y3 y3Var3 = new y3("ACTIVE", 2);
        f11936c = y3Var3;
        y3[] y3VarArr = {y3Var, y3Var2, y3Var3};
        f11937d = y3VarArr;
        EnumEntriesKt.a(y3VarArr);
    }

    public static y3[] values() {
        return (y3[]) f11937d.clone();
    }
}
