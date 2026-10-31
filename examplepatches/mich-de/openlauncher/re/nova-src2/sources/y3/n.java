package y3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public static final n f96612a;

    /* renamed from: b, reason: collision with root package name */
    public static final n f96613b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ n[] f96614c;

    static {
        n nVar = new n("Ltr", 0);
        f96612a = nVar;
        n nVar2 = new n("Rtl", 1);
        f96613b = nVar2;
        n[] nVarArr = {nVar, nVar2};
        f96614c = nVarArr;
        EnumEntriesKt.a(nVarArr);
    }

    public static n valueOf(String str) {
        return (n) Enum.valueOf(n.class, str);
    }

    public static n[] values() {
        return (n[]) f96614c.clone();
    }
}
