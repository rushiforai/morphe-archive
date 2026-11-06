package dev.twitchpatches.extension.ui;

import android.view.View;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

public final class UiViewPolicy {
    private static final WeakHashMap<View, State> states = new WeakHashMap<>();

    public static int visibility(View view, int requested) {
        State state = states.get(view);
        if (state == null) return requested;
        if (!state.applying) state.requested = requested;
        return UiSettings.enabled(state.key) ? View.GONE : state.requested;
    }

    public static void bind(View view) {
        Object tag = view.getTag();
        if (!(tag instanceof String) || !((String) tag).startsWith("twitchpatches_ui:")) return;
        String key = ((String) tag).substring("twitchpatches_ui:".length());
        State state = new State(view, key);
        states.put(view, state);
        view.addOnAttachStateChangeListener(state);
        if (view.isAttachedToWindow()) state.onViewAttachedToWindow(view);
        state.apply();
    }

    private static final class State implements View.OnAttachStateChangeListener {
        private final WeakReference<View> reference;
        private final String key;
        private int requested;
        private boolean applying;
        private AutoCloseable subscription;

        State(View view, String key) {
            reference = new WeakReference<>(view);
            this.key = key;
            requested = view.getVisibility();
        }

        void apply() {
            View view = reference.get();
            if (view == null) return;
            applying = true;
            try { view.setVisibility(UiSettings.enabled(key) ? View.GONE : requested); }
            finally { applying = false; }
        }

        @Override public void onViewAttachedToWindow(View view) {
            if (subscription == null) subscription = UiSettings.observe(() -> {
                View current = reference.get();
                if (current != null) current.post(this::apply);
            });
            apply();
        }

        @Override public void onViewDetachedFromWindow(View view) {
            if (subscription == null) return;
            try { subscription.close(); }
            catch (Exception error) { android.util.Log.w("TwitchPatchesUI", "View subscription cleanup failed"); }
            subscription = null;
        }
    }
}
