package ads_mobile_sdk;

import java.util.LinkedHashMap;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class q9 {

    /* renamed from: b, reason: collision with root package name */
    public static final b.i8 f8522b;

    /* renamed from: c, reason: collision with root package name */
    public static final LinkedHashMap f8523c;

    /* renamed from: d, reason: collision with root package name */
    public static final q9 f8524d;

    /* renamed from: e, reason: collision with root package name */
    public static final q9 f8525e;

    /* renamed from: f, reason: collision with root package name */
    public static final q9 f8526f;

    /* renamed from: g, reason: collision with root package name */
    public static final q9 f8527g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ q9[] f8528h;

    /* renamed from: a, reason: collision with root package name */
    public final int f8529a;

    static {
        q9 q9Var = new q9("UNKNOWN", 0, 0);
        f8524d = q9Var;
        q9 q9Var2 = new q9("CPM", 1, 1);
        f8525e = q9Var2;
        q9 q9Var3 = new q9("CPC", 2, 2);
        f8526f = q9Var3;
        q9 q9Var4 = new q9("ONE_PIXEL", 3, 3);
        f8527g = q9Var4;
        q9[] q9VarArr = {q9Var, q9Var2, q9Var3, q9Var4};
        f8528h = q9VarArr;
        EnumEntriesKt.a(q9VarArr);
        f8522b = new b.i8(0);
        q9[] q9VarArrValues = values();
        int iD0 = b70.k.d0(q9VarArrValues.length);
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0 < 16 ? 16 : iD0);
        for (q9 q9Var5 : q9VarArrValues) {
            linkedHashMap.put(Integer.valueOf(q9Var5.f8529a), q9Var5);
        }
        f8523c = linkedHashMap;
    }

    public q9(String str, int i5, int i11) {
        this.f8529a = i11;
    }

    public static q9[] values() {
        return (q9[]) f8528h.clone();
    }
}
