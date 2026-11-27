package local.waze.aainstaller;

import android.content.Context;
import android.os.Binder;
import android.util.Log;
import java.io.*;
import java.util.concurrent.TimeUnit;

/** Executes only the fixed installer handoff, under Shizuku's shell identity. */
public final class HandoffService extends IHandoffService.Stub {
    private final int ownerUid;
    public HandoffService(Context context) { ownerUid = context.getApplicationInfo().uid; }

    @Override public String launchInstaller(String token) {
        if (Binder.getCallingUid() != ownerUid) throw new SecurityException("Unexpected caller");
        if (token == null || !token.matches("[a-f0-9]{32}")) throw new IllegalArgumentException("Invalid APK token");
        if (android.os.Process.myUid() != 2000) return "ERROR: Start Shizuku through wireless debugging (ADB mode).";
        long identity = Binder.clearCallingIdentity();
        try {
            String stop = run("/system/bin/am", "force-stop", "--user", "0", "com.google.android.packageinstaller");
            if (stop.startsWith("ERROR:")) return stop;
            String output = run("/system/bin/am", "start", "--user", "0",
                "-a", "android.intent.action.INSTALL_PACKAGE",
                "-d", "content://local.waze.aainstaller.apk/apk/" + token,
                "-t", "application/vnd.android.package-archive", "-p", "com.google.android.packageinstaller",
                "--es", "android.intent.extra.INSTALLER_PACKAGE_NAME", "com.android.vending",
                "--ez", "android.intent.extra.NOT_UNKNOWN_SOURCE", "true");
            Log.i("WazeAAInstaller", "Shizuku handoff uid=" + android.os.Process.myUid() + ": " + output);
            return output;
        } catch (Exception error) {
            return "ERROR: " + error.getClass().getSimpleName() + ": " + error.getMessage();
        } finally { Binder.restoreCallingIdentity(identity); }
    }

    private String run(String... arguments) throws Exception {
        Process process = new ProcessBuilder(arguments).redirectErrorStream(true).start();
        if (!process.waitFor(20, TimeUnit.SECONDS)) {
            process.destroyForcibly();
            return "ERROR: Android installer did not respond. Return here and retry.";
        }
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (InputStream input = process.getInputStream()) {
            byte[] buffer = new byte[1024]; int n;
            while ((n = input.read(buffer)) != -1 && bytes.size() < 16384) bytes.write(buffer, 0, n);
        }
        String output = bytes.toString("UTF-8").trim();
        if (process.exitValue() != 0 || output.contains("Error:") || output.contains("Exception"))
            return "ERROR: " + output;
        return output;
    }

    @Override public void destroy() { System.exit(0); }
}
