package app.mahirsn.extension.youtube.history;

import static app.mahirsn.extension.youtube.history.Ui.dp;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.text.TextUtils;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.InputStream;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * The watch history kept on the server, as a full-screen list: newest first, with thumbnail,
 * how far each video was watched, and an "All / Courses" switch. Tapping a video opens it where
 * it was left.
 */
final class HistoryDialog {
    private static final long END_S = 20;   // the last seconds count as finished, like the server
    private static final LruCache<String, Bitmap> thumbs = new LruCache<>(120);
    private static final ExecutorService images = Executors.newFixedThreadPool(3);

    private static final class Item {
        String id, title, channel, course;
        double pos, len, last;
    }

    static void show(Context ctx) {
        // YouTube's theme colors and font, whichever of light or dark the app is in.
        int bg = Ui.attr(ctx, "ytBaseBackground", Color.WHITE);
        int fg = Ui.attr(ctx, "ytTextPrimary", 0xFF0F0F0F);
        int dim = Ui.attr(ctx, "ytTextSecondary", 0xFF606060);
        int chipOff = Ui.attr(ctx, "ytAdditiveBackground", 0x1A000000);
        int red = Ui.attr(ctx, "ytStaticBrandRed", 0xFFFF0033);

        Dialog dialog = new Dialog(ctx, android.R.style.Theme_Black_NoTitleBar_Fullscreen);
        LinearLayout root = new LinearLayout(ctx);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(bg);
        root.setFitsSystemWindows(true);

        // Header like YouTube's own pages: back arrow and title.
        LinearLayout header = new LinearLayout(ctx);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setMinimumHeight(dp(ctx, 56));
        ImageView back = new ImageView(ctx);
        int arrow = Ui.id(ctx, "drawable", "yt_outline_arrow_left_vd_theme_24");
        if (arrow != 0) back.setImageResource(arrow);
        back.setColorFilter(fg);
        back.setScaleType(ImageView.ScaleType.CENTER);
        back.setOnClickListener(v -> dialog.dismiss());
        header.addView(back, new LinearLayout.LayoutParams(dp(ctx, 56), dp(ctx, 56)));
        TextView title = Ui.text(ctx, Ui.str(ctx, "morphe_change_start_page_entry_history", "History"), 20, fg);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        header.addView(title);
        root.addView(header);

        // All / Courses
        LinearLayout chips = new LinearLayout(ctx);
        chips.setPadding(dp(ctx, 12), 0, dp(ctx, 12), dp(ctx, 8));
        TextView all = chip(ctx, Ui.str(ctx, "downloads_page_all_menu_item", "All")), courses = chip(ctx, "Courses");
        chips.addView(all);
        chips.addView(courses);
        root.addView(chips);

        // The app's own spinner while loading, then its own words if there is no connection.
        android.widget.ProgressBar spinner = new android.widget.ProgressBar(ctx);
        spinner.setIndeterminateTintList(android.content.res.ColorStateList.valueOf(dim));
        LinearLayout.LayoutParams slp = new LinearLayout.LayoutParams(dp(ctx, 36), dp(ctx, 36));
        slp.gravity = Gravity.CENTER_HORIZONTAL;
        slp.topMargin = dp(ctx, 48);
        root.addView(spinner, slp);
        TextView status = Ui.text(ctx, "", 14, dim);
        status.setGravity(Gravity.CENTER_HORIZONTAL);
        status.setPadding(dp(ctx, 16), dp(ctx, 48), dp(ctx, 16), 0);
        status.setVisibility(View.GONE);
        root.addView(status, new LinearLayout.LayoutParams(-1, -2));

        List<Item> items = new ArrayList<>();
        List<Item> shown = new ArrayList<>();
        ListView list = new ListView(ctx);
        list.setDivider(null);
        list.setVisibility(View.GONE);
        root.addView(list, new LinearLayout.LayoutParams(-1, 0, 1));

        BaseAdapter adapter = new BaseAdapter() {
            public int getCount() { return shown.size(); }
            public Object getItem(int i) { return shown.get(i); }
            public long getItemId(int i) { return i; }
            public View getView(int i, View convert, ViewGroup parent) {
                return row(ctx, convert, shown.get(i), fg, dim, red);
            }
        };
        list.setAdapter(adapter);
        list.setOnItemClickListener((p, v, i, id) -> {
            Item it = shown.get(i);
            dialog.dismiss();
            open(ctx, it);
        });

        boolean[] courseOnly = {false};
        Runnable filter = () -> {
            shown.clear();
            for (Item it : items) if (!courseOnly[0] || !TextUtils.isEmpty(it.course)) shown.add(it);
            style(all, !courseOnly[0], fg, bg, chipOff);
            style(courses, courseOnly[0], fg, bg, chipOff);
            adapter.notifyDataSetChanged();
            list.setSelection(0);
            status.setVisibility(shown.isEmpty() ? View.VISIBLE : View.GONE);
            list.setVisibility(shown.isEmpty() ? View.GONE : View.VISIBLE);
            if (shown.isEmpty()) status.setText(courseOnly[0] ? "No courses yet" : "Nothing watched yet");
        };
        all.setOnClickListener(v -> { courseOnly[0] = false; filter.run(); });
        courses.setOnClickListener(v -> { courseOnly[0] = true; filter.run(); });
        style(all, true, fg, bg, chipOff);
        style(courses, false, fg, bg, chipOff);

        dialog.setContentView(root);
        Window w = dialog.getWindow();
        if (w != null) {
            w.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            w.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(bg));
            w.setStatusBarColor(bg);
            w.setNavigationBarColor(bg);
        }
        dialog.show();

        WatchHistory.io.execute(() -> {
            String body = WatchHistory.request("GET", "/history?limit=500", null);
            List<Item> loaded = parse(body);
            WatchHistory.main.post(() -> {
                spinner.setVisibility(View.GONE);
                if (loaded == null) {
                    status.setText(Ui.str(ctx, "offline_no_content_body_text_not_offline_eligible", "No connection"));
                    status.setVisibility(View.VISIBLE);
                    return;
                }
                items.addAll(loaded);
                filter.run();
            });
        });
    }

    private static List<Item> parse(String body) {
        if (body == null) return null;
        try {
            JSONArray a = new JSONArray(body);
            List<Item> out = new ArrayList<>();
            for (int i = 0; i < a.length(); i++) {
                JSONObject o = a.getJSONObject(i);
                Item it = new Item();
                it.id = o.getString("id");
                it.title = o.optString("title", it.id);
                it.channel = o.optString("channel", "");
                it.course = o.isNull("course") ? "" : o.optString("course", "");
                it.pos = o.optDouble("pos", 0);
                it.len = o.optDouble("len", 0);
                it.last = o.optDouble("last", 0);
                out.add(it);
            }
            return out;
        } catch (Exception e) {
            return null;
        }
    }

    /** Opens the video in this app, where it was left (from the start once it was finished). */
    private static void open(Context ctx, Item it) {
        boolean finished = it.len > 0 && it.pos >= it.len - END_S;
        String url = "https://www.youtube.com/watch?v=" + it.id
                + (!finished && it.pos > 15 ? "&t=" + (long) it.pos + "s" : "");
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url)).setPackage(ctx.getPackageName());
        if (!(ctx instanceof android.app.Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        ctx.startActivity(intent);
    }

    private static View row(Context ctx, View convert, Item it, int fg, int dim, int red) {
        LinearLayout row;
        ImageView thumb;
        View bar;
        TextView name, meta, badge;
        if (convert instanceof LinearLayout && convert.getTag() instanceof Object[]) {
            row = (LinearLayout) convert;
            Object[] h = (Object[]) row.getTag();
            thumb = (ImageView) h[0];
            bar = (View) h[1];
            name = (TextView) h[2];
            meta = (TextView) h[3];
            badge = (TextView) h[4];
        } else {
            row = new LinearLayout(ctx);
            row.setPadding(dp(ctx, 12), dp(ctx, 6), dp(ctx, 12), dp(ctx, 6));
            FrameLayout frame = new FrameLayout(ctx);
            thumb = new ImageView(ctx);
            thumb.setScaleType(ImageView.ScaleType.CENTER_CROP);
            thumb.setBackgroundColor(0xFF303030);
            frame.addView(thumb, new FrameLayout.LayoutParams(-1, -1));
            bar = new View(ctx);
            bar.setBackgroundColor(red);
            frame.addView(bar, new FrameLayout.LayoutParams(0, dp(ctx, 4), Gravity.BOTTOM));
            // Length on the thumbnail, as YouTube shows it.
            badge = Ui.text(ctx, "", 12, Color.WHITE);
            badge.setPadding(dp(ctx, 4), dp(ctx, 2), dp(ctx, 4), dp(ctx, 2));
            GradientDrawable badgeBg = new GradientDrawable();
            badgeBg.setColor(0xCC000000);
            badgeBg.setCornerRadius(dp(ctx, 4));
            badge.setBackground(badgeBg);
            FrameLayout.LayoutParams blp = new FrameLayout.LayoutParams(-2, -2, Gravity.BOTTOM | Gravity.END);
            blp.setMargins(0, 0, dp(ctx, 4), dp(ctx, 8));
            frame.addView(badge, blp);
            frame.setClipToOutline(true);
            GradientDrawable round = new GradientDrawable();
            round.setCornerRadius(dp(ctx, 8));
            frame.setBackground(round);
            row.addView(frame, new LinearLayout.LayoutParams(dp(ctx, 160), dp(ctx, 90)));

            LinearLayout texts = new LinearLayout(ctx);
            texts.setOrientation(LinearLayout.VERTICAL);
            texts.setPadding(dp(ctx, 12), 0, 0, 0);
            name = Ui.text(ctx, "", 15, fg);
            name.setMaxLines(2);
            name.setEllipsize(TextUtils.TruncateAt.END);
            texts.addView(name);
            meta = Ui.text(ctx, "", 12, dim);
            meta.setMaxLines(3);
            meta.setPadding(0, dp(ctx, 4), 0, 0);
            texts.addView(meta);
            row.addView(texts, new LinearLayout.LayoutParams(0, -2, 1));
            row.setTag(new Object[]{thumb, bar, name, meta, badge});
        }

        name.setText(it.title);
        StringBuilder m = new StringBuilder();
        if (!it.channel.isEmpty()) m.append(it.channel).append('\n');
        if (it.last > 0) m.append(DateFormat.getDateInstance(DateFormat.MEDIUM).format(new Date((long) (it.last * 1000))));
        if (!TextUtils.isEmpty(it.course)) m.append('\n').append(it.course);
        meta.setText(m);
        badge.setText(it.len > 0 ? Ui.clock((long) (it.len * 1000)) : "");
        badge.setVisibility(it.len > 0 ? View.VISIBLE : View.GONE);

        float done = it.len > 0 ? (float) Math.min(1, it.pos / it.len) : 0;
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) bar.getLayoutParams();
        lp.width = (int) (dp(ctx, 160) * done);
        bar.setLayoutParams(lp);

        thumb.setTag(it.id);
        Bitmap cached = thumbs.get(it.id);
        thumb.setImageBitmap(cached);
        if (cached == null) {
            String id = it.id;
            images.execute(() -> {
                try (InputStream in = new URL("https://i.ytimg.com/vi/" + id + "/mqdefault.jpg").openStream()) {
                    Bitmap b = BitmapFactory.decodeStream(in);
                    if (b == null) return;
                    thumbs.put(id, b);
                    WatchHistory.main.post(() -> { if (id.equals(thumb.getTag())) thumb.setImageBitmap(b); });
                } catch (Exception ignored) {
                }
            });
        }
        return row;
    }

    private static TextView chip(Context ctx, String s) {
        TextView t = Ui.text(ctx, s, 14, Color.WHITE);
        t.setPadding(dp(ctx, 14), dp(ctx, 7), dp(ctx, 14), dp(ctx, 7));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-2, -2);
        lp.setMarginEnd(dp(ctx, 8));
        t.setLayoutParams(lp);
        return t;
    }

    private static void style(TextView chip, boolean on, int fg, int bg, int off) {
        GradientDrawable d = new GradientDrawable();
        d.setCornerRadius(dp(chip.getContext(), 8));
        d.setColor(on ? fg : off);
        chip.setBackground(d);
        chip.setTextColor(on ? bg : fg);
    }

    private HistoryDialog() {
    }
}
