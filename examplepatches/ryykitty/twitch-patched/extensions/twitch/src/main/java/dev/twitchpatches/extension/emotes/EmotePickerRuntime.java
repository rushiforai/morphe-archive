package dev.twitchpatches.extension.emotes;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

public final class EmotePickerRuntime {
    private static final String PREFIX = "twitchpatches-picker:";
    private static final String[] PROVIDERS = {"BTTV", "7TV", "FrankerFaceZ"};
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static WeakReference<Object> presenter = new WeakReference<>(null);
    private static WeakReference<Object> delegate = new WeakReference<>(null);
    private static WeakReference<View> root = new WeakReference<>(null);
    private static List<?> original = Collections.emptyList();
    private static final int[] positions = {-1, -1, -1};
    private static final ImageView[] buttons = new ImageView[3];
    private static String channel;
    private static boolean channelVisible;
    private static boolean received;

    private EmotePickerRuntime() { }

    public static void begin(Object owner, String id) {
        presenter = new WeakReference<>(owner);
        delegate.clear();
        root.clear();
        received = false;
        channel = EmoteProviders.channelId(id);
        original = Collections.emptyList();
        java.util.Arrays.fill(positions, -1);
        EmoteCatalog catalog = EmoteRuntime.catalog();
        if (catalog != null && EmoteRuntime.enabled()) catalog.ensure(channel);
    }

    public static void close(Object owner) {
        if (presenter.get() != owner) return;
        presenter.clear();
        delegate.clear();
        root.clear();
        original = Collections.emptyList();
        for (int index = 0; index < 3; index++) buttons[index] = null;
        EmotePickerImages.close();
    }

    public static List<?> augment(List<?> sections, boolean visible) {
        original = sections;
        received = true;
        channelVisible = visible;
        EmoteCatalog catalog = EmoteRuntime.catalog();
        if (catalog == null || presenter.get() == null || !EmoteRuntime.enabled()) {
            java.util.Arrays.fill(positions, -1);
            updateButtons();
            return sections;
        }
        int insertion = EmotePickerBridge.insertionIndex(sections, EmoteRuntime.channelName(channel));
        List<Object> result = new ArrayList<>(sections.subList(0, insertion));
        java.util.Arrays.fill(positions, -1);
        for (int provider = 0; provider < 3; provider++) {
            if (channel != null) append(result, catalog, provider, channel);
        }
        result.addAll(sections.subList(insertion, sections.size()));
        for (int provider = 0; provider < 3; provider++) append(result, catalog, provider, null);
        updateButtons();
        return result;
    }

    private static void append(List<Object> result, EmoteCatalog catalog, int provider, String scope) {
        if (!EmoteRuntime.providerEnabled(provider)) return;
        Map<String, Emote> entries = catalog.providerSnapshot(scope, provider);
        if (entries.isEmpty()) return;
        List<Object> models = new ArrayList<>(entries.size());
        for (Emote emote : entries.values()) {
            String url = emote.url;
            if (emote.animated && url.startsWith("https://cdn.betterttv.net/")) url = url.replace(".webp", ".gif");
            models.add(EmotePickerBridge.emote(PREFIX + url, emote.code, emote.animated));
        }
        if (positions[provider] < 0) positions[provider] = EmotePickerBridge.itemCount(result);
        result.add(EmotePickerBridge.section(PROVIDERS[provider] + (scope == null ? " Global Emotes" : " Channel Emotes"), models));
    }

    public static String imageURL(String id) {
        if (id == null || !id.startsWith(PREFIX)) return null;
        String url = id.substring(PREFIX.length());
        return EmoteProviders.imageUrl(url) ? url : null;
    }

    public static void bind(Object owner, View view) {
        ImageView anchor = view.findViewById(EmotePickerBridge.footerId());
        if (anchor == null || !(anchor.getParent() instanceof LinearLayout)) return;
        delegate = new WeakReference<>(owner);
        root = new WeakReference<>(view);
        EmotePickerImages.open(view);
        LinearLayout bar = (LinearLayout) anchor.getParent();
        for (int provider = 0; provider < 3; provider++) {
            final int index = provider;
            ImageView button = new ImageView(view.getContext());
            int size = Math.round(44 * view.getResources().getDisplayMetrics().density);
            int padding = Math.round(10 * view.getResources().getDisplayMetrics().density);
            button.setLayoutParams(new LinearLayout.LayoutParams(size, bar.getLayoutParams().height));
            button.setPadding(padding, padding, padding, padding);
            button.setScaleType(ImageView.ScaleType.FIT_CENTER);
            button.setContentDescription(PROVIDERS[provider] + " emotes");
            EmoteProviderIcons.bind(button, provider);
            button.setOnClickListener(clicked -> {
                Object target = delegate.get();
                View current = root.get();
                if (target != null && current != null && positions[index] >= 0)
                    EmotePickerBridge.scroll(target, current, positions[index]);
            });
            bar.addView(button);
            buttons[provider] = button;
        }
        updateButtons();
    }

    static void refresh(String changedChannel) {
        if (changedChannel != null && !changedChannel.equals(channel)) return;
        Object owner = presenter.get();
        View view = root.get();
        if (owner == null || !received || view == null || !view.isAttachedToWindow()) return;
        List<?> snapshot = original;
        boolean visible = channelVisible;
        MAIN.post(() -> { if (owner == presenter.get()) EmotePickerBridge.publish(owner, snapshot, visible); });
    }

    private static void updateButtons() {
        for (int index = 0; index < 3; index++) {
            ImageView button = buttons[index];
            if (button == null) continue;
            button.setVisibility(EmoteRuntime.providerEnabled(index) ? View.VISIBLE : View.GONE);
            button.setEnabled(positions[index] >= 0);
            button.setAlpha(positions[index] >= 0 ? 1f : 0.5f);
        }
    }
}
