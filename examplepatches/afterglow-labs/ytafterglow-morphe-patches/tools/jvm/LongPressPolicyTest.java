import java.util.Objects;
import app.afterglow.extension.menus.LongPressPolicy;

public final class LongPressPolicyTest {
    private static int checks;
    private static void check(String name, Object expected, Object actual) {
        checks++;
        if (!Objects.equals(expected, actual)) throw new AssertionError(name + ": " + actual);
    }
    public static void main(String[] args) {
        String id = "rfscVS0vtbw", base = "https://www.youtube.com/watch?v=" + id;
        check("start", base + "&t=0s", LongPressPolicy.timestampLink(id, 0));
        check("subsecond", base + "&t=0s", LongPressPolicy.timestampLink(id, 999));
        check("whole second", base + "&t=1s", LongPressPolicy.timestampLink(id, 1000));
        check("truncate fractional second", base + "&t=61s", LongPressPolicy.timestampLink(id, 61999));
        check("long video", base + "&t=16012s", LongPressPolicy.timestampLink(id, 16012999));
        check("wide timestamp", base + "&t=9223372036854775s", LongPressPolicy.timestampLink(id, Long.MAX_VALUE));
        check("unknown time", null, LongPressPolicy.timestampLink(id, -1));
        for (String invalid : new String[] {null, "", "short", "123456789012", "1234567890&", "1234567890?", "1234567890\n", "1234567890é"}) {
            check("invalid identity " + invalid, null, LongPressPolicy.timestampLink(invalid, 1000));
        }
        check("valid id symbols", "https://www.youtube.com/watch?v=_-aA0123456&t=0s",
                LongPressPolicy.timestampLink("_-aA0123456", 0));
        System.out.println(checks + " long-press policy checks passed");
    }
}
