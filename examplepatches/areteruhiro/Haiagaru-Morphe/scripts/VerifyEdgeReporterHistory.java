import app.morphe.extension.chmate.EdgeReporterId;
import app.morphe.extension.chmate.EdgeReporterHistory;
import android.content.SharedPreferences;
import java.lang.reflect.*;
import java.util.*;

/** Run with android.jar and compiled extension classes; SharedPreferences uses an in-memory proxy. */
public class VerifyEdgeReporterHistory {
    private static final Map<String,String> saved = new HashMap<>();
    private static int checks;
    private static void equal(Object expected, Object actual) {
        checks++;
        if (!Objects.equals(expected, actual)) throw new AssertionError("Expected " + expected + ", got " + actual);
    }
    private static void restart() throws Exception {
        Object editor = Proxy.newProxyInstance(VerifyEdgeReporterHistory.class.getClassLoader(),
                new Class[]{SharedPreferences.Editor.class}, (p,m,a) -> {
                    if (m.getName().equals("putString")) { saved.put((String)a[0], (String)a[1]); return p; }
                    if (m.getName().equals("apply")) return null;
                    throw new AssertionError(m);
                });
        Object prefs = Proxy.newProxyInstance(VerifyEdgeReporterHistory.class.getClassLoader(),
                new Class[]{SharedPreferences.class}, (p,m,a) -> {
                    if (m.getName().equals("getString")) return saved.getOrDefault(a[0], (String)a[1]);
                    if (m.getName().equals("edit")) return editor;
                    throw new AssertionError(m);
                });
        Field cache = EdgeReporterHistory.class.getDeclaredField("cache");
        cache.setAccessible(true); cache.set(null, prefs);
    }
    public static final class Subject {
        final long key; final String title;
        Subject(long key, String title) { this.key=key;this.title=title; }
    }
    public static void main(String[] args) throws Exception {
        String board = "bbs.eddibb.cc%2Fliveedge";
        String full = "スレ [/sE8R8tL★]";
        restart();
        equal("[/sE8R8tL★]", EdgeReporterId.suffix(full));
        equal(null, EdgeReporterId.suffix("スレ [not-an-id★]"));
        equal(null, EdgeReporterId.suffix(full + "追記"));
        equal(false, EdgeReporterId.isBoard("evil.example/liveedge"));
        equal(false, EdgeReporterId.isBoard("bbs.eddibb.cc%2Fother"));
        equal(full, EdgeReporterHistory.title(board, 1234567890L, full));
        restart(); // New preferences instance over persisted data, with no live subject available.
        equal(full, EdgeReporterHistory.title(board, 1234567890L, "スレ"));
        equal(full, EdgeReporterHistory.historyTitle(1234567890L, board, "スレ"));
        equal(full, EdgeReporterHistory.title(board, 1234567890L, full));
        equal("スレ", EdgeReporterHistory.title("other", 1234567890L, "スレ"));
        equal("スレ", EdgeReporterHistory.title(board, 1234567891L, "スレ"));
        equal(null, EdgeReporterHistory.title(board, 1234567890L, null));
        equal("", EdgeReporterHistory.title(board, 1234567890L, ""));
        Object url = new Object() { public String toString() { return "{server:bbs.eddibb.cc, name:liveedge, created:null, type:0 }"; } };
        EdgeReporterHistory.pending(List.of(new Subject(1234567892L,"別スレ [g66+xfHI★]")));
        EdgeReporterHistory.capturePending(url);
        equal("別スレ [g66+xfHI★]", EdgeReporterHistory.title(board,1234567892L,"別スレ"));
        EdgeReporterHistory.capture(new Object(),List.of(new Subject(1234567893L, full)));
        equal("スレ", EdgeReporterHistory.title(board,1234567893L,"スレ"));
        System.out.println("PASS: " + checks + " reporter persistence and isolation checks");
    }
}
