package app.patchlab.extension.offlinegames;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public final class NativeLibraries {
    private static volatile String expectedDirectory;
    private static volatile Context applicationContext;

    private NativeLibraries() {}

    /** Called by Unity before System.load(libmain) and NativeLoader.load(directory). */
    public static String directory(Context context) {
        try {
            // Read sourceDir directly: a root bind mount changes these bytes, whereas
            // PackageManager's nativeLibraryDir still contains the original installation.
            File apk = new File(context.getApplicationInfo().sourceDir);
            File root = context.getDir("patchlab-offlinegames-native", Context.MODE_PRIVATE);
            File directory = NativeLibraryStore.prepare(apk, root);
            expectedDirectory = directory.getAbsolutePath();
            applicationContext = context.getApplicationContext();
            Log.i("PatchLabOfflineGames", "Using verified Unity libraries from mounted APK: " + directory);
            return directory.getAbsolutePath();
        } catch (IOException error) {
            // Falling back silently would recreate the original 'patch applied, no effect' bug.
            throw new IllegalStateException("Cannot load patched Offline Games native libraries", error);
        }
    }

    /** Injected after NativeLoader.load succeeds, before Unity marks itself initialized. */
    public static void verifyLoaded() {
        boolean verified = false;
        StringBuilder maps = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new FileReader("/proc/self/maps"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.contains("libil2cpp.so")) maps.append(line).append('\n');
            }
            verified = expectedDirectory != null &&
                    NativeLoadStatus.hasExpectedMapping(maps.toString(), expectedDirectory);
        } catch (IOException error) {
            Log.e("PatchLabOfflineGames", "Cannot inspect loaded native library", error);
        }
        String status = verified ? "PatchLab: patched native code loaded" :
                "PatchLab: native code NOT verified — export the patched APK and log";
        Log.println(verified ? Log.INFO : Log.ERROR, "PatchLabOfflineGames",
                status + "\nExpected: " + expectedDirectory + "\n" + maps);
        Context context = applicationContext;
        if (context != null) {
            new Handler(Looper.getMainLooper()).post(() ->
                    Toast.makeText(context, status, Toast.LENGTH_LONG).show());
        }
    }
}
