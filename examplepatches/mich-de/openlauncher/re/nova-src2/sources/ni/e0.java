package ni;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class e0 {

    /* renamed from: a, reason: collision with root package name */
    public static final e0 f78267a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ e0[] f78268b;

    static {
        e0 e0Var = new e0("TAG_FOR_UNDER_AGE_OF_CONSENT_UNSPECIFIED", 0, -1);
        f78267a = e0Var;
        e0[] e0VarArr = {e0Var, new e0("TAG_FOR_UNDER_AGE_OF_CONSENT_FALSE", 1, 0), new e0("TAG_FOR_UNDER_AGE_OF_CONSENT_TRUE", 2, 1)};
        f78268b = e0VarArr;
        EnumEntriesKt.a(e0VarArr);
    }

    public e0(String str, int i5, int i11) {
    }

    public static e0[] values() {
        return (e0[]) f78268b.clone();
    }
}
