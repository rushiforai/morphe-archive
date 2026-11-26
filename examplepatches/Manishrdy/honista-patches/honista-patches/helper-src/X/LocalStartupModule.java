package X;

import android.app.Application;
import android.util.Log;
import dalvik.system.InMemoryDexClassLoader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.nio.ByteBuffer;
import java.security.MessageDigest;

/** Installs the pinned local module through the existing module cache. */
public final class LocalStartupModule {
    private static ClassLoader installed;

    public static synchronized void install(Application app, Class<?> cache) {
        try {
            if (installed != null) return;
            Field slot = cache.getDeclaredField("a");
            if (!Modifier.isStatic(slot.getModifiers()) || slot.getType() != Object.class)
                throw new IllegalStateException("Unexpected module cache field");
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            try (InputStream in = app.getAssets().open("local-startup-module.dex")) {
                byte[] buffer = new byte[8192];
                int count;
                while ((count = in.read(buffer)) != -1) out.write(buffer, 0, count);
            }
            byte[] bytes = out.toByteArray();
            StringBuilder hash = new StringBuilder();
            for (byte b : MessageDigest.getInstance("SHA-256").digest(bytes))
                hash.append(String.format(java.util.Locale.ROOT, "%02x", b & 255));
            if (!hash.toString().equals("60f049a8f1ae8c7506f28b769850ce0f5a81a9a35ce6eae8b0ff48f5174761e6"))
                throw new IllegalStateException("Unexpected startup module");
            ClassLoader loader = new InMemoryDexClassLoader(ByteBuffer.wrap(bytes), app.getClassLoader());
            // Module initialization resolves sibling entry points through this
            // cache, so publish it before invoking readiness (as upstream does).
            slot.setAccessible(true);
            slot.set(null, loader);
            // This is the same readiness entry used by the original loader.
            if (!Boolean.TRUE.equals(loader.loadClass("X.ilvkq3r3ff2").getMethod("m").invoke(null)))
                throw new IllegalStateException("Startup module not ready");
            installed = loader;
            Log.i("HonistaIntegrity", "Installed pinned startup module in existing module cache");
        } catch (Exception error) {
            throw new IllegalStateException("Cannot install local startup module", error);
        }
    }
}
