package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gxb {
    public static final gxb Left;
    public static final gxb Middle;
    public static final gxb Right;
    public static final /* synthetic */ gxb[] a;
    public static final /* synthetic */ i04 b;

    static {
        gxb gxbVar = new gxb("Left", 0);
        Left = gxbVar;
        gxb gxbVar2 = new gxb("Middle", 1);
        Middle = gxbVar2;
        gxb gxbVar3 = new gxb("Right", 2);
        Right = gxbVar3;
        gxb[] gxbVarArr = {gxbVar, gxbVar2, gxbVar3};
        a = gxbVarArr;
        b = new i04(gxbVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static gxb valueOf(String str) {
        return (gxb) Enum.valueOf(gxb.class, str);
    }

    public static gxb[] values() {
        return (gxb[]) a.clone();
    }
}
