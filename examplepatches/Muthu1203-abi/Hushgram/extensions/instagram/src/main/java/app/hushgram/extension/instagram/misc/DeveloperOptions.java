/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import android.app.Activity;

/** Read-only bridge used to label MetaConfig rows from Instagram's active Quick Experiments and control developer options access. */
public final class DeveloperOptions {
    private DeveloperOptions() {
    }

    /** Whether long-pressing the Home icon opens developer options. */
    public static boolean enableDevOptions(Activity activity) {
        app.hushgram.extension.instagram.download.DeveloperFlagMapping.checkMappings(activity);
        return Settings.DEVELOPER_OPTIONS.get();
    }

    /** Whether long-pressing the Home icon directly opens MetaConfig / Quick Experiments. */
    public static boolean directlyOpenMetaConfig() {
        return Settings.DIRECTLY_OPEN_METACONFIG.get();
    }

    /** Returns Instagram's known parameter name, keeping its fallback for entries not in the experiment list. */
    public static String parameterLabel(Object entry, String fallback, String configIdField, String indexIdField) {
        int config = readId(entry, configIdField);
        int index = readId(entry, indexIdField);
        return app.hushgram.extension.instagram.entity.DeveloperOptions.parameterName(config, index, fallback);
    }

    /** Returns Instagram's known config name, keeping its fallback when this config is unknown. */
    public static String configLabel(Object entry, String fallback, String configIdField) {
        int config = readId(entry, configIdField);
        return app.hushgram.extension.instagram.entity.DeveloperOptions.configName(config, fallback);
    }

    private static int readId(Object entry, String fieldName) {
        if (entry == null) return -1;
        try {
            java.lang.reflect.Field field = entry.getClass().getDeclaredField(fieldName);
            if (field.getType() != int.class) {
                throw new IllegalStateException(fieldName + " is not an int field");
            }
            field.setAccessible(true);
            return field.getInt(entry);
        } catch (Exception e) {
            Logger.printException(() -> "Could not read Instagram developer-option ID " + fieldName, e);
            return -1;
        }
    }
}
