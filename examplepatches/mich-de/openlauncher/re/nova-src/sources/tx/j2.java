package tx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class j2 {

    /* renamed from: a, reason: collision with root package name */
    public static final j2 f89825a;

    /* renamed from: b, reason: collision with root package name */
    public static final j2 f89826b;

    /* renamed from: c, reason: collision with root package name */
    public static final j2 f89827c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ j2[] f89828d;

    static {
        j2 j2Var = new j2("SIGNED_IN", 0);
        f89825a = j2Var;
        j2 j2Var2 = new j2("ASK_USER", 1);
        f89826b = j2Var2;
        j2 j2Var3 = new j2("RETRY_LATER", 2);
        f89827c = j2Var3;
        j2[] j2VarArr = {j2Var, j2Var2, j2Var3};
        f89828d = j2VarArr;
        EnumEntriesKt.a(j2VarArr);
    }

    public static j2 valueOf(String str) {
        return (j2) Enum.valueOf(j2.class, str);
    }

    public static j2[] values() {
        return (j2[]) f89828d.clone();
    }
}
