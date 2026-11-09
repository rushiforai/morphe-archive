package app.voidhack.extension.applemusic.library;

import android.content.Context;
import android.content.res.Configuration;

import java.util.Locale;

final class MetadataStrings {
    private MetadataStrings() {}

    static String text(Context context, String name, Object... arguments) {
        Configuration configuration = new Configuration(context.getResources().getConfiguration());
        configuration.setLocale("ja".equals(configuration.getLocales().get(0).getLanguage()) ? Locale.JAPANESE : Locale.ENGLISH);
        Context localized = context.createConfigurationContext(configuration);
        return localized.getString(LibraryStrings.id(context, "string", "voidhack_metadata_" + name), arguments);
    }
}
