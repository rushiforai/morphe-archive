package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class chc {
    public static final chc Indefinite;
    public static final chc Long;
    public static final chc Short;
    public static final /* synthetic */ chc[] a;
    public static final /* synthetic */ i04 b;

    static {
        chc chcVar = new chc("Short", 0);
        Short = chcVar;
        chc chcVar2 = new chc("Long", 1);
        Long = chcVar2;
        chc chcVar3 = new chc("Indefinite", 2);
        Indefinite = chcVar3;
        chc[] chcVarArr = {chcVar, chcVar2, chcVar3};
        a = chcVarArr;
        b = new i04(chcVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static chc valueOf(String str) {
        return (chc) Enum.valueOf(chc.class, str);
    }

    public static chc[] values() {
        return (chc[]) a.clone();
    }
}
