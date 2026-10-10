package dev.twitchpatches.extension.emotes;

import android.app.Activity;
import android.app.Application;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.widget.TextView;
import dev.twitchpatches.extension.settings.PatchSettings;
import dev.twitchpatches.extension.shared.ReactNativeRuntime;
import java.util.ArrayList;
import java.util.WeakHashMap;

public final class EmoteRuntime implements Application.ActivityLifecycleCallbacks, View.OnAttachStateChangeListener {
    private static volatile EmoteRuntime instance;
    private final SharedPreferences preferences;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final WeakHashMap<TextView, EmoteRows.Bound> rows = new WeakHashMap<>();
    private final EmoteCatalog catalog = new EmoteCatalog(channel -> main.post(() -> refresh(channel, null)));
    private final EmoteImages images = new EmoteImages(url -> main.post(() -> refresh(null, url)));
    private final NativeEmotePreview preview = new NativeEmotePreview();
    private volatile int providerMask;
    private volatile String channel;
    private volatile String channelName;
    private int resumed;
    private long lastObservation;

    private EmoteRuntime(Application application) {
        preferences = application.getSharedPreferences("twitch_patches_emotes", 0);
        providerMask = EmotePolicy.restore(preferences.getBoolean("enabled", true), preferences.getInt("provider_mask", -1));
        catalog.setProviderMask(providerMask);
        application.registerActivityLifecycleCallbacks(this);
    }

    public static synchronized void initialize(Application application) {
        if (instance == null) {
            instance = new EmoteRuntime(application);
            PatchSettings.register(new EmoteSetting());
            ReactNativeRuntime.select(4);
        }
    }

    public static boolean enabled() { return providerMask() != 0; }
    public static int providerMask() { return instance == null ? 0 : instance.providerMask; }
    public static boolean providerEnabled(int provider) { return EmotePolicy.includes(providerMask(), provider); }

    static EmoteCatalog catalog() { return instance == null ? null : instance.catalog; }
    static String channelName(String id) { return instance != null && id != null && id.equals(instance.channel) ? instance.channelName : null; }

    public static void setEnabled(boolean value) {
        setProviderMask(value ? EmotePolicy.ALL : 0);
    }

    public static void setProviderEnabled(int provider, boolean value) {
        setProviderMask(EmotePolicy.select(providerMask(), provider, value));
    }

    private static void setProviderMask(int mask) {
        EmoteRuntime runtime = instance;
        if (runtime == null) return;
        runtime.providerMask = mask;
        runtime.preferences.edit().putInt("provider_mask", mask).putBoolean("enabled", mask != 0).apply();
        runtime.catalog.setProviderMask(mask);
        runtime.images.cancelPending();
        ReactNativeRuntime.refresh();
        runtime.main.post(() -> { runtime.preview.close(); runtime.refresh(null, null); });
    }

    public static void onChannelChanged(String id, String name) {
        EmoteRuntime runtime = instance;
        String valid = EmoteProviders.channelId(id);
        if (runtime != null && valid != null) runtime.channelName = name;
        if (runtime == null || valid == null || valid.equals(runtime.channel)) return;
        runtime.channel = valid;
        runtime.catalog.cancelOutside(valid);
        runtime.images.cancelPending();
        runtime.main.post(() -> {
            if (!valid.equals(runtime.channel)) return;
            if (runtime.providerMask != 0 && runtime.resumed > 0) runtime.catalog.ensure(valid);
        });
    }

    public static void bind(TextView view, String sourceChannel) {
        EmoteRuntime runtime = instance;
        if (runtime == null || view == null || Looper.myLooper() != Looper.getMainLooper()) return;
        EmoteRows.Bound previous = runtime.rows.remove(view);
        if (previous != null) EmoteRows.close(previous.rendered);
        view.removeOnAttachStateChangeListener(runtime);
        if (view.getText().length() == 0) return;
        String id = EmoteProviders.channelId(sourceChannel);
        if (id == null) id = runtime.channel;
        EmoteRows.Bound bound = new EmoteRows.Bound(view.getText(), id);
        if (runtime.rows.size() >= 96) {
            TextView oldest = runtime.rows.keySet().iterator().next();
            EmoteRows.close(oldest.getText());
            oldest.removeOnAttachStateChangeListener(runtime);
            runtime.rows.remove(oldest);
        }
        runtime.rows.put(view, bound);
        view.addOnAttachStateChangeListener(runtime);
        if (runtime.providerMask != 0 && runtime.resumed > 0) {
            runtime.catalog.ensure(id);
            if (view.isAttachedToWindow()) EmoteRows.render(view, bound, runtime.catalog.snapshot(id), runtime.images);
        }
    }

    private void refresh(String changedChannel, String image) {
        if (image == null) EmotePickerRuntime.refresh(changedChannel);
        for (TextView view : new ArrayList<>(rows.keySet())) {
            EmoteRows.Bound bound = rows.get(view);
            if (bound == null) continue;
            if (view.getText() != bound.rendered) {
                EmoteRows.close(bound.rendered);
                view.removeOnAttachStateChangeListener(this);
                rows.remove(view);
                continue;
            }
            if (providerMask == 0) {
                EmoteRows.close(view.getText());
                view.setText(bound.original, TextView.BufferType.SPANNABLE);
                bound.rendered = view.getText();
            } else if (resumed > 0 && view.isAttachedToWindow() && view.isShown() &&
                    (changedChannel == null || changedChannel.equals(bound.channel)) && (image == null || bound.pending.contains(image))) {
                catalog.ensure(bound.channel);
                EmoteRows.render(view, bound, catalog.snapshot(bound.channel), images);
            }
        }
    }

    static void observed(int count) {
        EmoteRuntime runtime = instance;
        if (runtime != null && SystemClock.elapsedRealtime() - runtime.lastObservation > 5000) {
            runtime.lastObservation = SystemClock.elapsedRealtime();
            android.util.Log.i("TwitchPatchesEmotes", "Rendered emotes count=" + count);
        }
    }

    static void preview(TextView view, Emote emote) {
        EmoteRuntime runtime = instance;
        if (runtime == null || runtime.providerMask == 0 || runtime.resumed == 0) return;
        EmoteRows.Bound bound = runtime.rows.get(view);
        if (bound == null || !runtime.catalog.snapshot(bound.channel).containsValue(emote)) return;
        runtime.preview.open(view, emote, runtime.images.drawable(view.getResources(), emote.url));
    }

    @Override public void onViewAttachedToWindow(View view) {
        if (!(view instanceof TextView) || providerMask == 0 || resumed == 0) return;
        TextView text = (TextView) view;
        EmoteRows.Bound bound = rows.get(text);
        if (bound != null && text.getText() == bound.rendered) {
            catalog.ensure(bound.channel);
            EmoteRows.render(text, bound, catalog.snapshot(bound.channel), images);
        }
    }
    @Override public void onViewDetachedFromWindow(View view) { if (view instanceof TextView) EmoteRows.stop(((TextView) view).getText()); }
    @Override public void onActivityResumed(Activity activity) { resumed++; EmotePickerImages.resume(); refresh(null, null); }
    @Override public void onActivityPaused(Activity activity) {
        resumed = Math.max(0, resumed - 1);
        if (resumed == 0) {
            EmotePickerImages.pause();
            preview.close();
            rows.keySet().forEach(view -> EmoteRows.stop(view.getText()));
            catalog.cancelPending();
            images.cancelPending();
        }
    }
    @Override public void onActivityCreated(Activity activity, Bundle state) { }
    @Override public void onActivityStarted(Activity activity) { }
    @Override public void onActivityStopped(Activity activity) { }
    @Override public void onActivityDestroyed(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
}
