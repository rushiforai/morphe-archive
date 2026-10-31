package ni;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public static final d0 f78259a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ d0[] f78260b;

    static {
        d0 d0Var = new d0("TAG_FOR_CHILD_DIRECTED_TREATMENT_UNSPECIFIED", 0, -1);
        f78259a = d0Var;
        d0[] d0VarArr = {d0Var, new d0("TAG_FOR_CHILD_DIRECTED_TREATMENT_FALSE", 1, 0), new d0("TAG_FOR_CHILD_DIRECTED_TREATMENT_TRUE", 2, 1)};
        f78260b = d0VarArr;
        EnumEntriesKt.a(d0VarArr);
    }

    public d0(String str, int i5, int i11) {
    }

    public static d0[] values() {
        return (d0[]) f78260b.clone();
    }
}
