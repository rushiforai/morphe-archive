package dev.twitchpatches.extension.reload;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import java.util.HashSet;
import java.util.Set;

public final class NativeReloadViews {
    private static final String TAG = "twitchpatches_reload_button";
    private static final WeakHashMap<View, Binding> bindings = new WeakHashMap<>();
    private static final Set<String> attachmentStates = new HashSet<>();

    private NativeReloadViews() {}

    public static synchronized void install(View root, Object owner, boolean live, int volumeId) {
        String state = "native XML attachment root=" + (root != null) + " live=" + live
                + " owner=" + (owner instanceof NativeReloadOwner);
        if (attachmentStates.size() < 16 && attachmentStates.add(state)) Log.i("TwitchPatchesReload", state);
        if (root == null || !live || !(owner instanceof NativeReloadOwner)) return;
        View volume = root.findViewById(volumeId);
        ViewGroup parent = volume != null && volume.getParent() instanceof ViewGroup
                ? (ViewGroup) volume.getParent() : null;
        int reloadId = root.getResources().getIdentifier(TAG, "id", root.getContext().getPackageName());
        View button = parent == null || reloadId == 0 ? null : parent.findViewById(reloadId);
        String controls = "native XML controls volume=" + (volume != null) + " button=" + (button != null);
        if (attachmentStates.size() < 16 && attachmentStates.add(controls)) Log.i("TwitchPatchesReload", controls);
        if (button != null) bind(root, button, volume, owner);
    }

    private static void bind(View root, View button, View volume, Object owner) {
        if (bindings.containsKey(button)) return;
        Binding binding = new Binding(root, button, volume, owner);
        bindings.put(button, binding);
        button.setOnClickListener(binding);
        button.addOnAttachStateChangeListener(binding);
        if (button.isAttachedToWindow()) binding.onViewAttachedToWindow(button);
        binding.refresh();
        Log.i("TwitchPatchesReload", "native XML live controls bound");
    }

    static synchronized void refreshPreferences() {
        for (Binding binding : bindings.values()) {
            binding.action.reset();
            binding.refresh();
        }
    }

    private static final class Binding implements View.OnClickListener,
            View.OnAttachStateChangeListener, ViewTreeObserver.OnGlobalLayoutListener {
        private final WeakReference<View> root;
        private final WeakReference<View> button;
        private final WeakReference<View> volume;
        private final ViewReloadHost host;
        private final NativeReloadAction action;

        Binding(View root, View button, View volume, Object owner) {
            this.root = new WeakReference<>(root);
            this.button = new WeakReference<>(button);
            this.volume = new WeakReference<>(volume);
            host = new ViewReloadHost(root, (NativeReloadOwner) owner);
            action = NativeReloadAction.create(host);
        }

        void refresh() {
            View target = button.get(), original = volume.get();
            if (target == null || original == null) return;
            int visibility = ReloadRuntime.enabled() ? original.getVisibility() : View.GONE;
            if (target.getVisibility() != visibility) target.setVisibility(visibility);
            target.setEnabled(original.isEnabled() && action.available());
        }

        @Override public void onClick(View view) {
            if (view.isShown() && view.isEnabled()) {
                Log.i("TwitchPatchesReload", "native XML reload tap");
                action.invoke();
            }
        }

        @Override public void onGlobalLayout() { refresh(); }

        @Override public void onViewAttachedToWindow(View view) {
            View current = root.get();
            if (current != null) current.getViewTreeObserver().addOnGlobalLayoutListener(this);
            refresh();
        }

        @Override public void onViewDetachedFromWindow(View view) {
            View current = root.get();
            if (current != null && current.getViewTreeObserver().isAlive())
                current.getViewTreeObserver().removeOnGlobalLayoutListener(this);
            action.reset();
        }
    }
}
