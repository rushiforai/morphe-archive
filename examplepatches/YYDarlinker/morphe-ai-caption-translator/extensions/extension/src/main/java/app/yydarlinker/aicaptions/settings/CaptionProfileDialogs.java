package app.yydarlinker.aicaptions.settings;

import static app.yydarlinker.aicaptions.settings.CaptionSettingsDialogs.*;

import android.content.Context;

import java.util.Arrays;
import java.util.LinkedHashMap;

/** Selection uses persisted profile IDs even when display names are identical. */
final class CaptionProfileDialogs {
    private final Context context;
    private final Runnable refresh;

    CaptionProfileDialogs(Context context, Runnable refresh) {
        this.context = context;
        this.refresh = refresh;
    }

    void showProfiles() {
        LinkedHashMap<String, String> profiles = ApiProfiles.list(context);
        String active;
        try {
            active = ApiProfiles.active(context);
        } catch (ConfigRead.Failure invalidSelection) {
            active = null;
        }
        String[] ids = profiles.keySet().toArray(new String[0]);
        int selected = Arrays.asList(ids).indexOf(active);
        MorpheDialog.RowAction rename = new MorpheDialog.RowAction(text(context, "profile_rename"),
                (window, index) -> run(context, () -> nameProfile(ids[index], profiles.get(ids[index]))));
        MorpheDialog.RowAction delete = ids.length <= 1 ? null : new MorpheDialog.RowAction(
                text(context, "profile_delete"), (window, index) -> run(context,
                        () -> confirmDelete(ids[index], profiles.get(ids[index]))));
        builder(context, text(context, "profiles_title"))
                .setSingleChoiceItems(profiles.values().toArray(new String[0]), selected,
                        (window, index) -> run(context, () -> select(ids[index])))
                .manageChoices(rename, delete)
                .setNeutralButton(text(context, "profile_add"),
                        (window, which) -> run(context, () -> nameProfile(null, defaultName(ApiProfiles.list(context)))))
                .setPositiveButton(text(context, "close"), null)
                .show();
    }

    private void select(String id) {
        try {
            ApiProfiles.select(context, id);
        } finally {
            refresh.run();
        }
    }

    private void confirmDelete(String id, String name) {
        confirm(context, name, "profile_delete_summary", "delete", () -> {
            try {
                ApiProfiles.delete(context, id);
            } finally {
                refresh.run();
            }
        });
    }

    private void nameProfile(String id, String name) {
        boolean adding = id == null;
        String title = text(context, adding ? "profile_add" : "profile_rename");
        edit(context, title, field(context, name, text(context, "profile_name"), false),
                adding ? text(context, "profile_new_summary") : null, value -> {
                    if (value.isEmpty() || value.length() > 60)
                        throw new ConfigRead.Failure("profile_name_error");
                    if (adding) {
                        String created;
                        synchronized (ApiProfiles.LOCK) {
                            LinkedHashMap<String, String> profiles = ApiProfiles.list(context);
                            if (profiles.size() >= ApiProfiles.MAX_PROFILES)
                                throw new ConfigRead.Failure("profile_limit");
                            String chosen = value.equals(name) && profiles.containsValue(name)
                                    ? defaultName(profiles) : value;
                            created = ApiProfiles.create(context, chosen, AiCaptionConfig.DEFAULT_BASE_URL);
                        }
                        select(created);
                    } else {
                        ApiProfiles.rename(context, id, value);
                        refresh.run();
                    }
                });
    }

    private String defaultName(LinkedHashMap<String, String> profiles) {
        String format = text(context, "profile_default_name");
        var locale = CaptionTextResolver.locale(context);
        int number = 2;
        String name;
        do {
            name = String.format(locale, format, number++);
        } while (profiles.containsValue(name));
        return name;
    }

    void clearKey() {
        Profile profile = new Profile(context);
        String name = ApiProfiles.list(context).get(profile.id);
        confirm(context, name, "profile_clear_key_summary", "clear_key_action", () -> {
            try {
                ApiProfiles.clearKey(context, profile.id);
            } finally {
                refresh.run();
            }
        });
    }
}
