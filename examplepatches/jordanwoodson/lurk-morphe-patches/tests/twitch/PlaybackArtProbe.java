import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.widget.ProgressBar;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;

/** Version-pinned regression: execute the real native recommendation OFF path on Android ART.
 * A sentinel ProgressBar stops at the first original countdown operation, before creating a timer.
 * Unsafe allocation avoids unrelated view constructors; the actual app method and model getters run.
 * CLASSPATH=probe.jar:patched.apk app_process / PlaybackArtProbe
 */
public final class PlaybackArtProbe {
    private static final ReachedProgress REACHED_PROGRESS = new ReachedProgress();
    public static final class ReachedProgress extends Error {}
    public static final class ProgressSentinel extends ProgressBar {
        public ProgressSentinel(Context context) { super(context); }
        @Override public synchronized void setProgress(int value) { throw REACHED_PROGRESS; }
    }
    public static final class TextSink extends TextView {
        CharSequence bound;
        public TextSink(Context context) { super(context); }
        @Override public void setText(CharSequence value, BufferType type) { bound = value; }
    }
    private static Object allocate(Class<?> type) throws Exception {
        Class<?> unsafe = Class.forName("sun.misc.Unsafe");
        Object instance = unsafe.getMethod("getUnsafe").invoke(null);
        return unsafe.getMethod("allocateInstance", Class.class).invoke(instance, type);
    }
    private static void set(Object owner, String name, Object value) throws Exception {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        field.set(owner, value);
    }
    private static void disablePatch() throws Exception {
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
            SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
            (proxy, method, args) -> {
                if (method.getName().equals("getBoolean")) return false;
                throw new UnsupportedOperationException(method.getName());
            });
        Context context = new ContextWrapper(null) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) { return preferences; }
        };
        Field field = Class.forName("io.github.jordanwoodson.extension.shared.settings.Settings").getDeclaredField("context");
        field.setAccessible(true);
        field.set(null, context);
    }
    public static void main(String[] args) throws Exception {
        boolean stock = args.length > 0 && args[0].equals("stock");
        if (!stock) disablePatch();
        // R8 names are Twitch 31.8.0's: the countdown view ab2, its state mvw and the state type ovw.
        Class<?> viewType = Class.forName("ab2");
        Object view = allocate(viewType);
        TextSink title = (TextSink) allocate(TextSink.class);
        TextSink creator = (TextSink) allocate(TextSink.class);
        set(view, "j", title);
        set(view, "k", creator);
        set(view, "g", allocate(ProgressSentinel.class));
        // f may remain null: with the patch off, the helper returns before touching its view.
        Object channel = allocate(Class.forName("tv.twitch.android.models.channel.ChannelModel"));
        set(channel, "name", "regression-channel");
        Class<?> vodType = Class.forName("tv.twitch.android.models.videos.VodModel");
        Object vod = allocate(vodType);
        set(vod, "title", "regression-title");
        set(vod, "channel", channel);
        Class<?> playable = Class.forName("tv.twitch.android.models.Playable");
        Object state = Class.forName("mvw").getConstructor(playable).newInstance(vod);
        try {
            viewType.getMethod("w", Class.forName("ovw")).invoke(view, state);
            throw new AssertionError("Recommendation OFF path did not reach the original ProgressBar");
        } catch (InvocationTargetException expected) {
            if (expected.getCause() != REACHED_PROGRESS) throw new AssertionError(
                "Recommendation OFF path failed before original ProgressBar.setProgress", expected.getCause());
        }
        if (!"regression-title".contentEquals(title.bound)
                || !"regression-channel".contentEquals(creator.bound)) {
            throw new AssertionError("Actual VOD title/channel binding did not run before countdown continuation");
        }
        System.out.println(stock ? "PASS: stock ART recommendation countdown negative control" :
            "PASS: real ART recommendation OFF path binds title/channel then reaches original ProgressBar.setProgress");
    }
}
