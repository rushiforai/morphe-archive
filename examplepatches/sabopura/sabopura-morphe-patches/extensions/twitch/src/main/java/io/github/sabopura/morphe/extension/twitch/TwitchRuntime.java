package io.github.sabopura.morphe.extension.twitch;

import android.content.Context;

import io.github.sabopura.morphe.extension.twitch.ads.AdBlock;
import io.github.sabopura.morphe.extension.twitch.app.AmoledBlack;
import io.github.sabopura.morphe.extension.twitch.app.AppHooks;
import io.github.sabopura.morphe.extension.twitch.app.CrashGuard;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.chat.ViewCustomization;
import io.github.sabopura.morphe.extension.twitch.player.PlayerTools;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/** Runs once when Twitch starts, for every combination of selected patches. */
public final class TwitchRuntime {
    private TwitchRuntime() {
    }

    /** Injection point: start of TwitchApplication.onCreate. */
    public static void initialize(Context context) {
        try {
            boolean paused = CrashGuard.start(context);
            // Storage only: hooks stopped by a pause can still be reached and must not find it missing.
            AdBlock.initialize(context);
            PlayerTools.initialize(context);
            ChatSettings.preferences(context);
            AppHooks.initialize(context);
            if (paused) return;
            if (Features.has(Feature.AMOLED_BLACK)) AmoledBlack.initialize(context);
            if (Features.any(Feature.DECLUTTER, Feature.NAV_POSITION, Feature.LANDSCAPE_CHAT))
                ViewCustomization.initialize(context);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.initialize", e);
        }
    }
}
