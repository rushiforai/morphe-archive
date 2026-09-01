package defpackage;

import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class t34 implements gm8 {
    public static final t34 EVENT_TYPE_UNKNOWN;
    public static final t34 SESSION_START;
    public static final /* synthetic */ t34[] b;
    public static final /* synthetic */ i04 c;
    public final int a;

    public t34(String str, int i, int i2) {
        this.a = i2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static t34 valueOf(String str) {
        return (t34) Enum.valueOf(t34.class, str);
    }

    public static t34[] values() {
        return (t34[]) b.clone();
    }

    @Override // defpackage.gm8
    public int getNumber() {
        return this.a;
    }

    static {
        t34 t34Var = new t34(dpBiLjNeNsiASg.QiyBcmydHOthw, 0, 0);
        EVENT_TYPE_UNKNOWN = t34Var;
        t34 t34Var2 = new t34("SESSION_START", 1, 1);
        SESSION_START = t34Var2;
        t34[] t34VarArr = {t34Var, t34Var2};
        b = t34VarArr;
        c = new i04(t34VarArr);
    }
}
