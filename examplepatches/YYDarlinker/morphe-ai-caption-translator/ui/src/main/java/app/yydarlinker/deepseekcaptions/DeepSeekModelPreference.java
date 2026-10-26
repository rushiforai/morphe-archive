package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.SystemClock;
import android.text.InputType;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Inline model editor plus automatic OpenAI-compatible model discovery. */
@SuppressWarnings("deprecation")
public final class DeepSeekModelPreference extends ProfileEditorPreference {
    static final String KEY_MODEL = "deepseek_caption_model";

    private static final long RETRY_AUTO_FETCH_AFTER_MS = 30_000L;
    private static final Pattern HTTP_FAILURE =
            Pattern.compile("^模型列表 HTTP ([0-9]{3})(?:：(.*))?$", Pattern.DOTALL);
    private static final AtomicLong THREAD_IDS = new AtomicLong();
    private static final ExecutorService NETWORK =
            Executors.newCachedThreadPool(
                    runnable -> {
                        Thread thread =
                                new Thread(
                                        runnable,
                                        "DeepSeekModelCatalog-" + THREAD_IDS.incrementAndGet());
                        thread.setDaemon(true);
                        return thread;
                    });
    private static final Object CACHE_LOCK = new Object();
    private static volatile WeakReference<DeepSeekModelPreference> active =
            new WeakReference<>(null);
    private static String cachedFingerprint = "";
    private static List<String> cachedModels = Collections.emptyList();
    private static String lastAttemptFingerprint = "";
    private static long lastAttemptAtMs;

    private Runnable pendingCredentialRefresh;
    private Button refresh;
    private TextView choices;
    private PopupWindow modelMenu;
    private List<String> shownModels = Collections.emptyList();
    private volatile int fetchGeneration;

    public DeepSeekModelPreference(Context context) {
        this(context, null);
    }

    public DeepSeekModelPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    static void onCredentialsChanged(Context context) {
        synchronized (CACHE_LOCK) {
            cachedFingerprint = "";
            cachedModels = Collections.emptyList();
            lastAttemptFingerprint = "";
        }
        DeepSeekModelPreference preference = active.get();
        if (preference != null) preference.scheduleCredentialRefresh();
    }

    // ---- The field ----

    @Override
    void configureEditor(EditText value) {
        value.setSingleLine(true);
        value.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        value.setImeOptions(EditorInfo.IME_ACTION_DONE);
        uiHint(value, "model_hint_manual_only");
    }

    @Override
    String initialValue() {
        return DeepSeekConfig.model(getContext());
    }

    @Override
    void addDetails(Context context, LinearLayout root) {
        active = new WeakReference<>(this);
        LinearLayout controls = new LinearLayout(context);
        controls.setOrientation(LinearLayout.HORIZONTAL);
        controls.setGravity(Gravity.CENTER_VERTICAL | Gravity.END);
        root.addView(controls, wide());

        choices = new TextView(context);
        CaptionSettingsStyle.title(choices);
        choices.setTextSize(14);
        choices.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
        choices.setSingleLine(true);
        choices.setEllipsize(TextUtils.TruncateAt.END);
        choices.setMinHeight(CaptionSettingsStyle.dp(context, 48));
        choices.setClickable(true);
        choices.setFocusable(true);
        choices.setOnClickListener(view -> showModelMenu());
        choices.setVisibility(View.GONE);
        controls.addView(
                choices,
                new LinearLayout.LayoutParams(0, CaptionSettingsStyle.dp(context, 48), 1f));

        refresh = new Button(context, null, android.R.attr.borderlessButtonStyle);
        CaptionSettingsStyle.button(refresh);
        refresh.setMinimumWidth(0);
        refresh.setMinHeight(CaptionSettingsStyle.dp(context, 48));
        uiText(refresh, "refresh");
        refresh.setAllCaps(false);
        refresh.setOnClickListener(view -> fetchModels(true));
        controls.addView(
                refresh,
                new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        state = new TextView(context);
        CaptionSettingsStyle.caption(state);
        state.setPadding(0, CaptionSettingsStyle.dp(context, 4), 0, 0);
        state.setMaxLines(Integer.MAX_VALUE);
        state.setEllipsize(null);
        root.addView(state, wide());
    }

    @Override
    void save(String value) throws Exception {
        DeepSeekConfig.saveModel(getContext(), value);
    }

    @Override
    Object storedValue() {
        return ApiProfiles.values(getContext()).getAll().get("model");
    }

    @Override
    void saved() {
        setState("model_saved", false);
    }

    @Override
    String defaultFailure() {
        return CaptionStrings.get(getContext(), "model_save_failed");
    }

    @Override
    void edited() {
        updatePickerLabel();
    }

    @Override
    void attached(boolean currentProfile) {
        if (!currentProfile) return;
        super.attached(true);
        active = new WeakReference<>(this);
        if (refresh != null) refresh.setEnabled(true);
        showCachedOrFetch();
    }

    @Override
    void detached() {
        dismissModelMenu();
        super.detached();
        fetchGeneration++;
        if (active.get() == this) active = new WeakReference<>(null);
    }

    @Override
    void profileSwitched() {
        dismissModelMenu();
        fetchGeneration++;
        if (pendingCredentialRefresh != null) main.removeCallbacks(pendingCredentialRefresh);
    }

    @Override
    protected void refreshDynamicText() {
        if (choices != null) updatePickerLabel();
    }

    // ---- Discovery ----

    private void showCachedOrFetch() {
        if (!bound()) return;
        DeepSeekConfig.ProviderSettings config = DeepSeekConfig.load(getContext());
        if (!config.readable) {
            setState("config_unreadable", true);
            return;
        }
        if (!config.hasCredential) {
            setState("model_hint_manual_only", false);
            return;
        }
        String fingerprint = credentialFingerprint(config);
        synchronized (CACHE_LOCK) {
            if (fingerprint.equals(cachedFingerprint) && !cachedModels.isEmpty()) {
                showModels(new ArrayList<>(cachedModels), false);
                return;
            }
            long age = SystemClock.elapsedRealtime() - lastAttemptAtMs;
            if (fingerprint.equals(lastAttemptFingerprint) && age < RETRY_AUTO_FETCH_AFTER_MS) {
                setState("model_hint_retry", false);
                return;
            }
        }
        fetchModels(false);
    }

    private void fetchModels(boolean userInitiated) {
        if (!bound()) return;
        DeepSeekConfig.ProviderSettings config = DeepSeekConfig.load(getContext());
        if (!config.readable) {
            setState("config_unreadable", true);
            return;
        }
        if (!config.hasCredential) {
            setState("model_hint_key_first", true);
            return;
        }
        final String fingerprint = credentialFingerprint(config);
        final int generation = ++fetchGeneration;
        synchronized (CACHE_LOCK) {
            lastAttemptFingerprint = fingerprint;
            lastAttemptAtMs = SystemClock.elapsedRealtime();
        }
        if (refresh != null) refresh.setEnabled(false);
        setState(userInitiated ? "model_loading_refresh" : "model_loading_auto", false);

        NETWORK.execute(
                () -> {
                    try {
                        List<String> models = DeepSeekModelCatalog.fetch(config.baseUrl);
                        if (generation != fetchGeneration) return;
                        synchronized (CACHE_LOCK) {
                            cachedFingerprint = fingerprint;
                            cachedModels = new ArrayList<>(models);
                        }
                        main.post(
                                () -> {
                                    if (generation != fetchGeneration) return;
                                    if (refresh != null) {
                                        refresh.setEnabled(true);
                                        refresh.setText(
                                                CaptionStrings.get(getContext(), "refresh"));
                                    }
                                    showModels(models, true);
                                });
                    } catch (Throwable failure) {
                        main.post(
                                () -> {
                                    if (generation != fetchGeneration) return;
                                    if (refresh != null) refresh.setEnabled(true);
                                    uiText(
                                            state,
                                            () ->
                                                    String.format(
                                                            Locale.ROOT,
                                                            CaptionStrings.get(
                                                                    getContext(),
                                                                    "model_load_failed"),
                                                            failureText(getContext(), failure)));
                                    state.setAlpha(1f);
                                });
                    }
                });
    }

    private void scheduleCredentialRefresh() {
        if (pendingCredentialRefresh != null) main.removeCallbacks(pendingCredentialRefresh);
        pendingCredentialRefresh =
                () -> {
                    pendingCredentialRefresh = null;
                    fetchModels(false);
                };
        main.postDelayed(pendingCredentialRefresh, 500L);
    }

    private static String credentialFingerprint(DeepSeekConfig.ProviderSettings config) {
        return config.baseUrl + '|' + config.credentialId;
    }

    /**
     * Only the catalog's authored error envelope is UI text; provider details remain byte-for-byte.
     */
    static String failureText(Context context, Throwable failure) {
        String detail = failure.getMessage();
        if (detail == null || detail.trim().isEmpty()) return failure.getClass().getSimpleName();
        StackTraceElement[] trace = failure.getStackTrace();
        boolean authored =
                trace.length > 0
                        && DeepSeekModelCatalog.class.getName().equals(trace[0].getClassName())
                        && "fetch".equals(trace[0].getMethodName());
        if (!authored) return detail;
        if ("接口没有返回可选择的模型 ID".equals(detail)) return CaptionStrings.get(context, "model_ids_empty");
        if ("请先填写 API Key".equals(detail))
            return CaptionStrings.get(context, "model_hint_key_first");
        Matcher http = HTTP_FAILURE.matcher(detail);
        if (http.matches())
            return "HTTP " + http.group(1) + (http.group(2) == null ? "" : ": " + http.group(2));
        return detail;
    }

    private void setState(String text, boolean important) {
        if (state == null) return;
        uiText(state, text);
        state.setAlpha(important ? 1f : 0.72f);
    }

    // ---- The model list ----

    private void showModels(List<String> models, boolean newlyFetched) {
        if (choices == null) return;
        dismissModelMenu();
        shownModels = new ArrayList<>(models);
        updatePickerLabel();
        choices.setVisibility(View.VISIBLE);
        setState(newlyFetched ? "model_list_updated" : "model_pick_or_type", false);
    }

    private void updatePickerLabel() {
        if (choices == null) return;
        String name = editor == null ? "" : editor.getText().toString().trim();
        boolean listed = shownModels.contains(name);
        String label = listed ? name : modelCount();
        choices.setText(label + "  ▾");
        choices.setContentDescription(CaptionStrings.get(getContext(), "model") + ": " + label);
        CaptionTextResolver.direction(choices, listed);
    }

    private String modelCount() {
        return CaptionStrings.get(getContext(), "model") + " (" + shownModels.size() + ")";
    }

    private void dismissModelMenu() {
        if (modelMenu != null) {
            modelMenu.dismiss();
            modelMenu = null;
        }
    }

    private void showModelMenu() {
        if (choices == null || !choices.isAttachedToWindow() || shownModels.isEmpty() || !bound())
            return;
        dismissModelMenu();
        Context context = getContext();
        int row = CaptionSettingsStyle.dp(context, 48);
        int width =
                Math.min(
                        context.getResources().getDisplayMetrics().widthPixels
                                - CaptionSettingsStyle.dp(context, 32),
                        Math.max(choices.getWidth(), CaptionSettingsStyle.dp(context, 240)));
        if (width <= 0) return;
        LinearLayout rows = new LinearLayout(context);
        rows.setOrientation(LinearLayout.VERTICAL);
        TextView headingRow = modelMenuRow(context, modelCount(), false, true, null, null);
        uiText(headingRow, () -> "    " + modelCount());
        rows.addView(headingRow, new LinearLayout.LayoutParams(-1, row));
        String selected = editor.getText().toString().trim();
        for (String model : shownModels) {
            TextView item = modelMenuRow(context, model, model.equals(selected), false, null, null);
            item.setOnClickListener(
                    v -> {
                        dismissModelMenu();
                        if (editor == null || !bound()) return;
                        editor.setText(model);
                        editor.setSelection(model.length());
                        commitNow(model, true);
                        updatePickerLabel();
                    });
            rows.addView(item, new LinearLayout.LayoutParams(-1, row));
        }
        ScrollView scroll = new ScrollView(context);
        scroll.setFillViewport(false);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.addView(rows);
        LinearLayout surface = new LinearLayout(context);
        surface.setBackground(CaptionSettingsStyle.menuSurface(context));
        surface.setClipToOutline(true);
        surface.addView(scroll, new LinearLayout.LayoutParams(-1, -1));
        int maxHeight = Math.round(context.getResources().getDisplayMetrics().heightPixels * .55f);
        PopupWindow popup =
                new PopupWindow(
                        surface, width, Math.min(row * (shownModels.size() + 1), maxHeight), true);
        popup.setBackgroundDrawable(CaptionSettingsStyle.menuSurface(context));
        popup.setOutsideTouchable(true);
        popup.setElevation(CaptionSettingsStyle.dp(context, 8));
        popup.setInputMethodMode(PopupWindow.INPUT_METHOD_NOT_NEEDED);
        popup.setOnDismissListener(
                () -> {
                    if (modelMenu == popup) modelMenu = null;
                });
        modelMenu = popup;
        popup.showAsDropDown(choices);
    }

    static TextView modelMenuRow(
            Context context,
            String model,
            boolean selected,
            boolean heading,
            View reused,
            ViewGroup parent) {
        TextView row = reused instanceof TextView ? (TextView) reused : new TextView(context);
        CaptionSettingsStyle.title(row);
        row.setTextSize(14);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinHeight(CaptionSettingsStyle.dp(context, 48));
        row.setPadding(
                CaptionSettingsStyle.dp(context, 16),
                CaptionSettingsStyle.dp(context, 12),
                CaptionSettingsStyle.dp(context, 16),
                CaptionSettingsStyle.dp(context, 12));
        row.setSingleLine(true);
        row.setEllipsize(TextUtils.TruncateAt.END);
        row.setText((selected ? "✓  " : "    ") + model);
        row.setContentDescription(
                model + (selected ? ", " + CaptionStrings.get(context, "selected_suffix") : ""));
        CaptionTextResolver.direction(row, !heading);
        int fg = CaptionSettingsStyle.primary(context);
        row.setTextColor(heading ? CaptionSettingsStyle.secondary(context) : fg);
        // Only the outer popup owns the corners: a platform selector must not replace the neutral
        // fill as the first or last item scrolls into view.
        row.setBackground(
                new RippleDrawable(
                        ColorStateList.valueOf(CaptionSettingsStyle.tint(fg, 24)),
                        new ColorDrawable(
                                selected ? CaptionSettingsStyle.tint(fg, 20) : Color.TRANSPARENT),
                        null));
        return row;
    }
}
