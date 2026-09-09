package app.vantage.extension.claude;

/**
 * Build-time constants. Each getter is exactly `const-string v0; return-object v0`
 * so the patch can rewrite the constant from its options.
 */
public final class BuildValues {
    private BuildValues() {}

    /** Text shown in the corner pill. Empty disables the pill. */
    public static String badgeLabel() {
        return "";
    }
}
