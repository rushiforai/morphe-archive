package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import android.content.Intent;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Opens the shared storage path picker when at least one consumer is active. */
public enum MorpheStorageFolderAction implements Function0<Unit> {
    INSTANCE,
    DISABLED;

    @Override public Unit invoke() {
        if (this == INSTANCE && MorpheStorageConsumers.isAnyEnabled()) {
            Activity activity = MorpheSettingsUi.resumedActivity();
            if (activity != null) activity.startActivity(
                    new Intent(activity, MorpheStorageFolderPickerActivity.class));
        }
        return Unit.INSTANCE;
    }
}
