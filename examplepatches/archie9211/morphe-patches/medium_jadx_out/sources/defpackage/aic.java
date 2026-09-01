package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aic {
    public static final aic ActionPerformed;
    public static final aic Dismissed;
    public static final /* synthetic */ aic[] a;
    public static final /* synthetic */ i04 b;

    static {
        aic aicVar = new aic("Dismissed", 0);
        Dismissed = aicVar;
        aic aicVar2 = new aic("ActionPerformed", 1);
        ActionPerformed = aicVar2;
        aic[] aicVarArr = {aicVar, aicVar2};
        a = aicVarArr;
        b = new i04(aicVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static aic valueOf(String str) {
        return (aic) Enum.valueOf(aic.class, str);
    }

    public static aic[] values() {
        return (aic[]) a.clone();
    }
}
