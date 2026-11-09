package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;

/**
 * A post-bar download for pictures, GIFs, Reddit video, and RedGifs.
 * Joey's download service still saves the file. The default is one tap and no chooser.
 */
public final class MediaDownload {
    private static final String PREFS = "mighty_morphing";
    private static final String KEY_ORDER = "download_name_order";
    private static final String KEY_ON = "download_name_on";
    private static final String BUTTON = "morphe_download";
    private static final String[][] PARTS = {
            {"subreddit", "Subreddit"},
            {"author", "Username"},
            {"title", "Title"},
            {"id", "Post id"},
            {"resolution", "Resolution"},
            {"date", "Date"},
    };
    private static final Map<String, String> NAMES = new ConcurrentHashMap<>();
    private static final ConcurrentLinkedQueue<String> VIDEOS = new ConcurrentLinkedQueue<>();
    private static final Map<String, Boolean> ARMED = new ConcurrentHashMap<>();
    private static boolean naming;
    /** The post opened in the viewer, used when its download address differs from the feed. */
    private static File current;
    /** Applied once, when Joey's own file name does not match the address we registered. */
    private static volatile String pending;
    /** Recent posts, so the full-screen viewer can use the same file name. */
    private static final Map<String, File> KNOWN = Collections.synchronizedMap(new LinkedHashMap<String, File>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, File> eldest) {
            return size() > 80;
        }
    });
    private static final Map<View, Object> POSTS = new java.util.WeakHashMap<>();

    private MediaDownload() {
    }

    /** Joey is about to copy a finished file into the gallery. */
    public static String fileName(String joeyName) {
        if (joeyName == null) return null;
        String leaf = joeyName;
        int slash = Math.max(joeyName.lastIndexOf('/'), joeyName.lastIndexOf('\\'));
        if (slash >= 0 && slash < joeyName.length() - 1) leaf = joeyName.substring(slash + 1);
        String wanted = take(leaf);
        if (wanted == null && !leaf.equals(joeyName)) wanted = take(joeyName);
        if (wanted != null) {
            pending = null;
            return wanted;
        }
        int split = leaf.indexOf('_');
        if (split > 0 && leaf.substring(0, split).matches("\\d+")) {
            wanted = take(leaf.substring(split + 1));
            if (wanted != null) return wanted;
        }
        if (leaf.matches("[0-9a-fA-F]{6}\\.mp4")) {
            String video = VIDEOS.poll();
            if (video != null) {
                pending = null;
                return video;
            }
        }
        if (pending != null) {
            String name = pending;
            pending = null;
            return name;
        }
        return joeyName;
    }

    private static String take(String key) {
        if (key == null || key.isEmpty()) return null;
        String wanted = NAMES.remove(key);
        if (wanted != null) return wanted;
        for (String stored : NAMES.keySet()) {
            if (stored.equalsIgnoreCase(key)) return NAMES.remove(stored);
        }
        return null;
    }

    /** The feed is opening this post in the viewer. Keep it for the viewer's download button. */
    public static void note(Object submission) {
        if (submission == null) return;
        catalog(submission);
        List<File> files = files(submission);
        current = files.isEmpty() ? describe(submission, text(submission, "g0")) : files.get(0);
    }

    /** The viewer calls Joey's save directly. Register the chosen name first. */
    public static void prepare(Activity activity, String url) {
        if (activity == null || url == null || url.isEmpty()) return;
        if (!ModernUi.isModernUiEnabled(activity)) return;
        String leaf = joeyLeaf(url);
        if (ARMED.remove(leaf) != null) return;
        File known = KNOWN.get(leaf);
        if (known == null) {
            synchronized (KNOWN) {
                for (Map.Entry<String, File> entry : KNOWN.entrySet()) {
                    String key = entry.getKey();
                    if (key.startsWith("id:") && key.length() > 5 && url.contains(key.substring(3))) {
                        known = entry.getValue();
                        break;
                    }
                }
            }
        }
        if (known == null && viewer(activity)) known = current;
        if (known == null) return;
        File copy = copy(known);
        copy.url = url;
        String lower = url.toLowerCase(Locale.US);
        copy.video = known.video || lower.contains("v.redd.it") || lower.contains(".mp4");
        naming = true;
        try {
            remember(activity, copy, 0);
        } finally {
            naming = false;
        }
    }

    public static void attach(View item, Object submission) {
        if (item == null) return;
        catalog(submission);
        View barView = find(item, "actionbar_layout");
        if (!(barView instanceof ViewGroup)) return;
        ViewGroup bar = (ViewGroup) barView;
        ImageView button = (ImageView) button(item);
        View sample = find(item, "save");
        if (sample == null || sample.getParent() != bar) sample = find(item, "share_icon");
        if (button != null && !button.getClass().getName().endsWith("CImageView")) {
            bar.removeView(button);
            button = null;
        }
        if (button == null) {
            button = joeyIcon(item.getContext());
            if (button == null) return;
            button.setTag(BUTTON);
            button.setContentDescription("Download");
            button.setClickable(true);
            button.setLayoutParams(iconParams(bar, sample));
            if (sample != null) {
                button.setPadding(sample.getPaddingLeft(), sample.getPaddingTop(),
                        sample.getPaddingRight(), sample.getPaddingBottom());
            }
            button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            paintFloppy(button, sample);
            button.setOnClickListener(MediaDownload::onClick);
            int after = sample != null && sample.getParent() == bar ? bar.indexOfChild(sample) + 1 : bar.getChildCount();
            bar.addView(button, Math.max(0, Math.min(after, bar.getChildCount())));
        } else {
            paintFloppy(button, sample);
        }
        POSTS.put(button, submission);
        button.setVisibility(showButton(item, submission) ? View.VISIBLE : View.GONE);
        restoreSave(item);
    }

    /** Joey already shows the link icon for a non-text post. Keep web links and YouTube off the button. */
    private static boolean showButton(View item, Object submission) {
        if (submission == null || album(submission)) return false;
        View link = find(item, "link_icon");
        if (link == null || link.getVisibility() != View.VISIBLE) return false;
        if (!files(submission).isEmpty()) return true;
        String url = text(submission, "g0");
        String domain = text(submission, "R");
        if (url != null && (url.contains("v.redd.it") || direct(url)
                || url.toLowerCase(Locale.US).contains("redgifs.com"))) return true;
        if (domain == null) return false;
        String host = domain.toLowerCase(Locale.US);
        return host.equals("i.redd.it") || host.equals("v.redd.it") || host.equals("preview.redd.it")
                || host.equals("i.imgur.com") || host.contains("redgifs.com");
    }

    static View button(View item) {
        View barView = find(item, "actionbar_layout");
        if (!(barView instanceof ViewGroup)) return null;
        ViewGroup bar = (ViewGroup) barView;
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getId() == View.NO_ID && BUTTON.equals(child.getTag())) return child;
        }
        return null;
    }

    public static void show(Activity activity) {
        List<String> order = order(activity);
        JSONObject on = included(activity);
        LinearLayout page = MorpheDialog.page(activity, "Downloads",
                "A picture, GIF, or video saves straight away. "
                        + "Drag a part to build the file name. Add keeps that part in the name.");
        TextView sample = new TextView(activity);
        sample.setTextColor(MorpheDialog.sub(activity));
        sample.setTextSize(13);
        sample.setTypeface(sample.getTypeface(), android.graphics.Typeface.ITALIC);
        int pad = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        sample.setPadding(pad, 0, pad, pad);
        page.addView(sample);
        TextView folder = new TextView(activity);
        folder.setTextColor(MorpheDialog.text(activity));
        folder.setTextSize(15);
        folder.setText(folderLabel());
        folder.setPadding(pad, 0, pad, 0);
        page.addView(folder);
        TextView change = MorpheDialog.action(activity, "Change folder", MorpheDialog.TEXT);
        change.setOnClickListener(v -> pickFolder(activity, folder));
        LinearLayout.LayoutParams changeLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        changeLp.leftMargin = pad;
        changeLp.topMargin = Math.round(8 * activity.getResources().getDisplayMetrics().density);
        changeLp.bottomMargin = pad;
        page.addView(change, changeLp);
        LinearLayout rows = new LinearLayout(activity);
        rows.setOrientation(LinearLayout.VERTICAL);
        int text = MorpheDialog.text(activity);
        Runnable[] rebuild = new Runnable[1];
        rebuild[0] = () -> {
            rows.removeAllViews();
            sample.setText(example(order, on));
            for (String id : order) {
                String[] def = part(id);
                if (def == null) continue;
                boolean shown = on.optBoolean(id, false);
                LinearLayout line = new LinearLayout(activity);
                line.setOrientation(LinearLayout.HORIZONTAL);
                line.setGravity(Gravity.CENTER_VERTICAL);
                line.setTag(id);
                line.setMinimumHeight(Math.round(48 * activity.getResources().getDisplayMetrics().density));
                TextView label = new TextView(activity);
                label.setText(def[1]);
                label.setTextColor(text);
                label.setTextSize(15);
                line.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
                TextView hide = MorpheDialog.action(activity, "Add", MorpheDialog.TEXT);
                MorpheDialog.setFilled(activity, hide, shown);
                hide.setOnClickListener(v -> {
                    put(on, id, !on.optBoolean(id, false));
                    save(activity, order, on);
                    rebuild[0].run();
                });
                LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                gap.leftMargin = Math.round(12 * activity.getResources().getDisplayMetrics().density);
                line.addView(hide, gap);
                line.addView(DragOrder.handle(activity, rows, (from, to) -> {
                    if (from < 0 || to < 0 || from >= rows.getChildCount() || to >= rows.getChildCount()) return false;
                    int ia = order.indexOf(String.valueOf(rows.getChildAt(from).getTag()));
                    int ib = order.indexOf(String.valueOf(rows.getChildAt(to).getTag()));
                    if (ia < 0 || ib < 0) return false;
                    Collections.swap(order, ia, ib);
                    save(activity, order, on);
                    sample.setText(example(order, on));
                    return true;
                }));
                rows.addView(line);
            }
        };
        rebuild[0].run();
        page.addView(BarPreview.options(activity, rows));
        TextView reset = MorpheDialog.action(activity, "Reset", MorpheDialog.SUB);
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, reset, done));
        AlertDialog dialog = MorpheDialog.show(activity, page, 960);
        reset.setOnClickListener(v -> {
            prefs(activity).edit().remove(KEY_ORDER).remove(KEY_ON).apply();
            order.clear();
            for (String[] def : PARTS) {
                order.add(def[0]);
                put(on, def[0], false);
            }
            rebuild[0].run();
        });
        done.setOnClickListener(v -> dialog.dismiss());
    }

    private static void onClick(View view) {
        Object submission = POSTS.get(view);
        if (submission == null || album(submission)) return;
        Context context = view.getContext();
        String page = text(submission, "g0");
        if (page != null && page.toLowerCase(Locale.US).contains("redgifs.com")) {
            saveRedgifs(context, submission, page);
            return;
        }
        List<File> files = files(submission);
        if (files.isEmpty()) {
            String url = text(submission, "g0");
            if (url == null || url.isEmpty()) {
                cannot(context);
                return;
            }
            File file = describe(submission, url);
            remember(context, file, 0);
            if (!startJoey(context, url)) cannot(context);
            return;
        }
        save(context, files);
    }

    private static void save(Context context, List<File> files) {
        int index = 1;
        for (File file : files) {
            remember(context, file, files.size() > 1 ? index : 0);
            if (!startJoey(context, file.url)) cannot(context);
            index++;
        }
    }

    private static void remember(Context context, File file, int index) {
        String wanted = customName(context, file, index);
        if (wanted == null) return;
        if (naming) pending = wanted;
        else ARMED.put(joeyLeaf(file.url), Boolean.TRUE);
        if (file.video) VIDEOS.add(wanted);
        else NAMES.put(joeyLeaf(file.url), wanted);
    }

    private static void cannot(Context context) {
        int id = context.getResources().getIdentifier("cannot_download_media_webpage", "string", context.getPackageName());
        Toast.makeText(context, id == 0 ? "Cannot download this media" : context.getString(id), Toast.LENGTH_SHORT).show();
    }

    /** HD RedGifs file with sound, the same choice the RedGifs playback patch makes. */
    private static void saveRedgifs(Context context, Object submission, String page) {
        new Thread(() -> {
            String media = redgifsMedia(page);
            Runnable finish = () -> {
                if (media == null || media.isEmpty()) {
                    cannot(context);
                    return;
                }
                File file = describe(submission, media);
                remember(context, file, 0);
                if (!startJoey(context, media)) cannot(context);
            };
            if (context instanceof Activity) ((Activity) context).runOnUiThread(finish);
            else finish.run();
        }, "morphe-redgifs").start();
    }

    private static String redgifsMedia(String href) {
        try {
            String id = redgifsId(href);
            if (id.isEmpty()) return null;
            String token = new JSONObject(http("https://api.redgifs.com/v2/auth/temporary", null)).optString("token", "");
            if (token.isEmpty()) return null;
            JSONObject urls = new JSONObject(http("https://api.redgifs.com/v2/gifs/" + id, "Bearer " + token))
                    .getJSONObject("gif").getJSONObject("urls");
            String media = urls.optString("hd", "");
            if (media.isEmpty()) media = urls.optString("sd", "");
            if (media.isEmpty()) return null;
            int silent = media.indexOf("-silent");
            if (silent >= 0) media = media.substring(0, silent) + ".mp4";
            return media;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String redgifsId(String href) {
        String path = href;
        int query = path.indexOf('?');
        if (query >= 0) path = path.substring(0, query);
        int hash = path.indexOf('#');
        if (hash >= 0) path = path.substring(0, hash);
        int slash = path.lastIndexOf('/');
        String id = slash >= 0 ? path.substring(slash + 1) : path;
        String lower = id.toLowerCase(Locale.US);
        if (lower.endsWith("-silent.mp4")) id = id.substring(0, id.length() - "-silent.mp4".length());
        else if (lower.endsWith(".mp4")) id = id.substring(0, id.length() - 4);
        return id.toLowerCase(Locale.US);
    }

    private static String http(String url, String authorization) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setConnectTimeout(15000);
        conn.setReadTimeout(20000);
        conn.setRequestProperty("User-Agent", "Joey");
        if (authorization != null) conn.setRequestProperty("Authorization", authorization);
        try {
            if (conn.getResponseCode() / 100 != 2) return "";
            try (InputStream in = conn.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buf = new byte[8192];
                int n;
                while ((n = in.read(buf)) >= 0) out.write(buf, 0, n);
                return out.toString("UTF-8");
            }
        } finally {
            conn.disconnect();
        }
    }

    /** Same entry the full-screen viewer uses: set the URL, then BaseActivity.y1. */
    private static boolean startJoey(Context context, String url) {
        try {
            Context base = context;
            while (base instanceof android.content.ContextWrapper && !(base instanceof Activity)) {
                base = ((android.content.ContextWrapper) base).getBaseContext();
            }
            if (!(base instanceof Activity)) return false;
            Class<?> type = Class.forName("o.o.joey.Activities.BaseActivity");
            if (!type.isInstance(base)) return false;
            type.getMethod("y1", String.class).invoke(base, url);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void startFile(Context context, String url) {
        try {
            Intent intent = new Intent();
            intent.setClassName(context, "o.o.joey.Download.DownloadService");
            intent.putExtra("DOWNLOADURL", url);
            context.startService(intent);
        } catch (Throwable ignored) {
        }
    }

    private static void startVideo(Context context, String url) {
        try {
            Class<?> listener = Class.forName("kd.b");
            Object callback = listener.getDeclaredConstructor().newInstance();
            Class<?> task = Class.forName("kd.a");
            Object job = task.getDeclaredConstructor(Class.forName("kd.a$a"), String.class, boolean.class)
                    .newInstance(callback, url, Boolean.FALSE);
            Class.forName("zd.c").getMethod("q", AsyncTask.class).invoke(null, job);
        } catch (Throwable ignored) {
            startFile(context, url);
        }
    }

    /** Null keeps Joey's own file name. */
    private static String customName(Context context, File file, int index) {
        List<String> order = order(context);
        JSONObject on = included(context);
        boolean any = false;
        for (String[] def : PARTS) {
            if (on.optBoolean(def[0], false)) any = true;
        }
        if (!any) return null;
        List<String> bits = new ArrayList<>();
        for (String id : order) {
            if (!on.optBoolean(id, false)) continue;
            String bit = piece(id, file);
            if (bit != null && !bit.isEmpty()) bits.add(bit);
        }
        if (bits.isEmpty()) return null;
        String stem = String.join("_", bits);
        if (index > 1) stem = stem + "_" + index;
        return stem + extension(file);
    }

    private static String piece(String id, File file) {
        if ("subreddit".equals(id)) return clean(file.subreddit, 40);
        if ("author".equals(id)) return clean(file.author, 40);
        if ("title".equals(id)) return clean(file.title, 40);
        if ("id".equals(id)) return clean(file.id, 20);
        if ("resolution".equals(id)) return file.width > 0 && file.height > 0 ? file.width + "x" + file.height : "";
        if ("date".equals(id)) return file.created > 0
                ? new SimpleDateFormat("yyyyMMdd", Locale.US).format(new Date(file.created * 1000L)) : "";
        return "";
    }

    private static String example(List<String> order, JSONObject on) {
        File sample = new File();
        sample.subreddit = "me_irl";
        sample.author = "keyholepossums";
        sample.title = "A fine cat";
        sample.id = "abc123";
        sample.width = 1440;
        sample.height = 1920;
        sample.created = 1731024000L;
        sample.url = "https://i.redd.it/catpicture.jpg";
        List<String> bits = new ArrayList<>();
        for (String id : order) {
            if (!on.optBoolean(id, false)) continue;
            String bit = piece(id, sample);
            if (bit != null && !bit.isEmpty()) bits.add(bit);
        }
        if (bits.isEmpty()) return "Joey's own file name";
        return String.join("_", bits) + ".jpg";
    }

    private static List<File> files(Object submission) {
        List<File> list = new ArrayList<>();
        try {
            if (Boolean.TRUE.equals(flag(submission, "k0"))) return list;
            Object node = nodeOf(submission);
            String title = field(submission, "title", "d0");
            String author = field(submission, "author", "N");
            String subreddit = field(submission, "subreddit", "Z");
            String id = field(submission, "id", null);
            if (id == null && node != null) id = textOf(get(node, "id"));
            long created = longOf(node == null ? null : get(node, "created_utc"));
            int[] size = sourceSize(node);
            if (node != null && bool(get(node, "is_gallery"))) {
                Object meta = get(node, "media_metadata");
                if (meta != null) {
                    Iterator<?> fields = (Iterator<?>) meta.getClass().getMethod("fields").invoke(meta);
                    int n = 1;
                    while (fields != null && fields.hasNext()) {
                        Object entry = fields.next();
                        Object item = entry.getClass().getMethod("getValue").invoke(entry);
                        Object source = get(item, "s");
                        String url = firstText(source, "u", "gif", "mp4");
                        if (url == null) continue;
                        File file = base(title, author, subreddit, id, created);
                        file.url = unescape(url);
                        file.label = "Image " + n;
                        file.width = intOf(get(source, "x"));
                        file.height = intOf(get(source, "y"));
                        if (file.width == 0) {
                            file.width = size[0];
                            file.height = size[1];
                        }
                        stamp(submission, file);
                        list.add(file);
                        n++;
                    }
                }
                return list;
            }
            String url = text(submission, "g0");
            if (url == null) url = textOf(get(node, "url"));
            if (url == null) return list;
            boolean video = url.contains("v.redd.it") || (node != null && bool(get(node, "is_video")));
            if (!video && !direct(url)) {
                String preview = previewUrl(node);
                if (preview == null) return list;
                url = preview;
            }
            File file = base(title, author, subreddit, id, created);
            file.url = url;
            file.video = video;
            file.label = video ? "Video" : "Image";
            file.width = size[0];
            file.height = size[1];
            stamp(submission, file);
            list.add(file);
        } catch (Throwable ignored) {
        }
        return list;
    }

    private static boolean viewer(Activity activity) {
        for (Class<?> type = activity.getClass(); type != null; type = type.getSuperclass()) {
            String name = type.getName();
            if (name.endsWith("PhotoViewer") || name.endsWith("BaseAlbumActivity")) return true;
        }
        return false;
    }

    private static void catalog(Object submission) {
        if (submission == null) return;
        try {
            List<File> files = files(submission);
            for (File file : files) keep(file);
            String page = text(submission, "g0");
            if (page != null && !files.isEmpty()) {
                KNOWN.put(joeyLeaf(page), files.get(0));
            }
        } catch (Throwable ignored) {
        }
    }

    private static void keep(File file) {
        if (file == null) return;
        if (file.url != null) KNOWN.put(joeyLeaf(file.url), file);
        if (file.id != null && !file.id.isEmpty()) KNOWN.put("id:" + file.id, file);
    }

    private static File copy(File file) {
        File next = new File();
        next.title = file.title;
        next.author = file.author;
        next.subreddit = file.subreddit;
        next.id = file.id;
        next.created = file.created;
        next.width = file.width;
        next.height = file.height;
        next.video = file.video;
        next.url = file.url;
        return next;
    }

    private static File base(String title, String author, String subreddit, String id, long created) {
        File file = new File();
        file.title = title;
        file.author = author;
        file.subreddit = subreddit;
        file.id = id;
        file.created = created;
        return file;
    }

    /** Reddit galleries and Imgur albums. Left for a later release. */
    private static boolean album(Object submission) {
        String url = text(submission, "g0");
        String lower = url == null ? "" : url.toLowerCase(Locale.US);
        if (lower.contains("/gallery/") || lower.contains("imgur.com/a/")) return true;
        try {
            Object node = nodeOf(submission);
            if (node != null && bool(get(node, "is_gallery"))) return true;
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static boolean direct(String url) {
        String lower = url.toLowerCase(Locale.US);
        if (lower.contains("youtube.com") || lower.contains("youtu.be")) return false;
        String path = lower.split("\\?")[0];
        if (path.matches(".*\\.(jpg|jpeg|png|gif|webp|mp4|webm)$")) return true;
        return lower.contains("i.redd.it/") || lower.contains("preview.redd.it/")
                || lower.contains("i.imgur.com/");
    }

    private static void restoreSave(View item) {
        View save = find(item, "save");
        if (!(save instanceof ImageView)) return;
        String drawable = ((ImageView) save).isSelected() ? "star" : "star_outline";
        int id = item.getResources().getIdentifier(drawable, "drawable", item.getContext().getPackageName());
        if (id != 0) ((ImageView) save).setImageResource(id);
    }

    static View glyph(Context context, int color) {
        ImageView view = new ImageView(context);
        int size = Math.round(36 * context.getResources().getDisplayMetrics().density);
        view.setLayoutParams(new ViewGroup.LayoutParams(size, size));
        int pad = Math.round(6 * context.getResources().getDisplayMetrics().density);
        view.setPadding(pad, pad, pad, pad);
        view.setImageBitmap(floppyBitmap(Math.round(24 * context.getResources().getDisplayMetrics().density)));
        view.setColorFilter(color);
        return view;
    }

    private static ImageView joeyIcon(Context context) {
        try {
            return (ImageView) Class.forName("o.o.joey.ConfigViews.CImageView")
                    .getConstructor(Context.class)
                    .newInstance(context);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void paintFloppy(ImageView button, View sample) {
        int size = sample != null && sample.getWidth() > 0 ? sample.getWidth()
                : Math.round(24 * button.getResources().getDisplayMetrics().density);
        button.setImageBitmap(floppyBitmap(size));
        if (sample instanceof ImageView && ((ImageView) sample).getColorFilter() != null) {
            button.setColorFilter(((ImageView) sample).getColorFilter());
        } else {
            button.setColorFilter(Color.WHITE);
        }
    }

    /** White floppy with the label and shutter cut out, so a tint follows the shape. */
    private static Bitmap floppyBitmap(int size) {
        int n = Math.max(24, size);
        Bitmap bitmap = Bitmap.createBitmap(n, n, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setColor(Color.WHITE);
        Path path = new Path();
        path.setFillType(Path.FillType.EVEN_ODD);
        float edge = n * 0.14f;
        path.addRoundRect(new RectF(edge, edge, n - edge, n - edge), n * 0.08f, n * 0.08f, Path.Direction.CW);
        path.addRect(n * 0.30f, n * 0.22f, n * 0.70f, n * 0.46f, Path.Direction.CW);
        path.addCircle(n * 0.62f, n * 0.68f, n * 0.11f, Path.Direction.CW);
        canvas.drawPath(path, paint);
        return bitmap;
    }

    private static int iconId(Context context) {
        return context.getResources().getIdentifier("morphe_download", "drawable", context.getPackageName());
    }

    private static ViewGroup.LayoutParams iconParams(ViewGroup bar, View sample) {
        if (sample != null && sample.getLayoutParams() != null) {
            try {
                ViewGroup.LayoutParams copy = (ViewGroup.LayoutParams) sample.getLayoutParams().getClass()
                        .getConstructor(ViewGroup.LayoutParams.class)
                        .newInstance(sample.getLayoutParams());
                copy.width = sample.getLayoutParams().width;
                copy.height = sample.getLayoutParams().height;
                return copy;
            } catch (Throwable ignored) {
            }
        }
        int size = Math.round(48 * bar.getResources().getDisplayMetrics().density);
        return new ViewGroup.LayoutParams(size, size);
    }

    private static String nameOf(View view) {
        if (view.getId() == View.NO_ID) return "";
        try {
            return view.getResources().getResourceEntryName(view.getId());
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static String previewUrl(Object node) {
        try {
            String url = textOf(get(get(get(get(node, "preview"), "images"), 0), "source"), "url");
            return url != null && direct(unescape(url)) ? unescape(url) : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String textOf(Object node, String ignored) throws Exception {
        return textOf(node);
    }

    private static int[] sourceSize(Object node) {
        int[] size = new int[2];
        try {
            Object source = get(get(get(get(node, "preview"), "images"), 0), "source");
            size[0] = intOf(get(source, "width"));
            size[1] = intOf(get(source, "height"));
        } catch (Throwable ignored) {
        }
        return size;
    }

    private static String joeyLeaf(String url) {
        String value = url == null ? "" : url;
        String lower = value.toLowerCase(Locale.US);
        if (lower.contains("imgur.com") && !lower.matches(".*\\.(png|jpg|jpeg|gif|mp4|webm)(\\?.*)?$")) {
            value = value + ".png";
        }
        String leaf = value;
        int slash = leaf.lastIndexOf('/');
        if (slash >= 0) leaf = leaf.substring(slash + 1);
        int query = leaf.indexOf('?');
        if (query >= 0) leaf = leaf.substring(0, query);
        return leaf.isEmpty() ? "download" : leaf;
    }

    private static String extension(File file) {
        if (file.video) return ".mp4";
        String leaf = joeyLeaf(file.url).toLowerCase(Locale.US);
        int dot = leaf.lastIndexOf('.');
        if (dot >= 0 && leaf.length() - dot <= 5) return leaf.substring(dot);
        return ".jpg";
    }

    private static String stripExtension(String leaf) {
        int dot = leaf.lastIndexOf('.');
        return dot > 0 ? leaf.substring(0, dot) : leaf;
    }

    private static String clean(String raw, int max) {
        if (raw == null) return "";
        String cleaned = raw.replaceAll("[^A-Za-z0-9._-]+", "_").replaceAll("_+", "_");
        cleaned = cleaned.replaceAll("^_+|_+$", "");
        if (cleaned.length() > max) cleaned = cleaned.substring(0, max);
        return cleaned;
    }

    private static String unescape(String url) {
        return url.replace("&amp;", "&");
    }

    private static Object json(Object submission) {
        for (Class<?> type = submission.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if ("com.fasterxml.jackson.databind.JsonNode".equals(field.getType().getName())) {
                    field.setAccessible(true);
                    try {
                        return field.get(submission);
                    } catch (Throwable ignored) {
                        return null;
                    }
                }
            }
        }
        return null;
    }

    private static Object get(Object node, String field) throws Exception {
        if (node == null) return null;
        Object child = node.getClass().getMethod("get", String.class).invoke(node, field);
        if (child == null) return null;
        if (Boolean.TRUE.equals(child.getClass().getMethod("isNull").invoke(child))) return null;
        if (Boolean.TRUE.equals(child.getClass().getMethod("isMissingNode").invoke(child))) return null;
        return child;
    }

    private static Object get(Object node, int index) throws Exception {
        if (node == null) return null;
        return node.getClass().getMethod("get", int.class).invoke(node, index);
    }

    private static String text(Object target, String method) {
        try {
            Method found = target.getClass().getMethod(method);
            Object value = found.invoke(target);
            return value == null ? null : String.valueOf(value);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String textOf(Object node) throws Exception {
        if (node == null) return null;
        Object value = node.getClass().getMethod("asText").invoke(node);
        return value == null || String.valueOf(value).isEmpty() ? null : String.valueOf(value);
    }

    private static String firstText(Object node, String... fields) throws Exception {
        for (String field : fields) {
            String value = textOf(get(node, field));
            if (value != null) return value;
        }
        return null;
    }

    private static Boolean flag(Object target, String method) {
        try {
            Object value = target.getClass().getMethod(method).invoke(target);
            return value instanceof Boolean ? (Boolean) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean bool(Object node) throws Exception {
        if (node == null) return false;
        Object value = node.getClass().getMethod("asBoolean").invoke(node);
        return Boolean.TRUE.equals(value);
    }

    private static int intOf(Object node) {
        long value = longOf(node);
        if (value <= 0) return 0;
        return value > Integer.MAX_VALUE ? Integer.MAX_VALUE : (int) value;
    }

    private static long longOf(Object node) {
        if (node == null) return 0;
        try {
            Object value = node.getClass().getMethod("asLong").invoke(node);
            return value instanceof Number ? ((Number) value).longValue() : 0;
        } catch (Throwable ignored) {
            return 0;
        }
    }

    /** Title, author, subreddit, id, date, and size for the name Joey is about to save. */
    private static File describe(Object submission, String url) {
        File file = base(field(submission, "title", "d0"), field(submission, "author", "N"),
                field(submission, "subreddit", "Z"), field(submission, "id", null), 0);
        Object node = nodeOf(submission);
        if (file.id == null && node != null) {
            try {
                file.id = textOf(get(node, "id"));
            } catch (Throwable ignored) {
            }
        }
        file.created = longOf(node == null ? null : quietGet(node, "created_utc"));
        int[] size = sourceSize(node);
        file.width = size[0];
        file.height = size[1];
        file.url = url;
        file.video = url != null && url.contains("v.redd.it");
        stamp(submission, file);
        return file;
    }

    /** Joey's own created date, preview size, or Reddit video size. */
    private static void stamp(Object submission, File file) {
        if (submission == null || file == null) return;
        if (file.created <= 0) {
            try {
                Object date = submission.getClass().getMethod("x").invoke(submission);
                if (date instanceof Date) file.created = ((Date) date).getTime() / 1000L;
            } catch (Throwable ignored) {
            }
        }
        if (file.width > 0 && file.height > 0) return;
        try {
            Object thumbs = submission.getClass().getMethod("c0").invoke(submission);
            if (thumbs != null) {
                Object source = thumbs.getClass().getMethod("r").invoke(thumbs);
                if (source != null) {
                    Object width = source.getClass().getMethod("c").invoke(source);
                    Object height = source.getClass().getMethod("a").invoke(source);
                    if (width instanceof Number) file.width = ((Number) width).intValue();
                    if (height instanceof Number) file.height = ((Number) height).intValue();
                }
            }
        } catch (Throwable ignored) {
        }
        if (file.width > 0 && file.height > 0) return;
        Object video = quietGet(quietGet(nodeOf(submission), "media"), "reddit_video");
        int width = intOf(quietGet(video, "width"));
        int height = intOf(quietGet(video, "height"));
        if (width > 0 && height > 0) {
            file.width = width;
            file.height = height;
        }
    }

    private static String field(Object submission, String key, String method) {
        if (submission == null) return null;
        try {
            Object value = submission.getClass().getMethod("m", String.class).invoke(submission, key);
            if (value != null && !String.valueOf(value).isEmpty()) return String.valueOf(value);
        } catch (Throwable ignored) {
        }
        return method == null ? null : text(submission, method);
    }

    private static Object nodeOf(Object submission) {
        if (submission == null) return null;
        try {
            Object node = submission.getClass().getMethod("n").invoke(submission);
            if (node != null) return node;
        } catch (Throwable ignored) {
        }
        return json(submission);
    }

    private static Object quietGet(Object node, String key) {
        try {
            return get(node, key);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String folderLabel() {
        try {
            Object manager = Class.forName("mb.k").getMethod("e").invoke(null);
            Object uri = manager.getClass().getMethod("d").invoke(manager);
            if (uri == null) return "No folder selected";
            Object segment = uri.getClass().getMethod("getLastPathSegment").invoke(uri);
            String name = segment == null ? "" : String.valueOf(segment);
            int colon = name.lastIndexOf(':');
            if (colon >= 0) name = name.substring(colon + 1);
            int slash = name.lastIndexOf('/');
            if (slash >= 0) name = name.substring(slash + 1);
            return name.isEmpty() ? "Selected folder" : name;
        } catch (Throwable ignored) {
            return "No folder selected";
        }
    }

    private static void pickFolder(Activity activity, TextView label) {
        android.content.Intent intent = new android.content.Intent("android.intent.action.OPEN_DOCUMENT_TREE");
        intent.putExtra("android.content.extra.SHOW_ADVANCED", true);
        try {
            activity.startActivityForResult(intent, 200);
        } catch (Throwable ignored) {
            cannot(activity);
            return;
        }
        android.app.Application app = activity.getApplication();
        android.app.Application.ActivityLifecycleCallbacks callbacks =
                new android.app.Application.ActivityLifecycleCallbacks() {
                    @Override
                    public void onActivityResumed(Activity resumed) {
                        if (resumed != activity) return;
                        app.unregisterActivityLifecycleCallbacks(this);
                        label.setText(folderLabel());
                    }

                    @Override public void onActivityCreated(Activity a, android.os.Bundle b) {}
                    @Override public void onActivityStarted(Activity a) {}
                    @Override public void onActivityPaused(Activity a) {}
                    @Override public void onActivityStopped(Activity a) {}
                    @Override public void onActivitySaveInstanceState(Activity a, android.os.Bundle b) {}
                    @Override public void onActivityDestroyed(Activity a) {}
                };
        app.registerActivityLifecycleCallbacks(callbacks);
    }

    private static int iconTint(ViewGroup bar) {
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child instanceof ImageView && ((ImageView) child).getImageTintList() != null) {
                return ((ImageView) child).getImageTintList().getDefaultColor();
            }
        }
        return Color.WHITE;
    }

    private static View find(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }

    private static List<String> order(Context context) {
        List<String> result = new ArrayList<>();
        String raw = prefs(context).getString(KEY_ORDER, null);
        if (raw != null) {
            try {
                JSONArray arr = new JSONArray(raw);
                for (int i = 0; i < arr.length(); i++) {
                    String id = arr.optString(i, "");
                    if (part(id) != null && !result.contains(id)) result.add(id);
                }
            } catch (Throwable ignored) {
            }
        }
        for (String[] def : PARTS) {
            if (!result.contains(def[0])) result.add(def[0]);
        }
        return result;
    }

    private static JSONObject included(Context context) {
        JSONObject on = new JSONObject();
        for (String[] def : PARTS) put(on, def[0], false);
        String raw = prefs(context).getString(KEY_ON, null);
        if (raw == null) return on;
        try {
            JSONObject saved = new JSONObject(raw);
            for (String[] def : PARTS) {
                if (saved.has(def[0])) put(on, def[0], saved.optBoolean(def[0], false));
            }
        } catch (Throwable ignored) {
        }
        return on;
    }

    private static void save(Context context, List<String> order, JSONObject on) {
        JSONArray arr = new JSONArray();
        for (String id : order) arr.put(id);
        prefs(context).edit().putString(KEY_ORDER, arr.toString()).putString(KEY_ON, on.toString()).apply();
    }

    private static void put(JSONObject object, String key, boolean value) {
        try {
            object.put(key, value);
        } catch (Throwable ignored) {
        }
    }

    private static String[] part(String id) {
        for (String[] def : PARTS) {
            if (def[0].equals(id)) return def;
        }
        return null;
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static final class File {
        String url;
        String label;
        String title;
        String author;
        String subreddit;
        String id;
        int width;
        int height;
        long created;
        boolean video;
    }
}
