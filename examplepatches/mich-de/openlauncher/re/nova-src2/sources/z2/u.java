package z2;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public static final u f98149a;

    /* renamed from: b, reason: collision with root package name */
    public static final u f98150b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ u[] f98151c;

    static {
        u uVar = new u("Min", 0);
        f98149a = uVar;
        u uVar2 = new u("Max", 1);
        f98150b = uVar2;
        u[] uVarArr = {uVar, uVar2};
        f98151c = uVarArr;
        EnumEntriesKt.a(uVarArr);
    }

    public static u valueOf(String str) {
        return (u) Enum.valueOf(u.class, str);
    }

    public static u[] values() {
        return (u[]) f98151c.clone();
    }
}
