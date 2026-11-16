package e.e.a;
import android.preference.PreferenceManager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/** Localize the legacy native drawer group header without replacing its menu. */
public final class DrawerLabels253 {
 private DrawerLabels253(){}
 public static void refresh(View root){
  if(root==null)return;
  String lang=PreferenceManager.getDefaultSharedPreferences(root.getContext())
     .getString("app_lang","0");
  UiStrings.selectLanguage(lang);
  update(root,PanelUi.tr(root.getContext(),"設定","Settings","設定"),0);
 }
 private static void update(View view,String translated,int depth){
  if(view==null||depth>24)return;
  if(view instanceof TextView){
   TextView t=(TextView)view;CharSequence old=t.getText();
   if(old!=null&&("Setting".contentEquals(old)||"Settings".contentEquals(old)||
        "設定".contentEquals(old))&&!translated.contentEquals(old))t.setText(translated);
  }
  if(view instanceof ViewGroup){
   ViewGroup g=(ViewGroup)view;
   for(int i=0;i<g.getChildCount();i++)update(g.getChildAt(i),translated,depth+1);
  }
 }
}
