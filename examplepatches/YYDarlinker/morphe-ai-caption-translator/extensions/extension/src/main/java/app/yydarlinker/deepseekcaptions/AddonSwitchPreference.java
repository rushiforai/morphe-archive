package app.yydarlinker.deepseekcaptions;
import android.content.Context;
import android.util.AttributeSet;
import android.view.*;
import android.widget.*;
/** Self-managed addon Boolean. Not a host SwitchPreference requiring an official Setting registry entry. */
@SuppressWarnings("deprecation")
public class AddonSwitchPreference extends android.preference.Preference {
    private boolean checked,binding; private Switch widget;
    public AddonSwitchPreference(Context c){super(c);}
    public AddonSwitchPreference(Context c,AttributeSet a){super(c,a);}
    public AddonSwitchPreference(Context c,AttributeSet a,int d){super(c,a,d);}
    public AddonSwitchPreference(Context c,AttributeSet a,int d,int r){super(c,a,d,r);}
    public void setChecked(boolean v){checked=v;if(widget!=null){binding=true;widget.setChecked(v);binding=false;}notifyChanged();}
    public boolean isChecked(){return checked;}
    @Override protected View onCreateView(ViewGroup parent) {
        LinearLayout row=new LinearLayout(getContext());row.setGravity(Gravity.CENTER_VERTICAL);
        CaptionSettingsStyle.row(row);row.setMinimumHeight(CaptionSettingsStyle.dp(getContext(),64));LinearLayout labels=new LinearLayout(getContext());labels.setOrientation(1);
        TextView title=new TextView(getContext());title.setId(android.R.id.title);CaptionSettingsStyle.title(title);labels.addView(title);
        TextView summary=new TextView(getContext());summary.setId(android.R.id.summary);CaptionSettingsStyle.caption(summary);summary.setPadding(0,CaptionSettingsStyle.dp(getContext(),4),CaptionSettingsStyle.dp(getContext(),12),0);labels.addView(summary);
        row.addView(labels,new LinearLayout.LayoutParams(0,-2,1));widget=new Switch(getContext());
        widget.setContentDescription(getTitle());widget.setChecked(checked);
        widget.setOnCheckedChangeListener((b,v)->{if(!binding){if(callChangeListener(v))setChecked(v);else setChecked(checked);}});
        row.addView(widget);return row;
    }
    @Override protected void onClick(){if(callChangeListener(!checked))setChecked(!checked);}
}
