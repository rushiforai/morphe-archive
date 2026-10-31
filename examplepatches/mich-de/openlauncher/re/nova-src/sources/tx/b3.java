package tx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b3 {

    /* renamed from: a, reason: collision with root package name */
    public static final b3 f89664a;

    /* renamed from: b, reason: collision with root package name */
    public static final b3 f89665b;

    /* renamed from: c, reason: collision with root package name */
    public static final b3 f89666c;

    /* renamed from: d, reason: collision with root package name */
    public static final b3 f89667d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ b3[] f89668e;

    static {
        b3 b3Var = new b3("SIGN_IN", 0);
        f89664a = b3Var;
        b3 b3Var2 = new b3("PROVISIONING", 1);
        b3 b3Var3 = new b3("CONSENT", 2);
        f89665b = b3Var3;
        b3 b3Var4 = new b3("SHOWCASE", 3);
        f89666c = b3Var4;
        b3 b3Var5 = new b3("SUCCESS", 4);
        f89667d = b3Var5;
        b3[] b3VarArr = {b3Var, b3Var2, b3Var3, b3Var4, b3Var5};
        f89668e = b3VarArr;
        EnumEntriesKt.a(b3VarArr);
    }

    public static b3 valueOf(String str) {
        return (b3) Enum.valueOf(b3.class, str);
    }

    public static b3[] values() {
        return (b3[]) f89668e.clone();
    }
}
