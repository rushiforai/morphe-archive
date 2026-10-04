package e.e.a;

public final class ManualCookieTest {
    private static int checks;
    private static void expect(String input, String expected) {
        if (!expected.equals(ManualCookie.normalize(input))) throw new AssertionError("Cookie normalization failed");
        checks++;
    }
    private static void reject(String input) {
        try { ManualCookie.normalize(input); }
        catch (IllegalArgumentException expected) {
            if (expected.getMessage() != null) throw new AssertionError("Credentials in error message");
            checks++; return;
        }
        throw new AssertionError("Unsafe or incomplete cookie accepted");
    }
    public static void main(String[] args) {
        String value = "user_session_123_test";
        String normalized = "user_session=" + value + "; ";
        expect(value, normalized);
        expect("  " + value + "  ", normalized);
        expect("user_session=" + value, normalized);
        expect(" Cookie: user_session=" + value + "; ", normalized);
        expect("cookie: unrelated=x; user_session=" + value + "; Path=/; HttpOnly; Secure", normalized);
        expect("user_session_secure=secure; user_session=" + value, normalized + "user_session_secure=secure; ");
        expect(normalized, normalized);
        expect("user_session=" + value + "==", "user_session=" + value + "==; ");
        reject(null); reject(""); reject("random text"); reject("user_session=");
        reject("user_session_secure=secure"); reject("not_user_session=" + value);
        reject("user_session=" + value + "; user_session=other");
        reject("user_session=" + value + "; user_session=" + value);
        reject("user_session=" + value + "; user_session_secure=a; user_session_secure=b");
        reject("user_session=" + value + "\r\nX-Test: secret");
        reject("user_session=" + value + "\n"); reject("user_session=with space");
        reject("user_session=\"quoted\""); reject("user_session=x,y");
        reject("user_session=x\\y"); reject("user_session=日本語");
        reject("user_session=x\u0000y"); reject(new String(new char[16385]));
        System.out.println("Manual cookie checks passed: " + checks);
    }
}
