package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

/** Small theme-derived refinements; native widgets, host typography and accessibility remain in charge. */
final class CaptionSettingsStyle {
    static int dp(Context c,float value){return Math.round(value*c.getResources().getDisplayMetrics().density);}
    static int color(Context c,int attr,int fallback){
        TypedArray a=c.obtainStyledAttributes(new int[]{attr});
        try{return a.getColor(0,fallback);}finally{a.recycle();}
    }
    static int primary(Context c){
        try{return (Integer)Class.forName("app.morphe.extension.shared.theme.ThemeUtils").getMethod("getAppForegroundColor").invoke(null);}
        catch(ReflectiveOperationException | LinkageError unavailable){return color(c,android.R.attr.textColorPrimary,Color.DKGRAY);}
    }
    static int secondary(Context c){return color(c,android.R.attr.textColorSecondary,primary(c));}
    static int tint(int color,int alpha){return (color&0x00ffffff)|(alpha<<24);}
    static void row(View view){Context c=view.getContext();view.setPadding(dp(c,20),dp(c,12),dp(c,20),dp(c,12));}
    static void title(TextView view){view.setTextSize(16);view.setTextColor(primary(view.getContext()));view.setTypeface(Typeface.DEFAULT,Typeface.NORMAL);view.setAlpha(1f);}
    static void caption(TextView view){view.setTextSize(13);view.setTextColor(secondary(view.getContext()));view.setAlpha(1f);view.setLineSpacing(dp(view.getContext(),2),1f);}
    static void button(Button view){Context c=view.getContext();view.setAllCaps(false);view.setTextSize(14);view.setMinHeight(dp(c,48));view.setMinimumHeight(dp(c,48));view.setMinimumWidth(dp(c,64));view.setMinWidth(dp(c,64));view.setPadding(dp(c,12),0,dp(c,12),0);}
    static void editor(EditText view){
        Context c=view.getContext();view.setTextSize(16);view.setTextColor(primary(c));view.setHintTextColor(secondary(c));
        view.setMinHeight(dp(c,48));view.setMinimumHeight(dp(c,48));view.setPadding(dp(c,12),dp(c,10),dp(c,12),dp(c,10));
        StateListDrawable bg=new StateListDrawable();
        bg.addState(new int[]{android.R.attr.state_focused},surface(c,true));
        bg.addState(new int[]{},surface(c,false));view.setBackground(bg);
    }
    static GradientDrawable surface(Context c,boolean focused){
        GradientDrawable bg=new GradientDrawable();int text=primary(c);
        bg.setColor(tint(text,focused?12:7));bg.setCornerRadius(dp(c,8));
        bg.setStroke(dp(c,1),focused?color(c,android.R.attr.colorAccent,text):tint(text,28));return bg;
    }
}
