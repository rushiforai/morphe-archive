package app.immersivekeyboard.extension;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;

/**
 * The still wallpapers that come with the phone, offered as light and dark mode wallpapers.
 * vivo keeps them as plain images in places any app can read: its theme resource package
 * (the Themes app's wallpapers and the wallpapers of its built-in themes), the video
 * wallpaper package (each video has a still of its own), and system folders (the default
 * theme, the color wallpapers and the lock screen photos).
 */
final class VivoWallpapers {
    private static final String TAG = "ImmersiveKB";
    private static final String THEME_PACKAGE = "com.bbk.theme.resources";
    private static final String THEME_PATH = "/system/app/VivoThemeRes/VivoThemeRes.apk";
    private static final String VIDEO_PACKAGE = "com.vivo.livewallpaper.boxres";
    private static final String VIDEO_PATH =
            "/system/app/LiveWallpaperBoxRes/LiveWallpaperBoxRes.apk";
    private static final String THEME_WALLPAPER = "content/wallpaper/default_wallpaper.png";

    private static final Pattern IMAGE =
            Pattern.compile("res/drawable[^/]*/wallpaper_(\\d+)_cropflag\\d+\\.(png|jpg|webp)");
    private static final Pattern THEME = Pattern.compile("res/raw[^/]*/themes_[^/]+\\.itz");
    private static final Pattern VIDEO_STILL = Pattern.compile("assets/.+/icon_fold\\.jpg");

    private static final ExecutorService LOADER = Executors.newFixedThreadPool(2);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private VivoWallpapers() {
    }

    /** One wallpaper: where the full image is, and where a smaller one to preview is. */
    private static final class Wallpaper {
        final WallpaperSwitch.Source full;
        final WallpaperSwitch.Source preview;

        Wallpaper(WallpaperSwitch.Source full, WallpaperSwitch.Source preview) {
            this.full = full;
            this.preview = preview;
        }
    }

    /** Whether this phone has vivo's wallpapers. */
    static boolean available(Context context) {
        return apk(context, THEME_PACKAGE, THEME_PATH) != null
                || apk(context, VIDEO_PACKAGE, VIDEO_PATH) != null
                || new File("/system/etc/custom/papercolor").isDirectory();
    }

    private static File apk(Context context, String packageName, String fallbackPath) {
        try {
            File file = new File(context.getPackageManager()
                    .getApplicationInfo(packageName, 0).sourceDir);
            if (file.canRead()) {
                return file;
            }
        } catch (Throwable ignored) {
            // Not visible to this app; try where vivo puts it.
        }
        File fallback = new File(fallbackPath);
        return fallback.canRead() ? fallback : null;
    }

    /** Shows the wallpapers in a grid; the one tapped becomes the mode's wallpaper. */
    static void choose(Context activity, boolean light, Runnable done) {
        Toast loading = Toast.makeText(activity, "Loading vivo wallpapers…", Toast.LENGTH_SHORT);
        loading.show();
        LOADER.execute(() -> {
            List<Wallpaper> wallpapers = find(activity);
            MAIN.post(() -> {
                loading.cancel();
                if (wallpapers.isEmpty()) {
                    Toast.makeText(activity, "No vivo wallpapers found",
                            Toast.LENGTH_SHORT).show();
                    return;
                }
                show(activity, wallpapers, light, done);
            });
        });
    }

    private static List<Wallpaper> find(Context context) {
        List<Wallpaper> found = new ArrayList<>();
        File themes = apk(context, THEME_PACKAGE, THEME_PATH);
        if (themes != null) {
            try (ZipFile zip = new ZipFile(themes)) {
                List<String[]> numbered = new ArrayList<>();
                List<String> themeFiles = new ArrayList<>();
                Enumeration<? extends ZipEntry> entries = zip.entries();
                while (entries.hasMoreElements()) {
                    String name = entries.nextElement().getName();
                    Matcher matcher = IMAGE.matcher(name);
                    if (matcher.matches()) {
                        numbered.add(new String[]{name, matcher.group(1)});
                    } else if (THEME.matcher(name).matches()) {
                        themeFiles.add(name);
                    }
                }
                numbered.sort((a, b) -> Integer.compare(Integer.parseInt(a[1]),
                        Integer.parseInt(b[1])));
                for (String[] image : numbered) {
                    String base = image[0].substring(0, image[0].lastIndexOf('.'));
                    String preview = image[0];
                    for (String extension : new String[]{".png", ".jpg", ".webp"}) {
                        if (zip.getEntry(base + "_small" + extension) != null) {
                            preview = base + "_small" + extension;
                        }
                    }
                    found.add(new Wallpaper(entry(themes, image[0]), entry(themes, preview)));
                }
                // Built-in themes are packages of their own, each with a wallpaper inside.
                themeFiles.sort(null);
                for (String theme : themeFiles) {
                    if (contains(zip, theme, THEME_WALLPAPER)) {
                        WallpaperSwitch.Source source = nested(themes, theme, THEME_WALLPAPER);
                        found.add(new Wallpaper(source, source));
                    }
                }
            } catch (Throwable failure) {
                Log.w(TAG, "could not read vivo theme wallpapers", failure);
            }
        }

        File videos = apk(context, VIDEO_PACKAGE, VIDEO_PATH);
        if (videos != null) {
            try (ZipFile zip = new ZipFile(videos)) {
                List<String> stills = new ArrayList<>();
                Enumeration<? extends ZipEntry> entries = zip.entries();
                while (entries.hasMoreElements()) {
                    String name = entries.nextElement().getName();
                    if (VIDEO_STILL.matcher(name).matches()) {
                        stills.add(name);
                    }
                }
                stills.sort(null);
                for (String still : stills) {
                    // icon_fold is sized for the inner screen, icon for the cover screen.
                    String cover = still.replace("icon_fold.jpg", "icon.jpg");
                    found.add(new Wallpaper(entry(videos, still),
                            entry(videos, zip.getEntry(cover) != null ? cover : still)));
                }
            } catch (Throwable failure) {
                Log.w(TAG, "could not read vivo video wallpapers", failure);
            }
        }

        addFile(found, new File("/system/etc/theme/content/wallpaper/default_wallpaper.png"),
                null);
        File[] colors = new File("/system/etc/custom/papercolor").listFiles();
        if (colors != null) {
            Arrays.sort(colors);
            for (File color : colors) {
                addFile(found, new File(color, "default_wallpaper.png"), null);
            }
        }
        // The lock screen photos, each in an inner screen and a cover screen version.
        File[] photoFolders = new File("/system/media/wallpaper").listFiles(File::isDirectory);
        if (photoFolders != null) {
            for (File folder : photoFolders) {
                File[] photos = folder.listFiles((directory, name) -> name.endsWith("_hor.jpg"));
                if (photos == null) {
                    continue;
                }
                Arrays.sort(photos, (a, b) -> Integer.compare(number(a), number(b)));
                for (File photo : photos) {
                    File cover = new File(folder, photo.getName().replace("_hor.", "_ver."));
                    addFile(found, photo, cover.canRead() ? cover : null);
                }
            }
        }
        return found;
    }

    private static int number(File file) {
        String digits = file.getName().replaceAll("\\D", "");
        try {
            return digits.isEmpty() ? 0 : Integer.parseInt(digits);
        } catch (NumberFormatException tooLong) {
            return 0;
        }
    }

    private static void addFile(List<Wallpaper> found, File file, File preview) {
        if (file.canRead()) {
            File small = preview != null ? preview : file;
            found.add(new Wallpaper(() -> new FileInputStream(file),
                    () -> new FileInputStream(small)));
        }
    }

    private static WallpaperSwitch.Source entry(File apk, String name) {
        return () -> new EntryStream(new ZipFile(apk), name);
    }

    /** An image inside a package that is itself stored inside the APK. */
    private static WallpaperSwitch.Source nested(File apk, String outer, String inner) {
        return () -> {
            EntryStream outerStream = new EntryStream(new ZipFile(apk), outer);
            ZipInputStream zip = new ZipInputStream(outerStream);
            ZipEntry entry;
            while ((entry = zip.getNextEntry()) != null) {
                if (entry.getName().equals(inner)) {
                    return zip;
                }
            }
            zip.close();
            throw new IOException(inner + " not found");
        };
    }

    private static boolean contains(ZipFile zip, String outer, String inner) {
        try (ZipInputStream nested = new ZipInputStream(
                zip.getInputStream(zip.getEntry(outer)))) {
            ZipEntry entry;
            while ((entry = nested.getNextEntry()) != null) {
                if (entry.getName().equals(inner)) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
            // Not a theme package after all.
        }
        return false;
    }

    private static void show(Context activity, List<Wallpaper> wallpapers, boolean light,
            Runnable done) {
        float density = activity.getResources().getDisplayMetrics().density;
        int gap = Math.round(8 * density);
        GridView grid = new GridView(activity);
        grid.setNumColumns(3);
        grid.setHorizontalSpacing(gap);
        grid.setVerticalSpacing(gap);
        grid.setPadding(gap * 2, gap, gap * 2, gap);
        grid.setClipToPadding(false);
        int width = (activity.getResources().getDisplayMetrics().widthPixels * 7 / 10) / 3;
        int height = Math.round(width * 19f / 9f);
        grid.setAdapter(new Previews(wallpapers, width, height, Math.round(6 * density)));

        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle(light ? "vivo wallpaper for light mode" : "vivo wallpaper for dark mode")
                .setView(grid)
                .setNegativeButton(android.R.string.cancel, null)
                .create();
        grid.setOnItemClickListener((parent, view, position, id) -> {
            dialog.dismiss();
            WallpaperSwitch.save(activity, wallpapers.get(position).full, light, done);
        });
        dialog.show();
    }

    /** Thumbnails, decoded off the main thread as they scroll into view. */
    private static final class Previews extends BaseAdapter {
        private final List<Wallpaper> wallpapers;
        private final int width;
        private final int height;
        private final int corner;
        private final Map<Integer, Bitmap> cache = new ConcurrentHashMap<>();

        Previews(List<Wallpaper> wallpapers, int width, int height, int corner) {
            this.wallpapers = wallpapers;
            this.width = width;
            this.height = height;
            this.corner = corner;
        }

        @Override
        public int getCount() {
            return wallpapers.size();
        }

        @Override
        public Object getItem(int position) {
            return wallpapers.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            ImageView image = convertView instanceof ImageView ? (ImageView) convertView
                    : new ImageView(parent.getContext());
            image.setLayoutParams(new GridView.LayoutParams(width, height));
            image.setScaleType(ImageView.ScaleType.CENTER_CROP);
            image.setClipToOutline(true);
            image.setOutlineProvider(new android.view.ViewOutlineProvider() {
                @Override
                public void getOutline(View view, android.graphics.Outline outline) {
                    outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), corner);
                }
            });
            image.setBackgroundColor(0x22888888);
            image.setTag(position);
            Bitmap cached = cache.get(position);
            image.setImageBitmap(cached);
            if (cached == null) {
                WallpaperSwitch.Source source = wallpapers.get(position).preview;
                LOADER.execute(() -> {
                    Bitmap bitmap = decode(source);
                    if (bitmap == null) {
                        return;
                    }
                    cache.put(position, bitmap);
                    MAIN.post(() -> {
                        if (Integer.valueOf(position).equals(image.getTag())) {
                            image.setImageBitmap(bitmap);
                        }
                    });
                });
            }
            return image;
        }

        private Bitmap decode(WallpaperSwitch.Source source) {
            try {
                BitmapFactory.Options bounds = new BitmapFactory.Options();
                bounds.inJustDecodeBounds = true;
                try (InputStream input = source.open()) {
                    BitmapFactory.decodeStream(input, null, bounds);
                }
                int sample = 1;
                while (bounds.outWidth / (sample * 2) >= width
                        && bounds.outHeight / (sample * 2) >= height) {
                    sample *= 2;
                }
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inSampleSize = sample;
                Bitmap decoded;
                try (InputStream input = source.open()) {
                    decoded = BitmapFactory.decodeStream(input, null, options);
                }
                if (decoded == null || decoded.getWidth() <= width) {
                    return decoded;
                }
                // Keep the grid's memory small: only what the cell shows.
                Bitmap scaled = Bitmap.createScaledBitmap(decoded, width,
                        Math.max(1, Math.round(decoded.getHeight() * width
                                / (float) decoded.getWidth())), true);
                if (scaled != decoded) {
                    decoded.recycle();
                }
                return scaled;
            } catch (Throwable failure) {
                return null;
            }
        }
    }

    /** One file inside a package, closing the package along with the stream. */
    private static final class EntryStream extends FilterInputStream {
        private final ZipFile zip;

        EntryStream(ZipFile zip, String entry) throws IOException {
            super(open(zip, entry));
            this.zip = zip;
        }

        private static InputStream open(ZipFile zip, String entry) throws IOException {
            ZipEntry zipEntry = zip.getEntry(entry);
            if (zipEntry == null) {
                zip.close();
                throw new IOException(entry + " not found");
            }
            return zip.getInputStream(zipEntry);
        }

        @Override
        public void close() throws IOException {
            try {
                super.close();
            } finally {
                zip.close();
            }
        }
    }
}
