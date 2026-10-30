package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.widget.Toast;

import java.util.Locale;

/** Immediate utility actions shown as ordinary items inside the nested Morphe settings screen. */
@SuppressWarnings("deprecation")
public final class DeepSeekActionPreference extends CaptionSettingPreference {
    private boolean testing, hasResult;
    static final String KEY_TEST = "deepseek_caption_test_api";
    static final String KEY_RESET_POSITION = "deepseek_caption_reset_position";
    static final String KEY_CLEAR_CACHE = "deepseek_caption_clear_cache";
    static final String KEY_DELETE_KEY = "deepseek_caption_delete_key";
    static final String KEY_CLEAR_DIAGNOSTICS = "deepseek_caption_clear_diagnostics";

    public DeepSeekActionPreference(Context context) {
        this(context, null);
    }

    public DeepSeekActionPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        setPersistent(false);
        setOnPreferenceClickListener(
                preference -> {
                    performAction();
                    return true;
                });
    }

    private void performAction() {
        String key = getKey();
        Context context = getContext();
        if (KEY_TEST.equals(key)) {
            testApi();
        } else if (KEY_RESET_POSITION.equals(key)) {
            DeepSeekConfig.resetCaptionPositions(context);
            CaptionOverlay.refreshStyle(context);
            toast(CaptionStrings.get(context, "message_a25bd037963d"));
        } else if (KEY_CLEAR_CACHE.equals(key)) {
            CaptionActions.clearCache(context);
        } else if (KEY_DELETE_KEY.equals(key)) {
            new ApiProfilesPreference(context).clearCurrentKey();
        } else if (KEY_CLEAR_DIAGNOSTICS.equals(key)) {
            CaptionDiagnostics.clear(context);
            toast(CaptionStrings.get(context, "message_8bfb437edfc4"));
        }
    }

    private void testApi() {
        try {
        if (!ApiProfiles.flushCurrent()) {
            toast(CaptionStrings.get(getContext(), "profile_invalid_edits"));
            return;
        }
        } catch (RuntimeException notificationFailure) {
            // The flush may already have saved fields. Their inline state keeps that fact;
            // this action stops before starting a connection or claiming a rollback.
            toast(CaptionStrings.get(getContext(), "config_operation_uncertain"));
            return;
        }
        DeepSeekConfig.ProviderSettings config = DeepSeekConfig.load(getContext());
        if (!config.readable) {
            toast(CaptionStrings.get(getContext(), "config_unreadable"));
            return;
        }
        if (!config.hasCredential) {
            toast(CaptionStrings.get(getContext(), "enter_key"));
            return;
        }
        final String testedProfile = ApiProfiles.active(getContext());
        testing = true;
        setEnabled(false);
        setSummary(CaptionStrings.get(getContext(), "message_49562bf14c82"));
        new Thread(
                        () -> {
                            // Success is a flag, never inferred from the rendered (localized) text.
                            String result;
                            boolean available;
                            try {
                                result = CaptionActions.testApi();
                                available = true;
                            } catch (Throwable error) {
                                String detail = error.getMessage();
                                available = false;
                                result =
                                        detail == null || detail.trim().isEmpty()
                                                ? error.getClass().getSimpleName()
                                                : detail;
                            }
                            final String message = result;
                            final boolean ok = available;
                            new Handler(Looper.getMainLooper())
                                    .post(
                                            () -> {
                                                testing = false;
                                                hasResult = true;
                                                setEnabled(true);
                                                setSummary(
                                                        CaptionStrings.get(
                                                                getContext(),
                                                                "api_test_retry_hint"));
                                                if (!testedProfile.equals(
                                                        ApiProfiles.active(getContext()))) return;
                                                if (ok)
                                                    CaptionActions.refreshConfiguration(
                                                            getContext());
                                                toast(
                                                        String.format(
                                                                Locale.ROOT,
                                                                CaptionStrings.get(
                                                                        getContext(),
                                                                        ok
                                                                                ? "api_test_ok"
                                                                                : "api_test_failed"),
                                                                message));
                                            });
                        },
                        "DeepSeekCaptionApiTest")
                .start();
    }

    @Override
    protected void refreshDynamicText() {
        if (KEY_TEST.equals(getKey()) && (testing || hasResult))
            setSummary(
                    CaptionStrings.get(
                            getContext(),
                            testing ? "message_49562bf14c82" : "api_test_retry_hint"));
    }

    /**
     * The label is already fully resolved and localized by the caller; re-localizing it would
     * mangle it.
     */
    private void toast(String text) {
        Toast.makeText(getContext(), text, Toast.LENGTH_LONG).show();
    }
}
