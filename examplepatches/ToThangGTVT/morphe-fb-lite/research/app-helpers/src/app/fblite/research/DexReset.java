package app.fblite.research;

import android.content.Context;

import java.io.File;

/** Deletes the unpacked secondary dex when cache/fblite-reset-dex exists, to reproduce a first launch. Research only. */
public final class DexReset {
    public static void run(Context context) {
        try {
            File trigger = new File("/storage/emulated/0/Android/data/com.facebook.lite/cache/fblite-reset-dex");
            if (!trigger.exists()) return;
            trigger.delete();
            String data = context.getApplicationInfo().dataDir;
            delete(new File(data, "dex"));
            new File(data, "shared_prefs/primary_dex_features.xml").delete();
        } catch (Throwable ignored) {
        }
    }

    private static void delete(File f) {
        File[] children = f.listFiles();
        if (children != null) for (File c : children) delete(c);
        f.delete();
    }
}
