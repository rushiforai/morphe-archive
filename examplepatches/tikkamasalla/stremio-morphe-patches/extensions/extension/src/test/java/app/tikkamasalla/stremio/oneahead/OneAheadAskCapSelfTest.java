package app.tikkamasalla.stremio.oneahead;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * Stream-query cap: only asks that returned rows count against the 3; an episode that
 * answers nothing is free, but 6 asks in all is a hard bound so a dead addon cannot spin.
 */
public final class OneAheadAskCapSelfTest {
    static int fails = 0, total = 0;
    static void ok(String name, boolean cond, String info) {
        total++; if (!cond) fails++;
        System.out.println((cond ? "ok   " : "FAIL ") + name + (info == null ? "" : "  " + info));
    }
    static String src(String rel) throws Exception {
        String root = System.getProperty("oa.src", "extensions/extension/src/main/java");
        return new String(Files.readAllBytes(Paths.get(root, rel)), StandardCharsets.UTF_8).replace("\r\n", "\n");
    }

    /** The trigger's loop shape: rowsPerAsk[i] is the row count the i-th asked episode returns. */
    static int[] run(int[] rowsPerAsk) {
        int asked = 0, usable = 0;
        while (OneAheadTrigger.mayAsk(usable, asked) && asked < rowsPerAsk.length) {
            int rows = rowsPerAsk[asked];
            asked++;
            if (rows > 0) usable++;
        }
        return new int[]{asked, usable};
    }

    public static void main(String[] a) throws Exception {
        int[] r = run(new int[]{5, 5, 5, 5, 5, 5, 5});
        ok("three answering asks stop at 3", r[0] == 3 && r[1] == 3, "asked=" + r[0]);
        r = run(new int[]{0, 0, 5, 5, 5, 5, 5});
        ok("two empty asks do not use up the cap", r[0] == 5 && r[1] == 3, "asked=" + r[0] + " usable=" + r[1]);
        r = run(new int[]{0, 5, 0, 5, 0, 5, 5});
        ok("alternating empty and answering reaches 3 usable", r[0] == 6 && r[1] == 3, "asked=" + r[0] + " usable=" + r[1]);
        r = run(new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0});
        ok("a dead addon stops at 6 asks", r[0] == 6 && r[1] == 0, "asked=" + r[0]);
        r = run(new int[]{5, 0, 0, 0, 0, 0, 0, 0});
        ok("the bound of 6 holds with one usable ask", r[0] == 6 && r[1] == 1, "asked=" + r[0]);
        ok("mayAsk edges", OneAheadTrigger.mayAsk(2, 5) && !OneAheadTrigger.mayAsk(3, 3) && !OneAheadTrigger.mayAsk(0, 6), null);

        String t = src("app/tikkamasalla/stremio/oneahead/OneAheadTrigger.java");
        ok("loop uses mayAsk", t.contains("!mayAsk(usableAsks, asked)"), null);
        ok("only non-empty rows are counted", t.contains("if (!rows.isEmpty()) usableAsks++;"), null);
        ok("log line carries the running count", t.contains("\" ask=\" + asked + \" usable=\" + usableAsks"), null);

        System.out.println("TOTAL " + (total - fails) + "/" + total);
        System.exit(fails == 0 ? 0 : 1);
    }
}
