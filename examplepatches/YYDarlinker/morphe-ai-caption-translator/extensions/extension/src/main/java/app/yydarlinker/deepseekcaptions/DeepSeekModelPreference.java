package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

/** Inline model editor plus automatic OpenAI-compatible model discovery. */
@SuppressWarnings("deprecation")
public final class DeepSeekModelPreference extends CaptionSettingPreference implements ApiProfiles.Editor {
    static final String KEY_MODEL = "deepseek_caption_model";

    private static final long AUTO_SAVE_DELAY_MS = 850L;
    private static final long RETRY_AUTO_FETCH_AFTER_MS = 30_000L;
    private static final AtomicLong THREAD_IDS = new AtomicLong();
    private static final ExecutorService NETWORK = Executors.newCachedThreadPool(
            new ThreadFactory() {
                @Override public Thread newThread(Runnable runnable) {
                    Thread thread = new Thread(
                            runnable,
                            "DeepSeekModelCatalog-" + THREAD_IDS.incrementAndGet()
                    );
                    thread.setDaemon(true);
                    return thread;
                }
            }
    );
    private static final Object CACHE_LOCK = new Object();
    private static volatile WeakReference<DeepSeekModelPreference> active =
            new WeakReference<>(null);
    private static String cachedFingerprint = "";
    private static List<String> cachedModels = Collections.emptyList();
    private static String lastAttemptFingerprint = "";
    private static long lastAttemptAtMs;

    private final Handler main = new Handler(Looper.getMainLooper());
    private Runnable pendingSave;
    private Runnable pendingCredentialRefresh;
    private EditText editor;
    private TextView state;
    private Button refresh;
    private TextView choices;
    private PopupWindow modelMenu;
    private List<String> shownModels = Collections.emptyList();
    private String lastCommitted = "";
    private String boundProfile="";
    private View boundView;
    private long boundRevision=-1;
    private volatile int fetchGeneration;

    public DeepSeekModelPreference(Context context) {
        super(context);
        initialize();
    }

    public DeepSeekModelPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        initialize();
    }

    public DeepSeekModelPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initialize();
    }

    public DeepSeekModelPreference(
            Context context,
            AttributeSet attrs,
            int defStyleAttr,
            int defStyleRes
    ) {
        super(context, attrs, defStyleAttr, defStyleRes);
        initialize();
    }

    private void initialize() {
        ApiProfiles.register(this);
        setPersistent(false);
        setSelectable(false);
    }

    static void onCredentialsChanged(Context context) {
        synchronized (CACHE_LOCK) {
            cachedFingerprint = "";
            cachedModels = Collections.emptyList();
            lastAttemptFingerprint = "";
        }
        DeepSeekModelPreference preference = active.get();
        if (preference == null) return;
        preference.scheduleCredentialRefresh();
    }

    @Override
    public View getView(View convertView, ViewGroup parent) {
        View safe = boundView != null && (boundView.getParent()==null || boundView.getParent()==parent) && boundRevision==ApiProfiles.revision() && boundProfile.equals(ApiProfiles.active(getContext())) && (KEY_MODEL+boundProfile).equals(boundView.getTag())
                ? boundView
                : null;
        return super.getView(safe, parent);
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        ApiProfiles.register(this);
        // Commit before a scroll-induced recreation; the old debounce must not be discarded.
        flushProfile();
        cancelPendingSave();
        boundProfile=ApiProfiles.active(getContext());
        boundRevision=ApiProfiles.revision();
        active = new WeakReference<>(this);
        Context context = getContext();
        if (parent instanceof ListView) {
            ((ListView) parent).setItemsCanFocus(true);
            parent.setDescendantFocusability(ViewGroup.FOCUS_AFTER_DESCENDANTS);
        }

        LinearLayout root = new LinearLayout(context);
        boundView = root;
        root.setTag(KEY_MODEL+boundProfile);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setDescendantFocusability(ViewGroup.FOCUS_AFTER_DESCENDANTS);
        CaptionSettingsStyle.row(root);

        TextView title = new TextView(context);
        uiText(title,()->String.valueOf(getTitle()));
        CaptionSettingsStyle.title(title);
        title.setPadding(0,0,0,dp(8));
        root.addView(title, matchWrap());

        editor = new InlineCaptionEditor(context);
        editor.setId(CaptionEditorIds.forKey(KEY_MODEL));
        editor.setSingleLine(true);
        editor.setFocusableInTouchMode(true);
        CaptionSettingsStyle.editor(editor);
        editor.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        editor.setImeOptions(EditorInfo.IME_ACTION_DONE);
        uiHint(editor,"model_hint_manual_only");
        String initial = DeepSeekConfig.load(context).model;
        editor.setText(initial);
        editor.setSelection(initial.length());
        lastCommitted = initial;
        root.addView(editor, matchWrap());

        LinearLayout controls = new LinearLayout(context);
        controls.setOrientation(LinearLayout.HORIZONTAL);
        controls.setGravity(android.view.Gravity.CENTER_VERTICAL | android.view.Gravity.END);

        refresh = new Button(context,null,android.R.attr.borderlessButtonStyle);
        CaptionSettingsStyle.button(refresh);
        refresh.setMinimumWidth(0);
        refresh.setMinHeight(dp(48));
        uiText(refresh,"refresh");
        refresh.setAllCaps(false);
        refresh.setOnClickListener(view -> fetchModels(true));
        controls.addView(refresh, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        state = new TextView(context);
        CaptionSettingsStyle.caption(state);
        state.setPadding(0,dp(6),0,0);
        state.setPadding(dp(10), 0, 0, 0);
        root.addView(controls, matchWrap());

        choices = new TextView(context);
        CaptionSettingsStyle.title(choices);
        choices.setTextSize(14);
        choices.setGravity(android.view.Gravity.CENTER_VERTICAL | android.view.Gravity.START);
        choices.setSingleLine(true);
        choices.setEllipsize(android.text.TextUtils.TruncateAt.END);
        choices.setMinHeight(dp(48));
        choices.setClickable(true);
        choices.setFocusable(true);
        choices.setOnClickListener(view -> showModelMenu());
        choices.setVisibility(View.GONE);
        controls.addView(choices,0,new LinearLayout.LayoutParams(0,dp(48),1f));
        state.setPadding(0,dp(4),0,0);state.setMaxLines(Integer.MAX_VALUE);state.setEllipsize(null);
        root.addView(state,matchWrap());

        final EditText createdEditor=editor;
        final String createdProfile=boundProfile;
        editor.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {}

            @Override public void afterTextChanged(Editable value) {
                if(createdEditor==editor&&createdProfile.equals(ApiProfiles.active(getContext()))){
                    scheduleSave(value == null ? "" : value.toString());
                    updatePickerLabel();
                }
            }
        });
        editor.setOnFocusChangeListener((view, hasFocus) -> {
            if(view!=editor||!createdProfile.equals(ApiProfiles.active(getContext())))return;
            if (!hasFocus) commitNow(editor.getText().toString(), true);
        });
        editor.setOnEditorActionListener((view, actionId, event) -> {
            if(view!=editor||!createdProfile.equals(ApiProfiles.active(getContext())))return false;
            boolean done = actionId == EditorInfo.IME_ACTION_DONE ||
                    (event != null && event.getKeyCode() == KeyEvent.KEYCODE_ENTER &&
                            event.getAction() == KeyEvent.ACTION_DOWN);
            if (!done) return false;
            commitNow(editor.getText().toString(), true);
            editor.clearFocus();
            return true;
        });
        editor.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View view) {
                if(view!=editor||!createdProfile.equals(ApiProfiles.active(getContext())))return;
                ApiProfiles.register(DeepSeekModelPreference.this);
                active = new WeakReference<>(DeepSeekModelPreference.this);
                if (refresh != null) refresh.setEnabled(true);
                showCachedOrFetch();
            }

            @Override public void onViewDetachedFromWindow(View view) {
                if(view==editor)ApiProfiles.unregister(DeepSeekModelPreference.this);
                if(view!=editor||!createdProfile.equals(ApiProfiles.active(getContext())))return;
                dismissModelMenu();
                commitNow(((EditText) view).getText().toString(), false);
                fetchGeneration++;
                if (active.get() == DeepSeekModelPreference.this) {
                    active = new WeakReference<>(null);
                }
            }
        });

        return root;
    }

    private void showCachedOrFetch() {
        if(boundRevision!=ApiProfiles.revision() || !boundProfile.equals(ApiProfiles.active(getContext())))return;
        DeepSeekConfig.Snapshot config = DeepSeekConfig.load(getContext());
        if (config.apiKey.isEmpty()) {
            setState("model_hint_manual_only", false);
            return;
        }
        String fingerprint = credentialFingerprint(config);
        synchronized (CACHE_LOCK) {
            if (fingerprint.equals(cachedFingerprint) && !cachedModels.isEmpty()) {
                showModels(new ArrayList<>(cachedModels), false);
                return;
            }
            long age = SystemClockCompat.elapsedRealtime() - lastAttemptAtMs;
            if (fingerprint.equals(lastAttemptFingerprint) && age < RETRY_AUTO_FETCH_AFTER_MS) {
                setState("model_hint_retry", false);
                return;
            }
        }
        fetchModels(false);
    }

    private void fetchModels(boolean userInitiated) {
        if(boundRevision!=ApiProfiles.revision() || !boundProfile.equals(ApiProfiles.active(getContext())))return;
        DeepSeekConfig.Snapshot config = DeepSeekConfig.load(getContext());
        if (config.apiKey.isEmpty()) {
            setState("model_hint_key_first", true);
            return;
        }
        final String fingerprint = credentialFingerprint(config);
        final int generation = ++fetchGeneration;
        synchronized (CACHE_LOCK) {
            lastAttemptFingerprint = fingerprint;
            lastAttemptAtMs = SystemClockCompat.elapsedRealtime();
        }
        if (refresh != null) refresh.setEnabled(false);
        setState(userInitiated ? "model_loading_refresh" : "model_loading_auto", false);

        NETWORK.execute(() -> {
            try {
                List<String> models = DeepSeekModelCatalog.fetch(config.baseUrl, config.apiKey);
                if (generation != fetchGeneration) return;
                synchronized (CACHE_LOCK) {
                    cachedFingerprint = fingerprint;
                    cachedModels = new ArrayList<>(models);
                }
                main.post(() -> {
                    if (generation != fetchGeneration) return;
                    if (refresh != null) {
                        refresh.setEnabled(true);
                        refresh.setText(CaptionStrings.settings(getContext(), "refresh"));
                    }
                    showModels(models, true);
                });
            } catch (Throwable error) {
                String message = error.getMessage();
                if (message == null || message.trim().isEmpty()) {
                    message = error.getClass().getSimpleName();
                }
                final Throwable failure = error;
                main.post(() -> {
                    if (generation != fetchGeneration) return;
                    if (refresh != null) refresh.setEnabled(true);
                    uiText(state,()->String.format(java.util.Locale.ROOT,CaptionStrings.settings(getContext(),"model_load_failed"),failureText(getContext(),failure)));state.setAlpha(1f);
                });
            }
        });
    }

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
        String label = shownModels.contains(name) ? name
                : CaptionStrings.settings(getContext(), "model") + " (" + shownModels.size() + ")";
        choices.setText(label + "  ▾");
        choices.setContentDescription(CaptionStrings.settings(getContext(), "model") + ": " + label);
        CaptionTextResolver.direction(choices,shownModels.contains(name));
    }

    private void dismissModelMenu() {
        if (modelMenu != null) { modelMenu.dismiss(); modelMenu = null; }
    }

    private void showModelMenu() {
        if (choices == null || !choices.isAttachedToWindow() || shownModels.isEmpty()
                || boundRevision != ApiProfiles.revision()
                || !boundProfile.equals(ApiProfiles.active(getContext()))) return;
        dismissModelMenu();
        Context context = getContext();
        int width = Math.min(context.getResources().getDisplayMetrics().widthPixels - dp(32),
                Math.max(choices.getWidth(), dp(240)));
        if (width <= 0) return;
        LinearLayout rows = new LinearLayout(context);
        rows.setOrientation(LinearLayout.VERTICAL);
        String heading = CaptionStrings.settings(context, "model") + " (" + shownModels.size() + ")";
        TextView headingRow=modelMenuRow(context, heading, false, true, null, null);
        uiText(headingRow,()->"    "+CaptionStrings.settings(getContext(),"model")+" ("+shownModels.size()+")");
        rows.addView(headingRow,
                new LinearLayout.LayoutParams(-1, dp(48)));
        String selected = editor.getText().toString().trim();
        for (String model : shownModels) {
            TextView row = modelMenuRow(context, model, model.equals(selected), false, null, null);
            row.setOnClickListener(v -> {
                dismissModelMenu();
                if (editor == null || !boundProfile.equals(ApiProfiles.active(context))) return;
                editor.setText(model);
                editor.setSelection(model.length());
                commitNow(model, true);
                updatePickerLabel();
            });
            rows.addView(row, new LinearLayout.LayoutParams(-1, dp(48)));
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
        int height = Math.min(dp(48) * (shownModels.size() + 1), maxHeight);
        PopupWindow popup = new PopupWindow(surface, width, height, true);
        popup.setBackgroundDrawable(CaptionSettingsStyle.menuSurface(context));
        popup.setOutsideTouchable(true);
        popup.setElevation(dp(8));
        popup.setInputMethodMode(PopupWindow.INPUT_METHOD_NOT_NEEDED);
        popup.setOnDismissListener(() -> { if (modelMenu == popup) modelMenu = null; });
        modelMenu = popup;
        popup.showAsDropDown(choices);
    }

    static TextView modelMenuRow(Context context,String model,boolean selected,boolean heading,View reused,ViewGroup parent){
        // Only the outer popup owns the corners: do not let a platform selector
        // replace the neutral fill as the first or last item scrolls into view.
        TextView row=reused instanceof TextView?(TextView)reused:new TextView(context);
        CaptionSettingsStyle.title(row);row.setTextSize(14);row.setGravity(android.view.Gravity.CENTER_VERTICAL);
        row.setMinHeight(CaptionSettingsStyle.dp(context,48));
        row.setPadding(CaptionSettingsStyle.dp(context,16),CaptionSettingsStyle.dp(context,12),CaptionSettingsStyle.dp(context,16),CaptionSettingsStyle.dp(context,12));
        row.setSingleLine(true);row.setEllipsize(android.text.TextUtils.TruncateAt.END);
        row.setText((selected?"✓  ":"    ")+model);
        row.setContentDescription(model+(selected?", "+CaptionStrings.settings(context,"selected_suffix"):""));
        CaptionTextResolver.direction(row,!heading);
        int fg=CaptionSettingsStyle.primary(context);
        row.setTextColor(heading?CaptionSettingsStyle.secondary(context):fg);
        android.graphics.drawable.ColorDrawable fill=new android.graphics.drawable.ColorDrawable(selected?CaptionSettingsStyle.tint(fg,20):android.graphics.Color.TRANSPARENT);
        row.setBackground(new android.graphics.drawable.RippleDrawable(android.content.res.ColorStateList.valueOf(CaptionSettingsStyle.tint(fg,24)),fill,null));
        return row;
    }

    private void scheduleCredentialRefresh() {
        if (pendingCredentialRefresh != null) main.removeCallbacks(pendingCredentialRefresh);
        pendingCredentialRefresh = () -> {
            pendingCredentialRefresh = null;
            fetchModels(false);
        };
        main.postDelayed(pendingCredentialRefresh, 500L);
    }

    private void scheduleSave(String value) {
        cancelPendingSave();
        pendingSave = () -> commit(value, false);
        main.postDelayed(pendingSave, AUTO_SAVE_DELAY_MS);
    }

    private void commitNow(String value, boolean reportInvalid) {
        cancelPendingSave();
        commit(value, reportInvalid);
    }

    private void commit(String raw, boolean reportInvalid) {
        if(boundRevision!=ApiProfiles.revision() || !boundProfile.equals(ApiProfiles.active(getContext())))return;
        String value = raw == null ? "" : raw.trim();
        if (value.equals(lastCommitted)) return;
        try {
            DeepSeekConfig.saveModel(getContext(), value);
            lastCommitted = value;
            if (editor != null) editor.setError(null);
            setState("model_saved", false);
            if(!ApiProfiles.flushing())DynamicCaptionController.refreshConfiguration(getContext());
        } catch (Throwable error) {
            String detail = error.getMessage();
            if (detail == null || detail.trim().isEmpty()) detail = CaptionStrings.settings(getContext(),"model_save_failed");
            // One template for the whole sentence: the provider's own wording is the only variable here.
            final String failure=detail;
            uiText(state,()->String.format(java.util.Locale.ROOT,CaptionStrings.settings(getContext(),"value_retained"),CaptionStrings.localize(getContext(),failure)));state.setAlpha(1f);
            if (reportInvalid && editor != null) editor.setError(CaptionStrings.localize(getContext(),detail));
        }
    }

    /**
     * Accepts either a settings key (resolved now) or text the caller has already localized and
     * interpolated; resolving twice would leave a half-translated sentence behind.
     */
    private void setState(String text, boolean important) {
        if (state == null) return;
        uiText(state,text);
        state.setAlpha(important ? 1f : 0.72f);
    }

    /** Only the catalog's authored error envelope is UI text; provider details remain byte-for-byte. */
    static String failureText(Context context,Throwable failure){
        String detail=failure.getMessage();
        if(detail==null||detail.trim().isEmpty())return failure.getClass().getSimpleName();
        StackTraceElement[] trace=failure.getStackTrace();
        boolean authored=trace.length>0&&DeepSeekModelCatalog.class.getName().equals(trace[0].getClassName())&&"fetch".equals(trace[0].getMethodName());
        if(!authored)return detail;
        if("接口没有返回可选择的模型 ID".equals(detail))return CaptionStrings.settings(context,"model_ids_empty");
        if("请先填写 API Key".equals(detail))return CaptionStrings.settings(context,"model_hint_key_first");
        java.util.regex.Matcher http=java.util.regex.Pattern.compile("^模型列表 HTTP ([0-9]{3})(?:：(.*))?$",java.util.regex.Pattern.DOTALL).matcher(detail);
        if(http.matches())return "HTTP "+http.group(1)+(http.group(2)==null?"":": "+http.group(2));
        return detail;
    }
    @Override protected void refreshDynamicText(){if(choices!=null)updatePickerLabel();}

    @Override public boolean flushProfile(){
        if(editor==null||boundRevision!=ApiProfiles.revision()||!boundProfile.equals(ApiProfiles.active(getContext())))return true;
        String value=editor.getText().toString().trim();commitNow(value,true);
        return value.equals(lastCommitted);
    }
    @Override public void profileChanged(){
        cancelPendingSave();
        dismissModelMenu();
        fetchGeneration++;
        if(pendingCredentialRefresh!=null)main.removeCallbacks(pendingCredentialRefresh);
        boundProfile="";boundView=null;lastCommitted="";
        if(editor!=null){editor.setText("");editor.clearFocus();}
        notifyChanged();
    }

    private void cancelPendingSave() {
        if (pendingSave != null) main.removeCallbacks(pendingSave);
        pendingSave = null;
    }

    private static String credentialFingerprint(DeepSeekConfig.Snapshot config) {
        return config.baseUrl + '|' + Integer.toHexString(config.apiKey.hashCode());
    }

    private LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
    }

    private int dp(int value) {
        return Math.round(value * getContext().getResources().getDisplayMetrics().density);
    }

    /** Isolated wrapper makes the clock replaceable in plain JVM tests. */
    private static final class SystemClockCompat {
        static long elapsedRealtime() {
            return android.os.SystemClock.elapsedRealtime();
        }
    }
}
