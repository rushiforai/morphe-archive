package software.santodan.extension.monetchannels;

/** Set by the patch only after the original native contracts have been validated. */
public final class NativeLayout {
    public static boolean modern = false;
    public static boolean v111 = false;
    /** 1.1.2 bindings, keyed by the 1.1.0 names used throughout the runtime. */
    public static boolean v112 = false;
    public static String type(String name) {
        if (v112) switch (name) {
            case "a.c32": return "a.gf4";
            case "a.do4": return "a.sk4";
            case "a.f24": return "a.ea4";
            case "a.gt4": return "a.h35";
            case "a.in1": return "a.ap1";
            case "a.ip4": return "a.zy4";
            case "a.jw1": return "a.ty1";
            case "a.k88": return "a.td5";
            case "a.kv1": return "a.vx1";
            case "a.lv1": return "a.wx1";
            case "a.mv1": return "a.xx1";
            case "a.p35": return "a.s39";
            case "a.pt5": return "a.i86";
            case "a.uu1": return "a.fx1";
            case "a.vr4": return "a.q15";
            case "a.vs0": return "a.iv0";
            case "a.vt5": return "a.n86";
            case "a.vv0": return "a.rx0";
            case "a.wr4": return "a.r15";
            case "a.wu1": return "a.hx1";
            case "a.yp7": return "a.ke3";
            default: return name;
        }
        if (!v111) return name;
        switch (name) {
            case "a.c32": return "a.b42";
            case "a.do4": return "a.ss4";
            case "a.f24": return "a.b84";
            case "a.gt4": return "a.lz4";
            case "a.in1": return "a.ap1";
            case "a.ip4": return "a.ov4";
            case "a.jw1": return "a.iy1";
            case "a.k88": return "a.lz7";
            case "a.kv1": return "a.jx1";
            case "a.lv1": return "a.kx1";
            case "a.mv1": return "a.lx1";
            case "a.nv1": return "a.mx1";
            case "a.p35": return "a.zl0";
            case "a.pt5": return "a.n46";
            case "a.uu1": return "a.tw1";
            case "a.vr4": return "a.ay4";
            case "a.vs0": return "a.mu0";
            case "a.vt5": return "a.s46";
            case "a.vv0": return "a.mx0";
            case "a.wr4": return "a.by4";
            case "a.wu1": return "a.vw1";
            case "a.yp7": return "a.m42";
            default: return name;
        }
    }
    private NativeLayout() {}
}
