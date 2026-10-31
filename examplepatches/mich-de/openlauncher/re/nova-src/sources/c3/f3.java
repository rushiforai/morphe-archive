package c3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class f3 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ f3[] f19279a;

    static {
        f3[] f3VarArr = {new f3("Shown", 0), new f3("Hidden", 1)};
        f19279a = f3VarArr;
        EnumEntriesKt.a(f3VarArr);
    }

    public static f3 valueOf(String str) {
        return (f3) Enum.valueOf(f3.class, str);
    }

    public static f3[] values() {
        return (f3[]) f19279a.clone();
    }
}
