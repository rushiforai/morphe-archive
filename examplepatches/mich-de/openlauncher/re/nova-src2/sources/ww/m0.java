package ww;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class m0 {

    /* renamed from: a, reason: collision with root package name */
    public static final m0 f94813a;

    /* renamed from: b, reason: collision with root package name */
    public static final m0 f94814b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ m0[] f94815c;

    static {
        m0 m0Var = new m0("Global", 0);
        f94813a = m0Var;
        m0 m0Var2 = new m0("US", 1);
        f94814b = m0Var2;
        m0[] m0VarArr = {m0Var, m0Var2};
        f94815c = m0VarArr;
        EnumEntriesKt.a(m0VarArr);
    }

    public static m0 valueOf(String str) {
        return (m0) Enum.valueOf(m0.class, str);
    }

    public static m0[] values() {
        return (m0[]) f94815c.clone();
    }
}
