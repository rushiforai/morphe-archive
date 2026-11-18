package app.afterglow.extension.menus;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.i18n.L10n;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.video.VideoState;

/** A separate Copy button; native Description selection, Close and all existing listeners remain native. */
public final class DescriptionHeaderActions {
    private static final ExecutorService REQUESTS = Executors.newSingleThreadExecutor();
    private DescriptionHeaderActions() {}
    public static boolean enabled() {
        try { return InstalledTweaks.has("long-press-tools") && LiteMode.effectiveBool("copyVideoInfo"); }
        catch (Throwable error) { return false; }
    }
    static void clear(View root) {
        int tag = root.getResources().getIdentifier("afterglow_description_header", "id", root.getContext().getPackageName());
        if (tag == 0) return;
        Object previous = root.getTag(tag);
        if (previous instanceof Binding) ((Binding) previous).dispose();
        root.setTag(tag, null);
    }
    public static void bind(DescriptionHeaderHost host) {
        try {
            if (!InstalledTweaks.has("long-press-tools") || host == null) return;
            View root = host.afterglow_descriptionRoot();
            if (!(root instanceof ViewGroup)) return;
            int tag = root.getResources().getIdentifier("afterglow_description_header", "id", root.getContext().getPackageName());
            if (tag == 0) return;
            Object previous = root.getTag(tag);
            if (!DescriptionHeaderPolicy.PANEL.equals(host.afterglow_descriptionPanelId())) {
                if (previous instanceof Binding) ((Binding) previous).dispose();
                root.setTag(tag, null);
                return;
            }
            Binding binding;
            if (previous instanceof Binding && ((Binding) previous).host.get() == host) binding = (Binding) previous;
            else {
                if (previous instanceof Binding) ((Binding) previous).dispose();
                binding = new Binding(host, (ViewGroup) root); root.setTag(tag, binding);
            }
            binding.update();
        } catch (Throwable error) { Afterglow.error("DescriptionHeader.bind", error); }
    }
    private static final class Binding implements View.OnAttachStateChangeListener, View.OnLayoutChangeListener, AfterglowPrefs.Listener, VideoState.Listener {
        final WeakReference<DescriptionHeaderHost> host;
        final ViewGroup root;
        Object generation = new Object(), panel;
        String video = "";
        ImageButton button;
        boolean listening;
        Binding(DescriptionHeaderHost owner, ViewGroup view) {
            host = new WeakReference<>(owner); root = view;
            root.addOnAttachStateChangeListener(this); root.addOnLayoutChangeListener(this);
            if (root.isAttachedToWindow()) listen();
        }
        void listen() { if (!listening) { listening = true; AfterglowPrefs.addListener(this); VideoState.addListener(this); } }
        void unlisten() { if (listening) { listening = false; AfterglowPrefs.removeListener(this); VideoState.removeListener(this); } }
        void invalidate() { generation = new Object(); }
        void dispose() { invalidate(); unlisten(); removeButton(); root.removeOnAttachStateChangeListener(this); root.removeOnLayoutChangeListener(this); }
        public void onViewAttachedToWindow(View view) { invalidate(); listen(); update(); }
        public void onViewDetachedFromWindow(View view) { invalidate(); unlisten(); }
        public void onLayoutChange(View view, int l, int t, int r, int b, int ol, int ot, int or, int ob) { update(); }
        public void onChanged(String key) { if ("copyVideoInfo".equals(key) || key == null || LiteMode.KEY.equals(key)) root.post(() -> { invalidate(); update(); }); }
        public void onNewVideo(String id) { root.post(() -> { invalidate(); update(); }); }
        void update() {
            try {
                DescriptionHeaderHost owner = host.get();
                Object currentPanel = owner == null ? null : owner.afterglow_descriptionPanel();
                String currentVideo = VideoState.videoId();
                if (panel != currentPanel || !video.equals(currentVideo)) { invalidate(); panel = currentPanel; video = currentVideo; }
                boolean show = owner != null && owner.afterglow_descriptionRoot() == root && currentPanel != null
                        && DescriptionHeaderPolicy.PANEL.equals(owner.afterglow_descriptionPanelId()) && enabled();
                if (!show) { removeButton(); return; }
                if (button == null) addButton();
                if (button != null && root instanceof FrameLayout && root.getChildAt(root.getChildCount() - 1) != button) button.bringToFront();
            } catch (Throwable error) { removeButton(); Afterglow.error("DescriptionHeader.update", error); }
        }
        void addButton() {
            ImageButton candidate = new ImageButton(root.getContext());
            candidate.setContentDescription(L10n.get("CopyVideoInfo", "Copy video details"));
            TypedValue color = new TypedValue();
            root.getContext().getTheme().resolveAttribute(android.R.attr.textColorPrimary, color, true);
            ColorStateList tint = color.resourceId != 0 ? root.getContext().getColorStateList(color.resourceId) : ColorStateList.valueOf(color.data);
            candidate.setImageDrawable(new CopyIcon(tint.getDefaultColor(), dp(24)));
            TypedValue background = new TypedValue();
            if (root.getContext().getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, background, true) && background.resourceId != 0) candidate.setBackgroundResource(background.resourceId);
            candidate.setPadding(dp(8), dp(8), dp(8), dp(8));
            candidate.setOnClickListener(view -> open());
            if (root instanceof FrameLayout) {
                FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(dp(40), dp(40), Gravity.END | Gravity.CENTER_VERTICAL);
                params.setMarginEnd(dp(48)); root.addView(candidate, params);
            } else {
                int closeId = root.getResources().getIdentifier("close_button", "id", root.getContext().getPackageName());
                View close = closeId == 0 ? null : root.findViewById(closeId);
                if (close == null || !(close.getParent() instanceof LinearLayout)) return;
                LinearLayout row = (LinearLayout) close.getParent();
                if (row.getOrientation() != LinearLayout.HORIZONTAL) return;
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(dp(40), dp(40)); params.gravity = Gravity.CENTER_VERTICAL;
                row.addView(candidate, row.indexOfChild(close), params);
            }
            button = candidate;
        }
        int dp(int value) { return Math.round(value * root.getResources().getDisplayMetrics().density); }
        void removeButton() {
            if (button != null && button.getParent() instanceof ViewGroup) ((ViewGroup) button.getParent()).removeView(button);
            button = null;
        }
        boolean current(Object expectedGeneration, Object expectedPanel, String id) {
            try {
                DescriptionHeaderHost owner = host.get(); Activity activity = Afterglow.mainActivity();
                return owner != null && owner.afterglow_descriptionRoot() == root && activity != null
                        && !activity.isFinishing() && !activity.isDestroyed() && activity.getWindow() != null
                        && root.getRootView() == activity.getWindow().getDecorView().getRootView()
                        && DescriptionHeaderPolicy.current(enabled(), root.isAttachedToWindow(), root.isShown(), VideoState.isAdPlaying(),
                            expectedGeneration, generation, expectedPanel, owner.afterglow_descriptionPanel(), owner.afterglow_descriptionPanelId(), id, VideoState.videoId());
            } catch (Throwable error) { return false; }
        }
        void open() {
            update(); Object expectedGeneration = generation, expectedPanel = panel; String id = video;
            if (!current(expectedGeneration, expectedPanel, id)) return;
            Activity activity = Afterglow.mainActivity();
            new AlertDialog.Builder(activity).setTitle(L10n.get("CopyVideoInfo", "Copy video details"))
                    .setItems(new String[]{L10n.get("CopyTitle", "Copy title"), L10n.get("CopyDescription", "Copy description")},
                            (dialog, which) -> copy(which == 0, expectedGeneration, expectedPanel, id))
                    .setNegativeButton(android.R.string.cancel, null).show();
        }
        void copy(boolean title, Object expectedGeneration, Object expectedPanel, String id) {
            if (!current(expectedGeneration, expectedPanel, id)) return;
            Activity activity = Afterglow.mainActivity(); String nativeTitle = title ? DescriptionHeaderSource.title(id) : null;
            if (nativeTitle != null) { clipboard(activity, nativeTitle); return; }
            boolean[] cancelled = {false};
            AlertDialog progress = new AlertDialog.Builder(activity).setMessage(title ? "Loading title…" : "Loading description…")
                    .setNegativeButton(android.R.string.cancel, (d, w) -> cancelled[0] = true)
                    .setOnCancelListener(d -> cancelled[0] = true).create(); progress.show();
            REQUESTS.execute(() -> {
                DescriptionHeaderPolicy.Metadata result = null; String failure = null;
                try { result = DescriptionHeaderSource.load(id); }
                catch (Exception error) { failure = "The full video details could not be loaded. Check the connection and try again."; }
                DescriptionHeaderPolicy.Metadata value = result; String message = failure;
                activity.runOnUiThread(() -> {
                    if (activity.isFinishing() || activity.isDestroyed()) return;
                    progress.dismiss();
                    if (cancelled[0] || !current(expectedGeneration, expectedPanel, id)) return;
                    if (value != null) clipboard(activity, title ? value.title : value.description);
                    else new AlertDialog.Builder(activity).setTitle(L10n.get("CopyVideoInfo", "Copy video details"))
                            .setMessage(message).setPositiveButton(android.R.string.ok, null).show();
                });
            });
        }
    }
    private static void clipboard(Context context, String value) {
        try {
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard == null) return;
            clipboard.setPrimaryClip(ClipData.newPlainText("", value));
            Toast.makeText(context, L10n.get("Copied", "Copied"), Toast.LENGTH_SHORT).show();
        } catch (Throwable error) { Afterglow.error("DescriptionHeader.copy", error); }
    }
    private static final class CopyIcon extends Drawable {
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final int size;
        CopyIcon(int color, int size) { this.size = size; paint.setColor(color); paint.setStyle(Paint.Style.STROKE); paint.setStrokeWidth(1.7f); }
        public void draw(Canvas canvas) { int saved = canvas.save(); canvas.translate(getBounds().left, getBounds().top); canvas.scale(getBounds().width() / 24f, getBounds().height() / 24f); canvas.drawRoundRect(7, 7, 20, 21, 1, 1, paint); canvas.drawLine(4, 17, 4, 3, paint); canvas.drawLine(4, 3, 17, 3, paint); canvas.restoreToCount(saved); }
        public void setAlpha(int alpha) { paint.setAlpha(alpha); invalidateSelf(); }
        public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
        public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        public int getIntrinsicWidth() { return size; } public int getIntrinsicHeight() { return size; }
    }
}
