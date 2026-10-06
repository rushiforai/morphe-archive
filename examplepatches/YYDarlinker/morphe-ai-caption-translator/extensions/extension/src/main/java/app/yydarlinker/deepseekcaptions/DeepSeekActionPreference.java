package app.yydarlinker.deepseekcaptions;

import android.app.AlertDialog;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.Toast;

/** Immediate utility actions shown as ordinary items inside the nested Morphe settings screen. */
@SuppressWarnings("deprecation")
public final class DeepSeekActionPreference extends CaptionSettingPreference {
    private boolean testing,hasResult;
    static final String KEY_TEST = "deepseek_caption_test_api";
    static final String KEY_RESET_POSITION = "deepseek_caption_reset_position";
    static final String KEY_CLEAR_CACHE = "deepseek_caption_clear_cache";
    static final String KEY_DELETE_KEY = "deepseek_caption_delete_key";
    static final String KEY_CLEAR_DIAGNOSTICS = "deepseek_caption_clear_diagnostics";

    public DeepSeekActionPreference(Context context) {
        super(context);
        initialize();
    }

    public DeepSeekActionPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        initialize();
    }

    public DeepSeekActionPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initialize();
    }

    public DeepSeekActionPreference(
            Context context,
            AttributeSet attrs,
            int defStyleAttr,
            int defStyleRes
    ) {
        super(context, attrs, defStyleAttr, defStyleRes);
        initialize();
    }

    private void initialize() {
        setPersistent(false);
        setOnPreferenceClickListener(preference -> {
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
            toast(CaptionStrings.settings(context,"message_a25bd037963d"));
        } else if (KEY_CLEAR_CACHE.equals(key)) {
            DiskCaptionCache.clear(context);
            RebuildCache.clear(context);
            SourceCaptionCache.clear(context);
            toast(CaptionStrings.settings(context,"message_e8b2177e1cd3"));
        } else if (KEY_DELETE_KEY.equals(key)) {
            new ApiProfilesPreference(context).clearCurrentKey();
        } else if (KEY_CLEAR_DIAGNOSTICS.equals(key)) {
            CaptionDiagnostics.clear(context);
            toast(CaptionStrings.settings(context,"message_8bfb437edfc4"));
        }
    }

    private void testApi() {
        if(!ApiProfiles.flushCurrent()){
            toast(CaptionStrings.settings(getContext(),"profile_invalid_edits"));return;
        }
        DeepSeekConfig.Snapshot config = DeepSeekConfig.load(getContext());
        if (config.apiKey.isEmpty()) {
            toast(CaptionStrings.settings(getContext(),"enter_key"));
            return;
        }
        final String testedProfile=ApiProfiles.active(getContext());
        testing=true;
        setEnabled(false);
        setSummary(CaptionStrings.settings(getContext(), "message_49562bf14c82"));
        new Thread(() -> {
            String result;
            // Success is tracked as a flag, never inferred from the rendered text: the sentence is
            // localized, so matching it would only work in one language.
            boolean available;
            try {
                String translated = ContextualBatchApiClient.test(config);
                available = true;
                result = translated;
            } catch (Throwable error) {
                String detail = error.getMessage();
                available = false;
                result = detail == null || detail.trim().isEmpty()?error.getClass().getSimpleName():detail;
            }
            final String message = result;
            final boolean ok = available;
            postToUi(() -> {
                testing=false;hasResult=true;
                setEnabled(true);
                setSummary(CaptionStrings.settings(getContext(), "api_test_retry_hint"));
                if(!testedProfile.equals(ApiProfiles.active(getContext())))return;
                if(ok) DynamicCaptionController.refreshConfiguration(getContext());
                toast(String.format(java.util.Locale.ROOT,CaptionStrings.settings(getContext(),ok?"api_test_ok":"api_test_failed"),message));
            });
        }, "DeepSeekCaptionApiTest").start();
    }

    private void postToUi(Runnable action) {
        android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        handler.post(action);
    }
    @Override protected void refreshDynamicText(){if(KEY_TEST.equals(getKey())&&(testing||hasResult))setSummary(CaptionStrings.settings(getContext(),testing?"message_49562bf14c82":"api_test_retry_hint"));}

    /** The label is already fully resolved and localized by the caller; re-localizing it would mangle it. */
    private void toast(String text) {
        Toast.makeText(getContext(), text, Toast.LENGTH_LONG).show();
    }
}
