package k0;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class f1 {

    /* renamed from: a, reason: collision with root package name */
    public static final f1 f70603a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ f1[] f70604b;

    static {
        f1 f1Var = new f1("Horizontal", 0);
        f70603a = f1Var;
        f1[] f1VarArr = {f1Var, new f1("Vertical", 1)};
        f70604b = f1VarArr;
        EnumEntriesKt.a(f1VarArr);
    }

    public static f1 valueOf(String str) {
        return (f1) Enum.valueOf(f1.class, str);
    }

    public static f1[] values() {
        return (f1[]) f70604b.clone();
    }
}
