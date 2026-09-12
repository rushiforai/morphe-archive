package app.fdroidbackends.extension.shizuku;

import android.os.ParcelFileDescriptor;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Runs inside the Shizuku (adb/root shell) process, bound via {@code Shizuku.bindUserService}.
 * Streams the APK bytes handed to it into {@code pm install}'s stdin, avoiding the need to
 * grant this service its own storage/URI access.
 */
public class ShizukuInstallService extends IShizukuInstallService.Stub {

    // Required no-arg constructor: Shizuku instantiates the service via reflection.
    public ShizukuInstallService() {
    }

    @Override
    public String installFromDescriptor(ParcelFileDescriptor pfd, long size, String packageName) {
        String[] cmd = {
                "pm", "install", "-r", "-S", String.valueOf(size),
        };

        try {
            ProcessBuilder pb = new ProcessBuilder(cmd);
            pb.redirectErrorStream(true);
            Process process = pb.start();

            try (OutputStream stdin = process.getOutputStream();
                 InputStream apkIn = new ParcelFileDescriptor.AutoCloseInputStream(pfd)) {
                byte[] buffer = new byte[1 << 16];
                int read;
                while ((read = apkIn.read(buffer)) != -1) {
                    stdin.write(buffer, 0, read);
                }
            }

            StringBuilder output = new StringBuilder();
            try (InputStream out = process.getInputStream()) {
                byte[] buffer = new byte[1 << 12];
                int read;
                while ((read = out.read(buffer)) != -1) {
                    output.append(new String(buffer, 0, read));
                }
            }

            int exitCode = process.waitFor();
            String result = output.toString().trim();

            if (exitCode == 0 && result.startsWith("Success")) {
                return null;
            }
            return "pm install failed (exit " + exitCode + "): " + result;
        } catch (IOException | InterruptedException e) {
            return "Shizuku install failed: " + e.getMessage();
        }
    }

    @Override
    public void destroy() {
        System.exit(0);
    }
}
