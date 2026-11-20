package app.morphe.extension.chmate;

/** Pure-Java checks for reporter NG rules, including disabled and regex variants. */
public final class VerifyEdgeReporterNg {
    private static int checks;

    private static void equal(boolean expected, boolean actual, String label) {
        checks++;
        if (expected != actual) throw new AssertionError(label + ": expected=" + expected + " actual=" + actual);
    }

    public static void main(String[] args) {
        String suffix = " [A1b2C3d4★]";
        EdgeReporterNg exact = EdgeReporterNg.compile(suffix, (short) 0x10);
        equal(true, exact != null && exact.matches(suffix), "literal reporter suffix");
        equal(false, exact != null && exact.matches(" [A1b2C3d5★]"), "different reporter id");
        equal(false, EdgeReporterNg.compile("普通のスレタイ", (short) 0x10) != null, "ordinary title rule excluded");
        equal(false, EdgeReporterNg.compile(suffix, (short) 0x14) != null, "disabled rule excluded");

        EdgeReporterNg partial = EdgeReporterNg.compile("\\[[A-Za-z0-9+/.]{4}C3d4★\\]$", (short) 0x20);
        equal(true, partial != null && partial.matches(suffix), "regex reporter suffix");
        equal(false, partial != null && partial.matches(" [A1b2C3d5★]"), "regex different reporter id");
        equal(false, EdgeReporterNg.compile("[invalid", (short) 0x20) != null, "malformed regex ignored");
        System.out.println("PASS: " + checks + " Edge reporter NG matching checks");
    }
}
