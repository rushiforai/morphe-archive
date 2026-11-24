package app.jofslash.extension.quora;

/** Checks how the Update notice compares versions. Run by run.sh. */
public final class UpdateCheckTest {

    private static int failures;

    private static void newer(String a, String b) {
        if (UpdateCheck.compare(a, b) <= 0 || UpdateCheck.compare(b, a) >= 0) {
            System.err.println("FAIL UpdateCheck: " + a + " should be newer than " + b);
            failures++;
        }
    }

    public static void main(String[] args) {
        newer("1.10.0", "1.9.0");
        newer("2.0.0", "1.99.99");
        newer("1.10.0", "1.10.0-dev.3");
        newer("1.10.0-dev.10", "1.10.0-dev.9");
        newer("1.11.0-dev.1", "1.10.0");
        newer("1.10.1", "v1.10.0");
        if (UpdateCheck.compare("1.10.0", "1.10.0") != 0 || UpdateCheck.compare("1.10.0-dev.2", "1.10.0-dev.2") != 0) {
            System.err.println("FAIL UpdateCheck: equal versions should compare as equal");
            failures++;
        }
        if (!UpdateCheck.preRelease("1.10.0-dev.1") || UpdateCheck.preRelease("1.10.0")) {
            System.err.println("FAIL UpdateCheck: pre-release detection");
            failures++;
        }
        if (failures > 0) System.exit(1);
        System.out.println("UpdateCheck: ok");
    }
}
