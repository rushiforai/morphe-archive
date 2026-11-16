package e.e.a;

import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;

/** Translate known built-in chrome labels, never IDs, preferences or user input. */
public final class AppLocale251 {
 private AppLocale251(){}
 public static void translate(View view){
  if(view==null)return;
  if(view instanceof TextView && !(view instanceof EditText)){
   TextView label=(TextView)view;
   CharSequence old=label.getText();
   if(old!=null && old.length()>0 && old.length()<120){
    String source=old.toString();
    // Exact known UI strings only; no partial replacements in video titles.
    String localized=UiStrings.translate(source);
    if(localized!=null&&!localized.equals(source))label.setText(localized);
   }
  }
  if(view instanceof ViewGroup){
   ViewGroup group=(ViewGroup)view;
   for(int i=0;i<group.getChildCount();i++)translate(group.getChildAt(i));
  }
 }
}
