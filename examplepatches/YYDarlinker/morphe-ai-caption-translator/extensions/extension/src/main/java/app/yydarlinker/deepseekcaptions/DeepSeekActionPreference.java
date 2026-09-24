package app.yydarlinker.deepseekcaptions;

import android.app.AlertDialog;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.Toast;

/** Immediate utility actions shown as ordinary items inside the nested Morphe settings screen. */
@SuppressWarnings("deprecation")
public final class DeepSeekActionPreference extends android.preference.Preference {
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
            toast("字幕已恢复水平居中的默认位置");
        } else if (KEY_CLEAR_CACHE.equals(key)) {
            DiskCaptionCache.clear(context);
            SourceCaptionCache.clear(context);
            toast("字幕缓存已清除");
        } else if (KEY_DELETE_KEY.equals(key)) {
            new ApiProfilesPreference(context).clearCurrentKey();
        } else if (KEY_CLEAR_DIAGNOSTICS.equals(key)) {
            CaptionDiagnostics.clear(context);
            toast("诊断记录已清空");
        }
    }

    private void testApi() {
        if(!ApiProfiles.flushCurrent()){
            toast(CaptionStrings.settings(getContext(),"profile_invalid_edits"));return;
        }
        DeepSeekConfig.Snapshot config = DeepSeekConfig.load(getContext());
        if (config.apiKey.isEmpty()) {
            toast("请先填写 API Key");
            return;
        }
        final String testedProfile=ApiProfiles.active(getContext());
        setEnabled(false);
        setSummary(CaptionStrings.localize(getContext(), "测试中…"));
        new Thread(() -> {
            String result;
            try {
                String translated = ContextualBatchApiClient.test(config);
                result = "API 可用：" + translated;
            } catch (Throwable error) {
                String detail = error.getMessage();
                result = "API 测试失败：" +
                        (detail == null || detail.trim().isEmpty()
                                ? error.getClass().getSimpleName()
                                : detail);
            }
            final String message = result;
            postToUi(() -> {
                setEnabled(true);
                setSummary(CaptionStrings.localize(getContext(), "使用当前已自动保存的配置测试连接"));
                if(!testedProfile.equals(ApiProfiles.active(getContext())))return;
                if(message.startsWith("API 可用：")) DynamicCaptionController.refreshConfiguration(getContext());
                toast(message);
            });
        }, "DeepSeekCaptionApiTest").start();
    }

    private void postToUi(Runnable action) {
        android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        handler.post(action);
    }

    private void toast(String text) {
        Toast.makeText(getContext(), CaptionStrings.localize(getContext(),text), Toast.LENGTH_LONG).show();
    }
}
