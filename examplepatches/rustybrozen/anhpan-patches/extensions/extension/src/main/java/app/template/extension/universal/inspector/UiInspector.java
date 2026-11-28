package app.template.extension.universal.inspector;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Environment;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileWriter;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

public final class UiInspector {

    private static final String PREFS_NAME = "anhpan_ui_inspector";
    private static final String KEY_TAGS = "saved_tags";
    private static final int TAG_OVERLAY = 0x5A10DEB1;
    private static final int TAG_FAB = 0x5A10DEB2;

    private static volatile boolean initialized = false;
    private static volatile boolean inspectMode = false;
    private static WeakReference<Activity> currentActivity = new WeakReference<>(null);
    private static float fabX = 40f;
    private static float fabY = 300f;

    private UiInspector() { }

    public static void init(Application app) {
        if (app == null || initialized) {
            return;
        }
        initialized = true;
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) { }

            @Override
            public void onActivityStarted(Activity activity) { }

            @Override
            public void onActivityResumed(Activity activity) {
                currentActivity = new WeakReference<>(activity);
                attachToActivity(activity);
            }

            @Override
            public void onActivityPaused(Activity activity) { }

            @Override
            public void onActivityStopped(Activity activity) { }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) { }

            @Override
            public void onActivityDestroyed(Activity activity) { }
        });
    }

    private static void attachToActivity(Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        View decor = activity.getWindow() != null ? activity.getWindow().getDecorView() : null;
        if (!(decor instanceof ViewGroup)) {
            return;
        }
        ViewGroup root = (ViewGroup) decor;

        OverlayView overlay = root.findViewById(TAG_OVERLAY);
        if (overlay == null) {
            overlay = new OverlayView(activity, root);
            overlay.setId(TAG_OVERLAY);
            root.addView(overlay, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
            ));
        }
        overlay.setVisibility(inspectMode ? View.VISIBLE : View.GONE);
        overlay.setElevation(999f);

        TextView fab = root.findViewById(TAG_FAB);
        if (fab == null) {
            fab = createFab(activity, root, overlay);
            root.addView(fab);
        }
        fab.setElevation(1000f);
        fab.setX(fabX);
        fab.setY(fabY);
        updateFabAppearance(fab, activity);
        fab.bringToFront();
    }

    private static TextView createFab(Activity activity, ViewGroup root, OverlayView overlay) {
        TextView fab = new TextView(activity);
        fab.setId(TAG_FAB);
        fab.setText("UI");
        fab.setTextColor(Color.WHITE);
        fab.setTextSize(12f);
        fab.setGravity(Gravity.CENTER);
        int size = dp(activity, 44);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(size, size);
        fab.setLayoutParams(lp);

        final float[] downPos = new float[2];
        final float[] startXY = new float[2];
        final boolean[] moved = new boolean[1];
        final long[] downTime = new long[1];

        fab.setOnTouchListener((v, event) -> {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downPos[0] = event.getRawX();
                    downPos[1] = event.getRawY();
                    startXY[0] = v.getX();
                    startXY[1] = v.getY();
                    moved[0] = false;
                    downTime[0] = SystemClock.uptimeMillis();
                    return true;
                case MotionEvent.ACTION_MOVE:
                    float dx = event.getRawX() - downPos[0];
                    float dy = event.getRawY() - downPos[1];
                    if (Math.abs(dx) > 12 || Math.abs(dy) > 12) {
                        moved[0] = true;
                        fabX = Math.max(0, Math.min(root.getWidth() - v.getWidth(), startXY[0] + dx));
                        fabY = Math.max(0, Math.min(root.getHeight() - v.getHeight(), startXY[1] + dy));
                        v.setX(fabX);
                        v.setY(fabY);
                    }
                    return true;
                case MotionEvent.ACTION_UP:
                    if (!moved[0]) {
                        long held = SystemClock.uptimeMillis() - downTime[0];
                        if (held > 500) {
                            showInspectorMenu(activity);
                        } else {
                            inspectMode = !inspectMode;
                            overlay.setVisibility(inspectMode ? View.VISIBLE : View.GONE);
                            overlay.clearHighlight();
                            updateFabAppearance(fab, activity);
                            Toast.makeText(activity,
                                    inspectMode ? "UI Inspector: ON (tap to tag, double-tap to click)" : "UI Inspector: OFF",
                                    Toast.LENGTH_SHORT).show();
                        }
                    }
                    return true;
            }
            return false;
        });

        return fab;
    }

    private static void updateFabAppearance(TextView fab, Context context) {
        int count = loadTags(context).length();
        fab.setText(count > 0 ? "UI\n(" + count + ")" : "UI");
        fab.setTextSize(count > 0 ? 10f : 12f);
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.OVAL);
        bg.setColor(inspectMode ? Color.argb(230, 220, 53, 69) : Color.argb(200, 33, 37, 41));
        bg.setStroke(dp(context, 2), Color.WHITE);
        fab.setBackground(bg);
    }

    private static void refreshCurrentFab(Context context) {
        Activity act = currentActivity.get();
        if (act == null || act.getWindow() == null) {
            return;
        }
        View fab = act.getWindow().getDecorView().findViewById(TAG_FAB);
        if (fab instanceof TextView) {
            updateFabAppearance((TextView) fab, context);
        }
    }

    private static void showInspectorMenu(Activity activity) {
        JSONArray tags = loadTags(activity);
        String[] items = new String[tags.length()];
        for (int i = 0; i < tags.length(); i++) {
            JSONObject obj = tags.optJSONObject(i);
            String note = obj != null ? obj.optString("note", "") : "";
            String cls = obj != null ? obj.optString("class", "") : "";
            String shortCls = cls.contains(".") ? cls.substring(cls.lastIndexOf('.') + 1) : cls;
            String id = obj != null ? obj.optString("id", "NO_ID") : "NO_ID";
            String shortId = id.contains("/") ? id.substring(id.indexOf('/') + 1) : id;
            items[i] = "#" + (i + 1) + " " + (note.isEmpty() ? "(no note)" : note)
                    + "\n    " + shortCls + " [" + shortId + "]";
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(activity)
                .setTitle("Saved UI Tags (" + tags.length() + ")");

        if (tags.length() == 0) {
            builder.setMessage("No tags saved yet. Turn on UI Inspector and tap any element to add a note.");
        } else {
            builder.setItems(items, (dialog, which) -> {
                JSONObject obj = tags.optJSONObject(which);
                if (obj != null) {
                    try {
                        new AlertDialog.Builder(activity)
                                .setTitle("Tag #" + (which + 1))
                                .setMessage(obj.toString(2))
                                .setPositiveButton("OK", null)
                                .show();
                    } catch (Exception ignored) { }
                }
            });
        }

        builder.setPositiveButton("Copy JSON", (d, w) -> copyJson(activity, tags))
                .setNeutralButton("Export", (d, w) -> exportJson(activity, tags))
                .setNegativeButton("Clear", (d, w) -> {
                    saveTags(activity, new JSONArray());
                    refreshCurrentFab(activity);
                    Toast.makeText(activity, "Cleared all tags", Toast.LENGTH_SHORT).show();
                })
                .show();
    }

    private static void copyJson(Context context, JSONArray tags) {
        try {
            ClipboardManager cm = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) {
                cm.setPrimaryClip(ClipData.newPlainText("ui_inspector", tags.toString(2)));
                Toast.makeText(context, "Copied " + tags.length() + " tags to clipboard", Toast.LENGTH_SHORT).show();
            }
        } catch (Exception e) {
            Toast.makeText(context, "Copy failed: " + e.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    private static void exportJson(Context context, JSONArray tags) {
        try {
            File dir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
            if (dir == null || (!dir.exists() && !dir.mkdirs())) {
                dir = context.getExternalFilesDir(null);
            }
            File out = new File(dir, "ui_inspector_" + context.getPackageName() + ".json");
            try (FileWriter fw = new FileWriter(out, false)) {
                fw.write(tags.toString(2));
            }
            Toast.makeText(context, "Saved: " + out.getAbsolutePath(), Toast.LENGTH_LONG).show();
        } catch (Exception e) {
            Toast.makeText(context, "Export failed: " + e.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    private static JSONArray loadTags(Context context) {
        SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        try {
            return new JSONArray(prefs.getString(KEY_TAGS, "[]"));
        } catch (Exception e) {
            return new JSONArray();
        }
    }

    private static void saveTags(Context context, JSONArray arr) {
        SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        prefs.edit().putString(KEY_TAGS, arr.toString()).apply();
    }

    private static void addTag(Context context, JSONObject entry) {
        JSONArray arr = loadTags(context);
        arr.put(entry);
        saveTags(context, arr);
    }

    private static int dp(Context context, int dp) {
        return Math.round(dp * context.getResources().getDisplayMetrics().density);
    }

    private static final class OverlayView extends View {
        private final Activity activity;
        private final ViewGroup root;
        private final Paint borderPaint;
        private final Paint fillPaint;
        private final Paint parentBorderPaint;
        private final Paint labelBgPaint;
        private final Paint labelTextPaint;
        private final Rect highlightRect = new Rect();
        private final Rect parentRect = new Rect();
        private boolean hasHighlight = false;
        private boolean hasParentHighlight = false;
        private String highlightLabel = "";
        private long lastTapTime = 0;
        private float lastTapX = 0;
        private float lastTapY = 0;

        OverlayView(Activity activity, ViewGroup root) {
            super(activity);
            this.activity = activity;
            this.root = root;

            borderPaint = new Paint();
            borderPaint.setColor(Color.argb(255, 0, 229, 255));
            borderPaint.setStyle(Paint.Style.STROKE);
            borderPaint.setStrokeWidth(6f);

            fillPaint = new Paint();
            fillPaint.setColor(Color.argb(55, 0, 229, 255));
            fillPaint.setStyle(Paint.Style.FILL);

            parentBorderPaint = new Paint();
            parentBorderPaint.setColor(Color.argb(180, 255, 214, 0));
            parentBorderPaint.setStyle(Paint.Style.STROKE);
            parentBorderPaint.setStrokeWidth(3f);

            labelBgPaint = new Paint();
            labelBgPaint.setColor(Color.argb(220, 20, 20, 20));
            labelBgPaint.setStyle(Paint.Style.FILL);

            labelTextPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            labelTextPaint.setColor(Color.WHITE);
            labelTextPaint.setTextSize(dp(activity, 11));
        }

        void clearHighlight() {
            hasHighlight = false;
            hasParentHighlight = false;
            highlightLabel = "";
            invalidate();
        }

        void highlightTarget(View target) {
            int[] loc = new int[2];
            target.getLocationOnScreen(loc);
            highlightRect.set(loc[0], loc[1], loc[0] + target.getWidth(), loc[1] + target.getHeight());
            hasHighlight = true;

            if (target.getParent() instanceof View && target.getParent() != root) {
                View p = (View) target.getParent();
                int[] pLoc = new int[2];
                p.getLocationOnScreen(pLoc);
                parentRect.set(pLoc[0], pLoc[1], pLoc[0] + p.getWidth(), pLoc[1] + p.getHeight());
                hasParentHighlight = true;
            } else {
                hasParentHighlight = false;
            }

            String shortId = resolveShortId(target);
            highlightLabel = target.getClass().getSimpleName()
                    + " (" + target.getWidth() + "x" + target.getHeight() + ")"
                    + (shortId.isEmpty() ? "" : " #" + shortId);
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            if (hasParentHighlight) {
                canvas.drawRect(parentRect, parentBorderPaint);
            }
            if (hasHighlight) {
                canvas.drawRect(highlightRect, fillPaint);
                canvas.drawRect(highlightRect, borderPaint);

                if (!highlightLabel.isEmpty()) {
                    float pad = dp(activity, 6);
                    float textW = labelTextPaint.measureText(highlightLabel);
                    float textH = labelTextPaint.getTextSize();
                    float boxW = textW + pad * 2;
                    float boxH = textH + pad * 1.5f;
                    float left = Math.max(8f, Math.min(getWidth() - boxW - 8f, highlightRect.left));
                    float top = highlightRect.top - boxH - 6f;
                    if (top < 8f) {
                        top = Math.min(getHeight() - boxH - 8f, highlightRect.bottom + 6f);
                    }
                    canvas.drawRect(left, top, left + boxW, top + boxH, labelBgPaint);
                    canvas.drawText(highlightLabel, left + pad, top + textH + pad * 0.4f, labelTextPaint);
                }
            }
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                return true;
            }
            if (event.getActionMasked() != MotionEvent.ACTION_UP) {
                return true;
            }

            float rawX = event.getRawX();
            float rawY = event.getRawY();
            long now = SystemClock.uptimeMillis();

            if (now - lastTapTime < 350 && Math.hypot(rawX - lastTapX, rawY - lastTapY) < 60) {
                lastTapTime = 0;
                passThroughClick(rawX, rawY);
                return true;
            }

            lastTapTime = now;
            lastTapX = rawX;
            lastTapY = rawY;

            View target = findDeepestView(root, rawX, rawY);
            if (target != null) {
                highlightTarget(target);
                showTagDialog(target, rawX, rawY);
            }
            return true;
        }

        private void passThroughClick(float rawX, float rawY) {
            setVisibility(View.GONE);
            long down = SystemClock.uptimeMillis();
            MotionEvent evDown = MotionEvent.obtain(down, down, MotionEvent.ACTION_DOWN, rawX, rawY, 0);
            MotionEvent evUp = MotionEvent.obtain(down, down + 20, MotionEvent.ACTION_UP, rawX, rawY, 0);
            root.dispatchTouchEvent(evDown);
            root.dispatchTouchEvent(evUp);
            evDown.recycle();
            evUp.recycle();
            postDelayed(() -> {
                if (inspectMode) {
                    setVisibility(View.VISIBLE);
                }
            }, 150);
        }

        private View findDeepestView(View view, float rawX, float rawY) {
            if (view == this || view.getId() == TAG_FAB || view.getVisibility() != View.VISIBLE) {
                return null;
            }
            int id = view.getId();
            if (id == android.R.id.statusBarBackground || id == android.R.id.navigationBarBackground) {
                return null;
            }
            if (view.getWidth() <= 0 || view.getHeight() <= 0) {
                return null;
            }
            int[] loc = new int[2];
            view.getLocationOnScreen(loc);
            if (rawX < loc[0] || rawX > loc[0] + view.getWidth()
                    || rawY < loc[1] || rawY > loc[1] + view.getHeight()) {
                return null;
            }
            if (view instanceof ViewGroup) {
                ViewGroup vg = (ViewGroup) view;
                for (int i = vg.getChildCount() - 1; i >= 0; i--) {
                    View child = findDeepestView(vg.getChildAt(i), rawX, rawY);
                    if (child != null) {
                        return child;
                    }
                }
            }
            boolean isFullScreen = view.getWidth() >= root.getWidth() * 0.9f
                    && view.getHeight() >= root.getHeight() * 0.9f;
            if (isFullScreen && view != root) {
                return null;
            }
            return view == root ? null : view;
        }

        private void showTagDialog(View target, float rawX, float rawY) {
            String resName = resolveResourceName(target);
            String cls = target.getClass().getName();
            String text = target instanceof TextView ? String.valueOf(((TextView) target).getText()) : "";
            CharSequence descCs = target.getContentDescription();
            String desc = descCs != null ? descCs.toString() : "";
            String path = buildViewPath(target);

            LinearLayout container = new LinearLayout(activity);
            container.setOrientation(LinearLayout.VERTICAL);
            int pad = dp(activity, 16);
            container.setPadding(pad, pad, pad, 0);

            TextView info = new TextView(activity);
            info.setTextSize(12f);
            info.setText(
                    "Activity: " + activity.getClass().getSimpleName() + "\n"
                    + "Class: " + cls + "\n"
                    + "ID: " + resName + "\n"
                    + (text.isEmpty() ? "" : "Text: " + text + "\n")
                    + (desc.isEmpty() ? "" : "Desc: " + desc + "\n")
                    + "Path: " + path
            );
            container.addView(info);

            EditText input = new EditText(activity);
            input.setHint("Note (e.g. card chat muon an avatar)");
            container.addView(input);

            AlertDialog.Builder builder = new AlertDialog.Builder(activity)
                    .setTitle("Tag UI Element")
                    .setView(container)
                    .setPositiveButton("Save", (d, w) -> {
                        try {
                            JSONObject obj = new JSONObject();
                            obj.put("note", input.getText().toString().trim());
                            obj.put("activity", activity.getClass().getName());
                            obj.put("class", cls);
                            obj.put("id", resName);
                            obj.put("text", text);
                            obj.put("contentDescription", desc);
                            obj.put("path", path);
                            addTag(activity, obj);
                            refreshCurrentFab(activity);
                            Toast.makeText(activity, "Saved tag", Toast.LENGTH_SHORT).show();
                        } catch (Exception e) {
                            Toast.makeText(activity, "Save failed", Toast.LENGTH_SHORT).show();
                        }
                    })
                    .setNegativeButton("Click Through", (d, w) -> passThroughClick(rawX, rawY));

            if (target.getParent() instanceof View && target.getParent() != root) {
                View parentView = (View) target.getParent();
                builder.setNeutralButton("Parent", (d, w) -> {
                    highlightTarget(parentView);
                    showTagDialog(parentView, rawX, rawY);
                });
            }
            builder.show();
        }

        private String resolveShortId(View v) {
            int id = v.getId();
            if (id == View.NO_ID) {
                return "";
            }
            try {
                return v.getResources().getResourceEntryName(id);
            } catch (Exception e) {
                return "0x" + Integer.toHexString(id);
            }
        }

        private String resolveResourceName(View v) {
            int id = v.getId();
            if (id == View.NO_ID) {
                return "NO_ID";
            }
            try {
                return v.getResources().getResourceName(id);
            } catch (Exception e) {
                return "0x" + Integer.toHexString(id);
            }
        }

        private String buildViewPath(View target) {
            List<String> parts = new ArrayList<>();
            View cur = target;
            while (cur != null && cur != root) {
                String name = cur.getClass().getSimpleName();
                if (cur.getParent() instanceof ViewGroup) {
                    ViewGroup p = (ViewGroup) cur.getParent();
                    int idx = p.indexOfChild(cur);
                    name = name + "[" + idx + "]";
                }
                parts.add(0, name);
                if (cur.getParent() instanceof View) {
                    cur = (View) cur.getParent();
                } else {
                    break;
                }
            }
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < parts.size(); i++) {
                if (i > 0) {
                    sb.append(" > ");
                }
                sb.append(parts.get(i));
            }
            return sb.toString();
        }
    }
}
