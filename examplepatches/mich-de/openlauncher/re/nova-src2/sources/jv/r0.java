package jv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class r0 {

    /* renamed from: a, reason: collision with root package name */
    public static final r0 f70139a;

    /* renamed from: b, reason: collision with root package name */
    public static final r0 f70140b;

    /* renamed from: c, reason: collision with root package name */
    public static final r0 f70141c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ r0[] f70142d;

    static {
        r0 r0Var = new r0("NONE", 0);
        f70139a = r0Var;
        r0 r0Var2 = new r0("MANAGE_ONE", 1);
        f70140b = r0Var2;
        r0 r0Var3 = new r0("MANAGE_ALL", 2);
        f70141c = r0Var3;
        r0[] r0VarArr = {r0Var, r0Var2, r0Var3};
        f70142d = r0VarArr;
        EnumEntriesKt.a(r0VarArr);
    }

    public static r0 valueOf(String str) {
        return (r0) Enum.valueOf(r0.class, str);
    }

    public static r0[] values() {
        return (r0[]) f70142d.clone();
    }
}
