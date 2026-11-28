package com.waze.gw;

import android.content.Context;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Waze extracts assets/res into its private data directory and only does it again when the app's versionCode
 * grows, so a mod build that edits a packaged image or the map scenes would keep running the stock ones. This copies
 * the mod-edited files (see PINS, SKIN_VARIANTS, MAP_SCENES) into that cache after Waze has prepared it (hooked at the end of
 * com.waze.resources.g.a()).
 */
public final class ModAssets {
    private static final String TAG = "WazeModAssets";
    /** Round speed-limit pins for 100/110/120 km/h, named by the native pin patch (segment_native.c, limit_pin_*). */
    private static final String[] PINS = {
            "bigpin_speed_limit_world_100", "bigpin_speed_limit_world_110", "bigpin_speed_limit_world_120"};
    private static final String[] SUFFIXES = {"", "@2x", "@3x"};
    /** Lua skins whose colours the patch edits: the skin and the experiment skin next to it, day and night, map editor too. */
    private static final String[] SKIN_DIRECTORIES = {"", "experiment/"};
    private static final String[] SKIN_VARIANTS = {"day", "night", "editor.day", "editor.night"};
    /** Godot scenes of the map; the mod swaps the speedometer's speed and speed-limit positions (tools/patch_pck_speedometer.py). */
    private static final String MAP_SCENES = "waze_map_scenes.pck";

    private ModAssets() { }

    public static void afterResourcesPrepared() {
        try {
            Context context = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke((Object) null);
            if (context == null) return;
            File dataRoot = context.getFilesDir().getParentFile();
            if (dataRoot == null) return;
            int refreshed = 0;
            File skins = new File(dataRoot, "waze/skins/default");
            if (skins.isDirectory()) {
                for (String pin : PINS) {
                    for (String suffix : SUFFIXES) {
                        String file = pin + suffix + ".png";
                        if (refresh(context, "res/skins/default/" + file, new File(skins, file))) refreshed++;
                    }
                }
                // The map colours the patch writes into the lua skins.
                for (String directory : SKIN_DIRECTORIES) {
                    for (String variant : SKIN_VARIANTS) {
                        String file = directory + "skin_values." + variant + ".lua";
                        if (new File(skins, file).isFile()
                                && refresh(context, "res/skins/default/" + file, new File(skins, file))) refreshed++;
                    }
                }
            }
            File scenes = new File(dataRoot, "waze/godot/" + MAP_SCENES);
            if (!scenes.isFile()) Log.w(TAG, "map scenes cache not found at " + scenes);
            else if (refresh(context, "res/godot/" + MAP_SCENES, scenes)) refreshed++;
            if (refreshed > 0) Log.i(TAG, "refreshed " + refreshed + " cached files");
        } catch (Throwable t) {
            Log.w(TAG, "cache refresh failed", t);
        }
    }

    /** Copies the packaged asset over the cached file when their bytes differ. */
    private static boolean refresh(Context context, String assetPath, File destination) throws IOException {
        if (destination.isFile() && sameBytes(context, assetPath, destination)) return false;
        File temporary = new File(destination.getPath() + ".wzmod.tmp");
        try (InputStream in = context.getAssets().open(assetPath);
             OutputStream out = new FileOutputStream(temporary, false)) {
            byte[] buffer = new byte[65536];
            int read;
            while ((read = in.read(buffer)) >= 0) out.write(buffer, 0, read);
            out.flush();
        }
        if (destination.exists() && !destination.delete()) {
            temporary.delete();
            throw new IOException("Cannot replace " + destination);
        }
        if (!temporary.renameTo(destination)) {
            temporary.delete();
            throw new IOException("Cannot install " + destination);
        }
        return true;
    }

    private static boolean sameBytes(Context context, String assetPath, File file) throws IOException {
        try (InputStream packaged = context.getAssets().open(assetPath);
             InputStream cached = new FileInputStream(file)) {
            byte[] a = new byte[65536];
            byte[] b = new byte[65536];
            while (true) {
                int na = readFully(packaged, a);
                int nb = readFully(cached, b);
                if (na != nb) return false;
                if (na <= 0) return true;
                for (int i = 0; i < na; i++) if (a[i] != b[i]) return false;
            }
        }
    }

    private static int readFully(InputStream in, byte[] buffer) throws IOException {
        int total = 0;
        while (total < buffer.length) {
            int read = in.read(buffer, total, buffer.length - total);
            if (read < 0) break;
            total += read;
        }
        return total;
    }
}
