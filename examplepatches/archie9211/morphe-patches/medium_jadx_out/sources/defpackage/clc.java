package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class clc {
    public static final clc ADDING;
    public static final clc NONE;
    public static final clc REMOVING;
    public static final /* synthetic */ clc[] a;

    static {
        clc clcVar = new clc("NONE", 0);
        NONE = clcVar;
        clc clcVar2 = new clc("ADDING", 1);
        ADDING = clcVar2;
        clc clcVar3 = new clc("REMOVING", 2);
        REMOVING = clcVar3;
        a = new clc[]{clcVar, clcVar2, clcVar3};
    }

    public static clc valueOf(String str) {
        return (clc) Enum.valueOf(clc.class, str);
    }

    public static clc[] values() {
        return (clc[]) a.clone();
    }
}
