package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mcb {
    public static final mcb Ltr;
    public static final mcb Rtl;
    public static final /* synthetic */ mcb[] a;
    public static final /* synthetic */ i04 b;

    static {
        mcb mcbVar = new mcb("Ltr", 0);
        Ltr = mcbVar;
        mcb mcbVar2 = new mcb("Rtl", 1);
        Rtl = mcbVar2;
        mcb[] mcbVarArr = {mcbVar, mcbVar2};
        a = mcbVarArr;
        b = new i04(mcbVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static mcb valueOf(String str) {
        return (mcb) Enum.valueOf(mcb.class, str);
    }

    public static mcb[] values() {
        return (mcb[]) a.clone();
    }
}
