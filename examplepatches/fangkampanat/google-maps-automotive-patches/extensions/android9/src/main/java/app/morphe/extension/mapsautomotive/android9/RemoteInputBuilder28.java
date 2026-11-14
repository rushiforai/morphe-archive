package app.morphe.extension.mapsautomotive.android9;

import android.app.RemoteInput;
import android.os.Build;

/** RemoteInput.Builder.setEditChoicesBeforeSending (patch "Android 9 (API 28)"): not on Android 9, ignored. */
public final class RemoteInputBuilder28 {
    public static final String OWNER = "Landroid/app/RemoteInput$Builder;";

    private RemoteInputBuilder28() {
    }

    public static RemoteInput.Builder setEditChoicesBeforeSending(RemoteInput.Builder builder, int editChoices) {
        if (Build.VERSION.SDK_INT >= 29) return builder.setEditChoicesBeforeSending(editChoices);
        return builder;
    }
}
