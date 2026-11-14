package app.morphe.extension.mapsautomotive.android9;

import android.app.Person;
import android.content.pm.ShortcutInfo;
import android.os.Build;

/** Android 10 settings of ShortcutInfo.Builder (patch "Android 9 (API 28)"): not on Android 9, ignored. */
public final class ShortcutInfoBuilder28 {
    public static final String OWNER = "Landroid/content/pm/ShortcutInfo$Builder;";

    private ShortcutInfoBuilder28() {
    }

    public static ShortcutInfo.Builder setLongLived(ShortcutInfo.Builder builder, boolean longLived) {
        if (Build.VERSION.SDK_INT >= 29) return builder.setLongLived(longLived);
        return builder;
    }

    public static ShortcutInfo.Builder setPersons(ShortcutInfo.Builder builder, Person[] persons) {
        if (Build.VERSION.SDK_INT >= 29) return builder.setPersons(persons);
        return builder;
    }
}
