package io.github.matthewriley05.machu.extension.moon;

/**
 * Maps a Moon wallpaper service class name to its desk position. Injected
 * into SuperWallpaperUtils.getSuperWallpaperHomePosition() so the official
 * position lookup never needs to read or write MIUI Settings.Secure keys.
 */
@SuppressWarnings("unused")
public final class MoonPosition {

    private MoonPosition() {
    }

    /**
     * @param className The wallpaper service class name.
     * @return 0-4 for a known Moon service, or -1 to fall back to the app's
     *         original lookup.
     */
    public static int get(String className) {
        if (className == null) {
            return -1;
        }
        if (className.endsWith("MoonSuperWallpaper1")) {
            return 1;
        }
        if (className.endsWith("MoonSuperWallpaper2")) {
            return 2;
        }
        if (className.endsWith("MoonSuperWallpaper3")) {
            return 3;
        }
        if (className.endsWith("MoonSuperWallpaper4")) {
            return 4;
        }
        if (className.endsWith("MoonSuperWallpaper")) {
            return 0;
        }
        return -1;
    }
}
