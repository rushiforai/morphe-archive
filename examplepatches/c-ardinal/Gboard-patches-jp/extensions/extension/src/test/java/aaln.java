/** Minimal ABI fixture for the generated proto parser lookup. */
public final class aaln {
    public static aamx H(Class<?> type) {
        return (bytes, registry) -> {
            if (registry == null) throw new IllegalArgumentException("Missing registry");
            return new String(bytes, java.nio.charset.StandardCharsets.UTF_8);
        };
    }
}
