package xyz.urro.gboard;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** Runs on the host JVM; no keyboard, credentials, or Android state required. */
public final class ClipboardRowsChecks {
    static int checks;
    static void check(boolean ok, String message) {
        checks++;
        if (!ok) throw new AssertionError(message);
    }
    static List<Integer> order(ClipboardRows rows) {
        List<Integer> result = new ArrayList<>();
        for (int p = 0; p < rows.count(); p++) result.add(rows.remote(p) ? -1 : rows.nativePosition(p));
        return result;
    }
    public static void main(String[] args) {
        ClipboardRows rows = new ClipboardRows(new int[]{1, 0, 0, 2, 0, 3, 0, 0}, 2, true);
        check(order(rows).equals(Arrays.asList(0, 1, 2, -1, -1, -1, 3, 4, 5, 6, 7)), "Remote section must precede ALL other sections, preserving their order");
        check(rows.insertion == 3, "After local items");
        for (int local = 0; local < 6; local++) for (int remote = 0; remote < 6; remote++) {
            int[] types = new int[local + 6];
            types[0] = 1; types[local + 1] = 3; types[local + 3] = 2;
            ClipboardRows visible = new ClipboardRows(types, remote, true);
            ClipboardRows hidden = new ClipboardRows(types, remote, false);
            check(visible.insertion == local + 1, "Do not reorder arbitrary native sections");
            check(visible.count() == types.length + remote + 1, "Count includes remote header");
            for (int i = 0; i < types.length; i++) {
                check(visible.nativePosition(visible.displayPosition(i)) == i, "Native/display position roundtrip");
                check(hidden.nativePosition(i) == i && hidden.displayPosition(i) == i, "Hidden remote section is an identity mapping");
            }
        }
        check(new ClipboardRows(new int[0], 0, true).count() == 1, "Empty remote header remains visible");
        check(new ClipboardRows(new int[]{1, 0, 0}, 1, true).insertion == 3, "Append when there are no other sections");
        check(rows.nativePosition(-1) == -1, "Preserve NO_POSITION");
        System.out.println("PASS: " + checks + " clipboard section/position assertions");
    }
}
