package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum xm6 {
    UNKNOWN(0),
    CLASS(1),
    FILE_FACADE(2),
    SYNTHETIC_CLASS(3),
    MULTIFILE_CLASS(4),
    MULTIFILE_CLASS_PART(5);

    public static final wm6 Companion = new wm6();
    public static final LinkedHashMap b;
    public final int a;

    static {
        xm6[] xm6VarArrValues = values();
        int iP = ei7.P(xm6VarArrValues.length);
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP < 16 ? 16 : iP);
        for (xm6 xm6Var : xm6VarArrValues) {
            linkedHashMap.put(Integer.valueOf(xm6Var.a), xm6Var);
        }
        b = linkedHashMap;
    }

    xm6(int i) {
        this.a = i;
    }

    public static final xm6 getById(int i) {
        Companion.getClass();
        xm6 xm6Var = (xm6) b.get(Integer.valueOf(i));
        return xm6Var == null ? UNKNOWN : xm6Var;
    }
}
