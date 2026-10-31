package ni;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public static final n f78295a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ n[] f78296b;

    static {
        n nVar = new n("UNSPECIFIED", 0, 0);
        f78295a = nVar;
        n[] nVarArr = {nVar, new n("CHILD", 1, 1), new n("TEEN", 2, 2)};
        f78296b = nVarArr;
        EnumEntriesKt.a(nVarArr);
    }

    public n(String str, int i5, int i11) {
    }

    public static n[] values() {
        return (n[]) f78296b.clone();
    }
}
