package app.xposed.extension;

import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.content.res.XmlResourceParser;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;

import org.xmlpull.v1.XmlPullParser;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/**
 * The account card and the post card as PNGs in X's current theme, as X-Posed's Copy and Save
 * make them: copied to the clipboard, saved to Pictures/X-Posed, shared, or handed to X's
 * composer. They are made on the phone and uploaded nowhere unless the user posts them.
 */
final class CardImage {
    enum Action {
        COPY("Copy", "Copy card as an image", Icons.COPY),
        SAVE("Save", "Save card as an image", Icons.DOWNLOAD),
        SHARE("Share", "Share card as an image", Icons.SHARE);

        final String label, description;
        final Glyphs.Glyph icon;

        Action(String label, String description, Glyphs.Glyph icon) {
            this.label = label;
            this.description = description;
            this.icon = icon;
        }
    }

    interface Callback {
        /** Main thread. message is null when there is nothing to say. */
        void onDone(String message, boolean failed);
    }

    interface UriCallback {
        /** Main thread. uri is null when the image couldn't be written; then message says why. */
        void onUri(Uri uri, String message);
    }

    /** What an image shows, for messages, the clipboard and the share sheet. */
    static final class Subject {
        final String noun, clipLabel, shareTitle, shareText;

        /** shareText goes with the image to the app it is shared to, or null. */
        Subject(String noun, String clipLabel, String shareTitle, String shareText) {
            this.noun = noun;
            this.clipLabel = clipLabel;
            this.shareTitle = shareTitle;
            this.shareText = shareText;
        }
    }

    private static final Subject ACCOUNT_CARD = new Subject("card image", "Account card", "Share account card", null);

    private static final String TAG = Hooks.TAG;
    private static final int WIDTH_DP = 400;
    private static final double MAX_PIXELS = 8_000_000;
    /** Below this scale the text of a long post would be too small to read in the image. */
    static final float MIN_POST_SCALE = 0.5f;
    private static final String ALBUM = "X-Posed";
    /** Under the cache directory that X's FileProvider serves. */
    private static final String DIR = "xposed-cards";
    /** Long enough to paste a copied card; files are removed when a later card is made. */
    private static final long KEEP_MS = TimeUnit.DAYS.toMillis(1);
    private static final String FILE_PROVIDER_PATHS = "android.support.FILE_PROVIDER_PATHS";

    private static final ExecutorService io = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "xposed-card-image");
        t.setDaemon(true);
        return t;
    });
    private static final Handler main = new Handler(Looper.getMainLooper());

    /** Image thread only. */
    private static SharedFiles sharedFiles;
    private static boolean sharedFilesResolved;

    /** Thrown when X has no FileProvider for its cache, so Copy and Share can't hand the image to other apps. */
    private static final class NoFileProvider extends IOException {
        NoFileProvider() {
            super("X has no FileProvider for its cache directory");
        }
    }

    /** X's own FileProvider and the cache directory it serves, read from X's manifest. */
    private static final class SharedFiles {
        final String authority, name;
        final File root;

        SharedFiles(String authority, String name, File root) {
            this.authority = authority;
            this.name = name;
            this.root = root;
        }
    }

    private CardImage() {
    }

    /** Makes the image of [card] and copies, saves or shares it. Main thread. */
    static void export(Context context, AccountCard card, Action action, Callback callback) {
        // The image shows the pictures the sheet shows; wait for any still loading.
        List<String> urls = new ArrayList<>();
        List<Integer> sizes = new ArrayList<>();
        if (card.avatarUrl != null && RemoteImages.cached(card.avatarUrl) == null) {
            urls.add(card.avatarUrl);
            sizes.add(AccountCardView.AVATAR_DP);
        }
        if (card.affiliationBadge != null && RemoteImages.cached(card.affiliationBadge) == null) {
            urls.add(card.affiliationBadge);
            sizes.add(AccountCardView.BADGE_DP);
        }
        if (urls.isEmpty()) {
            render(context, card, action, callback);
            return;
        }
        int[] waiting = {urls.size()};
        float density = context.getResources().getDisplayMetrics().density;
        for (int i = 0; i < urls.size(); i++) {
            RemoteImages.load(urls.get(i), Math.round(sizes.get(i) * density), bitmap -> {
                if (--waiting[0] == 0) render(context, card, action, callback);
            });
        }
    }

    private static void render(Context context, AccountCard card, Action action, Callback callback) {
        Bitmap bitmap;
        try {
            Ui ui = new Ui(context);
            bitmap = draw(context, AccountCardView.build(ui, card, false), 0);
        } catch (RuntimeException | OutOfMemoryError e) {
            Log.e(TAG, "Couldn't draw the card image", e);
            callback.onDone("Couldn't create the card image.", true);
            return;
        }
        write(context, bitmap, fileName(card.handle), action, ACCOUNT_CARD, true, callback);
    }

    /**
     * Copies, saves or shares [bitmap] as [name]; recycles it afterwards when [recycle] is set.
     * Main thread.
     */
    static void write(Context context, Bitmap bitmap, String name, Action action, Subject subject, boolean recycle,
                      Callback callback) {
        io.execute(() -> {
            Uri uri = null;
            IOException error = null;
            try {
                if (action == Action.SAVE) {
                    save(context, bitmap, name);
                } else {
                    uri = writeShared(context, bitmap, name);
                }
            } catch (IOException e) {
                error = e;
            } catch (RuntimeException e) {
                error = new IOException(e);
            } finally {
                if (recycle) bitmap.recycle();
            }
            Uri result = uri;
            IOException failure = error;
            main.post(() -> finish(context, action, result, failure, subject, callback));
        });
    }

    /** Writes [bitmap] where X's FileProvider serves it, for X's own composer. Main thread. */
    static void shared(Context context, Bitmap bitmap, String name, UriCallback callback) {
        io.execute(() -> {
            Uri uri = null;
            String message = null;
            try {
                uri = writeShared(context, bitmap, name);
            } catch (NoFileProvider e) {
                message = "This version of X can't attach the image. Save it and add it in X instead.";
            } catch (IOException | RuntimeException e) {
                Log.w(TAG, "Couldn't write the image", e);
                message = "Couldn't create the image.";
            }
            Uri result = uri;
            String failure = message;
            main.post(() -> callback.onUri(result, failure));
        });
    }

    private static void finish(Context context, Action action, Uri uri, IOException error, Subject subject, Callback callback) {
        if (error != null) {
            Log.w(TAG, "Couldn't " + action.label.toLowerCase(Locale.ROOT) + " the " + subject.noun, error);
            if (error instanceof NoFileProvider) {
                callback.onDone("This version of X can't hand images to other apps. Use Save instead.", true);
            } else {
                callback.onDone(action == Action.SAVE ? "Couldn't save the " + subject.noun + "."
                        : "Couldn't create the " + subject.noun + ".", true);
            }
            return;
        }
        switch (action) {
            case SAVE:
                callback.onDone("Saved to Pictures/" + ALBUM + ".", false);
                return;
            case COPY:
                try {
                    ClipboardManager clipboard = context.getSystemService(ClipboardManager.class);
                    clipboard.setPrimaryClip(ClipData.newUri(context.getContentResolver(), subject.clipLabel, uri));
                } catch (RuntimeException e) {
                    Log.w(TAG, "Couldn't copy the " + subject.noun, e);
                    callback.onDone("Couldn't copy the " + subject.noun + ". Use Save or Share instead.", true);
                    return;
                }
                // Android 13 and newer confirm copies themselves.
                callback.onDone(Build.VERSION.SDK_INT < 33 ? "Copied. Paste it wherever images are supported." : null, false);
                return;
            default:
                Intent send = new Intent(Intent.ACTION_SEND)
                        .setType("image/png")
                        .putExtra(Intent.EXTRA_STREAM, uri)
                        .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                if (subject.shareText != null) send.putExtra(Intent.EXTRA_TEXT, subject.shareText);
                // The chooser previews the image and passes the read grant on from the clip.
                send.setClipData(ClipData.newRawUri(null, uri));
                try {
                    context.startActivity(Intent.createChooser(send, subject.shareTitle));
                    callback.onDone(null, false);
                } catch (ActivityNotFoundException e) {
                    callback.onDone("No app can share images.", true);
                }
        }
    }

    /**
     * [content] framed in X's theme, about as wide as a phone screen. Scaled down to the pixel
     * limit, or null when that would scale it below [minScale]. Main thread.
     */
    static Bitmap draw(Context context, View content, float minScale) {
        Ui ui = new Ui(context);
        LinearLayout frame = new LinearLayout(context);
        frame.setOrientation(LinearLayout.VERTICAL);
        // Detached views don't inherit the layout direction, so set it for right-to-left languages.
        frame.setLayoutDirection(context.getResources().getConfiguration().getLayoutDirection());
        int pad = ui.dp(20);
        frame.setPadding(pad, pad, pad, pad);
        frame.setBackgroundColor(ui.background);
        frame.addView(content, Ui.matchWidth());

        int width = ui.dp(WIDTH_DP);
        frame.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        int height = frame.getMeasuredHeight();
        frame.layout(0, 0, width, height);
        float scale = (float) Math.min(1, Math.sqrt(MAX_PIXELS / ((double) width * height)));
        if (scale < minScale) return null;
        Bitmap bitmap = Bitmap.createBitmap(Math.max(1, Math.round(width * scale)), Math.max(1, Math.round(height * scale)),
                Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        canvas.scale(scale, scale);
        frame.draw(canvas);
        return bitmap;
    }

    /** X-Posed's file name for a card. */
    static String fileName(String handle) {
        String safe = handle == null ? "" : handle.replaceAll("[^A-Za-z0-9_]", "");
        return "x-posed-" + (safe.isEmpty() ? "account" : safe) + "-card.png";
    }

    /** Adds the PNG to Pictures/X-Posed, which needs no storage permission. Image thread. */
    private static void save(Context context, Bitmap bitmap, String name) throws IOException {
        ContentResolver resolver = context.getContentResolver();
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
        values.put(MediaStore.MediaColumns.MIME_TYPE, "image/png");
        values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_PICTURES + "/" + ALBUM);
        // Hidden from other apps until it is complete.
        values.put(MediaStore.MediaColumns.IS_PENDING, 1);
        Uri item = resolver.insert(MediaStore.Images.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY), values);
        if (item == null) throw new IOException("The media store refused the image");
        try {
            try (OutputStream out = resolver.openOutputStream(item)) {
                if (out == null || !bitmap.compress(Bitmap.CompressFormat.PNG, 100, out)) {
                    throw new IOException("Couldn't write the image");
                }
            }
            values.clear();
            values.put(MediaStore.MediaColumns.IS_PENDING, 0);
            resolver.update(item, values, null, null);
        } catch (IOException | RuntimeException e) {
            resolver.delete(item, null, null);
            throw e;
        }
    }

    /**
     * Writes the PNG where X's own FileProvider serves files from and returns its content URI,
     * which other apps can read once X grants them access. Image thread.
     */
    private static Uri writeShared(Context context, Bitmap bitmap, String name) throws IOException {
        SharedFiles shared = sharedFiles(context);
        if (shared == null) throw new NoFileProvider();
        File dir = new File(shared.root, DIR);
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("Couldn't create " + dir);
        deleteOld(dir);
        File file = new File(dir, name);
        try (FileOutputStream out = new FileOutputStream(file)) {
            if (!bitmap.compress(Bitmap.CompressFormat.PNG, 100, out)) throw new IOException("Couldn't write the image");
        }
        // FileProvider's URI form: content://<authority>/<root name>/<path under the root>.
        Uri uri = new Uri.Builder()
                .scheme(ContentResolver.SCHEME_CONTENT)
                .authority(shared.authority)
                .encodedPath("/" + Uri.encode(shared.name) + "/" + Uri.encode(DIR + "/" + name, "/"))
                .build();
        // Fails unless the provider serves the file, as a standard FileProvider does.
        try (ParcelFileDescriptor fd = context.getContentResolver().openFileDescriptor(uri, "r")) {
            if (fd == null) throw new IOException("X's FileProvider didn't open " + uri);
        }
        return uri;
    }

    private static void deleteOld(File dir) {
        File[] files = dir.listFiles();
        if (files == null) return;
        long cutoff = System.currentTimeMillis() - KEEP_MS;
        for (File f : files) {
            if (f.lastModified() < cutoff && !f.delete()) Log.w(TAG, "Couldn't delete " + f);
        }
    }

    /**
     * X's FileProvider for a directory in its cache: one that X declares, else any other. Read
     * from the manifest, since the provider and its paths are X's to rename. Image thread.
     */
    private static SharedFiles sharedFiles(Context context) {
        if (sharedFilesResolved) return sharedFiles;
        sharedFilesResolved = true;
        try {
            PackageManager pm = context.getPackageManager();
            PackageInfo pkg = pm.getPackageInfo(context.getPackageName(), PackageManager.GET_PROVIDERS | PackageManager.GET_META_DATA);
            if (pkg.providers == null) return null;
            boolean foundX = false;
            for (ProviderInfo p : pkg.providers) {
                // FileProvider requires exported="false" and grantUriPermissions="true".
                if (p.exported || !p.grantUriPermissions || p.authority == null || p.metaData == null
                        || !p.metaData.containsKey(FILE_PROVIDER_PATHS)) continue;
                boolean isX = p.name.startsWith("com.x.") || p.name.startsWith("com.twitter.");
                if (foundX && !isX) continue;
                SharedFiles found = cachePath(context, pm, p);
                if (found == null) continue;
                sharedFiles = found;
                foundX = isX;
                if (isX) break;
            }
        } catch (Exception e) {
            Log.w(TAG, "Couldn't read X's file providers", e);
        }
        return sharedFiles;
    }

    private static SharedFiles cachePath(Context context, PackageManager pm, ProviderInfo p) throws Exception {
        try (XmlResourceParser xml = p.loadXmlMetaData(pm, FILE_PROVIDER_PATHS)) {
            if (xml == null) return null;
            for (int type = xml.next(); type != XmlPullParser.END_DOCUMENT; type = xml.next()) {
                if (type != XmlPullParser.START_TAG || !"cache-path".equals(xml.getName())) continue;
                String name = xml.getAttributeValue(null, "name");
                String path = xml.getAttributeValue(null, "path");
                if (name == null || name.isEmpty()) continue;
                File root = path == null || path.isEmpty() ? context.getCacheDir() : new File(context.getCacheDir(), path);
                return new SharedFiles(p.authority.split(";")[0], name, root);
            }
        }
        return null;
    }
}
