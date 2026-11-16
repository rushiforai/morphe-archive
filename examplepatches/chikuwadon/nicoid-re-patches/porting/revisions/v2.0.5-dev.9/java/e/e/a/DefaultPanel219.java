package e.e.a;

import android.preference.*;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.util.Locale;

/**
 * Initial lower player panel. Keep the same persisted key and existing values
 * from dev.8; never change the current panel after a user has switched it.
 */
public final class DefaultPanel219 {
 private static final String KEY="nicoid_initial_player_panel";
 private static final String[] IDS={"info","comments","menu","related"};
 private static final String[] LABELS={"動画情報","コメント","メニュー","関連動画"};
 private DefaultPanel219(){}

 public static void install(PreferenceActivity activity){
  if(activity==null||activity.isFinishing())return;
  Preference existing=activity.findPreference(KEY);
  ListPreference p;
  if(existing instanceof ListPreference)p=(ListPreference)existing;
  else {
   if(existing!=null)return;
   Preference group=activity.findPreference("player");
   if(!(group instanceof PreferenceGroup))group=activity.findPreference("setting_whole");
   if(!(group instanceof PreferenceGroup))return;
   p=new ListPreference(activity);
   p.setKey(KEY);
   p.setOrder(145);
   ((PreferenceGroup)group).addPreference(p);
  }
  p.setTitle(PanelUi.tr(activity,"動画再生画面の初期パネル","Default player panel","播放器預設面板"));
  CharSequence[] entries=new CharSequence[IDS.length];
  for(int i=0;i<IDS.length;i++)entries[i]=UiStrings.translate(LABELS[i]);
  p.setEntries(entries);
  p.setEntryValues(IDS);
  p.setDefaultValue("info");
  updateSummary(activity,p,p.getValue());
  p.setOnPreferenceChangeListener((row,value)->{
   String selected=String.valueOf(value);
   int idx=index(selected);
   if(idx<0)return false;
   p.setValue(selected);
   updateSummary(activity,p,selected);
   return true;
  });
 }

 private static int index(String value){
  if(value!=null)for(int i=0;i<IDS.length;i++)if(IDS[i].equals(value))return i;
  return -1;
 }
 private static void updateSummary(Context c,ListPreference p,String value){
  int selected=index(value);
  if(selected<0)selected=0;
  String choice=String.valueOf(p.getEntries()[selected]);
  String detail=PanelUi.tr(c,"動画を開いたときに最初に表示する下部パネル",
      "Choose the bottom panel shown when opening a video",
      "選擇開啟影片時首先顯示的底部面板");
  String separator=PanelUi.tr(c,"：",": ","：");
  p.setSummary(choice+separator+detail);
 }

 public static void apply(Object fragment){
  if(fragment==null)return;
  try{
   Field f=fragment.getClass().getField("E1");
   Object object=f.get(fragment);
   if(!(object instanceof View))return;
   View view=(View)object;
   Context context=view.getContext();
   String target=PreferenceManager.getDefaultSharedPreferences(context).getString(KEY,"info");
   if(index(target)<0)return;
   // The hook runs immediately after k3 construction, before its pager adapter
   // can finish binding. Retry on the View's UI thread until the pages exist.
   int initial=current(object);
   view.postDelayed(()->select(object,view,target,initial,0),80);
  }catch(Exception e){android.util.Log.w("nicoid-panel","Could not inspect lower-panel ViewPager",e);}
 }
 private static void select(Object pager,View view,String target,int initial,int attempt){
  if(attempt>=36)return;
  // Native tab binding may itself change the current index while installing
  // the adapter. The user's saved initial choice takes precedence only here,
  // during the one-time player-entry initialization.
  Object adapter=adapter(pager);
  if(!view.isAttachedToWindow()||adapter==null||count(adapter)<2){
   again(pager,view,target,initial,attempt);return;
  }
  int targetIndex=-1;
  StringBuilder available=new StringBuilder();
  for(int i=0;i<count(adapter);i++){
   CharSequence name=pageTitle(adapter,i);
   String title=name==null?"":name.toString();
   if(i>0)available.append(", ");
   available.append(i).append('=').append(title);
   if(matches(target,title))targetIndex=i;
  }
  if(targetIndex<0)targetIndex=tabStripIndex(view,target,count(adapter));
  if(targetIndex>=0){
   move(pager,targetIndex);
   android.util.Log.i("nicoid-panel","Initial panel "+target+" => "+targetIndex);
  }else if(attempt<35)again(pager,view,target,initial,attempt);
  else android.util.Log.w("nicoid-panel","Unknown lower tabs for "+target+": "+available);
 }
 private static void again(Object pager,View view,String target,int initial,int attempt){
  view.postDelayed(()->select(pager,view,target,initial,attempt+1),80);
 }
 private static boolean matches(String target,String title){
  if(title==null)return false;
  String s=title.toLowerCase(Locale.ROOT).replace(" ","");
  if(target.equals("info"))return s.contains("動画情報")||s.contains("video information")
     ||s.contains("videodetails")||s.contains("video info")||s.contains("影片資訊")||s.contains("詳細");
  if(target.equals("comments"))return s.contains("コメント")||s.contains("comment")||s.contains("留言")||s.contains("評論");
  if(target.equals("menu"))return s.contains("メニュー")||s.contains("menu")||s.contains("選單")||s.contains("菜单");
  if(target.equals("related"))return s.contains("関連")||s.contains("related")||s.contains("similar")
     ||s.contains("相關")||s.contains("相关")||s.contains("推薦");
  return false;
 }
 private static java.lang.reflect.Method method(Object object,String name,Class<?>... args) throws Exception{
  java.lang.reflect.Method call=object.getClass().getMethod(name,args);
  call.setAccessible(true);
  return call;
 }
 private static int current(Object pager){
  try{return ((Number)method(pager,"getCurrentItem").invoke(pager)).intValue();}
  catch(Exception error){return -1;}
 }
 private static Object adapter(Object pager){
  try{return method(pager,"getAdapter").invoke(pager);}
  catch(Exception error){return null;}
 }
 private static int count(Object adapter){
  try{return ((Number)method(adapter,"getCount").invoke(adapter)).intValue();}
  catch(Exception error){return 0;}
 }
 private static CharSequence pageTitle(Object adapter,int index){
  try{return (CharSequence)method(adapter,"getPageTitle",int.class).invoke(adapter,index);}
  catch(Exception error){return null;}
 }
 private static void move(Object pager,int index){
  try{method(pager,"setCurrentItem",int.class,boolean.class).invoke(pager,index,false);}
  catch(Exception error){android.util.Log.w("nicoid-panel","Could not switch lower panel",error);}
 }
 // Certain native adapters do not expose titles until the sliding tabs bind.
 private static int tabStripIndex(View view,String target,int count){
  Object parent=view.getParent();
  if(!(parent instanceof ViewGroup))return -1;
  ViewGroup group=(ViewGroup)parent;
  for(int j=0;j<group.getChildCount();j++){
   View child=group.getChildAt(j);
   if(!child.getClass().getName().contains("PagerSlidingTabStrip"))continue;
   java.util.ArrayList<String> names=new java.util.ArrayList<>();
   collectTitles(child,names);
   if(names.size()!=count)continue;
   for(int i=0;i<names.size();i++)if(matches(target,names.get(i)))return i;
  }
  return -1;
 }
 private static void collectTitles(View view,java.util.ArrayList<String> out){
  if(view instanceof TextView){
   CharSequence s=((TextView)view).getText();
   if(s!=null&&!s.toString().trim().isEmpty())out.add(s.toString());
  }else if(view instanceof ViewGroup){
   ViewGroup group=(ViewGroup)view;
   for(int i=0;i<group.getChildCount();i++)collectTitles(group.getChildAt(i),out);
  }
 }
}
