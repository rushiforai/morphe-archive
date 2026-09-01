package defpackage;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class tx5 {
    public static final q84 a = new q84(ey3.a);
    public static final q84 b = new q84(kk7.o(4096, 4096));
    public static final q84 c = new q84(Boolean.FALSE);
    public static final q84 d = new q84(Boolean.TRUE);

    public static final void a(nx5 nx5Var, boolean z) {
        int i = z ? 200 : 0;
        q84 q84Var = wx5.a;
        nx5Var.b().a(wx5.a, i > 0 ? new nj2(i) : yrd.a);
    }

    public static final void b(nx5 nx5Var, List list) {
        nx5Var.b().a(a, nk7.z0(list));
        String strF0 = bu1.F0(list, null, null, null, new ff4(14, new pya()), 31);
        Map map = nx5Var.g;
        if (!g76.L(map, Boolean.valueOf(nx5Var.f))) {
            if (!(map instanceof Map)) {
                ywb.d();
                return;
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap(map);
            nx5Var.g = linkedHashMap;
            nx5Var.f = true;
            map = linkedHashMap;
        }
        map.getClass();
        pwd.y(map).put("coil#transformations", strF0);
    }
}
