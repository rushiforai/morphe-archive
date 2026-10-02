package app.spicetify.extension.spotify.localserver;

import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.util.Log;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

/**
 * The separate process that serves track files to Spotify. Serving them from Spotify's own process can wedge
 * it: a read waiting on the file proxy never finishes if the process is killed, so the process never exits.
 */
public final class ServerProcess {
    static final String SUFFIX = ":spicetify_server";
    private static volatile Boolean current;

    private ServerProcess() {}

    /**
     * Runs first in Spotify's Application.onCreate. In the track server process it loads the saved server
     * settings and returns true, so Spotify's own start-up, which would start a second Spotify, is skipped.
     */
    public static boolean skipApplication(Context context) {
        if (!isCurrent(context)) return false;
        ServerConfig.loadForServer(context);
        return true;
    }

    public static boolean isCurrent(Context context) {
        Boolean known = current;
        if (known == null) current = known = processName(context).endsWith(SUFFIX);
        return known;
    }

    private static String processName(Context context) {
        if (Build.VERSION.SDK_INT >= 28) {
            String name = Application.getProcessName();
            if (name != null) return name;
        }
        try (FileInputStream in = new FileInputStream("/proc/self/cmdline")) {
            byte[] buffer = new byte[256];
            int length = in.read(buffer);
            int end = 0;
            while (end < Math.max(0, length) && buffer[end] != 0) end++;
            return new String(buffer, 0, end, StandardCharsets.UTF_8);
        } catch (IOException error) {
            Log.w("SpicetifyServer", "Could not read the process name", error);
            return context.getPackageName();
        }
    }

    /** Brings the server process up to date with the settings and scan saved by Spotify's main process. */
    static void refresh(Context context) {
        ServerConfig.loadForServer(context);
        ServerIndex.loadSaved(ServerConfig.snapshot());
    }
}
