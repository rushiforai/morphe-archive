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
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

/**
 * Inline text field for the Morphe second-level screen.
 *
 * <p>The value is committed shortly after typing stops and again when focus leaves the field. This
 * keeps every setting on the page itself: there is no editor dialog and no page-level Save button.</p>
 */
@SuppressWarnings("deprecation")
public class DeepSeekTextPreference extends android.preference.Preference implements ApiProfiles.Editor {
    static final String KEY_BASE_URL = "deepseek_caption_base_url";
    static final String KEY_API_KEY = "deepseek_caption_api_key";
    static final String KEY_PROMPT = "deepseek_caption_prompt";

    private static final long AUTO_SAVE_DELAY_MS = 850L;

    private final Handler main = new Handler(Looper.getMainLooper());
    private Runnable pendingSave;
    private EditText editor;
    private TextView state;
    private String lastCommitted = "";
    private String boundProfile="";
    private View boundView;
    private long boundRevision=-1;
    private String boundDefaultPrompt="";

    public DeepSeekTextPreference(Context context) {
        super(context);
        initialize();
    }

    public DeepSeekTextPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        initialize();
    }

    public DeepSeekTextPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initialize();
    }

    public DeepSeekTextPreference(
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

    @Override
    public View getView(View convertView, ViewGroup parent) {
        // Android groups rows of the same Preference subclass into one recycle pool. These rows
        // contain different editors (URL/key/prompt), so only reuse this exact field's view.
        String key = getKey();
        View safeView = boundView != null && (boundView.getParent()==null || boundView.getParent()==parent) && boundRevision==ApiProfiles.revision() && (!KEY_PROMPT.equals(key) || boundDefaultPrompt.equals(DeepSeekConfig.defaultPrompt(getContext()))) && boundProfile.equals(ApiProfiles.active(getContext())) && key != null && (key+boundProfile).equals(boundView.getTag())
                ? boundView
                : null;
        View bound=super.getView(safeView,parent);
        if(editor!=null){editor.setEnabled(true);editor.setFocusable(true);editor.setFocusableInTouchMode(true);editor.setClickable(true);editor.setLongClickable(true);editor.setCursorVisible(true);}
        if(bound instanceof ViewGroup){((ViewGroup)bound).setDescendantFocusability(ViewGroup.FOCUS_AFTER_DESCENDANTS);bound.setFocusable(false);}
        return bound;
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        ApiProfiles.register(this);
        // Commit before a scroll-induced recreation; the old debounce must not be discarded.
        flushProfile();
        cancelPendingSave();
        boundProfile=ApiProfiles.active(getContext());
        boundRevision=ApiProfiles.revision();
        boundDefaultPrompt=DeepSeekConfig.defaultPrompt(getContext());
        Context context = getContext();
        if (parent instanceof ListView) {
            ((ListView) parent).setItemsCanFocus(true);
            parent.setDescendantFocusability(ViewGroup.FOCUS_AFTER_DESCENDANTS);
        }
        LinearLayout root = new LinearLayout(context);
        boundView = root;
        root.setTag(getKey()+boundProfile);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setDescendantFocusability(ViewGroup.FOCUS_AFTER_DESCENDANTS);
        CaptionSettingsStyle.row(root);

        TextView title = new TextView(context);
        title.setText(getTitle());
        CaptionSettingsStyle.title(title);
        title.setPadding(0,0,0,dp(8));
        root.addView(title, matchWrap());

        editor = new InlineCaptionEditor(context);
        editor.setId(android.R.id.edit);
        editor.setFocusableInTouchMode(true);
        CaptionSettingsStyle.editor(editor);
        configureEditor(editor);
        String initial = initialValue();
        if (!KEY_API_KEY.equals(getKey())) {
            editor.setText(initial);
            editor.setSelection(initial.length());
        }
        lastCommitted = KEY_API_KEY.equals(getKey()) ? "" : initial.trim();
        root.addView(editor, matchWrap());
        editor.setLongClickable(true);


        state = new TextView(context);
        CaptionSettingsStyle.caption(state);
        state.setPadding(0,dp(6),0,0);
        updateState(false, null);
        root.addView(state, matchWrap());

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
            if (!hasFocus) {
                String text=editor.getText().toString();commitNow(text,true);
                if(KEY_PROMPT.equals(getKey()) && text.trim().isEmpty()){
                    String defaults=DeepSeekConfig.defaultPrompt(getContext());
                    lastCommitted=defaults.trim();editor.setText(defaults);cancelPendingSave();
                }
                // Do not clear text on transient focus loss from Android action mode / keyboard.
            }
        });
        editor.setOnEditorActionListener((view, actionId, event) -> {
            if(view!=editor||!createdProfile.equals(ApiProfiles.active(getContext())))return false;
            boolean done = actionId == EditorInfo.IME_ACTION_DONE ||
                    (event != null && event.getKeyCode() == KeyEvent.KEYCODE_ENTER &&
                            event.getAction() == KeyEvent.ACTION_DOWN);
            if (done && !KEY_PROMPT.equals(getKey())) {
                commitNow(editor.getText().toString(), true);
                editor.clearFocus();
                return true;
            }
            return false;
        });
        editor.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View view) {if(view==editor)ApiProfiles.register(DeepSeekTextPreference.this);}

            @Override public void onViewDetachedFromWindow(View view) {
                if(view==editor)ApiProfiles.unregister(DeepSeekTextPreference.this);
                if(view!=editor||!createdProfile.equals(ApiProfiles.active(getContext())))return;
                commitNow(((EditText) view).getText().toString(), false);
                if(KEY_API_KEY.equals(getKey())){cancelPendingSave();((EditText)view).setText("");cancelPendingSave();}
            }
        });
        return root;
    }

    private void configureEditor(EditText value) {
        String key = getKey();
        if (KEY_API_KEY.equals(key)) {
            value.setSingleLine(true);
            value.setInputType(CaptionInputPolicy.keyInputType());
            ((InlineCaptionEditor)value).sensitive(true);
            value.setImeOptions(EditorInfo.IME_ACTION_DONE|EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
            boolean saved = SecureApiKey.hasSavedValue(getContext());
            value.setHint(CaptionStrings.localize(getContext(), saved ? "已加密保存；输入可替换" : "请输入 API Key"));
        } else if (KEY_PROMPT.equals(key)) {
            value.setSingleLine(false);
            value.setMinLines(3);
            value.setMaxLines(7);
            value.setGravity(android.view.Gravity.TOP | android.view.Gravity.START);
            value.setInputType(InputType.TYPE_CLASS_TEXT |
                    InputType.TYPE_TEXT_FLAG_MULTI_LINE |
                    InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
            value.setImeOptions(EditorInfo.IME_FLAG_NO_ENTER_ACTION);
        } else if (KEY_BASE_URL.equals(key)) {
            value.setSingleLine(true);
            value.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
            value.setImeOptions(EditorInfo.IME_ACTION_DONE);
        } else {
            value.setSingleLine(true);
            value.setInputType(InputType.TYPE_CLASS_TEXT);
            value.setImeOptions(EditorInfo.IME_ACTION_DONE);
        }
    }

    private String initialValue() {
        if(KEY_API_KEY.equals(getKey()))return "";
        DeepSeekConfig.Snapshot current = DeepSeekConfig.load(getContext());
        if (KEY_BASE_URL.equals(getKey())) return current.baseUrl;
        if (KEY_PROMPT.equals(getKey())) return current.prompt;
        return "";
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
        if (KEY_API_KEY.equals(getKey()) && value.isEmpty()) return;
        if(KEY_API_KEY.equals(getKey()) && (value.contains("\n") || value.contains("\r"))) {
            if(editor!=null)editor.setError(CaptionStrings.localize(getContext(), "API Key 应为单行"));return;
        }

        try {
            saveValue(value);
            lastCommitted = value;
            if (editor != null) editor.setError(null);
            updateState(true, null);
            if (KEY_BASE_URL.equals(getKey()) || KEY_API_KEY.equals(getKey())) {
                DeepSeekModelPreference.onCredentialsChanged(getContext());
            }
            if(!ApiProfiles.flushing())DynamicCaptionController.refreshConfiguration(getContext());
        } catch (Throwable error) {
            String detail = error.getMessage();
            if (detail == null || detail.trim().isEmpty()) detail = "自动保存失败";
            // During ordinary typing an incomplete URL is expected. Keep the last valid
            // value and show a quiet inline hint; focus loss exposes the field error as well.
            updateState(false, detail);
            if (reportInvalid && editor != null) editor.setError(CaptionStrings.localize(getContext(),detail));
        }
    }

    private void saveValue(String value) throws Exception {
        String key = getKey();
        if (KEY_BASE_URL.equals(key)) {
            DeepSeekConfig.saveBaseUrl(getContext(), value);
        } else if (KEY_API_KEY.equals(key)) {
            SecureApiKey.save(getContext(), value);
        } else if (KEY_PROMPT.equals(key)) {
            DeepSeekConfig.savePrompt(getContext(), value);
        } else {
            throw new IllegalArgumentException("未知设置项");
        }
    }

    private void updateState(boolean justSaved, String error) {
        if (state == null) return;
        if (error != null) {
            state.setText(CaptionStrings.localize(getContext(), error + "；保留上次有效值"));
            state.setAlpha(1f);
            return;
        }

        if (KEY_API_KEY.equals(getKey())) {
            state.setText(CaptionStrings.localize(getContext(), !SecureApiKey.hasSavedValue(getContext())
                    ? "编辑时可见；关闭页面清空，加密保存"
                    : (justSaved ? "已自动加密保存" : "已加密保存，不回显原 Key")));
        } else {
            CharSequence summary = getSummary();
            // XML summaries are already localized. Re-translating their Chinese prefixes duplicates text.
            state.setText(justSaved ? CaptionStrings.localize(getContext(), "已自动保存") :
                    (summary == null || summary.length() == 0 ? CaptionStrings.localize(getContext(),"修改后自动保存") : summary));
        }
        state.setAlpha(1f);
    }

    @Override public boolean flushProfile(){
        if(editor==null||boundRevision!=ApiProfiles.revision()||!boundProfile.equals(ApiProfiles.active(getContext())))return true;
        String value=editor.getText().toString().trim();commitNow(value,true);
        return value.equals(lastCommitted) || (KEY_API_KEY.equals(getKey())&&value.isEmpty());
    }
    @Override public void profileChanged(){
        cancelPendingSave();
        boundProfile="";boundView=null;lastCommitted="";
        if(editor!=null){editor.setText("");editor.clearFocus();}
        notifyChanged();
    }

    private void cancelPendingSave() {
        if (pendingSave != null) main.removeCallbacks(pendingSave);
        pendingSave = null;
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
}
