package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class x0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ x0[] f81003a;

    static {
        x0[] x0VarArr = {new x0("Automatic", 0), new x0("Always", 1), new x0("Never", 2)};
        f81003a = x0VarArr;
        EnumEntriesKt.a(x0VarArr);
    }

    public static x0 valueOf(String str) {
        return (x0) Enum.valueOf(x0.class, str);
    }

    public static x0[] values() {
        return (x0[]) f81003a.clone();
    }
}
