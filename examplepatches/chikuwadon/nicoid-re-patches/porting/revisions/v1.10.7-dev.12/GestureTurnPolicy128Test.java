package e.e.a;

/** Regression cases for all-vertical scrolling and mixed-direction gestures. */
public final class GestureTurnPolicy128Test {
    private static int count;
    private static void check(boolean condition,String message) {
        count++;
        if (!condition) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        for (String pattern : new String[]{"UD", "DU", "UDU", "DUD", "UDUD", "DUDU"}) {
            check(!GestureTurnPolicy128.allowClaim(false,pattern),"off: "+pattern);
            check(GestureTurnPolicy128.allowClaim(true,pattern),"on: "+pattern);
        }
        for (String pattern : new String[]{"UL","UR","DL","DR","LU","LD","RU","RD",
                "URD","ULD","DRU","DLU","UDL","UDR","DUL","DUR",
                "U","D","L","R","LR","RL","", "UDRL", "DLUR"}) {
            check(GestureTurnPolicy128.allowClaim(false,pattern),"preserved off: "+pattern);
            check(GestureTurnPolicy128.allowClaim(true,pattern),"preserved on: "+pattern);
        }
        check(!GestureTurnPolicy128.verticalOnly(null),"null");
        check(!GestureTurnPolicy128.verticalOnly("U"),"single U");
        check(!GestureTurnPolicy128.verticalOnly("D"),"single D");
        check(GestureTurnPolicy128.verticalOnly("UDU"),"triple UDU");
        check(GestureTurnPolicy128.verticalOnly("DUD"),"triple DUD");
        check(GestureTurnPolicy128.allowClaim(false,"UDL"),"allow turn from UD to left");
        check(GestureTurnPolicy128.allowClaim(false,"DUR"),"allow turn from DU to right");
        System.out.println("PASS: "+count+" vertical-only gesture assertions");
    }
}
