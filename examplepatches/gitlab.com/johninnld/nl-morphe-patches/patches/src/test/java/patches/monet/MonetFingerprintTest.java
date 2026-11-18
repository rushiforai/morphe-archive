package patches.monet;

import static org.junit.Assert.assertNotEquals;
import java.util.*;
import org.junit.Test;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;

/** A valid array-fill method isolates payload and exception metadata hashing. */
public final class MonetFingerprintTest {
    private static ImmutableMethod method(int width, int value, String caught, int tryCount) {
        var code = new ImmutableMethodImplementation(1, List.of(
            new ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 0, 6),
            new ImmutableInstruction10x(Opcode.RETURN_VOID),
            new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0),
            new ImmutableInstruction10x(Opcode.RETURN_VOID),
            new ImmutableArrayPayload(width, List.of(value))),
            List.of(new ImmutableTryBlock(0, tryCount, List.of(new ImmutableExceptionHandler(caught, 4)))), List.of());
        return new ImmutableMethod("LProbe;", "fill", List.of(new ImmutableMethodParameter("[I", Set.of(), null)),
            "V", 9, Set.of(), Set.of(), code);
    }
    @Test public void changingArrayContentsChangesFingerprint() {
        assertNotEquals(MonetWuplayHooks.fingerprint(method(4, 11, "Ljava/lang/Exception;", 3)),
            MonetWuplayHooks.fingerprint(method(4, 99, "Ljava/lang/Exception;", 3)));
    }
    @Test public void changingArrayWidthChangesFingerprint() {
        assertNotEquals(MonetWuplayHooks.fingerprint(method(4, 11, "Ljava/lang/Exception;", 3)),
            MonetWuplayHooks.fingerprint(method(2, 11, "Ljava/lang/Exception;", 3)));
    }
    @Test public void changingCatchTypeChangesFingerprint() {
        assertNotEquals(MonetWuplayHooks.fingerprint(method(4, 11, "Ljava/lang/Exception;", 3)),
            MonetWuplayHooks.fingerprint(method(4, 11, "Ljava/lang/Error;", 3)));
    }
    @Test public void changingTryRangeChangesFingerprint() {
        assertNotEquals(MonetWuplayHooks.fingerprint(method(4, 11, "Ljava/lang/Exception;", 3)),
            MonetWuplayHooks.fingerprint(method(4, 11, "Ljava/lang/Exception;", 4)));
    }
}
