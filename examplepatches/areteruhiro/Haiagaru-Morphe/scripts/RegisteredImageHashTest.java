package app.morphe.extension.chmate;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** JVM-only regression for conservative perceptual matching and unique-count semantics. */
public final class RegisteredImageHashTest {
    private static void check(boolean value) { if (!value) throw new AssertionError("registered image matching"); }
    private static int[] pattern(int style, int brightness) {
        int[] out = new int[1024];
        for (int y = 0; y < 32; y++) for (int x = 0; x < 32; x++) {
            int l = style == 0 ? (x < 16 ? 40 + y * 3 : 220 - y * 3)
                    : style == 1 ? (y < 16 ? 180 + x : x * 3)
                    : ((x / 4 + y / 4) % 2 == 0 ? 220 : 30);
            l = Math.max(0, Math.min(255, l + brightness));
            out[y * 32 + x] = 0xff000000 | l << 16 | l << 8 | l;
        }
        return out;
    }
    public static void main(String[] ignored) {
        var first = RegisteredImageHash.calculate(pattern(0, 0), 640, 480);
        var same = RegisteredImageHash.calculate(pattern(0, 5), 1280, 960);
        var second = RegisteredImageHash.calculate(pattern(1, 0), 640, 480);
        var third = RegisteredImageHash.calculate(pattern(2, 0), 640, 480);
        check(RegisteredImageHash.similar(first, same));
        check(RegisteredImageHash.sameImage(first, same));
        check(!RegisteredImageHash.sameImage(first, second));
        check(!RegisteredImageHash.similar(first, RegisteredImageHash.calculate(pattern(0, 0), 480, 640)));
        check(!RegisteredImageHash.similar(first, second));
        check(!RegisteredImageHash.similar(first, third));
        Map<String, RegisteredImageHash.Stamp> cache = new HashMap<>();
        cache.put("url-a", same); cache.put("url-b", second); cache.put("url-c", third);
        List<RegisteredImageHash.Stamp> refs = Arrays.asList(first, second);
        check(RegisteredImageHash.matchingCount(refs, Arrays.asList("url-a", "url-a"), cache) == 1);
        check(RegisteredImageHash.matchingCount(refs, Arrays.asList("url-a", "url-b"), cache) == 2);
        check(RegisteredImageHash.matchingCount(refs, Collections.singletonList("url-c"), cache) == 0);
        check(RegisteredImageHash.matchingCount(Arrays.asList(first, first), Collections.singletonList("url-a"), cache) == 1);
        // Same picture under two URLs and equivalent registered files must never count twice.
        cache.put("url-a-copy", first);
        check(RegisteredImageHash.matchingCount(Arrays.asList(first, same, second),
                Arrays.asList("url-a", "url-a-copy"), cache) == 1);
        // A user can opt into less conservative matches while the default stays strict.
        var close = new RegisteredImageHash.Stamp(first.phash ^ 0x3ffL,
                first.dhash ^ 0x3ffL, first.aspect, first.gray);
        check(!RegisteredImageHash.similar(first, close, RegisteredImageHash.STRICT));
        check(RegisteredImageHash.similar(first, close, RegisteredImageHash.STANDARD));
        var loose = new RegisteredImageHash.Stamp(first.phash ^ 0x3fffffL,
                first.dhash ^ 0x3ffffffL, first.aspect, first.gray);
        check(!RegisteredImageHash.similar(first, loose, RegisteredImageHash.WIDE));
        check(RegisteredImageHash.similar(first, loose, RegisteredImageHash.SIMILAR));
        for (int sensitivity = RegisteredImageHash.STRICT; sensitivity < RegisteredImageHash.SIMILAR; sensitivity++)
            if (RegisteredImageHash.similar(first, close, sensitivity))
                check(RegisteredImageHash.similar(first, close, sensitivity + 1));
        check(RegisteredImageHash.calculate(new int[1024], 32, 32) == null);
        System.out.println("RegisteredImageHashTest OK");
    }
}
