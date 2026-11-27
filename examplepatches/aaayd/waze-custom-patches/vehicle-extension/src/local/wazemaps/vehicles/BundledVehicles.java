package local.wazemaps.vehicles;

import android.content.Context;
import android.util.Log;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;

/** Uses only assets shipped inside this Waze APK; never contacts a server. */
public final class BundledVehicles {
    private static final String TAG = "WazeBundledVehicles";
    private static final String ROOT = "assets/res/skins/default/cars/";
    private static final String[] NAMES = {"cat", "dog", "george_gold", "george_taxi",
        "ghost_halo", "mcfioti", "motorbike", "santa", "wartho_halo"};
    private static Context context() throws ReflectiveOperationException {
        return (Context) Class.forName("com.waze.lx").getMethod("a").invoke(null);
    }
    private static Object call(Object target, String method) throws ReflectiveOperationException {
        return target.getClass().getMethod(method).invoke(target);
    }
    private static boolean bundled(String name) {
        return Arrays.asList(NAMES).contains(name);
    }
    public static Object augmentCars(Object value) {
        if (!(value instanceof List)) return value; // Preserve coroutine suspension/errors.
        try {
            List<?> original = (List<?>) value;
            List<Object> result = new ArrayList<>(original);
            Set<String> names = new HashSet<>();
            for (Object car : original) names.add((String) call(car, "e"));
            Class<?> car = Class.forName("com.waze.copilot.data.c");
            Class<?> info = Class.forName("com.waze.copilot.data.ad");
            Class<?> lighting = Class.forName("com.waze.copilot.data.ae");
            Class<?> download = Class.forName("com.waze.copilot.data.a");
            Class<?> preview = Class.forName("com.waze.copilot.data.b");
            Constructor<?> ctor = car.getConstructor(long.class, String.class, info, download, preview);
            Context ctx = context();
            Set<String> assets = new HashSet<>(Arrays.asList(ctx.getAssets().list("res/skins/default/cars")));
            for (int i = 0; i < NAMES.length; i++) {
                String name = NAMES[i];
                String texture = name + (name.equals("motorbike") ? "_texture.png" : "_texture_normal.png");
                if (names.contains(name) || !assets.contains(name + "_model.obj") || !assets.contains(texture)) continue;
                Object light = lighting.getConstructor(float.class, Float.class).newInstance(1.0f, Float.valueOf(0.0f));
                Object model = info.getConstructor(boolean.class, boolean.class, boolean.class, float.class, lighting)
                    .newInstance(true, false, false, 1.0f, light);
                Object source = download.getConstructor(long.class, String.class).newInstance(1L, "");
                Object thumbnail = preview.getConstructor(String.class).newInstance((Object) null);
                // Negative IDs identify local entries without colliding with server catalogue IDs.
                result.add(ctor.newInstance(-9001L - i, name, model, source, thumbnail));
            }
            Log.i(TAG, "Added " + (result.size() - original.size()) + " bundled models");
            return result;
        } catch (Exception e) {
            Log.e(TAG, "Could not extend car catalogue", e);
            return value;
        }
    }
    public static boolean prepare(Object car) {
        try {
            String name = (String) call(car, "e");
            long id = ((Number) call(car, "a")).longValue();
            int index = Arrays.asList(NAMES).indexOf(name);
            if (!bundled(name) || id != -9001L - index) return false;
            Context ctx = context();
            File directory = new File(ctx.getFilesDir().getParentFile(), "waze/skins/default/cars");
            if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Cannot create cars directory");
            copyAsset(ctx, name + "_model.obj", new File(directory, name + "_model.obj"));
            String texture = name + (name.equals("motorbike") ? "_texture.png" : "_texture_normal.png");
            copyAsset(ctx, texture, new File(directory, name + "_texture_normal.png"));
            Log.i(TAG, "Prepared bundled model: " + name);
            return true;
        } catch (Exception e) {
            Log.e(TAG, "Could not prepare bundled car", e);
            return false;
        }
    }
    private static void copyAsset(Context ctx, String asset, File destination) throws IOException {
        // Allowlisted names above keep all writes inside Waze's own car resource directory.
        try (InputStream in = ctx.getAssets().open("res/skins/default/cars/" + asset)) {
            if (destination.isFile() && destination.length() == in.available()) return;
            File temporary = new File(destination.getPath() + ".morphe-tmp");
            try (OutputStream out = new FileOutputStream(temporary)) {
                byte[] buffer = new byte[8192];
                int read;
                while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
            }
            if (!temporary.renameTo(destination)) throw new IOException("Cannot install bundled car asset");
        }
    }
}
