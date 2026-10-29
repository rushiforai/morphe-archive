package e.e.a;
import android.preference.*;
/** Resolve final placement after every legacy installer has finished. */
public final class SettingsPlacement233 {
 static void move(PreferenceActivity a,String key,String category,int order){PreferenceGroup root=a.getPreferenceScreen();Preference p=a.findPreference(key),g=a.findPreference(category);if(p==null||!(g instanceof PreferenceGroup))return;PreferenceGroup old=SettingsTools.parent(root,p);if(old!=(PreferenceGroup)g){if(old!=null)old.removePreference(p);((PreferenceGroup)g).addPreference(p);}p.setOrder(order);}
 public static void apply(PreferenceActivity a){if(a.getPreferenceScreen()==null)return;move(a,"double_tap_seek_seconds","player",150);move(a,"popup_double_tap_seek","player",151);move(a,"gesture_horizontal_seek","player",152);move(a,"gesture_vertical_options","player",153);move(a,"comment_cast_min","google_cast",20);move(a,"multiple_video_tabs","setting_whole",300);}
 public static void finish(PreferenceActivity a){HorizontalSeek233.settings(a);apply(a);}
}
