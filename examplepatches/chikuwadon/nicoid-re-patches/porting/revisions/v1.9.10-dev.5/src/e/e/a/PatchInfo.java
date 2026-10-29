package e.e.a;
import android.preference.*;
/** Keep version information available even with an older settings resource. */
public final class PatchInfo {
 public static Preference ensure(PreferenceActivity activity,String value){
  Preference version=activity.findPreference("nicoid_patch_version");
  if(version==null){version=new Preference(activity);version.setKey("nicoid_patch_version");version.setTitle(UiStrings.translate("パッチバージョン"));Preference parent=activity.findPreference("about");PreferenceGroup group=parent instanceof PreferenceGroup?(PreferenceGroup)parent:activity.getPreferenceScreen();if(group!=null)group.addPreference(version);}
  version.setSummary(PatchVersion237.display());return version;
 }
}
