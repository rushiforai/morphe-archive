package defpackage;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class z86 {
    public static final Map a;
    public static final LinkedHashMap b;

    static {
        dy dyVar = dy.VALUE_PARAMETER;
        List listR = d46.R(dy.FIELD, dy.METHOD_RETURN_TYPE, dyVar, dy.TYPE_PARAMETER_BOUNDS, dy.TYPE_USE);
        List listQ = d46.Q(dyVar);
        y05 y05Var = ee6.a;
        vl8 vl8Var = vl8.NOT_NULL;
        Map mapQ = ei7.Q(new f09(y05Var, new y86(new wl8(vl8Var, false), listR, false, true)), new f09(ee6.b, new y86(new wl8(vl8Var, false), listR, false, true)), new f09(ee6.c, new y86(new wl8(vl8.FORCE_FLEXIBILITY, false), listR, 4)));
        a = mapQ;
        b = ei7.S(mapQ, ei7.Q(new f09(ee6.h, new y86(new wl8(vl8Var, false), listQ, 12)), new f09(ee6.i, new y86(new wl8(vl8.NULLABLE, false), listQ, 12))));
    }
}
