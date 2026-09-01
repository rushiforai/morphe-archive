package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ynd {
    public static final ynd Attached;
    public static final ynd Detached;
    public static final ynd Uninitialized;
    public static final /* synthetic */ ynd[] a;
    public static final /* synthetic */ i04 b;

    static {
        ynd yndVar = new ynd("Uninitialized", 0);
        Uninitialized = yndVar;
        ynd yndVar2 = new ynd("Detached", 1);
        Detached = yndVar2;
        ynd yndVar3 = new ynd("Attached", 2);
        Attached = yndVar3;
        ynd[] yndVarArr = {yndVar, yndVar2, yndVar3};
        a = yndVarArr;
        b = new i04(yndVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ynd valueOf(String str) {
        return (ynd) Enum.valueOf(ynd.class, str);
    }

    public static ynd[] values() {
        return (ynd[]) a.clone();
    }
}
