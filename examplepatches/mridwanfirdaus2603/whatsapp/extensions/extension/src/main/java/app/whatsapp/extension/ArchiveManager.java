package app.whatsapp.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Environment;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Runtime helper for WhatsAppMessageMediaArchive ("Keep Messages & Media").
 *
 * Provides user-controlled local archiving of currently visible/available
 * conversation messages and legitimately received WhatsApp media files.
 *
 * Does NOT bypass sender deletion controls, anti-revoke, or disappearing-message
 * restrictions. Archived data is stored locally and clearly separated from
 * WhatsApp's live chat history.
 */
final class ArchiveManager {

    private static final String ARCHIVE_BTN_TAG = "morphe_chat_archive_btn";
    private static final String ARCHIVE_DIR_NAME = "morphe_archive";
    private static final String MESSAGES_FILE = "messages.json";
    private static final String MEDIA_SUBDIR = "media";

    private ArchiveManager() {
    }

    static void onConversationResume(final Activity activity) {
        if (activity == null) return;
        final View decor = activity.getWindow() != null ? activity.getWindow().getDecorView() : null;
        if (decor == null) return;

        decor.post(() -> attachOrUpdateArchiveButton(activity, decor, 0));
    }

    private static void attachOrUpdateArchiveButton(final Activity activity, final View decor, final int attempt) {
        try {
            View existing = decor.findViewWithTag(ARCHIVE_BTN_TAG);
            if (!PatchSettingsExtension.isMessageArchiveEnabled()) {
                if (existing != null) existing.setVisibility(View.GONE);
                return;
            }
            if (existing != null) {
                existing.setVisibility(View.VISIBLE);
                return;
            }

            View contentRoot = activity.findViewById(android.R.id.content);
            if (!(contentRoot instanceof ViewGroup)) {
                if (attempt < 5) {
                    decor.postDelayed(() -> attachOrUpdateArchiveButton(activity, decor, attempt + 1), 150);
                }
                return;
            }

            ViewGroup rootGroup = (ViewGroup) contentRoot;
            ImageButton btn = new ImageButton(activity);
            btn.setTag(ARCHIVE_BTN_TAG);
            btn.setContentDescription("Arsipkan Pesan Tersedia");
            btn.setImageDrawable(new ArchiveBoxDrawable(0xFFFFFFFF));

            int size = dpToPx(activity, 36);
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.OVAL);
            bg.setColor(0x55000000);
            btn.setBackground(bg);

            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(size, size);
            lp.gravity = Gravity.TOP | Gravity.END;
            lp.topMargin = dpToPx(activity, 92);
            lp.rightMargin = dpToPx(activity, 12);
            btn.setLayoutParams(lp);

            btn.setOnClickListener(v -> archiveVisibleMessages(activity, decor));
            rootGroup.addView(btn);
        } catch (Throwable ignored) {
        }
    }

    /**
     * Archives text messages currently visible and available in the active conversation.
     */
    private static void archiveVisibleMessages(Activity activity, View decor) {
        try {
            String chatTitle = extractChatTitle(decor);
            List<String> lines = new ArrayList<>();
            collectVisibleMessageTexts(decor, lines);

            if (lines.isEmpty()) {
                Toast.makeText(activity,
                        "Tidak ada teks pesan yang terdeteksi di layar saat ini.",
                        Toast.LENGTH_SHORT).show();
                return;
            }

            JSONArray arr = loadMessagesArray(activity);
            long now = System.currentTimeMillis();
            int added = 0;

            for (String msg : lines) {
                if (!containsMessage(arr, chatTitle, msg)) {
                    JSONObject obj = new JSONObject();
                    obj.put("chat", chatTitle);
                    obj.put("text", msg);
                    obj.put("timestamp", now);
                    arr.put(obj);
                    added++;
                }
            }

            saveMessagesArray(activity, arr);
            String note = added > 0
                    ? added + " pesan dari \"" + chatTitle + "\" diarsipkan secara lokal."
                    : "Pesan yang terlihat sudah ada di arsip lokal.";
            Toast.makeText(activity, note, Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
            Toast.makeText(activity, "Gagal mengarsipkan: " + t.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    private static String extractChatTitle(View decor) {
        List<TextView> tvs = new ArrayList<>();
        collectTopTextViews(decor, tvs, 0);
        for (TextView tv : tvs) {
            CharSequence c = tv.getText();
            if (c != null) {
                String s = c.toString().trim();
                if (!s.isEmpty() && s.length() <= 60 && !s.contains("\n")) {
                    return s;
                }
            }
        }
        return "Percakapan WhatsApp";
    }

    private static void collectTopTextViews(View v, List<TextView> out, int depth) {
        if (out.size() >= 6 || depth > 8) return;
        if (v instanceof TextView && v.getVisibility() == View.VISIBLE) {
            int[] loc = new int[2];
            v.getLocationOnScreen(loc);
            if (loc[1] >= 0 && loc[1] < 320) {
                out.add((TextView) v);
            }
            return;
        }
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            for (int i = 0; i < vg.getChildCount(); i++) {
                collectTopTextViews(vg.getChildAt(i), out, depth + 1);
            }
        }
    }

    private static void collectVisibleMessageTexts(View v, List<String> out) {
        if (v == null || v.getVisibility() != View.VISIBLE) return;
        if (v instanceof TextView) {
            int[] loc = new int[2];
            v.getLocationOnScreen(loc);
            // Skip top toolbar and bottom input bar
            int screenH = v.getResources().getDisplayMetrics().heightPixels;
            if (loc[1] > dpToPx(v.getContext(), 90) && loc[1] < screenH - dpToPx(v.getContext(), 90)) {
                CharSequence cs = ((TextView) v).getText();
                if (cs != null) {
                    String s = cs.toString().trim();
                    if (s.length() >= 2 && !s.matches("^\\d{1,2}[.:]\\d{2}$")) {
                        if (!out.contains(s)) out.add(s);
                    }
                }
            }
            return;
        }
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            for (int i = 0; i < vg.getChildCount(); i++) {
                collectVisibleMessageTexts(vg.getChildAt(i), out);
            }
        }
    }

    private static File getArchiveDir(Context context) {
        File dir = new File(context.getFilesDir(), ARCHIVE_DIR_NAME);
        if (!dir.exists()) dir.mkdirs();
        return dir;
    }

    private static File getMediaArchiveDir(Context context) {
        File dir = new File(getArchiveDir(context), MEDIA_SUBDIR);
        if (!dir.exists()) dir.mkdirs();
        return dir;
    }

    private static JSONArray loadMessagesArray(Context context) {
        File f = new File(getArchiveDir(context), MESSAGES_FILE);
        if (!f.exists()) return new JSONArray();
        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(new FileInputStream(f), StandardCharsets.UTF_8))) {
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) sb.append(line);
            return new JSONArray(sb.toString());
        } catch (Throwable ignored) {
            return new JSONArray();
        }
    }

    private static void saveMessagesArray(Context context, JSONArray arr) throws Exception {
        File f = new File(getArchiveDir(context), MESSAGES_FILE);
        try (FileOutputStream fos = new FileOutputStream(f)) {
            fos.write(arr.toString(2).getBytes(StandardCharsets.UTF_8));
        }
    }

    private static boolean containsMessage(JSONArray arr, String chat, String text) {
        for (int i = 0; i < arr.length(); i++) {
            JSONObject obj = arr.optJSONObject(i);
            if (obj != null && chat.equals(obj.optString("chat")) && text.equals(obj.optString("text"))) {
                return true;
            }
        }
        return false;
    }

    /**
     * Archives eligible already-received media files from WhatsApp's local Media directories
     * (excluding .Statuses, .Links, Private, and View Once).
     */
    static int archiveReceivedMediaFromWhatsApp(Context context) {
        int copied = 0;
        File[] candidateRoots = {
                new File(Environment.getExternalStorageDirectory(), "Android/media/com.whatsapp/WhatsApp/Media"),
                new File(Environment.getExternalStorageDirectory(), "WhatsApp/Media")
        };
        String[] subFolders = {"WhatsApp Images", "WhatsApp Video", "WhatsApp Documents"};
        File destRoot = getMediaArchiveDir(context);

        for (File root : candidateRoots) {
            if (!root.exists() || !root.isDirectory()) continue;
            for (String sub : subFolders) {
                File folder = new File(root, sub);
                if (!folder.exists() || !folder.isDirectory()) continue;
                File[] files = folder.listFiles();
                if (files == null) continue;
                for (File src : files) {
                    if (!src.isFile() || src.length() <= 0) continue;
                    String name = src.getName();
                    if (name.startsWith(".")) continue;
                    File dest = new File(destRoot, name);
                    if (dest.exists() && dest.length() == src.length()) continue;
                    if (copyFile(src, dest)) {
                        copied++;
                        if (copied >= 50) return copied; // Bounded batch to stay responsive
                    }
                }
            }
        }
        return copied;
    }

    private static boolean copyFile(File src, File dst) {
        try (FileInputStream in = new FileInputStream(src);
             FileOutputStream out = new FileOutputStream(dst)) {
            byte[] buf = new byte[16384];
            int len;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    static long getArchiveStorageBytes(Context context) {
        return folderSize(getArchiveDir(context));
    }

    private static long folderSize(File dir) {
        if (dir == null || !dir.exists()) return 0;
        long total = 0;
        File[] files = dir.listFiles();
        if (files == null) return 0;
        for (File f : files) {
            total += f.isDirectory() ? folderSize(f) : f.length();
        }
        return total;
    }

    private static String formatBytes(long bytes) {
        if (bytes < 1024) return bytes + " B";
        if (bytes < 1024 * 1024) return String.format(Locale.US, "%.1f KB", bytes / 1024.0);
        return String.format(Locale.US, "%.2f MB", bytes / (1024.0 * 1024.0));
    }

    /**
     * Opens the Archive Management screen from Pengaturan Patch.
     */
    static void showArchiveManagerDialog(final Activity activity, final int bgColor,
                                         final int primaryColor, final int secondaryColor,
                                         final int accentColor) {
        try {
            final Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_NoActionBar);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

            LinearLayout root = new LinearLayout(activity);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(bgColor);
            root.setFitsSystemWindows(true);

            // Header
            LinearLayout toolbar = new LinearLayout(activity);
            toolbar.setOrientation(LinearLayout.HORIZONTAL);
            toolbar.setGravity(Gravity.CENTER_VERTICAL);
            toolbar.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, dpToPx(activity, 56)));
            toolbar.setPadding(dpToPx(activity, 8), 0, dpToPx(activity, 16), 0);

            TextView backBtn = new TextView(activity);
            backBtn.setText("←");
            backBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
            backBtn.setTextColor(primaryColor);
            backBtn.setPadding(dpToPx(activity, 12), dpToPx(activity, 8), dpToPx(activity, 12), dpToPx(activity, 8));
            backBtn.setOnClickListener(v -> dialog.dismiss());
            toolbar.addView(backBtn);

            TextView title = new TextView(activity);
            title.setText("Arsip Lokal (Terpisah dari Chat)");
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
            title.setTypeface(Typeface.DEFAULT_BOLD);
            title.setTextColor(primaryColor);
            toolbar.addView(title);
            root.addView(toolbar);

            int pad = dpToPx(activity, 16);
            LinearLayout controls = new LinearLayout(activity);
            controls.setOrientation(LinearLayout.VERTICAL);
            controls.setPadding(pad, dpToPx(activity, 8), pad, dpToPx(activity, 8));

            final TextView usageTv = new TextView(activity);
            usageTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            usageTv.setTextColor(secondaryColor);
            controls.addView(usageTv);

            final EditText searchBox = new EditText(activity);
            searchBox.setHint("Cari pesan atau file arsip...");
            searchBox.setTextColor(primaryColor);
            searchBox.setHintTextColor(secondaryColor);
            searchBox.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            controls.addView(searchBox);

            LinearLayout btnRow = new LinearLayout(activity);
            btnRow.setOrientation(LinearLayout.HORIZONTAL);
            btnRow.setPadding(0, dpToPx(activity, 8), 0, dpToPx(activity, 8));

            TextView syncMediaBtn = new TextView(activity);
            syncMediaBtn.setText("Arsipkan Media Diterima");
            syncMediaBtn.setTextColor(accentColor);
            syncMediaBtn.setTypeface(Typeface.DEFAULT_BOLD);
            syncMediaBtn.setPadding(0, dpToPx(activity, 6), dpToPx(activity, 16), dpToPx(activity, 6));
            btnRow.addView(syncMediaBtn);

            TextView clearBtn = new TextView(activity);
            clearBtn.setText("Hapus Semua Arsip");
            clearBtn.setTextColor(0xFFEF5350);
            clearBtn.setTypeface(Typeface.DEFAULT_BOLD);
            clearBtn.setPadding(dpToPx(activity, 16), dpToPx(activity, 6), 0, dpToPx(activity, 6));
            btnRow.addView(clearBtn);

            controls.addView(btnRow);
            root.addView(controls);

            ScrollView scroll = new ScrollView(activity);
            scroll.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            final LinearLayout listContainer = new LinearLayout(activity);
            listContainer.setOrientation(LinearLayout.VERTICAL);
            listContainer.setPadding(pad, 0, pad, pad);
            scroll.addView(listContainer);
            root.addView(scroll);

            final Runnable refresh = () -> renderArchiveList(
                    activity, listContainer, usageTv,
                    searchBox.getText() != null ? searchBox.getText().toString() : "",
                    primaryColor, secondaryColor
            );

            syncMediaBtn.setOnClickListener(v -> new Thread(() -> {
                int count = archiveReceivedMediaFromWhatsApp(activity);
                activity.runOnUiThread(() -> {
                    Toast.makeText(activity,
                            count > 0 ? count + " file media diarsipkan." : "Tidak ada media baru untuk diarsipkan.",
                            Toast.LENGTH_SHORT).show();
                    refresh.run();
                });
            }).start());

            clearBtn.setOnClickListener(v -> {
                deleteRecursive(getArchiveDir(activity));
                Toast.makeText(activity, "Arsip lokal dihapus.", Toast.LENGTH_SHORT).show();
                refresh.run();
            });

            searchBox.addTextChangedListener(new TextWatcher() {
                @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
                @Override public void onTextChanged(CharSequence s, int start, int before, int count) { refresh.run(); }
                @Override public void afterTextChanged(Editable s) {}
            });

            refresh.run();

            dialog.setContentView(root);
            if (dialog.getWindow() != null) {
                dialog.getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
                dialog.getWindow().setBackgroundDrawable(new ColorDrawable(bgColor));
            }
            dialog.show();
        } catch (Throwable ignored) {
        }
    }

    private static void renderArchiveList(Context context, LinearLayout container, TextView usageTv,
                                          String query, int primaryColor, int secondaryColor) {
        container.removeAllViews();
        String q = query.trim().toLowerCase(Locale.US);

        JSONArray arr = loadMessagesArray(context);
        File[] mediaFiles = getMediaArchiveDir(context).listFiles();
        int mediaCount = mediaFiles != null ? mediaFiles.length : 0;

        usageTv.setText("Penggunaan penyimpanan: " + formatBytes(getArchiveStorageBytes(context))
                + " • " + arr.length() + " pesan • " + mediaCount + " media");

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm", Locale.US);
        int shown = 0;

        for (int i = arr.length() - 1; i >= 0; i--) {
            JSONObject obj = arr.optJSONObject(i);
            if (obj == null) continue;
            String chat = obj.optString("chat", "");
            String text = obj.optString("text", "");
            long ts = obj.optLong("timestamp", 0L);

            if (!q.isEmpty() && !chat.toLowerCase(Locale.US).contains(q)
                    && !text.toLowerCase(Locale.US).contains(q)) {
                continue;
            }

            TextView item = new TextView(context);
            item.setText("[" + chat + " • " + sdf.format(new Date(ts)) + "]\n" + text);
            item.setTextColor(primaryColor);
            item.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            item.setPadding(0, dpToPx(context, 6), 0, dpToPx(context, 6));
            container.addView(item);
            shown++;
        }

        if (mediaFiles != null) {
            for (File f : mediaFiles) {
                String name = f.getName();
                if (!q.isEmpty() && !name.toLowerCase(Locale.US).contains(q)) continue;
                TextView item = new TextView(context);
                item.setText("Media: " + name + " (" + formatBytes(f.length()) + ")");
                item.setTextColor(secondaryColor);
                item.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                item.setPadding(0, dpToPx(context, 4), 0, dpToPx(context, 4));
                container.addView(item);
                shown++;
            }
        }

        if (shown == 0) {
            TextView empty = new TextView(context);
            empty.setText("Belum ada konten arsip lokal yang cocok.");
            empty.setTextColor(secondaryColor);
            empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            empty.setPadding(0, dpToPx(context, 16), 0, 0);
            container.addView(empty);
        }
    }

    private static void deleteRecursive(File f) {
        if (f == null || !f.exists()) return;
        if (f.isDirectory()) {
            File[] children = f.listFiles();
            if (children != null) {
                for (File c : children) deleteRecursive(c);
            }
        }
        f.delete();
    }

    private static int dpToPx(Context context, int dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, context.getResources().getDisplayMetrics());
    }

    /** Monochrome archive box icon. */
    private static class ArchiveBoxDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        ArchiveBoxDrawable(int color) {
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            android.graphics.Rect b = getBounds();
            float w = b.width();
            float h = b.height();
            if (w <= 0 || h <= 0) return;

            float s = Math.min(w, h) * 0.22f;
            float cx = b.centerX();
            float cy = b.centerY();
            paint.setStrokeWidth(Math.max(1.8f, s * 0.22f));

            // Top lid
            canvas.drawRect(cx - s, cy - s * 0.85f, cx + s, cy - s * 0.35f, paint);
            // Box body
            canvas.drawRect(cx - s * 0.85f, cy - s * 0.35f, cx + s * 0.85f, cy + s * 0.85f, paint);
            // Handle slot
            canvas.drawLine(cx - s * 0.35f, cy + s * 0.15f, cx + s * 0.35f, cy + s * 0.15f, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
