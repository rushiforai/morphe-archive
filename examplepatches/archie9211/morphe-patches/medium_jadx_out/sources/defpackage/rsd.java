package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rsd {
    public static final rsd CancelTraversal;
    public static final rsd ContinueTraversal;
    public static final rsd SkipSubtreeAndContinueTraversal;
    public static final /* synthetic */ rsd[] a;
    public static final /* synthetic */ i04 b;

    static {
        rsd rsdVar = new rsd("ContinueTraversal", 0);
        ContinueTraversal = rsdVar;
        rsd rsdVar2 = new rsd("SkipSubtreeAndContinueTraversal", 1);
        SkipSubtreeAndContinueTraversal = rsdVar2;
        rsd rsdVar3 = new rsd("CancelTraversal", 2);
        CancelTraversal = rsdVar3;
        rsd[] rsdVarArr = {rsdVar, rsdVar2, rsdVar3};
        a = rsdVarArr;
        b = new i04(rsdVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static rsd valueOf(String str) {
        return (rsd) Enum.valueOf(rsd.class, str);
    }

    public static rsd[] values() {
        return (rsd[]) a.clone();
    }
}
