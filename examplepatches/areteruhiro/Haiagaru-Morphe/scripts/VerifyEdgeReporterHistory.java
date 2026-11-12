import app.morphe.extension.chmate.EdgeReporterId;
import app.morphe.extension.chmate.EdgeReporterHistory;
import android.content.SharedPreferences;
import java.lang.reflect.*;
import java.util.*;

/** Run with android.jar and compiled extension classes; SharedPreferences uses an in-memory proxy. */
public class VerifyEdgeReporterHistory {
    private static final Map<String,String> saved = new HashMap<>();
    private static int checks;
    private static int edits;
    private static void equal(Object expected, Object actual) {
        checks++;
        if (!Objects.equals(expected, actual)) throw new AssertionError("Expected " + expected + ", got " + actual);
    }
    private static void restart() throws Exception {
        Field writes = EdgeReporterHistory.class.getDeclaredField("writes");
        writes.setAccessible(true); Object pending = writes.get(null);
        if (pending != null) { Method flush = pending.getClass().getDeclaredMethod("flush"); flush.setAccessible(true); flush.invoke(pending); }
        Object editor = Proxy.newProxyInstance(VerifyEdgeReporterHistory.class.getClassLoader(),
                new Class[]{SharedPreferences.Editor.class}, (p,m,a) -> {
                    if (m.getName().equals("putString")) { saved.put((String)a[0], (String)a[1]); return p; }
                    if (m.getName().equals("apply")) return null;
                    if (m.getName().equals("commit")) return true;
                    throw new AssertionError(m);
                });
        Object prefs = Proxy.newProxyInstance(VerifyEdgeReporterHistory.class.getClassLoader(),
                new Class[]{SharedPreferences.class}, (p,m,a) -> {
                    if (m.getName().equals("getString")) return saved.getOrDefault(a[0], (String)a[1]);
                    if (m.getName().equals("edit")) { edits++; return editor; }
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
        equal("[not-an-id★]", EdgeReporterId.suffix("スレ [not-an-id★]"));
        equal(null, EdgeReporterId.suffix(full + "追記"));
        equal(false, EdgeReporterId.isBoard("evil.example/liveedge"));
        equal(false, EdgeReporterId.isBoard("bbs.eddibb.cc%2Fother"));
        equal(full, EdgeReporterHistory.title(board, 1234567890L, full));
        equal("スレ", EdgeReporterHistory.copyTitle(full));
        equal("未保存", EdgeReporterHistory.copyTitle("未保存 [/sE8R8tL★]"));
        equal("本文\nスレ [/sE8R8tL★]", EdgeReporterHistory.copyTitle("本文\nスレ [/sE8R8tL★]"));
        equal("スレ [not-an-id★]", EdgeReporterHistory.copyTitle("スレ [not-an-id★]"));
        restart(); // New preferences instance over persisted data, with no live subject available.
        equal(full, EdgeReporterHistory.title(board, 1234567890L, "スレ"));
        equal(full, EdgeReporterHistory.historyTitle(1234567890L, board, "スレ"));
        int before = edits;
        for (int n=0;n<10000;n++) EdgeReporterHistory.historyTitle(1234567890L, board, n%2==0?full:"スレ");
        equal(before, edits);
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
        equal(full, EdgeReporterHistory.displayTitle(1234567890L,"スレ"));
        equal(full, EdgeReporterHistory.displayTitle(1234567890L,full));
        equal("スレ [different★]", EdgeReporterHistory.displayTitle(1234567890L,"スレ [different★]"));
        equal("スレ", EdgeReporterHistory.displayTitle(1234567899L,"スレ"));
        equal(null, EdgeReporterHistory.displayTitle(1234567890L,null));
        equal("", EdgeReporterHistory.displayTitle(1234567890L,""));
        equal("スレ", EdgeReporterHistory.displayTitle(0,"スレ"));
        String kenmo="kenmo.org%2Fpoverty",operate="kenmo.org%2Foperate";
        equal(true,EdgeReporterId.isBoard(kenmo));equal("kenmo:poverty",EdgeReporterId.scope("https://kenmo.org/poverty/"));
        equal(false,EdgeReporterId.isBoard("https://kenmo.org.evil/poverty/"));equal(false,EdgeReporterId.isBoard("https://kenmo.org@evil/poverty/"));
        equal(false,EdgeReporterId.isBoard("https://kenmo.org:999/poverty/"));
        equal("スレ",EdgeReporterHistory.title(kenmo,1234567890L,"スレ"));
        Object kenmoUrl=new Object(){public String toString(){return "{server:kenmo.org, name:poverty, created:null, type:0 }";}};
        EdgeReporterHistory.capture(kenmoUrl,List.of(new Subject(1234567890L,"スレ [KenmoId★]")));
        equal("スレ [KenmoId★]",EdgeReporterHistory.title(kenmo,1234567890L,"スレ"));
        equal(full,EdgeReporterHistory.title(board,1234567890L,"スレ"));
        equal("スレ",EdgeReporterHistory.title(operate,1234567890L,"スレ"));
        equal("スレ [KenmoId★]",EdgeReporterHistory.resolveTitle(kenmo,"スレ"));
        equal("スレ [KenmoId★]",EdgeReporterHistory.displayTitle("kenmo:poverty",1234567890L,"スレ"));
        equal(full,EdgeReporterHistory.displayTitle(1234567890L,"スレ"));
        restart();equal("スレ [KenmoId★]",EdgeReporterHistory.historyTitle(1234567890L,kenmo,"スレ"));
        equal("スレ",EdgeReporterHistory.historyTitle(1234567890L,operate,"スレ"));
        if(args.length==2){
            List<Subject> topics=new ArrayList<>();java.util.regex.Pattern line=java.util.regex.Pattern.compile("^([0-9]+)\\.dat<>(.*) \\([0-9]+\\)$");
            for(String text:java.nio.file.Files.readAllLines(java.nio.file.Path.of(args[0]),java.nio.charset.Charset.forName("MS932"))){java.util.regex.Matcher m=line.matcher(text);if(m.matches())topics.add(new Subject(Long.parseLong(m.group(1)),m.group(2)));}
            equal(true,topics.size()>100);EdgeReporterHistory.capture(kenmoUrl,topics);
            String dat=java.nio.file.Files.readAllLines(java.nio.file.Path.of(args[1]),java.nio.charset.Charset.forName("MS932")).get(0).split("<>",5)[4];
            equal(null,EdgeReporterId.suffix(dat));
            equal(EdgeReporterId.suffix(topics.get(0).title),EdgeReporterId.suffix(EdgeReporterHistory.historyTitle(topics.get(0).key,kenmo,dat)));
        }
        System.out.println("PASS: " + checks + " reporter persistence and isolation checks");
    }
}
