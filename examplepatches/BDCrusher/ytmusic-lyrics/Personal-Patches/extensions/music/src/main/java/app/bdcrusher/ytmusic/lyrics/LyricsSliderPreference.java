/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.preference.Preference;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import app.morphe.extension.shared.theme.ThemeUtils;

/** Inline numeric preference: a native accessible SeekBar, with its value always visible. */
@SuppressWarnings("deprecation")
public final class LyricsSliderPreference extends Preference {
    private final SharedPreferences preferences;
    private final String setting,unit;
    private final int minimum,maximum,step,defaultValue;
    public LyricsSliderPreference(Context c,SharedPreferences p,String key,String title,int min,int max,int increment,int def,String suffix){
        super(c);preferences=p;setting=key;unit=suffix;minimum=min;maximum=max;step=increment;defaultValue=def;
        setKey("bdcrusher_"+key);setTitle(title);setPersistent(false);setSelectable(false);
    }
    private int dp(float n){return Math.round(n*getContext().getResources().getDisplayMetrics().density);}
    @Override @android.annotation.SuppressLint("MissingSuperCall")
    protected View onCreateView(ViewGroup parent){
        Context c=getContext();int foreground=ThemeUtils.getAppForegroundColor();
        LinearLayout root=new LinearLayout(c);root.setOrientation(LinearLayout.VERTICAL);root.setPadding(dp(16),dp(14),dp(16),dp(10));
        android.graphics.drawable.GradientDrawable card=new android.graphics.drawable.GradientDrawable();card.setColor((foreground&0xffffff)|0x0b000000);card.setCornerRadius(dp(16));root.setBackground(card);
        LinearLayout heading=new LinearLayout(c);heading.setGravity(android.view.Gravity.CENTER_VERTICAL);
        TextView title=new TextView(c);title.setText(getTitle());title.setTextSize(16);title.setTextColor(foreground);
        heading.addView(title,new LinearLayout.LayoutParams(0,-2,1));
        TextView value=new TextView(c);value.setTextSize(14);value.setTextColor(foreground);value.setPadding(dp(12),0,0,0);heading.addView(value);
        root.addView(heading,new LinearLayout.LayoutParams(-1,-2));
        SeekBar slider=new SeekBar(c);slider.setMax((maximum-minimum)/step);
        int initial=Math.max(minimum,Math.min(maximum,preferences.getInt(setting,defaultValue)));
        slider.setProgress((initial-minimum)/step);value.setText(initial+unit);
        slider.setContentDescription(getTitle());slider.setProgressTintList(ColorStateList.valueOf(foreground));slider.setThumbTintList(ColorStateList.valueOf(foreground));
        if(android.os.Build.VERSION.SDK_INT>=30)slider.setStateDescription(initial+unit);
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
            private void save(){preferences.edit().putInt(setting,minimum+slider.getProgress()*step).apply();}
            public void onStartTrackingTouch(SeekBar bar){}
            public void onStopTrackingTouch(SeekBar bar){save();}
            public void onProgressChanged(SeekBar bar,int progress,boolean fromUser){
                int number=minimum+progress*step;value.setText(number+unit);if(android.os.Build.VERSION.SDK_INT>=30)bar.setStateDescription(number+unit);
                // Keyboard and accessibility actions have no tracking gesture to finish.
                if(fromUser&&!bar.isPressed())save();
            }
        });
        LinearLayout.LayoutParams row=new LinearLayout.LayoutParams(-1,dp(48));row.topMargin=dp(4);root.addView(slider,row);app.bdcrusher.ytmusic.common.FeaturePreferences.card(root,false);return root;
    }
}
