package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rre {
    public static final rre Impulse;
    public static final rre Lsq2;
    public static final /* synthetic */ rre[] a;
    public static final /* synthetic */ i04 b;

    static {
        rre rreVar = new rre("Lsq2", 0);
        Lsq2 = rreVar;
        rre rreVar2 = new rre("Impulse", 1);
        Impulse = rreVar2;
        rre[] rreVarArr = {rreVar, rreVar2};
        a = rreVarArr;
        b = new i04(rreVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static rre valueOf(String str) {
        return (rre) Enum.valueOf(rre.class, str);
    }

    public static rre[] values() {
        return (rre[]) a.clone();
    }
}
