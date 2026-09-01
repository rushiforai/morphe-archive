package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class stc {
    public static final stc L;
    public static final stc M;
    public static final stc S;
    public static final /* synthetic */ stc[] a;
    public static final /* synthetic */ i04 b;

    static {
        stc stcVar = new stc("S", 0);
        S = stcVar;
        stc stcVar2 = new stc("M", 1);
        M = stcVar2;
        stc stcVar3 = new stc("L", 2);
        L = stcVar3;
        stc[] stcVarArr = {stcVar, stcVar2, stcVar3};
        a = stcVarArr;
        b = new i04(stcVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static stc valueOf(String str) {
        return (stc) Enum.valueOf(stc.class, str);
    }

    public static stc[] values() {
        return (stc[]) a.clone();
    }
}
