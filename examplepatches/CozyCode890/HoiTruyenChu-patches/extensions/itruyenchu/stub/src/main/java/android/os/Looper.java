package android.os;

/**
 * Lets this plain Java stub module compile signatures that use Looper. The extension itself is
 * compiled against the real android.jar (boot classpath), which takes precedence over this class.
 */
public final class Looper {
    private Looper() {
    }
}
