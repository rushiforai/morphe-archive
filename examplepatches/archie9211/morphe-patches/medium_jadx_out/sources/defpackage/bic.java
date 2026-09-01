package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bic {
    public static final bic ActionPerformed;
    public static final bic Dismissed;
    public static final /* synthetic */ bic[] a;
    public static final /* synthetic */ i04 b;

    static {
        bic bicVar = new bic("Dismissed", 0);
        Dismissed = bicVar;
        bic bicVar2 = new bic("ActionPerformed", 1);
        ActionPerformed = bicVar2;
        bic[] bicVarArr = {bicVar, bicVar2};
        a = bicVarArr;
        b = new i04(bicVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static bic valueOf(String str) {
        return (bic) Enum.valueOf(bic.class, str);
    }

    public static bic[] values() {
        return (bic[]) a.clone();
    }
}
