package v2;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public static final n f91980a;

    /* renamed from: b, reason: collision with root package name */
    public static final n f91981b;

    /* renamed from: c, reason: collision with root package name */
    public static final n f91982c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ n[] f91983d;

    static {
        n nVar = new n("Initial", 0);
        f91980a = nVar;
        n nVar2 = new n("Main", 1);
        f91981b = nVar2;
        n nVar3 = new n("Final", 2);
        f91982c = nVar3;
        n[] nVarArr = {nVar, nVar2, nVar3};
        f91983d = nVarArr;
        EnumEntriesKt.a(nVarArr);
    }

    public static n valueOf(String str) {
        return (n) Enum.valueOf(n.class, str);
    }

    public static n[] values() {
        return (n[]) f91983d.clone();
    }
}
