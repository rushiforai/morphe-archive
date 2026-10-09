package e.e.a;
import android.content.*;import android.preference.*;import android.view.*;import android.widget.*;import android.graphics.Color;import android.graphics.drawable.GradientDrawable;
final class PanelUi {
 static String tr(Context c,String ja,String en,String zh){String l=PreferenceManager.getDefaultSharedPreferences(c).getString("app_lang","0");if(l.equals("-1")){String x=java.util.Locale.getDefault().getLanguage();l=x.equals("ja")?"0":x.equals("zh")?"2":"1";}return l.equals("1")?en:l.equals("2")?zh:ja;}
 static int ink(Context c){return ThemeChoice.isNight(c)?0xffeeeeee:0xff202124;}
 static int dp(Context c,int x){return Math.round(x*c.getResources().getDisplayMetrics().density);}
 static TextView text(Context c,String s,int size){TextView t=new TextView(c);t.setText(s);t.setTextSize(size);t.setTextColor(ink(c));t.setPadding(dp(c,8),dp(c,8),dp(c,8),dp(c,8));return t;}
 static LinearLayout column(Context c){LinearLayout b=new LinearLayout(c);b.setOrientation(1);return b;}
 static Button button(Context c,String s){Button b=new Button(c);b.setText(s);b.setAllCaps(false);b.setTextSize(14);ThemeChoice.button(b);b.setTextColor(ink(c));return b;}
 static void divider(LinearLayout b){View v=new View(b.getContext());v.setBackgroundColor(ThemeChoice.isNight(b.getContext())?0x28ffffff:0x22000000);b.addView(v,new LinearLayout.LayoutParams(-1,dp(b.getContext(),1)));}
 static GradientDrawable round(Context c,int color,int radius){GradientDrawable d=new GradientDrawable();d.setColor(color);d.setCornerRadius(dp(c,radius));return d;}
 static void tint(android.widget.CompoundButton b){b.setTextColor(ink(b.getContext()));b.setButtonTintList(android.content.res.ColorStateList.valueOf(ThemeChoice.accent(b.getContext())));}
}
