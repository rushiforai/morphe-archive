/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.common;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.preference.*;
import android.view.View;
import android.widget.TextView;
import app.morphe.extension.shared.theme.ThemeUtils;

/** Scoped native preference rows. Keep framework widget binding, focus and accessibility. */
@SuppressWarnings("deprecation")
public final class FeaturePreferences {
    private FeaturePreferences() {}
    private static int dp(Context c,float n){return Math.round(n*c.getResources().getDisplayMetrics().density);}
    private static int blend(int background,int foreground,float strength){return Color.rgb(
        Math.round(Color.red(background)*(1-strength)+Color.red(foreground)*strength),
        Math.round(Color.green(background)*(1-strength)+Color.green(foreground)*strength),
        Math.round(Color.blue(background)*(1-strength)+Color.blue(foreground)*strength));}
    public static void card(View view,boolean clickable){
        int foreground=ThemeUtils.getAppForegroundColor(),background=ThemeUtils.getAppBackgroundColor();
        GradientDrawable shape=new GradientDrawable();shape.setColor(blend(background,foreground,.065f));shape.setCornerRadius(dp(view.getContext(),18));
        shape.setStroke(dp(view.getContext(),1),blend(background,foreground,.11f));
        android.graphics.drawable.Drawable drawable=clickable?new RippleDrawable(ColorStateList.valueOf((foreground&0xffffff)|0x18000000),shape,null):shape;
        view.setBackground(new InsetDrawable(drawable,dp(view.getContext(),12),dp(view.getContext(),4),dp(view.getContext(),12),dp(view.getContext(),4)));
        view.setPadding(dp(view.getContext(),28),dp(view.getContext(),17),dp(view.getContext(),28),dp(view.getContext(),17));
        if(clickable)view.setMinimumHeight(dp(view.getContext(),76));
    }
    private static void bind(View view){
        card(view,true);
        View title=view.findViewById(android.R.id.title),summary=view.findViewById(android.R.id.summary);
        int foreground=ThemeUtils.getAppForegroundColor();
        if(title instanceof TextView text){text.setTextColor(foreground);text.setTextSize(16);text.setSingleLine(false);text.setTypeface(null,Typeface.NORMAL);}
        if(summary instanceof TextView text){text.setTextColor((foreground&0xffffff)|0xb3000000);text.setTextSize(13);text.setMaxLines(8);text.setPadding(0,dp(view.getContext(),5),0,0);}
    }
    public static Preference action(Context c){return new Row(c);}
    public static SwitchPreference toggle(Context c){return new Toggle(c);}
    public static ListPreference choice(Context c){return new Choice(c);}
    public static EditTextPreference text(Context c){return new Text(c);}
    public static PreferenceCategory heading(Context c){return new Heading(c);}
    private static class Row extends Preference {Row(Context c){super(c);}@Override protected void onBindView(View v){super.onBindView(v);bind(v);}}
    private static final class Toggle extends SwitchPreference {Toggle(Context c){super(c);}@Override protected void onBindView(View v){super.onBindView(v);bind(v);}}
    private static final class Choice extends ListPreference {
        Choice(Context c){super(c);}
        @Override protected void onBindView(View v){super.onBindView(v);bind(v);}
        @Override protected void onPrepareDialogBuilder(android.app.AlertDialog.Builder builder){
            super.onPrepareDialogBuilder(builder);
            CharSequence[] entries=getEntries(),values=getEntryValues();
            if(entries==null||values==null||entries.length!=values.length)return;
            // The host themes preference rows separately from the framework dialog list.
            android.widget.ArrayAdapter<CharSequence> adapter=new android.widget.ArrayAdapter<>(getContext(),android.R.layout.simple_list_item_single_choice,entries){
                @Override public View getView(int position,View recycled,android.view.ViewGroup parent){
                    View row=super.getView(position,recycled,parent);
                    if(row instanceof TextView text){text.setTextColor(ThemeUtils.getAppForegroundColor());text.setSingleLine(false);text.setTextSize(16);}
                    return row;
                }
            };
            builder.setSingleChoiceItems(adapter,findIndexOfValue(getValue()),(dialog,index)->{
                String value=values[index].toString();if(callChangeListener(value))setValue(value);dialog.dismiss();
            });
        }
    }
    private static final class Text extends EditTextPreference {Text(Context c){super(c);}@Override protected void onBindView(View v){super.onBindView(v);bind(v);}}
    private static final class Heading extends PreferenceCategory {Heading(Context c){super(c);}@Override protected void onBindView(View v){super.onBindView(v);v.setPadding(dp(getContext(),28),dp(getContext(),26),dp(getContext(),28),dp(getContext(),8));if(v instanceof TextView t){t.setTextColor(ThemeUtils.getAppForegroundColor());t.setTextSize(14);t.setTypeface(null,Typeface.BOLD);}}}
}
