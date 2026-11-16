package e.e.a;

import android.app.Dialog;
import android.content.Context;
import android.preference.DialogPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.view.View;
import java.util.WeakHashMap;

/** Reuse the established rounded theme, without replacing existing dialogs. */
public final class DialogCorner242 {
 private static final WeakHashMap<Preference,Boolean> WATCHED=new WeakHashMap<>();
 private DialogCorner242(){}
 public static void roundedContent(View content){
  if(content==null)return;
  Context c=content.getContext();
  content.setBackground(PanelUi.round(c,UiDialogs.surface(c),24));
  content.setClipToOutline(true);
 }
 public static void style(Dialog dialog){
  if(dialog==null||!dialog.isShowing())return;
  UiTheme191.window(dialog);
 }
 public static void install(PreferenceActivity activity){
  if(activity==null||activity.isFinishing()||activity.isDestroyed())return;
  PreferenceGroup root=activity.getPreferenceScreen();
  if(root!=null)walk(activity,root);
 }
 private static void walk(PreferenceActivity a,Preference pref){
  if(pref instanceof PreferenceGroup){
   PreferenceGroup group=(PreferenceGroup)pref;
   for(int i=0;i<group.getPreferenceCount();i++)walk(a,group.getPreference(i));
  }
  if(!(pref instanceof DialogPreference)||WATCHED.containsKey(pref))return;
  WATCHED.put(pref,Boolean.TRUE);
  DialogPreference dialog=(DialogPreference)pref;
  final Preference.OnPreferenceClickListener original=pref.getOnPreferenceClickListener();
  pref.setOnPreferenceClickListener(p->{
   boolean consumed=original!=null&&original.onPreferenceClick(p);
   // DialogPreference opens its dialog after this callback returns false.
   a.getListView().post(()->{
    if(a.isFinishing()||a.isDestroyed())return;
    style(dialog.getDialog());
   });
   return consumed;
  });
 }
}
