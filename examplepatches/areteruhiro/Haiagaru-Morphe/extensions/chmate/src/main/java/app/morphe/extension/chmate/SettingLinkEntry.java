package app.morphe.extension.chmate;
import android.view.View;import android.widget.*;
public final class SettingLinkEntry {
 public static final int KEY_TAG=0x7e0b0021;
 public final String category,label;public final View control;
 public SettingLinkEntry(String category,String label,View control){this.category=category;this.label=label;this.control=control;}
 public boolean toggle(){return control instanceof CompoundButton&&!(control instanceof RadioButton);}
 public boolean available(){for(View v=control;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null)if(v.getVisibility()!=View.VISIBLE||!v.isEnabled())return false;return true;}
 public String locator(){Object key=control.getTag(KEY_TAG);return key instanceof String?(String)key:label;}
 public boolean matches(SettingLinkRequest request){return (request.category.isEmpty()||request.category.equals(category))&&(SettingLinkRequest.normalize(label).equals(SettingLinkRequest.alias(request.name))||SettingLinkRequest.normalize(locator()).equals(request.name));}
}
