package dev.supperelias2.sbs.morphe.features;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import dev.supperelias2.sbs.morphe.MorpheSettings;

/** Opt-in handoff of this session's direct VOD URI. No persistence or logging. */
@SuppressWarnings("unused")
public final class ExternalPlayerHooks {
    private static final Map<Object, Integer> OFFERED = new WeakHashMap<>();
    private ExternalPlayerHooks() {}

    public static void onDirectLoaded(Object manager) {
        if (!MorpheSettings.enabled("external_player", false) || manager == null) return;
        Object vm = Reflect.viewModel(manager);
        Object controller = Reflect.field(vm, "playbackController");
        if (!Boolean.FALSE.equals(Reflect.value(Reflect.field(controller, "_isMediaLive")))) return;
        Object item = Reflect.call(Reflect.player(manager), "getCurrentMediaItem");
        Object configuration = Reflect.field(item, "localConfiguration");
        Object source = Reflect.field(configuration, "uri");
        if (!(source instanceof Uri) || Reflect.field(configuration, "drmConfiguration") != null) return;
        Uri uri = (Uri) source;
        if (!"https".equalsIgnoreCase(uri.getScheme()) && !"http".equalsIgnoreCase(uri.getScheme())) return;
        synchronized (OFFERED) {
            int fingerprint = uri.hashCode();
            Integer previous = OFFERED.get(manager);
            if (previous != null && previous == fingerprint) return;
            OFFERED.put(manager, fingerprint);
        }
        WeakReference<Object> reference = new WeakReference<>(manager);
        new Handler(Looper.getMainLooper()).post(() -> open(reference.get(), uri));
    }

    private static void open(Object manager, Uri uri) {
        if (!MorpheSettings.enabled("external_player", false)) return;
        Activity activity = MorpheSettings.getActivity();
        Object player = Reflect.player(manager);
        if (activity == null || !activity.hasWindowFocus() || player == null) return;
        Object item = Reflect.call(player, "getCurrentMediaItem");
        Object local = Reflect.field(item, "localConfiguration");
        if (local == null || !uri.equals(Reflect.field(local, "uri")) || Reflect.field(local, "drmConfiguration") != null) return;
        Object controller = Reflect.field(Reflect.viewModel(manager), "playbackController");
        if (!Boolean.FALSE.equals(Reflect.value(Reflect.field(controller, "_isMediaLive")))) return;
        Intent view = new Intent(Intent.ACTION_VIEW).setDataAndType(uri, "video/*");
        List<ResolveInfo> matches = activity.getPackageManager().queryIntentActivities(view, 0);
        List<Intent> choices = new ArrayList<>();
        for (ResolveInfo match : matches) {
            if (match.activityInfo == null || activity.getPackageName().equals(match.activityInfo.packageName)) continue;
            choices.add(new Intent(view).setComponent(new ComponentName(match.activityInfo.packageName, match.activityInfo.name)));
        }
        if (choices.isEmpty()) return; // Normal SBS playback continues when no external player is installed.
        try {
            Intent chooser = Intent.createChooser(choices.remove(0), "Open SBS video in…");
            if (!choices.isEmpty()) chooser.putExtra(Intent.EXTRA_INITIAL_INTENTS, choices.toArray(new Intent[0]));
            activity.startActivity(chooser);
            // Keep SBS's prepared media intact: cancel/return can resume with its normal play button.
            Reflect.call(player, "pause");
        } catch (ActivityNotFoundException | SecurityException ignored) {
            // Keep the normal loaded stream; no account/session data is reported.
        }
    }
}
