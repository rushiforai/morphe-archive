// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.extension.anki;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.*;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.content.res.ColorStateList;

public final class WidgetSettingsActivity extends Activity {
    private FrameLayout preview;
    private TextView opacityLabel;
    private int chosen;
    @Override public void onCreate(Bundle state) {
        boolean dark=WidgetTheme.isDark(this);
        int theme=getResources().getIdentifier(dark?"Theme_Dark":"Theme_Light","style",getPackageName());
        setTheme(theme!=0?theme:(dark?android.R.style.Theme_Material_NoActionBar:android.R.style.Theme_Material_Light_NoActionBar));
        super.onCreate(state);
        int text=dark?0xffcad3f5:0xff4c4f69,accent=dark?0xffc6a0f6:0xff8839ef;
        ScrollView scroll=new ScrollView(this);
        scroll.setBackgroundColor(dark?0xff24273a:0xffeff1f5);
        scroll.setOnApplyWindowInsetsListener((v,insets)->{v.setPadding(insets.getSystemWindowInsetLeft(),insets.getSystemWindowInsetTop(),insets.getSystemWindowInsetRight(),insets.getSystemWindowInsetBottom());return insets;});
        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);content.setPadding(dp(24),dp(24),dp(24),dp(24));scroll.addView(content);setContentView(scroll);
        Typeface font=Typeface.createFromAsset(getAssets(),"catppuccin/anki/JetBrainsMono-Regular.ttf");
        TextView title=label("Widgets",24,text,font);content.addView(title);
        TextView description=label("Catppuccin colors and JetBrains Mono apply to all AnkiDroid widgets. Background opacity leaves text and counts fully visible.",16,text,font);description.setPadding(0,dp(12),0,dp(24));content.addView(description);
        content.addView(label("Preview",16,text,font));
        preview=new FrameLayout(this);
        preview.setBackground(new GradientDrawable(GradientDrawable.Orientation.TL_BR,dark?new int[]{0xff494d64,0xff8087a2}:new int[]{0xff9ca0b0,0xffdce0e8}));
        preview.setPadding(dp(14),dp(14),dp(14),dp(14));content.addView(preview,new LinearLayout.LayoutParams(-1,dp(185)));
        chosen=WidgetTheme.opacity(this);
        opacityLabel=label("Background opacity: "+chosen+"%",18,text,font);opacityLabel.setPadding(0,dp(24),0,dp(8));content.addView(opacityLabel);
        SeekBar opacity=new SeekBar(this);opacity.setMax(10);opacity.setProgress(chosen/10);opacity.setProgressTintList(ColorStateList.valueOf(accent));opacity.setThumbTintList(ColorStateList.valueOf(accent));opacity.setContentDescription("Widget background opacity");content.addView(opacity);
        opacity.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
            public void onProgressChanged(SeekBar bar,int value,boolean user){chosen=value*10;opacityLabel.setText("Background opacity: "+chosen+"%");}
            public void onStartTrackingTouch(SeekBar bar){}
            public void onStopTrackingTouch(SeekBar bar){AnkiTheme.prefs(WidgetSettingsActivity.this).edit().putInt(WidgetTheme.OPACITY,chosen).apply();showPreview();}
        });
        Button done=new Button(this);done.setText("Done");done.setAllCaps(false);done.setTypeface(font);done.setBackgroundTintList(ColorStateList.valueOf(accent));done.setTextColor(dark?0xff24273a:0xffeff1f5);done.setOnClickListener(v->finish());content.addView(done);
        showPreview();
    }
    private int dp(int value){return Math.round(value*getResources().getDisplayMetrics().density);}
    private TextView label(String text,int size,int color,Typeface face){TextView v=new TextView(this);v.setText(text);v.setTextSize(size);v.setTextColor(color);v.setTypeface(face);return v;}
    private void showPreview(){
        int layout=getResources().getIdentifier("widget_card_analysis","layout",getPackageName());
        RemoteViews remote=new RemoteViews(getPackageName(),layout);
        remote.setViewVisibility(id("empty_widget"),View.GONE);
        remote.setViewVisibility(id("cardAnalysisDataHolder"),View.VISIBLE);
        remote.setViewVisibility(id("deckNameCardAnalysis"),View.VISIBLE);
        WidgetTheme.setTextViewText(remote,id("deckNameCardAnalysis"),"Sample deck");
        WidgetTheme.setTextViewText(remote,id("deckNew_card_analysis_widget"),"12");
        WidgetTheme.setTextViewText(remote,id("deckLearn_card_analysis_widget"),"5");
        WidgetTheme.setTextViewText(remote,id("deckDue_card_analysis_widget"),"23");
        preview.removeAllViews();preview.addView(WidgetTheme.theme(remote).apply(this,preview),new FrameLayout.LayoutParams(-1,-1));
    }
    private int id(String name){return getResources().getIdentifier(name,"id",getPackageName());}
}
