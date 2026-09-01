package defpackage;

import scalapb.options.hI.AEVqIoD;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ri2 {
    public static final ri2 API;
    public static final ri2 IMPL;
    public static final /* synthetic */ ri2[] a;

    public static ri2 valueOf(String str) {
        return (ri2) Enum.valueOf(ri2.class, str);
    }

    public static ri2[] values() {
        return (ri2[]) a.clone();
    }

    static {
        ri2 ri2Var = new ri2(AEVqIoD.drpnkUtV, 0);
        API = ri2Var;
        ri2 ri2Var2 = new ri2("IMPL", 1);
        IMPL = ri2Var2;
        a = new ri2[]{ri2Var, ri2Var2};
    }
}
