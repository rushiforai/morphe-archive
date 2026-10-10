package dev.twitchpatches.extension.emotes;

import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.WeakHashMap;

public final class EmotePickerImages implements View.OnAttachStateChangeListener {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final EmotePickerImages INSTANCE = new EmotePickerImages();
    private final WeakHashMap<ImageView, String> rows = new WeakHashMap<>();
    private final WeakHashMap<ImageView, String> displayed = new WeakHashMap<>();
    private final EmoteImages images = new EmoteImages(url -> MAIN.post(this::scan), 6, 32);
    private final ViewTreeObserver.OnPreDrawListener drawing = () -> { schedule(); return true; };
    private WeakReference<View> root = new WeakReference<>(null);
    private Set<String> demand = new LinkedHashSet<>();
    private boolean active = true;
    private boolean scheduled;

    private EmotePickerImages() { }

    public static boolean bind(ImageView view, String url) {
        if (android.os.Build.VERSION.SDK_INT < 28 || Looper.myLooper() != Looper.getMainLooper() || view == null) return false;
        if (url == null || !(EmoteProviders.imageUrl(url) ||
                url.startsWith("https://static-cdn.jtvnw.net/emoticons/v2/"))) return false;
        if (!url.equals(INSTANCE.rows.get(view))) INSTANCE.release(view);
        INSTANCE.rows.put(view, url);
        view.removeOnAttachStateChangeListener(INSTANCE);
        view.addOnAttachStateChangeListener(INSTANCE);
        INSTANCE.schedule();
        return true;
    }

    static void open(View view) {
        close();
        INSTANCE.root = new WeakReference<>(view);
        INSTANCE.active = true;
        view.getViewTreeObserver().addOnPreDrawListener(INSTANCE.drawing);
        INSTANCE.schedule();
    }

    static void close() {
        View view = INSTANCE.root.get();
        if (view != null && view.getViewTreeObserver().isAlive()) view.getViewTreeObserver().removeOnPreDrawListener(INSTANCE.drawing);
        pause();
        INSTANCE.root.clear();
        INSTANCE.rows.clear();
        INSTANCE.displayed.clear();
        INSTANCE.demand.clear();
    }

    private void schedule() {
        if (!active || scheduled) return;
        scheduled = true;
        MAIN.post(() -> { scheduled = false; scan(); });
    }

    private void scan() {
        if (!active) return;
        Rect bounds = new Rect();
        ArrayList<ImageView> visible = new ArrayList<>();
        Set<String> wanted = new LinkedHashSet<>();
        for (ImageView view : new ArrayList<>(rows.keySet())) {
            if (view.isAttachedToWindow() && view.isShown() && view.getGlobalVisibleRect(bounds) && !bounds.isEmpty()) {
                visible.add(view);
                wanted.add(rows.get(view));
            } else release(view);
        }
        images.retainRequests(wanted);
        for (ImageView view : visible) show(view, rows.get(view));
        if (!wanted.equals(demand)) {
            demand = wanted;
            android.util.Log.d("TwitchPatchesEmotes", "Picker images visible=" + wanted.size() + " pending=" + images.pendingCount());
        }
    }

    private void show(ImageView view, String url) {
        if (url.equals(displayed.get(view))) return;
        Drawable drawable = images.drawable(view.getResources(), url);
        if (drawable == null) { images.request(new Emote("", url, false, false)); return; }
        release(view);
        displayed.put(view, url);
        view.setImageDrawable(drawable);
        if (drawable instanceof Animatable) ((Animatable) drawable).start();
    }

    private void release(ImageView view) {
        Drawable drawable = view.getDrawable();
        if (drawable instanceof Animatable) ((Animatable) drawable).stop();
        if (displayed.remove(view) != null) view.setImageDrawable(null);
    }

    static void pause() {
        INSTANCE.active = false;
        new ArrayList<>(INSTANCE.rows.keySet()).forEach(INSTANCE::release);
        INSTANCE.images.cancelPending();
    }

    static void resume() { INSTANCE.active = true; INSTANCE.schedule(); }

    @Override public void onViewAttachedToWindow(View view) {
        schedule();
    }
    @Override public void onViewDetachedFromWindow(View view) { release((ImageView) view); schedule(); }
}
