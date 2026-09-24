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
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Spinner;
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
public final class DeepSeekModelPreference extends android.preference.Preference implements ApiProfiles.Editor {
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
    private Spinner choices;
    private String lastCommitted = "";
    private String boundProfile="";
    private View boundView;
    private long boundRevision=-1;
    private volatile int fetchGeneration;
    private boolean populatingChoices;

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
        title.setText(getTitle());
        CaptionSettingsStyle.title(title);
        title.setPadding(0,0,0,dp(8));
        root.addView(title, matchWrap());

        editor = new InlineCaptionEditor(context);
        editor.setSingleLine(true);
        editor.setFocusableInTouchMode(true);
        CaptionSettingsStyle.editor(editor);
        editor.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        editor.setImeOptions(EditorInfo.IME_ACTION_DONE);
        editor.setHint(CaptionStrings.localize(getContext(), "可从下方选择，也可手动输入模型 ID"));
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
        refresh.setText(CaptionStrings.localize(getContext(), "刷新"));
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

        choices = new Spinner(context);
        choices.setVisibility(View.GONE);
        choices.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override public void onItemSelected(
                    AdapterView<?> parentView,
                    View view,
                    int position,
                    long id
            ) {
                if (parentView!=choices || !boundProfile.equals(ApiProfiles.active(getContext())) || populatingChoices || position <= 0) return;
                Object selected = parentView.getItemAtPosition(position);
                if (!(selected instanceof String)) return;
                String model = ((String) selected).trim();
                if (model.isEmpty()) return;
                editor.setText(model);
                editor.setSelection(model.length());
                commitNow(model, true);
            }

            @Override public void onNothingSelected(AdapterView<?> parentView) {}
        });
        controls.addView(choices,0,new LinearLayout.LayoutParams(0,dp(48),1f));
        state.setPadding(0,dp(4),0,0);state.setMaxLines(2);
        root.addView(state,matchWrap());

        final EditText createdEditor=editor;
        final String createdProfile=boundProfile;
        editor.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {}

            @Override public void afterTextChanged(Editable value) {
                if(createdEditor==editor&&createdProfile.equals(ApiProfiles.active(getContext())))scheduleSave(value == null ? "" : value.toString());
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
            setState("填写 API 地址和 API Key 后会自动获取；仍可手动输入", false);
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
                setState("可点“刷新”重试，或直接输入模型 ID", false);
                return;
            }
        }
        fetchModels(false);
    }

    private void fetchModels(boolean userInitiated) {
        if(boundRevision!=ApiProfiles.revision() || !boundProfile.equals(ApiProfiles.active(getContext())))return;
        DeepSeekConfig.Snapshot config = DeepSeekConfig.load(getContext());
        if (config.apiKey.isEmpty()) {
            setState("请先填写 API Key；模型也可手动输入", true);
            return;
        }
        final String fingerprint = credentialFingerprint(config);
        final int generation = ++fetchGeneration;
        synchronized (CACHE_LOCK) {
            lastAttemptFingerprint = fingerprint;
            lastAttemptAtMs = SystemClockCompat.elapsedRealtime();
        }
        if (refresh != null) refresh.setEnabled(false);
        setState(userInitiated ? "正在重新获取模型列表…" : "正在自动获取模型列表…", false);

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
                        refresh.setText(CaptionStrings.localize(getContext(), "重新获取"));
                    }
                    showModels(models, true);
                });
            } catch (Throwable error) {
                String message = error.getMessage();
                if (message == null || message.trim().isEmpty()) {
                    message = error.getClass().getSimpleName();
                }
                final String detail = message;
                main.post(() -> {
                    if (generation != fetchGeneration) return;
                    if (refresh != null) refresh.setEnabled(true);
                    setState("获取失败，可手动输入：" + detail, true);
                });
            }
        });
    }

    private void showModels(List<String> models, boolean newlyFetched) {
        if (choices == null) return;
        List<String> entries = new ArrayList<>(models.size() + 1);
        entries.add(CaptionStrings.localize(getContext(),"模型")+" ("+models.size()+")");
        entries.addAll(models);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(
                getContext(),
                android.R.layout.simple_spinner_item,
                entries
        ) {
            @Override public View getView(int position,View reused,ViewGroup parent){
                View v=super.getView(position,reused,parent);if(v instanceof TextView){((TextView)v).setTextSize(14);((TextView)v).setSingleLine(true);((TextView)v).setEllipsize(android.text.TextUtils.TruncateAt.END);}return v;
            }
            @Override public View getDropDownView(int position,View reused,ViewGroup parent){
                View v=super.getDropDownView(position,reused,parent);if(v instanceof TextView)((TextView)v).setTextSize(14);return v;
            }
        };
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        populatingChoices = true;
        choices.setAdapter(adapter);
        choices.setSelection(0, false);
        choices.setVisibility(View.VISIBLE);
        populatingChoices = false;
        setState(newlyFetched ? "列表已更新" : "可选择模型或直接输入 ID", false);
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
            setState("模型已自动保存", false);
            if(!ApiProfiles.flushing())DynamicCaptionController.refreshConfiguration(getContext());
        } catch (Throwable error) {
            String detail = error.getMessage();
            if (detail == null || detail.trim().isEmpty()) detail = "模型自动保存失败";
            setState(detail + "；保留上次有效值", true);
            if (reportInvalid && editor != null) editor.setError(CaptionStrings.localize(getContext(),detail));
        }
    }

    private void setState(String text, boolean important) {
        if (state == null) return;
        state.setText(CaptionStrings.localize(getContext(),text));
        state.setAlpha(important ? 1f : 0.72f);
    }

    @Override public boolean flushProfile(){
        if(editor==null||boundRevision!=ApiProfiles.revision()||!boundProfile.equals(ApiProfiles.active(getContext())))return true;
        String value=editor.getText().toString().trim();commitNow(value,true);
        return value.equals(lastCommitted);
    }
    @Override public void profileChanged(){
        cancelPendingSave();
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
