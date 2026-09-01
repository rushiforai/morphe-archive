package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nnd {
    public static final nnd Indeterminate;
    public static final nnd Off;
    public static final nnd On;
    public static final /* synthetic */ nnd[] a;
    public static final /* synthetic */ i04 b;

    static {
        nnd nndVar = new nnd("On", 0);
        On = nndVar;
        nnd nndVar2 = new nnd("Off", 1);
        Off = nndVar2;
        nnd nndVar3 = new nnd("Indeterminate", 2);
        Indeterminate = nndVar3;
        nnd[] nndVarArr = {nndVar, nndVar2, nndVar3};
        a = nndVarArr;
        b = new i04(nndVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static nnd valueOf(String str) {
        return (nnd) Enum.valueOf(nnd.class, str);
    }

    public static nnd[] values() {
        return (nnd[]) a.clone();
    }
}
