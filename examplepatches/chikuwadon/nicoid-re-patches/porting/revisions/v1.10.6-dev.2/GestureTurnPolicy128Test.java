package e.e.a;

/** Regression tests for issue #113, with no Android runtime dependency. */
public final class GestureTurnPolicy128Test {
    private static int checks;
    private static void expect(boolean value, String label) {
        checks++;
        if (!value) throw new AssertionError(label);
    }

    public static void main(String[] args) {
        expect(!GestureTurnPolicy128.allowClaim(false, "UD"), "OFF blocks up-down");
        expect(!GestureTurnPolicy128.allowClaim(false, "DU"), "OFF blocks down-up");
        expect(GestureTurnPolicy128.allowClaim(true, "UD"), "ON restores up-down");
        expect(GestureTurnPolicy128.allowClaim(true, "DU"), "ON restores down-up");
        for (String pattern : new String[] {
                "", "U", "D", "UL", "UR", "DL", "DR", "LU", "LD",
                "RU", "RD", "LR", "RL", "UDL", "UDR", "DUL", "DUR",
                "URD", "ULD", "DLU", "DRU", "UDU", "DUD"
        }) {
            expect(GestureTurnPolicy128.allowClaim(false, pattern),
                    "OFF preserves other pattern " + pattern);
            expect(GestureTurnPolicy128.allowClaim(true, pattern),
                    "ON preserves other pattern " + pattern);
        }
        // When a gesture continues beyond an ignored UD/DU, the third
        // direction remains eligible instead of being permanently disabled.
        expect(!GestureTurnPolicy128.allowClaim(false, "UD"), "UD stays native");
        expect(GestureTurnPolicy128.allowClaim(false, "UDL"), "UDL is distinct");
        expect(!GestureTurnPolicy128.allowClaim(false, "DU"), "DU stays native");
        expect(GestureTurnPolicy128.allowClaim(false, "DUR"), "DUR is distinct");
        expect(!GestureTurnPolicy128.verticalReversal(null), "null is safe");
        System.out.println("PASS: " + checks + " gesture recognition assertions");
    }
}
