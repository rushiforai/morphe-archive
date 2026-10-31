package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class v0 {

    /* renamed from: a, reason: collision with root package name */
    public static final v0 f56064a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ v0[] f56065b;

    static {
        v0 v0Var = new v0("Automatic", 0, "automatic");
        f56064a = v0Var;
        v0[] v0VarArr = {v0Var, new v0("Skip", 1, "skip"), new v0("Microdeposits", 2, "microdeposits"), new v0("Instant", 3, "instant"), new v0("InstantOrSkip", 4, "instant_or_skip")};
        f56065b = v0VarArr;
        EnumEntriesKt.a(v0VarArr);
    }

    public v0(String str, int i5, String str2) {
    }

    public static v0 valueOf(String str) {
        return (v0) Enum.valueOf(v0.class, str);
    }

    public static v0[] values() {
        return (v0[]) f56065b.clone();
    }
}
