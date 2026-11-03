package app.voidhack.extension.applemusic.library;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.LocaleList;

import java.util.Locale;

final class LibraryStrings {
    private LibraryStrings() {}

    private static Resources resources(Context context) {
        Configuration configuration = new Configuration(context.getResources().getConfiguration());
        Locale primary = configuration.getLocales().get(0);
        configuration.setLocales(new LocaleList("ja".equals(primary.getLanguage()) ? Locale.JAPANESE : Locale.ENGLISH));
        return context.createConfigurationContext(configuration).getResources();
    }

    static int id(Context context, String type, String name) {
        int id = context.getResources().getIdentifier(name, type, context.getPackageName());
        if (id == 0) throw new IllegalStateException("Missing Apple Music resource: " + type + "/" + name);
        return id;
    }

    static String text(Context context, String name, Object... arguments) {
        return resources(context).getString(id(context, "string", "voidhack_library_" + name), arguments);
    }

    static String quantity(Context context, String name, int count) {
        return resources(context).getQuantityString(id(context, "plurals", "voidhack_library_" + name), count, count);
    }

    static String counts(Context context, LibraryBackup backup) {
        return text(context, "count_pair", quantity(context, "songs", backup.library.size()),
                quantity(context, "playlists", backup.playlists.size()));
    }
}
