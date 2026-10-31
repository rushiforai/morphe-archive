package app.fblite.research;

import android.content.Context;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/** Copies the unpacked secondary dex to external storage so adb can pull it. Research only. */
public final class DexDump {
    public static void run(final Context context) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Thread.sleep(15000);
                    File src = new File(context.getApplicationInfo().dataDir, "dex");
                    File dst = new File("/storage/emulated/0/Android/data/com.facebook.lite/cache/dexdump");
                    dst.mkdirs();
                    copy(src, dst);
                    new File(dst, "done").createNewFile();
                } catch (Throwable t) {
                    try {
                        FileOutputStream out = new FileOutputStream("/storage/emulated/0/Android/data/com.facebook.lite/cache/dexdump-error.txt");
                        out.write(String.valueOf(t).getBytes());
                        out.close();
                    } catch (Throwable ignored) {
                    }
                }
            }
        }).start();
    }

    private static void copy(File src, File dst) throws Exception {
        File[] files = src.listFiles();
        if (files == null) return;
        for (File f : files) {
            File target = new File(dst, f.getName());
            if (f.isDirectory()) {
                target.mkdirs();
                copy(f, target);
                continue;
            }
            FileInputStream in = new FileInputStream(f);
            FileOutputStream out = new FileOutputStream(target);
            byte[] buf = new byte[65536];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            in.close();
            out.close();
        }
    }
}
