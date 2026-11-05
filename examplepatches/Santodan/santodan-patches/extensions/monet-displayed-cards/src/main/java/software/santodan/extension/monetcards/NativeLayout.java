package software.santodan.extension.monetcards;

/** Selected by the patch after validating the app's native contracts, never guessed at runtime. */
public final class NativeLayout {
    public static boolean modern = false;
    public static boolean v111 = false;
    public static String type(String name) {
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
