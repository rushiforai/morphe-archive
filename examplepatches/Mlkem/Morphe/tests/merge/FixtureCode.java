package ca.mikem.mergeonly.fixture;

/** Independent fixture app code, deliberately unrelated to the patch bundle. */
public final class FixtureCode {
    public static String greeting() { return "MERGE-ONLY-DEX-PROBE"; }
    public static int add(int a, int b) { return a + b; }
}
