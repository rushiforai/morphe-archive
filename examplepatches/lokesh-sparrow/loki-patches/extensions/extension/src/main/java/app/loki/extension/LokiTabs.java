package app.loki.extension;

import java.util.ArrayList;
import java.util.List;

/** IMO: removes the voice-rooms tab from the Home tab list. Never throws; on any doubt the list is left alone. */
public final class LokiTabs {
    /** IMO's id for the voice-rooms ("clubhouse") tab; chats are 0, calls 4 and contacts 3. */
    private static final int VOICE = 2;

    private LokiTabs() {
    }

    /** The newer Home layout: its tab model holds enum values, and the voice-rooms one is named CLUBHOUSE. */
    public static List<?> withoutClubhouse(List<?> tabs) {
        try {
            if (tabs == null) return null;
            if (!LokiSwitches.imoOn(LokiSwitches.IMO_VOICE)) return tabs;
            ArrayList<Object> kept = new ArrayList<>(tabs.size());
            for (Object tab : tabs) {
                if (tab == null || !"CLUBHOUSE".equals(String.valueOf(tab))) kept.add(tab);
            }
            return kept.isEmpty() ? tabs : kept;
        } catch (Throwable error) {
            return tabs;
        }
    }

    /**
     * IMO's suggestion strip above the chat box (dice, lips, rose... one tap sends it). Every visibility change the
     * strip's own class makes comes through here: with the switch on, the strip (a LinearLayout) stays gone; anything
     * else, and everything with the switch off, is passed on unchanged. Never throws.
     */
    public static void suggestionVisibility(android.view.View view, int visibility) {
        int wanted = visibility;
        try {
            if (view instanceof android.widget.LinearLayout && LokiSwitches.imoOn(LokiSwitches.IMO_SUGGESTIONS)) {
                wanted = android.view.View.GONE;
            }
        } catch (Throwable ignored) {
            // Fall back to what IMO asked for.
        }
        if (view != null) view.setVisibility(wanted);
        if (view instanceof android.widget.LinearLayout) guardStrip((android.widget.LinearLayout) view);
    }


    /**
     * Keeps IMO's suggestion strip hidden whoever shows it. The strip's own class is rewritten to go through
     * suggestionVisibility, which also starts watching the strip. IMO's code is not touched beyond that: but IMO's chat screens can also change the strip from outside that class (the field is
     * public), and which of them runs depends on the phone. So the strip itself is watched: before every frame, if it
     * is visible while the switch is on, it is hidden again. Never throws.
     */
    private static final java.util.WeakHashMap<android.view.View, Boolean> GUARDED = new java.util.WeakHashMap<>();

    private static void guardStrip(final android.widget.LinearLayout strip) {
        try {
            if (strip == null) return;
            synchronized (GUARDED) {
                if (GUARDED.put(strip, Boolean.TRUE) != null) return;
            }
            final android.view.ViewTreeObserver.OnPreDrawListener watcher = new android.view.ViewTreeObserver.OnPreDrawListener() {
                @Override
                public boolean onPreDraw() {
                    try {
                        if (strip.getVisibility() != android.view.View.GONE && LokiSwitches.imoOn(LokiSwitches.IMO_SUGGESTIONS)) {
                            strip.setVisibility(android.view.View.GONE);
                            return false;
                        }
                    } catch (Throwable ignored) {
                        // Leave the frame alone.
                    }
                    return true;
                }
            };
            watchStrip(strip, watcher);
            strip.addOnAttachStateChangeListener(new android.view.View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(android.view.View view) {
                    watchStrip(strip, watcher);
                }

                @Override
                public void onViewDetachedFromWindow(android.view.View view) {
                }
            });
        } catch (Throwable ignored) {
            // The strip stays as IMO draws it.
        }
    }

    private static void watchStrip(android.view.View strip, android.view.ViewTreeObserver.OnPreDrawListener watcher) {
        android.view.ViewTreeObserver observer = strip.getViewTreeObserver();
        if (!observer.isAlive()) return;
        observer.removeOnPreDrawListener(watcher);
        observer.addOnPreDrawListener(watcher);
    }

    public static List<Integer> withoutVoice(List<Integer> tabs) {
        try {
            if (tabs == null) return null;
            if (!LokiSwitches.imoOn(LokiSwitches.IMO_VOICE)) return tabs;
            ArrayList<Integer> kept = new ArrayList<>(tabs.size());
            for (Integer tab : tabs) {
                if (tab == null || tab.intValue() != VOICE) kept.add(tab);
            }
            return kept.isEmpty() ? tabs : kept;
        } catch (Throwable error) {
            return tabs;
        }
    }
}
