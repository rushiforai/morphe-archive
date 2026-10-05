package e.e.a;
import android.app.*;import android.content.*;import android.preference.*;import android.widget.*;import android.view.*;import android.util.TypedValue;import java.util.Locale;
public final class SpeedSlider {
 public interface Selection{void selected(float speed);}
 public static float value(int progress){return (Math.max(0,Math.min(58,progress))+2)/20f;}
 public static int progress(float value){return Math.max(0,Math.min(58,Math.round(value*20)-2));}
 public static String label(float speed){return String.format(Locale.ROOT,speed==Math.round(speed*10)/10f?"%.1f×":"%.2f×",speed);}
 public static void show(Context context,String title,float speed,boolean overlay,Selection selected){
  Context c=PlaybackSession.dialogContext(context);LinearLayout box=new LinearLayout(c);box.setOrientation(1);int pad=(int)(24*c.getResources().getDisplayMetrics().density);box.setPadding(pad,pad,pad,pad);
  TextView label=new TextView(c);label.setGravity(Gravity.CENTER);label.setTextSize(22);box.addView(label,new LinearLayout.LayoutParams(-1,-2));SeekBar seek=new SeekBar(c);seek.setMax(58);seek.setProgress(progress(speed));label.setText(label(value(seek.getProgress())));box.addView(seek,new LinearLayout.LayoutParams(-1,-2));
  TypedValue color=new TypedValue();seek.getContext().getTheme().resolveAttribute(0x7f03005e,color,true);int tint=color.resourceId==0?color.data:seek.getResources().getColor(color.resourceId);android.content.res.ColorStateList colors=android.content.res.ColorStateList.valueOf(tint);seek.setProgressTintList(colors);seek.setThumbTintList(colors);
  seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onProgressChanged(SeekBar s,int p,boolean user){label.setText(label(value(p)));}public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){}});
  AlertDialog d=new AlertDialog.Builder(c).setTitle(UiStrings.translate(title)).setView(box).setPositiveButton(UiStrings.translate("OK"),(dialog,which)->selected.selected(value(seek.getProgress()))).setNegativeButton(UiStrings.translate("キャンセル"),null).create();
  if(overlay)d.getWindow().setType(android.os.Build.VERSION.SDK_INT>=26?WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY:WindowManager.LayoutParams.TYPE_PHONE);d.show();PlaybackSession.styleDialog(d);
 }
 private static void white(View v){if(v instanceof TextView)((TextView)v).setTextColor(android.graphics.Color.WHITE);if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++)white(g.getChildAt(i));}}
 public static void settings(PreferenceActivity a,PreferenceGroup group){Preference old=a.findPreference("default_playback_speed");if(old instanceof ListPreference)group.removePreference(old);else if(old!=null)return;Preference p=new Preference(a);p.setKey("default_playback_speed");p.setTitle(UiStrings.translate("デフォルトの再生速度"));p.setSummary(label(PlaybackRules.defaultSpeed(PreferenceManager.getDefaultSharedPreferences(a).getString(p.getKey(),"1.0"))));p.setOnPreferenceClickListener(v->{show(a,"デフォルトの再生速度",PlaybackRules.defaultSpeed(PreferenceManager.getDefaultSharedPreferences(a).getString(p.getKey(),"1.0")),false,s->{PreferenceManager.getDefaultSharedPreferences(a).edit().putString(p.getKey(),Float.toString(s)).apply();p.setSummary(label(s));});return true;});group.addPreference(p);}
}
