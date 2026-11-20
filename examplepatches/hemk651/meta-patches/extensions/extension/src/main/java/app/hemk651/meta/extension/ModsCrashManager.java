/*
 * Meta Patches — crash logging.
 *
 * Forked from InstaFL managers/CrashManager.java and
 * utils/InstafelCrashHandler.java (https://github.com/mamiiblt/instafel) by
 * mamiiblt (Muhammed Ali Bulut), rebranded to Meta Patches.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension;

import android.content.Context;
import android.os.Build;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Saves and reads crash reports as a JSON log file.
 */
public class ModsCrashManager {

    private static final String LOG_FOLDER = "mp_update_files";
    private static final String LOG_FILE = "mp_crashlogs.json";

    /** Installed as the default uncaught exception handler by the init patch. */
    public static class ModsCrashHandler implements Thread.UncaughtExceptionHandler {
        private final Context ctx;
        private final Thread.UncaughtExceptionHandler previous;

        public ModsCrashHandler(Context ctx) {
            this.ctx = ctx;
            this.previous = Thread.getDefaultUncaughtExceptionHandler();
        }

        @Override
        public void uncaughtException(Thread thread, Throwable throwable) {
            try {
                new ModsCrashManager(ctx).saveLog(throwable);
            } catch (Exception ignored) {
            }
            if (previous != null) {
                previous.uncaughtException(thread, throwable);
            }
        }
    }

    private final Context ctx;

    public ModsCrashManager(Context ctx) {
        this.ctx = ctx;
    }

    private File logFile() {
        File folder = new File(ctx.getExternalFilesDir(null), LOG_FOLDER);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        return new File(folder, LOG_FILE);
    }

    public void saveLog(Throwable throwable) {
        try {
            JSONObject logObject = new JSONObject();

            JSONObject appData = new JSONObject();
            appData.put("patch_ver", ModsEnv.PATCH_VERSION);
            appData.put("ig_ver", ModsEnv.getIgVersion(ctx));
            appData.put("ig_ver_code", ModsEnv.getIgVersionCode(ctx));
            appData.put("itype", ModsEnv.INSTALL_TYPE);
            logObject.put("appData", appData);

            JSONObject deviceData = new JSONObject();
            deviceData.put("aver", Build.VERSION.RELEASE);
            deviceData.put("sdk", Build.VERSION.SDK_INT);
            deviceData.put("model", Build.MODEL);
            deviceData.put("brand", Build.BRAND);
            deviceData.put("product", Build.PRODUCT);
            logObject.put("deviceData", deviceData);

            JSONObject crashData = new JSONObject();
            crashData.put("msg", throwable.getMessage() == null ? JSONObject.NULL : throwable.getMessage());
            crashData.put("trace", Log.getStackTraceString(throwable));
            crashData.put("class", throwable.getClass().getName());
            logObject.put("crashData", crashData);

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
            logObject.put("date", sdf.format(new Date()));

            addLogIntoCrashFile(logObject);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static JSONArray getLogs(Context ctx) {
        try {
            File file = new ModsCrashManager(ctx).logFile();
            if (!file.exists()) {
                file.createNewFile();
                return new JSONArray("[]");
            }

            StringBuilder builder = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                    new FileInputStream(file), StandardCharsets.UTF_8))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    builder.append(line);
                }
            }

            String content = builder.toString();
            return content.isEmpty() ? new JSONArray("[]") : new JSONArray(content);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void removeReports(Context ctx) {
        try {
            ModsCrashManager manager = new ModsCrashManager(ctx);
            File file = manager.logFile();
            if (file.exists()) {
                file.delete();
                file.createNewFile();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void addLogIntoCrashFile(JSONObject logObject) throws Exception {
        JSONArray logs = getLogs(ctx);
        if (logs == null) {
            logs = new JSONArray();
        }
        logs.put(logObject);

        File file = logFile();
        if (!file.exists()) {
            file.createNewFile();
        }
        try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream(file, false), StandardCharsets.UTF_8))) {
            writer.write(logs.toString());
        }
    }
}
