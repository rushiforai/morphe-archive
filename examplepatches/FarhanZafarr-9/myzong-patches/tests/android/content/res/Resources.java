package android.content.res;
import java.util.HashMap;
public class Resources {
    private final android.util.DisplayMetrics metrics = new android.util.DisplayMetrics();
    public android.util.DisplayMetrics getDisplayMetrics() { return metrics; }
    private final HashMap<String,Integer> names = new HashMap<>();
    public void register(String name, int id) { names.put(name,id); }
    public int getIdentifier(String name, String kind, String pkg) {
        if (!"id".equals(kind) || !"com.zong.customercare".equals(pkg)) throw new AssertionError();
        return names.getOrDefault(name,0);
    }
}
