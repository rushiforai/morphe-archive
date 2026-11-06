package android.content;
import java.util.HashMap;
import java.util.Map;
public class Intent {
    public static final int FLAG_ACTIVITY_NEW_TASK = 0x10000000;
    private final String action;
    private ComponentName component;
    private int flags;
    private final Map<String,Object> extras = new HashMap<>();
    public Intent(String action) { this.action=action; }
    public Intent setComponent(ComponentName c) { component=c; return this; }
    public Intent putExtra(String k, int v) { extras.put(k,v); return this; }
    public Intent addFlags(int f) { flags |= f; return this; }
    public String getAction() { return action; }
    public ComponentName getComponent() { return component; }
    public int getFlags() { return flags; }
    public int getIntExtra(String k, int d) { Object v=extras.get(k); return v instanceof Integer ? (Integer)v : d; }
}
