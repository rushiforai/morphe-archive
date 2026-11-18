import android.content.SharedPreferences;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.playback.MiniPlayerPlayback;
import app.afterglow.extension.settings.AfterglowPrefs;
import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

public final class MiniPlayerPlaybackTest {
    private static final Map<String, Object> PREFS = new HashMap<>();
    private static boolean failReads;
    private static int checks;

    private static void check(String name, Object expected, Object actual) {
        checks++;
        if (!expected.equals(actual)) throw new AssertionError(name + ": " + actual + " != " + expected);
    }

    public static void main(String[] args) throws Exception {
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
                SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
                (proxy, method, values) -> {
                    if (!method.getName().equals("getBoolean"))
                        throw new AssertionError("Unexpected preference read: " + method.getName());
                    if (failReads) throw new IllegalStateException("unavailable test preferences");
                    return (Boolean) PREFS.getOrDefault((String) values[0], values[1]);
                });
        Field field = AfterglowPrefs.class.getDeclaredField("prefs");
        field.setAccessible(true);
        field.set(null, preferences);

        check("iOS default remains OFF", false, AfterglowPrefs.descriptor("miniplayer").defaultValue);
        check("uninstalled native pause-only", 5, MiniPlayerPlayback.playbackMode(5));
        PREFS.put("miniplayer", true);
        check("imported ON cannot enable uninstalled tweak", 5, MiniPlayerPlayback.playbackMode(5));
        InstalledTweaks.mark("background-playback");
        check("background tweak does not own this override", 5, MiniPlayerPlayback.playbackMode(5));
        InstalledTweaks.mark("miniplayer");
        PREFS.clear();
        check("installed default remains native", 5, MiniPlayerPlayback.playbackMode(5));
        PREFS.put("playlistOldMinibar", true);
        check("playlist minibar has independent behavior", 5, MiniPlayerPlayback.playbackMode(5));

        int[] inputs = {-1, 0, 1, 2, 3, 4, 5, 6, 7, Integer.MAX_VALUE};
        for (int input : inputs) {
            check("OFF preserves mode " + input, input, MiniPlayerPlayback.playbackMode(input));
        }
        PREFS.put("miniplayer", true);
        int[] enabled = {-1, 0, 1, 2, 3, 4, 0, 6, 7, Integer.MAX_VALUE};
        for (int i = 0; i < inputs.length; i++) {
            check("ON mode " + inputs[i], enabled[i], MiniPlayerPlayback.playbackMode(inputs[i]));
        }
        PREFS.put("miniplayer", false);
        check("live OFF restores pause-only policy", 5, MiniPlayerPlayback.playbackMode(5));
        PREFS.put("liteModeEnabled", true);
        check("Lite Mode preserves OFF", 5, MiniPlayerPlayback.playbackMode(5));
        PREFS.put("miniplayer", true);
        check("Lite Mode preserves ON", 0, MiniPlayerPlayback.playbackMode(5));
        PREFS.remove("miniplayer");
        check("reset preference restores native default", 5, MiniPlayerPlayback.playbackMode(5));
        PREFS.put("miniplayer", "malformed import");
        check("wrong preference type uses default OFF", 5, MiniPlayerPlayback.playbackMode(5));

        failReads = true;
        check("unknown mode avoids preference failure", 7, MiniPlayerPlayback.playbackMode(7));
        check("unrelated native mode did not report an error", 0, Afterglow.errors);
        check("failed preference read preserves native restriction", 5, MiniPlayerPlayback.playbackMode(5));
        check("failure is reported once", 1, Afterglow.errors);
        failReads = false;
        PREFS.put("miniplayer", true);
        check("preference recovery uses current value", 0, MiniPlayerPlayback.playbackMode(5));
        System.out.println(checks + " mini-player playback checks passed");
    }
}
