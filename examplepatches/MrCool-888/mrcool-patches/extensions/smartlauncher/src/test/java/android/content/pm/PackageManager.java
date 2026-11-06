package android.content.pm;
import android.content.ComponentName;
public class PackageManager {
    public static class NameNotFoundException extends Exception { public NameNotFoundException(String s) { super(s); } }
    public ActivityInfo target = new ActivityInfo();
    public boolean missing, runtimeFailure;
    public ActivityInfo getActivityInfo(ComponentName c, int flags) throws NameNotFoundException {
        if (runtimeFailure) throw new IllegalStateException("configured package manager failure");
        if (missing) throw new NameNotFoundException(c.getClassName());
        return target;
    }
}
