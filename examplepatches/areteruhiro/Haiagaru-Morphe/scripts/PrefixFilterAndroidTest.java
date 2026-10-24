package app.morphe.extension.chmate;
import android.app.Activity;
import android.content.SharedPreferences;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import java.lang.reflect.*;
public class PrefixFilterAndroidTest {
 static int checks;
 static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 static boolean visible(int index)throws Exception{Method m=Class.forName("app.morphe.extension.chmate.QuickFilterOptions").getDeclaredMethod("visible",int.class);m.setAccessible(true);return (Boolean)m.invoke(null,index);}
 static boolean contains(View v,String token){
  if(v instanceof EditText&&token.equals(((EditText)v).getText().toString()))return true;
  if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++)if(contains(((ViewGroup)v).getChildAt(i),token))return true;
  return false;
 }
 public static String run(Activity activity)throws Exception {
  checks=0;check("ab12".equals(WacchoiSuffixNg.prefix("(ﾜｯﾁｮｲ ab12-Cd34)")),"upper prefix");
  check(WacchoiSuffixNg.prefix("xab12-Cd34")==null,"boundary");
  SharedPreferences p=activity.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);
  String[] keys={"quickFilterExtras","quickFilterAA","quickFilterMine","quickFilterReplies"};
  boolean[] had=new boolean[4],old=new boolean[4];for(int i=0;i<4;i++){had[i]=p.contains(keys[i]);old[i]=p.getBoolean(keys[i],false);}
  try{
   p.edit().putBoolean(keys[0],true).putBoolean(keys[1],false).putBoolean(keys[2],true).putBoolean(keys[3],false).commit();
   check(!visible(4)&&visible(5)&&!visible(6),"independent extras");
   check(!visible(-1)&&!visible(7),"bounds");
   Method m=ExtraQuickFilters.class.getDeclaredMethod("visibleIndices");m.setAccessible(true);int[] ids=(int[])m.invoke(null);
   check(java.util.Arrays.equals(ids,new int[]{0,1,2,3,5}),"dialog mapping");
   android.widget.LinearLayout rows=new android.widget.LinearLayout(activity);Method settings=Class.forName("app.morphe.extension.chmate.QuickFilterOptions").getDeclaredMethod("addSettings",android.widget.LinearLayout.class,Activity.class);settings.setAccessible(true);settings.invoke(null,rows,activity);
   check(rows.getChildCount()==6,"six display options");
   return "PASS "+checks+" prefix/filter Java checks";
  }finally{SharedPreferences.Editor e=p.edit();for(int i=0;i<4;i++)if(had[i])e.putBoolean(keys[i],old[i]);else e.remove(keys[i]);e.commit();}
 }
}
