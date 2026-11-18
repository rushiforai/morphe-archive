package app.afterglow.extension.playback;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;

/** Keeps YouTube's information/comments section and hides later watch recommendations. */
public final class WatchNextSections {
    public interface Controller {
        void afterglow_rememberWatchNext(Object model);
        Object afterglow_watchInfoOnly(Object model);
        View afterglow_watchNextRoot();
        void afterglow_refreshWatchNext();
    }

    private static final Map<Controller, Boolean> BOUND = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable REFRESH = WatchNextSections::refresh;

    static {
        AfterglowPrefs.addListener(key -> {
            if (key != null && !key.equals("noRelatedWatchNexts") && !key.equals(LiteMode.KEY)) return;
            MAIN.removeCallbacks(REFRESH);
            MAIN.post(REFRESH);
        });
    }

    private WatchNextSections() {}

    private static boolean enabled() {
        return InstalledTweaks.has("watch-page") && LiteMode.effectiveBool("noRelatedWatchNexts");
    }

    /** Only the main watch-list presentation receives a copy; native response owners keep the original. */
    public static Object filter(Controller owner, Object model) {
        if (owner == null || Looper.myLooper() != Looper.getMainLooper()
                || !InstalledTweaks.has("watch-page")) return model;
        try {
            owner.afterglow_rememberWatchNext(model);
            boolean hide = enabled();
            BOUND.put(owner, hide);
            return hide && model != null ? owner.afterglow_watchInfoOnly(model) : model;
        } catch (Throwable error) {
            Afterglow.error("WatchNextSections.filter", error);
            return model;
        }
    }

    private static void refresh() {
        boolean hide = enabled();
        for (Controller owner : new ArrayList<>(BOUND.keySet())) {
            if (owner == null || Boolean.valueOf(hide).equals(BOUND.get(owner))) continue;
            try {
                View root = owner.afterglow_watchNextRoot();
                if (root != null && root.isAttachedToWindow()) owner.afterglow_refreshWatchNext();
            } catch (Throwable error) { Afterglow.error("WatchNextSections.refresh", error); }
        }
    }
}
