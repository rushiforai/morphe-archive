package software.santodan.extension.monetcards;

/** Selected by the patch after validating the app's native contracts, never guessed at runtime. */
public final class NativeLayout {
    public static boolean modern = false;
    public static boolean v111 = false;
    /** 1.1.2 bindings; method names match 1.1.1, classes do not. */
    public static boolean v112 = false;
    public static String type(String name) {
        if (v112) switch (name) {
            case "a.jw1": return "a.ty1";
            case "a.lo7": return "a.qf8";
            case "a.pp0": return "a.bs0";
            case "a.qp1": return "a.as1";
            case "a.uu1": return "a.fx1";
            case "a.ux2": return "a.w33";
            case "a.wp1": return "a.gs1";
            case "a.wu1": return "a.hx1";
            case "a.xb5": return "a.cm5";
            case "a.y95": return "a.ek5";
            default: return name;
        }
        if (!v111) return name;
        switch (name) {
            case "a.jw1": return "a.iy1";
            case "a.lo7": return "a.u08";
            case "a.pp0": return "a.fr0";
            case "a.qp1": return "a.or1";
            case "a.uu1": return "a.tw1";
            case "a.ux2": return "a.b33";
            case "a.wp1": return "a.ur1";
            case "a.wu1": return "a.vw1";
            case "a.xb5": return "a.mi5";
            case "a.y95": return "a.og5";
            default: return name;
        }
    }
    private NativeLayout() {}
}
