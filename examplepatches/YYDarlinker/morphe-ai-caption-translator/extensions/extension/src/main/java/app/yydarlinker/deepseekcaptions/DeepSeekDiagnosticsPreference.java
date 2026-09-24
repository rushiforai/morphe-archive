package app.yydarlinker.deepseekcaptions;
import android.content.*;
import android.util.AttributeSet;
import android.view.*;
import android.widget.*;
/** Quiet by default; expanding or pressing a button is always explicit and never calls the provider. */
@SuppressWarnings("deprecation")
public final class DeepSeekDiagnosticsPreference extends android.preference.Preference {
    public DeepSeekDiagnosticsPreference(Context c){super(c);init();}
    public DeepSeekDiagnosticsPreference(Context c,AttributeSet a){super(c,a);init();}
    public DeepSeekDiagnosticsPreference(Context c,AttributeSet a,int d){super(c,a,d);init();}
    public DeepSeekDiagnosticsPreference(Context c,AttributeSet a,int d,int r){super(c,a,d,r);init();}
    private void init(){setPersistent(false);setSelectable(false);}
    @Override protected View onCreateView(ViewGroup parent){
        Context c=getContext();LinearLayout box=new LinearLayout(c);box.setOrientation(LinearLayout.VERTICAL);CaptionSettingsStyle.row(box);
        LinearLayout header=new LinearLayout(c);header.setGravity(Gravity.CENTER_VERTICAL);
        TextView title=new TextView(c);title.setText(CaptionStrings.localize(getContext(), "字幕诊断"));CaptionSettingsStyle.title(title);header.addView(title,new LinearLayout.LayoutParams(0,-2,1));
        Button toggle=new Button(c,null,android.R.attr.borderlessButtonStyle);CaptionSettingsStyle.button(toggle);toggle.setText(CaptionStrings.localize(getContext(), "展开"));toggle.setTag("ai_diagnostics_toggle");header.addView(toggle);box.addView(header);
        TextView hint=new TextView(c);hint.setText(CaptionStrings.localize(getContext(), "排查翻译或时间问题时，可展开查看并复制记录"));CaptionSettingsStyle.caption(hint);box.addView(hint);
        LinearLayout expanded=new LinearLayout(c);expanded.setOrientation(LinearLayout.VERTICAL);expanded.setVisibility(View.GONE);
        LinearLayout actions=new LinearLayout(c);actions.setGravity(Gravity.END);expanded.addView(actions);
        TextView body=new TextView(c);body.setTag("ai_diagnostics_body");CaptionSettingsStyle.caption(body);body.setTextIsSelectable(true);body.setPadding(CaptionSettingsStyle.dp(c,12),CaptionSettingsStyle.dp(c,10),CaptionSettingsStyle.dp(c,12),CaptionSettingsStyle.dp(c,10));
        ScrollView scroll=new ScrollView(c){@Override public boolean onInterceptTouchEvent(MotionEvent e){if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(true);return super.onInterceptTouchEvent(e);}};
        scroll.setTag("ai_diagnostics_scroll");scroll.setBackground(CaptionSettingsStyle.surface(c,false));scroll.setFillViewport(false);scroll.setVerticalScrollBarEnabled(true);scroll.addView(body,new ScrollView.LayoutParams(-1,-2));
        Button refresh=new Button(c,null,android.R.attr.borderlessButtonStyle);CaptionSettingsStyle.button(refresh);refresh.setText(CaptionStrings.localize(getContext(), "刷新"));refresh.setOnClickListener(v->{body.setText(CaptionDiagnostics.uiText(c));scroll.scrollTo(0,0);});actions.addView(refresh);
        Button copy=new Button(c,null,android.R.attr.borderlessButtonStyle);CaptionSettingsStyle.button(copy);copy.setText(CaptionStrings.localize(getContext(), "复制"));copy.setOnClickListener(v->{ClipboardManager manager=(ClipboardManager)c.getSystemService(Context.CLIPBOARD_SERVICE);if(manager!=null){manager.setPrimaryClip(ClipData.newPlainText("AI 字幕诊断",body.getText()));Toast.makeText(c,"诊断已复制",Toast.LENGTH_SHORT).show();}});actions.addView(copy);
        expanded.addView(scroll,new LinearLayout.LayoutParams(-1,CaptionSettingsStyle.dp(c,280)));box.addView(expanded);
        toggle.setOnClickListener(v->{boolean open=expanded.getVisibility()!=View.VISIBLE;if(open)body.setText(CaptionDiagnostics.uiText(c));expanded.setVisibility(open?View.VISIBLE:View.GONE);toggle.setText(CaptionStrings.localize(getContext(), open?"收起":"展开"));toggle.setContentDescription(CaptionStrings.localize(getContext(), open?"收起字幕诊断":"展开字幕诊断"));});return box;
    }
}
