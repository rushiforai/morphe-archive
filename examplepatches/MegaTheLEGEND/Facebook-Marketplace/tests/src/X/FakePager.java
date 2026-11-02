package X;
import java.util.*;
/** Stand-in for X.2FU: A04(long) -> Integer index of a tab id (null when absent), like the real one. */
public class FakePager {
    final List<Long> ids;
    public boolean throwing;
    public FakePager(Long... ids) { this.ids = Arrays.asList(ids); }
    public Integer A04(long id) {
        if (throwing) throw new IllegalStateException("tabBarController");
        int i = ids.indexOf(id);
        return i < 0 ? null : Integer.valueOf(i);
    }
}
