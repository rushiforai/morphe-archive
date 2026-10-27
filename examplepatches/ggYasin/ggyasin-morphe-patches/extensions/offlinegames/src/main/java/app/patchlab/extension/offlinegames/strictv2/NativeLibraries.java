package app.patchlab.extension.offlinegames.strictv2;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public final class NativeLibraries {
    private static final String TAG = "PatchLabOfflineGames";
    private static volatile String expectedDirectory;
    private static volatile Context applicationContext;
    private static volatile String mainLoadError;
    private NativeLibraries() {}

    /** Called before Unity loads libmain and invokes NativeLoader.load(directory). */
    public static String directory(Context context) {
        applicationContext = context.getApplicationContext();
        try {
            File apk = new File(context.getApplicationInfo().sourceDir);
            File root = context.getDir("patchlab-offlinegames-native", Context.MODE_PRIVATE);
            File directory = NativeLibraryStore.prepare(apk, root).getCanonicalFile();
            expectedDirectory = directory.getAbsolutePath();
            Log.i(TAG, "Prepared verified Unity libraries (not yet loaded): " + directory);
            return expectedDirectory;
        } catch (IOException | SecurityException error) {
            String message = failure("Cannot prepare patched native libraries: " + error, "");
            throw new IllegalStateException(message, error);
        }
    }

    /** Remains in the same APK classloader as Unity; JNI registration still uses libmain's JNI_OnLoad. */
    public static void loadMain(String path) {
        mainLoadError = null;
        try {
            File requested = new File(path).getCanonicalFile();
            if (expectedDirectory == null || !requested.equals(new File(expectedDirectory, "libmain.so"))) {
                throw new IOException("Unity requested an unexpected libmain path: " + path);
            }
            System.load(requested.getAbsolutePath());
        } catch (IOException | UnsatisfiedLinkError | SecurityException error) {
            mainLoadError = failure("Cannot explicitly load libmain.so: " + error, readMapsForReport());
            throw new UnsatisfiedLinkError(mainLoadError);
        }
    }

    /** Replaces Unity's System.loadLibrary("main") fallback, preserving its error dialog path. */
    public static void rejectMainFallback(String name) {
        String message = mainLoadError;
        if (message == null) message = failure("Refused native basename fallback: " + name, readMapsForReport());
        throw new UnsatisfiedLinkError(message);
    }

    /** null means verified success; otherwise Unity returns this text to its existing failure dialog. */
    public static String finishLoad(boolean loaderSucceeded) {
        final String maps;
        try {
            maps = readMaps();
        } catch (IOException | SecurityException error) {
            return failure("Cannot verify loaded Unity libraries: " + error, "");
        }
        String problem = NativeLoadStatus.unityProblem(maps, expectedDirectory);
        if (!loaderSucceeded || problem != null) {
            return failure("NativeLoader.load returned " + loaderSucceeded + ". " +
                    (problem == null ? "Native initialization failed." : problem) +
                    "\nStock-library fallback is disabled. The native loader does not expose its dlerror here; " +
                    "the mappings below identify missing or unexpected libraries.", maps);
        }
        String status = "PatchLab: patched native code loaded";
        Log.i(TAG, status + "\nExpected: " + expectedDirectory + "\n" + maps);
        showStatus(status);
        return null;
    }

    private static String readMaps() throws IOException {
        StringBuilder maps = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new FileReader("/proc/self/maps"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.contains("libmain.so") || line.contains("libunity.so") || line.contains("libil2cpp.so")) {
                    maps.append(line).append('\n');
                }
            }
        }
        return maps.toString();
    }

    private static String readMapsForReport() {
        try { return readMaps(); }
        catch (IOException | SecurityException error) { return "Cannot read maps: " + error; }
    }

    private static String failure(String reason, String maps) {
        Context context = applicationContext;
        String message = "PatchLab native loading failed\n" + reason +
                "\nExpected directory: " + expectedDirectory + "\n" + maps;
        if (context != null) {
            message += "\nAPK: " + context.getApplicationInfo().sourceDir +
                    "\nInstalled native directory: " + context.getApplicationInfo().nativeLibraryDir;
            // App-specific external files are shareable/exportable by the user. No storage permission needed.
            File directory = context.getExternalFilesDir(null);
            if (directory == null) directory = context.getFilesDir();
            File report = new File(directory, "patchlab-native-load-error.txt");
            try (FileOutputStream output = new FileOutputStream(report)) {
                message += "\nReport: " + report.getAbsolutePath();
                output.write(message.getBytes(StandardCharsets.UTF_8));
            } catch (IOException | SecurityException error) {
                message += "\nCould not save report: " + error;
            }
        }
        Log.e(TAG, message);
        showStatus("PatchLab: native loading failed — see error dialog/report");
        return message;
    }

    private static void showStatus(String status) {
        Context context = applicationContext;
        if (context != null) new Handler(Looper.getMainLooper()).post(() ->
                Toast.makeText(context, status, Toast.LENGTH_LONG).show());
    }
}
