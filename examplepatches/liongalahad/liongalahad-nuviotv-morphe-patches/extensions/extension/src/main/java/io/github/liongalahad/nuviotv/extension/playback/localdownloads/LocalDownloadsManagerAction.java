package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Activity;
import android.content.Intent;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Opens the Local Downloads-owned settings subpage. */
public enum LocalDownloadsManagerAction implements Function0<Unit> {
    INSTANCE;

    @Override public Unit invoke() {
        Activity activity = MorpheSettingsUi.resumedActivity();
        if (activity != null) {
            activity.startActivity(new Intent(activity, LocalDownloadsManagerActivity.class));
        }
        return Unit.INSTANCE;
    }
}
