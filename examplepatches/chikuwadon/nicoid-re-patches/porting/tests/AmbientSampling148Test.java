package e.e.a;

/** Emission state transitions must not need Android/GPU or a real video. */
public final class AmbientSampling148Test {
    private static int checks;
    private static void test(boolean expected, boolean enabled, boolean mode,
                             int strength, int sides, String reason) {
        checks++;
        boolean actual = AmbientSampling148.shouldSample(enabled,mode,strength,sides);
        if (actual != expected) throw new AssertionError(reason +
                " expected " + expected + ", got " + actual);
    }
    public static void main(String[] args) {
        test(false, false, true, 41, 15, "global off");
        test(false, true, false, 41, 15, "this mode off");
        test(false, true, true, 0, 15, "zero strength");
        test(false, true, true, 41, 0, "every edge off");
        test(false, true, true, 0, 0, "both disabled");
        test(false, true, true, 41, 16, "non-visual direction flag");
        for (int side: new int[]{1,2,4,8,3,15}) {
            test(true, true, true, 41, side, "valid selected visual sides");
        }
        // Re-enabling or mode switching must resume scheduling immediately.
        test(false, true, true, 0, 2, "off while PixelCopy in flight");
        test(true, true, true, 60, 2, "strength restored");
        test(false, true, true, 60, 0, "side mask disabled");
        test(true, true, true, 60, 1, "side selection restored");
        test(false, true, false, 60, 1, "switch to disabled popup");
        test(true, true, true, 60, 1, "return to enabled fullscreen");
        System.out.println("PASS: " + checks + " ambient capture scheduling states");
    }
}
