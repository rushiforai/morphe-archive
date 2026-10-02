package app.fblite.research;

import android.content.Context;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Field;

import dalvik.system.DexFile;
import dalvik.system.PathClassLoader;

/** Writes why OriginalRasterizer could not load the original X.0eF. Research only. */
public final class FallbackProbe {
    private static final String OUT = "/storage/emulated/0/Android/data/com.facebook.lite/cache/fallback-probe.txt";

    public static void run(final Context context) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                StringBuilder sb = new StringBuilder();
                try {
                    Thread.sleep(15000);
                    ClassLoader app = FallbackProbe.class.getClassLoader();
                    Class<?> or = Class.forName("app.fblite.extension.feedfont.OriginalRasterizer", false, app);
                    for (String f : new String[] {"failed", "constructor"}) {
                        Field field = or.getDeclaredField(f);
                        field.setAccessible(true);
                        sb.append(f).append('=').append(field.get(null)).append('\n');
                    }
                    Class<?> r = Class.forName("X.0eF", false, app);
                    boolean ours = false;
                    for (java.lang.reflect.Method m : r.getDeclaredMethods()) if (m.getName().equals("canDraw")) ours = true;
                    sb.append("X.0eF ours=").append(ours).append(" loader=").append(r.getClassLoader()).append('\n');
                    sb.append("X.0e1 loader=").append(Class.forName("X.0e1", false, app).getClassLoader()).append('\n');
                    sb.append("app loader=").append(app).append(" parent=").append(app.getParent()).append('\n');
                    sb.append("context loader=").append(context.getClassLoader()).append('\n');
                    sb.append("preload=").append(PreloadProbe.result).append('\n');
                    File[] files = new File(context.getApplicationInfo().dataDir, "dex").listFiles();
                    if (files != null) for (File f : files) sb.append("file ").append(f.getName()).append(" w=").append(f.canWrite()).append('\n');
                    Class<?> loaderClass = Class.forName("X.09K", false, app);
                    Object loader = loaderClass.getField("A0A").get(null);
                    sb.append("09K.A0A=").append(loader).append('\n');
                    DexFile[] dexFiles = (DexFile[]) loaderClass.getField("A02").get(loader);
                    final ClassLoader hide = new ClassLoader(app) {
                        @Override
                        protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
                            if (name.equals("X.0eF")) throw new ClassNotFoundException(name);
                            return super.loadClass(name, resolve);
                        }
                    };
                    for (DexFile dex : dexFiles) {
                        sb.append("A02 ").append(dex == null ? "null" : dex.getName()).append('\n');
                        if (dex == null || dex.getName().endsWith(".apk")) continue;
                        try {
                            Class<?> c = new PathClassLoader(dex.getName(), hide).loadClass("X.0eF");
                            sb.append("  loaded ").append(c).append('\n');
                        } catch (Throwable t) {
                            sb.append("  ").append(trace(t)).append('\n');
                        }
                    }
                } catch (Throwable t) {
                    sb.append("probe error ").append(trace(t)).append('\n');
                }
                try {
                    FileWriter w = new FileWriter(OUT);
                    w.write(sb.toString());
                    w.close();
                } catch (Throwable ignored) {
                }
            }
        }).start();
    }

    private static String trace(Throwable t) {
        StringWriter sw = new StringWriter();
        t.printStackTrace(new PrintWriter(sw));
        String s = sw.toString();
        return s.length() > 1500 ? s.substring(0, 1500) : s;
    }
}
