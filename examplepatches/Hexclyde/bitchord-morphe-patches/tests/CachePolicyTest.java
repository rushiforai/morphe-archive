package app.bitchord.telegram;

public final class CachePolicyTest {
    static int checks;

    static void check(boolean value, String text) {
        checks++;
        if (!value) throw new AssertionError(text);
    }

    public static void main(String[] args) {
        check(
                CachePolicy.DEFAULT_BYTES == 256L * 1024 * 1024,
                "Previous 256 MiB default preserved");
        check(CachePolicy.count() == 9, "Nine bounded slider choices");
        long previous = 0;
        for (int i = 0; i < CachePolicy.count(); i++) {
            long bytes = CachePolicy.bytesAt(i);
            CachePolicy.requireValid(bytes);
            check(bytes > previous, "Increasing slider stops");
            check(CachePolicy.indexOf(bytes) == i, "Stored target restores slider position");
            previous = bytes;
        }
        check(CachePolicy.bytesAt(0) == 64L * 1024 * 1024, "Minimum target");
        check(previous == 16L * 1024 * 1024 * 1024, "Maximum target uses 64-bit bytes");
        check(CachePolicy.label(256L * 1024 * 1024).equals("256 MiB"), "MiB label");
        check(CachePolicy.label(8L * 1024 * 1024 * 1024).equals("8 GiB"), "GiB label");
        for (long invalid : new long[] {-1, 0, 1, Long.MAX_VALUE}) {
            check(
                    CachePolicy.validOrDefault(invalid) == CachePolicy.DEFAULT_BYTES,
                    "Invalid stored value falls back to default");
            boolean rejected = false;
            try {
                CachePolicy.requireValid(invalid);
            } catch (IllegalArgumentException e) {
                rejected = true;
            }
            check(rejected, "Invalid requested cache limit rejected");
        }
        System.out.println(
                "PASS: "
                        + checks
                        + " Telegram cache-policy size, persistence-mapping and label checks.");
    }
}
