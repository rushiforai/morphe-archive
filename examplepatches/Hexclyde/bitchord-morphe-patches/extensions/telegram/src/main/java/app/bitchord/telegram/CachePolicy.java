package app.bitchord.telegram;

/** Telegram's soft media target only. Does not alter BitChord's own cache or downloads. */
public final class CachePolicy {
    private CachePolicy() {}

    public static final long MIB = 1024L * 1024, DEFAULT_BYTES = 256 * MIB;
    private static final long[] OPTIONS = {
        64 * MIB,
        128 * MIB,
        256 * MIB,
        512 * MIB,
        1024 * MIB,
        2048 * MIB,
        4096 * MIB,
        8192 * MIB,
        16384 * MIB
    };

    public static int count() {
        return OPTIONS.length;
    }

    public static long bytesAt(int index) {
        if (index < 0 || index >= OPTIONS.length)
            throw new IllegalArgumentException("Invalid cache-size choice");
        return OPTIONS[index];
    }

    public static long validOrDefault(long bytes) {
        for (long option : OPTIONS) if (option == bytes) return bytes;
        return DEFAULT_BYTES;
    }

    public static void requireValid(long bytes) {
        if (validOrDefault(bytes) != bytes)
            throw new IllegalArgumentException(
                    "Choose a Telegram cache target between 64 MiB and 16 GiB.");
    }

    public static int indexOf(long bytes) {
        long value = validOrDefault(bytes);
        for (int i = 0; i < OPTIONS.length; i++) if (OPTIONS[i] == value) return i;
        return 2;
    }

    public static String label(long bytes) {
        long mib = bytes / MIB;
        return mib >= 1024 && mib % 1024 == 0 ? (mib / 1024) + " GiB" : mib + " MiB";
    }
}
