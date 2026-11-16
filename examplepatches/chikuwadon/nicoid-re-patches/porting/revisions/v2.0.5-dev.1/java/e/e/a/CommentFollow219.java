package e.e.a;
import android.preference.PreferenceManager;
import android.widget.CheckBox;
import android.widget.CompoundButton;

/** #137: remember comment auto-follow across player and tab recreation. */
public final class CommentFollow219 {
 private static final String KEY="nicoid_comment_auto_follow_v1";
 private CommentFollow219(){}
 public static void restore(CheckBox box){
  if(box==null)return;
  boolean enabled=PreferenceManager.getDefaultSharedPreferences(box.getContext()).getBoolean(KEY,false);
  if(box.isChecked()!=enabled)box.setChecked(enabled);
 }
 public static void save(CompoundButton box,boolean enabled){
  if(box!=null)PreferenceManager.getDefaultSharedPreferences(box.getContext()).edit().putBoolean(KEY,enabled).apply();
 }
}
