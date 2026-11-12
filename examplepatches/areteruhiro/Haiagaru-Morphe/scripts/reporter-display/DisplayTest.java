import app.morphe.extension.chmate.*;
import android.content.SharedPreferences;
import java.lang.reflect.*;
import java.util.*;

public final class DisplayTest {
    private static int checks;
    private static void equal(Object expected, Object actual) {
        checks++;
        if (!Objects.equals(expected, actual)) throw new AssertionError(expected + " != " + actual);
    }
    private static String display(int version, Object board, long thread, String title) {
        EdgeReporterDisplay.begin(o.NativeRows.adapter(version, board));
        EdgeReporterDisplay.subject(o.NativeRows.subject(version, thread));
        String result = EdgeReporterDisplay.title(title);
        EdgeReporterDisplay.end();
        return result;
    }
    public static void main(String[] args) throws Exception {
        SharedPreferences prefs = (SharedPreferences) Proxy.newProxyInstance(DisplayTest.class.getClassLoader(),
                new Class[]{SharedPreferences.class}, (p,m,a) -> {
                    if (m.getName().equals("getString")) return a[0].equals("1791989395") ? "[a.+/★]" : a[0].equals("kenmo:poverty:1791989395") ? "[kenmo★]" : a[1];
                    throw new AssertionError("Display must not write preferences: " + m);
                });
        Field cache = EdgeReporterHistory.class.getDeclaredField("cache");
        cache.setAccessible(true); cache.set(null,prefs);
        String edge = "bbs.eddibb.cc%2Fliveedge";
        for (int version : new int[]{191,226,242}) {
            equal("Thread [a.+/★]", display(version,edge,1791989395L,"Thread"));
            equal("Thread [a.+/★]", display(version,edge,1791989395L,"Thread [a.+/★]"));
            equal("Thread [new★]", display(version,edge,1791989395L,"Thread [new★]"));
            equal("Thread", display(version,"other",1791989395L,"Thread"));
            equal("Thread [kenmo★]", display(version,"kenmo.org%2Fpoverty",1791989395L,"Thread"));
            equal("Thread", display(version,"kenmo.org%2Foperate",1791989395L,"Thread"));
            equal("Thread", display(version,"evilkenmo.org%2Fpoverty",1791989395L,"Thread"));
            equal("Thread", display(version,edge,1791989396L,"Thread"));
            equal("Thread", display(version,edge,9240000000L,"Thread"));
            equal(null, display(version,edge,1791989395L,null));
            equal("", display(version,edge,1791989395L,""));
            EdgeReporterDisplay.begin(o.NativeRows.adapter(version,edge));
            EdgeReporterDisplay.subject(o.NativeRows.subject(version,1791989395L));
            equal("Thread [a.+/★]",EdgeReporterDisplay.title("Thread"));
            equal("Header",EdgeReporterDisplay.title("Header"));
            EdgeReporterDisplay.end();
            equal("Thread",EdgeReporterDisplay.title("Thread"));
        }
        System.out.println("PASS: " + checks + " display fallback/isolation checks (191/226/242)");
    }
}
