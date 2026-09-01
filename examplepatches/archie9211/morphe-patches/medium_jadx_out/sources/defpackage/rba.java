package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rba {
    public static final qba Companion;
    public static final rba EARLIEST;
    public static final rba LATEST;
    public static final rba MOST_POPULAR;
    public static final /* synthetic */ rba[] a;
    public static final /* synthetic */ i04 b;

    static {
        rba rbaVar = new rba("LATEST", 0);
        LATEST = rbaVar;
        rba rbaVar2 = new rba("EARLIEST", 1);
        EARLIEST = rbaVar2;
        rba rbaVar3 = new rba("MOST_POPULAR", 2);
        MOST_POPULAR = rbaVar3;
        rba[] rbaVarArr = {rbaVar, rbaVar2, rbaVar3};
        a = rbaVarArr;
        b = new i04(rbaVarArr);
        Companion = new qba();
    }

    public static g04 getEntries() {
        return b;
    }

    public static rba valueOf(String str) {
        return (rba) Enum.valueOf(rba.class, str);
    }

    public static rba[] values() {
        return (rba[]) a.clone();
    }
}
