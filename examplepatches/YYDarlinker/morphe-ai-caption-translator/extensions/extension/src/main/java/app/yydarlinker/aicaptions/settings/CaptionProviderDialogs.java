package app.yydarlinker.aicaptions.settings;

import app.yydarlinker.aicaptions.ProviderEndpoint;
import app.yydarlinker.aicaptions.host.CaptionActions;

import static app.yydarlinker.aicaptions.settings.CaptionSettingsDialogs.*;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.EditText;

import java.util.List;
import java.util.Locale;
import java.util.function.Consumer;
import java.util.function.Supplier;

/** A provider field is saved explicitly against the profile that opened it. */
final class CaptionProviderDialogs {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private final Context context;
    private final Runnable refresh;
    private boolean busy;

    CaptionProviderDialogs(Context context, Runnable refresh) {
        this.context = context;
        this.refresh = refresh;
    }

    void endpoint(CharSequence title) {
        Profile profile = new Profile(context);
        EditText input = field(context, recover(() -> AiCaptionConfig.baseUrl(context)),
                AiCaptionConfig.DEFAULT_BASE_URL, true);
        MorpheDialog dialog = builder(context, title).setView(input)
                .setNeutralButton(text(context, "reset"), (window, which) -> {
                    input.setText(AiCaptionConfig.DEFAULT_BASE_URL);
                    input.setSelection(input.length());
                    input.setError(null);
                }, false);
        editor(dialog, input, value -> {
            try {
                ProviderEndpoint.validate(value);
            } catch (IllegalArgumentException invalid) {
                throw new ConfigRead.Failure("api_address_invalid");
            }
            commit(profile, "base_url", () -> AiCaptionConfig.saveBaseUrl(context, value));
        });
    }

    void key(CharSequence title) {
        Profile profile = new Profile(context);
        EditText input = field(context, "", text(context, "enter_key"), true);
        // Android preserves view state on recreation. Keep credentials out of that state.
        input.setSaveEnabled(false);
        input.setImeOptions(input.getImeOptions()
                | android.view.inputmethod.EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
        input.setImportantForAutofill(android.view.View.IMPORTANT_FOR_AUTOFILL_NO);
        MorpheDialog dialog = builder(context, title)
                .setMessage(text(context, "message_10d1b374429d"))
                .setView(input);
        dialog.protectContent();
        dialog.setOnDismissListener(window -> input.setText(""));
        editor(dialog, input, value -> {
            if (value.isEmpty()) throw new ConfigRead.Failure("enter_key");
            if (value.indexOf('\n') >= 0 || value.indexOf('\r') >= 0)
                throw new ConfigRead.Failure("message_7da9039cc193");
            commit(profile, null, () -> SecureApiKey.replace(context, value));
        });
    }

    void model(CharSequence title) {
        Profile profile = new Profile(context);
        EditText input = field(context, recover(() -> AiCaptionConfig.model(context)),
                text(context, "model_hint"), true);
        MorpheDialog dialog = builder(context, title).setView(input)
                .setNeutralButton(text(context, "model_choices"), null);
        editor(dialog, input, value -> {
            if (value.isEmpty()) throw new ConfigRead.Failure("model_empty");
            commit(profile, "model", () -> AiCaptionConfig.saveModel(context, value));
        });
        dialog.button(android.R.id.button3).setOnClickListener(view -> run(context, () -> {
            profile.requireCurrent(context);
            String endpoint = credentialed().baseUrl;
            if (busy) return;
            view.setEnabled(false);
            input.setError(null);
            toast(context, text(context, "model_loading_refresh"));
            background(profile, "load_models", () -> CaptionActions.models(endpoint), choices -> {
                if (!dialog.isShowing()) return;
                if (choices.isEmpty()) {
                    input.setError(text(context, "model_ids_empty"));
                    return;
                }
                int selected = choices.indexOf(input.getText().toString().trim());
                builder(context, title).setSingleChoiceItems(choices.toArray(new String[0]), selected,
                        (window, which) -> run(context, () -> {
                            profile.requireCurrent(context);
                            input.setText(choices.get(which));
                            input.setSelection(input.length());
                        })).setNegativeButton(text(context, "cancel"), null).show();
            }, () -> view.setEnabled(true));
        }));
    }

    void testApi(CharSequence title) {
        if (busy) return;
        Profile profile = new Profile(context);
        credentialed();
        toast(context, text(context, "message_49562bf14c82"));
        background(profile, "test_api", CaptionActions::testApi, result -> {
            CaptionActions.refreshConfiguration(context);
            builder(context, title)
                    .setMessage(String.format(Locale.ROOT, text(context, "api_test_ok"), result))
                    .setPositiveButton(text(context, "close"), null).show();
        }, () -> {});
    }

    private AiCaptionConfig.ProviderSettings credentialed() {
        AiCaptionConfig.ProviderSettings config = AiCaptionConfig.load(context);
        if (!config.readable) throw new ConfigRead.Failure();
        if (!config.hasCredential) throw new ConfigRead.Failure("enter_key");
        return config;
    }

    private static String recover(Supplier<String> read) {
        try {
            return read.get();
        } catch (ConfigRead.Failure invalid) {
            return "";
        }
    }

    private interface Work<T> {
        T call() throws Exception;
    }

    private <T> void background(
            Profile profile, String operation, Work<T> work, Consumer<T> success, Runnable finished) {
        busy = true;
        new Thread(() -> {
            try {
                if (!profile.current(context)) {
                    MAIN.post(() -> complete(finished));
                    return;
                }
                T result = work.call();
                MAIN.post(() -> {
                    complete(finished);
                    run(context, () -> {
                        if (profile.current(context) && CaptionSettingsPreference.hasWindow(context))
                            success.accept(result);
                    });
                });
            } catch (Exception | LinkageError error) {
                log(operation, error);
                MAIN.post(() -> {
                    complete(finished);
                    run(context, () -> {
                        if (!profile.current(context) || !CaptionSettingsPreference.hasWindow(context)) return;
                        if (operation.equals("test_api")) {
                            builder(context, text(context, "test_api"))
                                    .setMessage(message(context, error))
                                    .setPositiveButton(text(context, "close"), null).show();
                        } else {
                            toast(context, message(context, error));
                        }
                    });
                });
            }
        }, "caption-" + operation).start();
    }

    private void complete(Runnable finished) {
        busy = false;
        finished.run();
    }

    private interface Write {
        void run() throws Exception;
    }

    private void commit(Profile profile, String field, Write write) throws Exception {
        boolean changed = false;
        Throwable failure = null;
        try {
            synchronized (ApiProfiles.LOCK) {
                profile.requireCurrent(context);
                Object before = stored(field);
                try {
                    write.run();
                } finally {
                    changed = !before.equals(stored(field));
                }
            }
        } catch (Exception | LinkageError error) {
            failure = error;
            throw error;
        } finally {
            if (changed) {
                try {
                    ApiProfiles.changed(context);
                } catch (RuntimeException | LinkageError error) {
                    log("settings_sync", error);
                    toast(context, text(context, "config_saved_sync_pending"));
                    if (failure != null && failure != error) failure.addSuppressed(error);
                } finally {
                    refresh.run();
                }
            }
        }
    }

    private Object stored(String field) {
        if (field == null) return SecureApiKey.checkedCredential(context).identity();
        return java.util.Optional.ofNullable(ApiProfiles.values(context).getAll().get(field));
    }
}
