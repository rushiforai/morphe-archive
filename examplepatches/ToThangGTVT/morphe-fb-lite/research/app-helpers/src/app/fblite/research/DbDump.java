package app.fblite.research;

import android.content.Context;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/** Copies the app's databases to external storage 20 s after start, when cache/fblite-dbdump exists. Research only. */
public final class DbDump {
    private static final String DIR = "/storage/emulated/0/Android/data/com.facebook.lite/cache/";

    public static void run(final Context context) {
        if (!new File(DIR + "fblite-dbdump").exists()) return;
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Thread.sleep(20000);
                    File src = new File(context.getApplicationInfo().dataDir, "databases");
                    File dst = new File(DIR + "dbdump");
                    dst.mkdirs();
                    File[] files = src.listFiles();
                    if (files != null) for (File f : files) {
                        if (!f.isFile()) continue;
                        FileInputStream in = new FileInputStream(f);
                        FileOutputStream out = new FileOutputStream(new File(dst, f.getName()));
                        byte[] buf = new byte[65536];
                        int n;
                        while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
                        in.close();
                        out.close();
                    }
                    new File(dst, "done").createNewFile();
                } catch (Throwable ignored) {
                }
            }
        }).start();
    }
}
