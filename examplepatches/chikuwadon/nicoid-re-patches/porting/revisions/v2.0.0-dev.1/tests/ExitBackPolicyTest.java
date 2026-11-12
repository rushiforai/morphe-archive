package e.e.a;

public final class ExitBackPolicyTest {
    static void check(boolean result, boolean expected, String name) {
        if (result != expected) throw new AssertionError(name);
    }
    public static void main(String[] ignored) {
        check(ExitBackPolicy.isSecondPress(0, 1000), false, "first press");
        check(ExitBackPolicy.isSecondPress(1000, 1001), true, "second press");
        check(ExitBackPolicy.isSecondPress(1000, 3000), true, "inclusive boundary");
        check(ExitBackPolicy.isSecondPress(1000, 3001), false, "expired window");
        check(ExitBackPolicy.isSecondPress(1000, 999), false, "monotonic clock");
        System.out.println("PASS: double-Back timing contract");
    }
}
