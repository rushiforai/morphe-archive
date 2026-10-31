package f1;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class b5 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ b5[] f53404a;

    static {
        b5[] b5VarArr = {new b5("Filled", 0), new b5("Outlined", 1)};
        f53404a = b5VarArr;
        EnumEntriesKt.a(b5VarArr);
    }

    public static b5 valueOf(String str) {
        return (b5) Enum.valueOf(b5.class, str);
    }

    public static b5[] values() {
        return (b5[]) f53404a.clone();
    }
}
