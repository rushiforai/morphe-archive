package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.function.Supplier;

/** Original Preference navigation/actions; metadata and explicitly owned text slots refresh in place. */
@SuppressWarnings("deprecation")
public class CaptionSettingPreference extends android.preference.Preference {
    private final String titleSlot, summarySlot;
    private final List<TextSlot> textSlots = new ArrayList<>();
    private boolean binding;
    private WeakReference<View> currentView = new WeakReference<>(null);
    private static final class TextSlot {
        final WeakReference<TextView> view;
        final Supplier<String> value;
        final boolean hint;
        TextSlot(TextView view, Supplier<String> value, boolean hint) {
            this.view = new WeakReference<>(view); this.value = value; this.hint = hint;
        }
        void refresh() {
            TextView target = view.get();
            if(target!=null){
                CharSequence next=value.get();
                if(!sameText(hint?target.getHint():target.getText(),next)){
                    if(hint)target.setHint(next);else target.setText(next);
                }
            }
        }
    }
    /** Text equality must also retain real span/style changes, not just equal visible characters. */
    static boolean sameText(CharSequence a,CharSequence b){
        if(a==b)return true;
        if(!android.text.TextUtils.equals(a,b))return false;
        java.util.List<Object> left=styleSpans(a),right=styleSpans(b);
        if(left.size()!=right.size())return false;
        for(int i=0;i<left.size();i++){
            Object x=left.get(i),y=right.get(i);if(!x.equals(y))return false;
            android.text.Spanned sx=(android.text.Spanned)a,sy=(android.text.Spanned)b;
            if(sx.getSpanStart(x)!=sy.getSpanStart(y)||sx.getSpanEnd(x)!=sy.getSpanEnd(y)
                ||sx.getSpanFlags(x)!=sy.getSpanFlags(y))return false;
        }
        return true;
    }
    private static java.util.List<Object> styleSpans(CharSequence value){
        java.util.List<Object> result=new java.util.ArrayList<>();
        if(value instanceof android.text.Spanned){android.text.Spanned styled=(android.text.Spanned)value;
            for(Object span:styled.getSpans(0,value.length(),Object.class))
                if(!(span instanceof android.text.NoCopySpan))result.add(span);
        }
        return result;
    }
    public CaptionSettingPreference(Context c) { this(c, null); }
    public CaptionSettingPreference(Context c, AttributeSet a) { this(c, a, android.R.attr.preferenceStyle); }
    public CaptionSettingPreference(Context c, AttributeSet a, int d) { this(c, a, d, 0); }
    public CaptionSettingPreference(Context c, AttributeSet a, int d, int r) {
        super(c, a, d, r);
        titleSlot = slot(c, a, "title"); summarySlot = slot(c, a, "summary");
    }
    static String slot(Context c, AttributeSet a, String attribute) {
        if (a == null) return null;
        int id = a.getAttributeResourceValue("http://schemas.android.com/apk/res/android", attribute, 0);
        if (id != 0) try {
            String name = c.getResources().getResourceEntryName(id);
            if (name.startsWith("cap_")) return name.substring(4);
        } catch (RuntimeException unavailable) { /* No owned resource slot. */ }
        return null;
    }
    protected final void uiText(TextView view, String key, Object... arguments) {
        uiText(view, () -> arguments.length==0?CaptionStrings.settings(getContext(),key):String.format(Locale.ROOT, CaptionStrings.settings(getContext(), key), arguments));
    }
    protected final void uiText(TextView view, Supplier<String> value) { bind(view, value, false); }
    protected final void uiHint(TextView view, String key) { bind(view, () -> CaptionStrings.settings(getContext(), key), true); }
    private void bind(TextView view, Supplier<String> value, boolean hint) {
        textSlots.removeIf(slot -> slot.view.get() == null || (slot.view.get() == view && slot.hint == hint));
        TextSlot slot = new TextSlot(view, value, hint); textSlots.add(slot); slot.refresh();
        CaptionTextResolver.direction(view, view instanceof android.widget.EditText && !DeepSeekTextPreference.KEY_PROMPT.equals(getKey()));
    }
    protected void refreshDynamicText() {}
    final void refreshCaptionText() {
        if(titleSlot!=null){String next=CaptionStrings.settings(getContext(),titleSlot);if(!sameText(getTitle(),next))setTitle(next);}
        if(summarySlot!=null){String next=CaptionStrings.settings(getContext(),summarySlot);if(!sameText(getSummary(),next))setSummary(next);}
        refreshDynamicText();
        textSlots.removeIf(slot -> slot.view.get() == null);
        for (TextSlot slot : textSlots) {
            slot.refresh();
            TextView target = slot.view.get();
            if (target != null) CaptionTextResolver.direction(target,
                    target instanceof android.widget.EditText && !DeepSeekTextPreference.KEY_PROMPT.equals(getKey()));
        }
        View row = currentView.get();
        if(row!=null && !binding)refreshRow(row);
    }
    @Override public View getView(View convert, ViewGroup parent) {
        binding=true;
        try {
            refreshCaptionText();
            View row=super.getView(convert,parent);
            currentView=new WeakReference<>(row);return row;
        }finally{binding=false;}
    }
    @Override protected void onBindView(View row) { super.onBindView(row); refreshRow(row); }
    private void refreshRow(View row) {
        CaptionTextResolver.direction(row, false);
        for (int id : new int[]{android.R.id.title, android.R.id.summary}) {
            TextView label = row.findViewById(id);
            if (label != null) {
                CharSequence next=id==android.R.id.title?getTitle():getSummary();
                if(!sameText(label.getText(),next))label.setText(next);
                if(label.getMaxLines()==1)label.setSingleLine(false);
                if(label.getMaxLines()!=Integer.MAX_VALUE)label.setMaxLines(Integer.MAX_VALUE);
                if(label.getEllipsize()!=null)label.setEllipsize(null);
                CaptionTextResolver.direction(label, false);
            }
        }
    }
}
