package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ovb {
    public static final ovb Inherit;
    public static final ovb SecureOff;
    public static final ovb SecureOn;
    public static final /* synthetic */ ovb[] a;
    public static final /* synthetic */ i04 b;

    static {
        ovb ovbVar = new ovb("Inherit", 0);
        Inherit = ovbVar;
        ovb ovbVar2 = new ovb("SecureOn", 1);
        SecureOn = ovbVar2;
        ovb ovbVar3 = new ovb("SecureOff", 2);
        SecureOff = ovbVar3;
        ovb[] ovbVarArr = {ovbVar, ovbVar2, ovbVar3};
        a = ovbVarArr;
        b = new i04(ovbVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ovb valueOf(String str) {
        return (ovb) Enum.valueOf(ovb.class, str);
    }

    public static ovb[] values() {
        return (ovb[]) a.clone();
    }
}
