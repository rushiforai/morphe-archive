/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.common;
import android.content.Context;
import android.preference.*;
import android.widget.*;
import java.io.*;
import app.morphe.extension.shared.theme.ThemeUtils;
@SuppressWarnings("deprecation")
public final class PersonalCredits {
    private PersonalCredits(){}
    public static void add(Context context,PreferenceScreen page){Preference credits=new Preference(context);credits.setTitle("Credits and licenses");credits.setOnPreferenceClickListener(p->{show(context);return true;});page.addPreference(credits);}
    public static void show(Context context){try(InputStream input=context.getAssets().open("bdcrusher-features/NOTICE.txt")){
        ByteArrayOutputStream out=new ByteArrayOutputStream();byte[] buffer=new byte[4096];int count;while((count=input.read(buffer))!=-1){if(out.size()+count>512*1024)throw new IOException("notice limit");out.write(buffer,0,count);}
        TextView text=new TextView(context);text.setText(out.toString("UTF-8"));text.setTextColor(ThemeUtils.getAppForegroundColor());text.setTextIsSelectable(true);int pad=Math.round(16*context.getResources().getDisplayMetrics().density);text.setPadding(pad,pad,pad,pad);ScrollView scroll=new ScrollView(context);scroll.addView(text);new android.app.AlertDialog.Builder(context).setTitle("Credits and licenses").setView(scroll).setPositiveButton("Close",null).show();
    }catch(Exception missing){Toast.makeText(context,"Credits unavailable",Toast.LENGTH_SHORT).show();}}
    public static void reset(Context c,PreferenceScreen page,android.content.SharedPreferences preferences,String title,Runnable refresh,String... keys){Preference reset=app.bdcrusher.ytmusic.common.FeaturePreferences.action(c);reset.setTitle("Reset "+title);reset.setSummary("Restore this group's defaults; saved files and connections are kept");reset.setOnPreferenceClickListener(p->{new android.app.AlertDialog.Builder(c).setTitle("Reset "+title+"?").setNegativeButton("Cancel",null).setPositiveButton("Reset",(d,w)->{android.content.SharedPreferences.Editor editor=preferences.edit();for(String key:keys)editor.remove(key);editor.apply();refresh.run();}).show();return true;});page.addPreference(reset);}
}
