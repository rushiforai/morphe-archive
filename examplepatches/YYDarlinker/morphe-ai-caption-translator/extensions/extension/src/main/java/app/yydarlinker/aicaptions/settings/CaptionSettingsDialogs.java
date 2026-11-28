package app.yydarlinker.aicaptions.settings;

import app.yydarlinker.aicaptions.diagnostics.CaptionDiagnostics;

import android.content.Context;
import android.text.InputType;
import android.widget.EditText;
import android.widget.Toast;

/** Common dialog controls, error reporting and stale profile checks. */
public final class CaptionSettingsDialogs {
    private CaptionSettingsDialogs() {}

    interface SaveText {
        void save(String value) throws Exception;
    }

    static final class Profile {
        final String id;
        private final long revision;

        Profile(Context context) {
            synchronized (ApiProfiles.LOCK) {
                id = ApiProfiles.active(context);
                revision = ApiProfiles.revision();
            }
        }

        boolean current(Context context) {
            synchronized (ApiProfiles.LOCK) {
                return revision == ApiProfiles.revision() && id.equals(ApiProfiles.active(context));
            }
        }

        void requireCurrent(Context context) {
            if (!current(context)) throw new ConfigRead.Failure("config_operation_uncertain");
        }
    }

    static MorpheDialog builder(Context context, CharSequence title) {
        return new MorpheDialog(context, title);
    }

    public static void confirm(
            Context context, CharSequence title, String messageKey, String actionKey, Runnable action) {
        builder(context, title)
                .setMessage(text(context, messageKey))
                .setNegativeButton(text(context, "cancel"), null)
                .setPositiveButton(text(context, actionKey),
                        (dialog, which) -> run(context, action)).show();
    }

    static EditText field(Context context, String value, String hint, boolean data) {
        EditText field = new EditText(context);
        field.setSingleLine(true);
        if (data) field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        field.setHint(hint);
        field.setText(value);
        field.setSelection(field.length());
        CaptionTextResolver.direction(field, data);
        MorpheDialog.styleInput(field);
        return field;
    }

    static void edit(
            Context context, CharSequence title, EditText field, String message, SaveText save) {
        editor(builder(context, title).setView(field).setMessage(message), field, save);
    }

    static void editor(MorpheDialog dialog, EditText field, SaveText save) {
        Context context = field.getContext();
        dialog
                .setNegativeButton(text(context, "cancel"), null)
                .setPositiveButton(text(context, "profile_save"), null).show();
        dialog.button(android.R.id.button1).setOnClickListener(view -> {
            try {
                save.save(field.getText().toString().trim());
                dialog.dismiss();
            } catch (Exception | LinkageError error) {
                log("settings_save", error);
                field.setError(message(context, error));
            }
        });
    }

    public static void run(Context context, Runnable operation) {
        try {
            operation.run();
        } catch (RuntimeException | LinkageError error) {
            log("settings_action", error);
            toast(context, message(context, error));
        }
    }

    static String message(Context context, Throwable error) {
        if (error instanceof ConfigRead.Failure) {
            return text(context, ((ConfigRead.Failure) error).messageKey);
        }
        return text(context, "config_operation_uncertain");
    }

    static void log(String operation, Throwable error) {
        // Exception messages can contain a provider URL or key.
        android.util.Log.w("CaptionAddon", operation + ": " + CaptionDiagnostics.errorDetail(error));
    }

    static void toast(Context context, String message) {
        Toast.makeText(context, message, Toast.LENGTH_LONG).show();
    }

    static String text(Context context, String key) {
        return CaptionStrings.get(context, key);
    }
}
