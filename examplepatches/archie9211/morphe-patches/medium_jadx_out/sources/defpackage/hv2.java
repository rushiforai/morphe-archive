package defpackage;

import com.drew.imaging.avi.hzjl.bPUi;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class hv2 {
    public static final hv2 ACKNOWLEDGE;
    public static final hv2 ATTEMPT;
    public static final hv2 BACKEND_GRANT;
    public static final hv2 CONFIRMED;
    public static final hv2 RESULT;
    public static final /* synthetic */ hv2[] a;
    public static final /* synthetic */ i04 b;

    public static g04 getEntries() {
        return b;
    }

    public static hv2 valueOf(String str) {
        return (hv2) Enum.valueOf(hv2.class, str);
    }

    public static hv2[] values() {
        return (hv2[]) a.clone();
    }

    static {
        hv2 hv2Var = new hv2("ATTEMPT", 0);
        ATTEMPT = hv2Var;
        hv2 hv2Var2 = new hv2("RESULT", 1);
        RESULT = hv2Var2;
        hv2 hv2Var3 = new hv2("BACKEND_GRANT", 2);
        BACKEND_GRANT = hv2Var3;
        hv2 hv2Var4 = new hv2("ACKNOWLEDGE", 3);
        ACKNOWLEDGE = hv2Var4;
        hv2 hv2Var5 = new hv2(bPUi.kifCGxpMNqB, 4);
        CONFIRMED = hv2Var5;
        hv2[] hv2VarArr = {hv2Var, hv2Var2, hv2Var3, hv2Var4, hv2Var5};
        a = hv2VarArr;
        b = new i04(hv2VarArr);
    }
}
