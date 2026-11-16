package e.e.a;
import android.preference.*;
import android.view.View;
import java.lang.reflect.Method;
import java.util.Locale;

/** #138: optional comments panel on player entry. Does not affect popup resume (#139). */
public final class DefaultPanel219 {
 private static final String KEY="nicoid_initial_player_panel";
 private DefaultPanel219(){}
 public static void install(PreferenceActivity activity){
  if(activity==null||activity.isFinishing()||activity.findPreference(KEY)!=null)return;
  Preference group=activity.findPreference("player");
  if(!(group instanceof PreferenceGroup))return;
  ListPreference p=new ListPreference(activity);
  p.setKey(KEY);
  p.setTitle(PanelUi.tr(activity,"動画再生画面の初期パネル","Default player panel","播放器預設面板"));
  p.setEntries(new CharSequence[]{PanelUi.tr(activity,"動画情報","Video information","影片資訊"),
                                   PanelUi.tr(activity,"コメント","Comments","留言")});
  p.setEntryValues(new CharSequence[]{"info","comments"});
  p.setDefaultValue("info");p.setOrder(145);
  p.setSummary(PanelUi.tr(activity,
    "動画を開いたときに最初に表示する下部パネル",
    "Choose the bottom panel shown when opening a video",
    "選擇開啟影片時首先顯示的底部面板"));
  ((PreferenceGroup)group).addPreference(p);
 }
 public static void apply(Object fragment){
  if(fragment==null)return;
  try{
   Object pager=fragment.getClass().getField("E1").get(fragment);
   if(!(pager instanceof View))return;
   View view=(View)pager;
   String mode=PreferenceManager.getDefaultSharedPreferences(view.getContext()).getString(KEY,"info");
   if("comments".equals(mode))view.post(()->select(pager,view,0));
  }catch(Exception e){android.util.Log.w("nicoid-panel","Could not read player tabs",e);}
 }
 private static void select(Object pager,View view,int attempt){
  if(attempt>=5||!view.isAttachedToWindow())return;
  try{
   Class<?> pagerClass=pager.getClass();
   if(((Number)pagerClass.getMethod("getCurrentItem").invoke(pager)).intValue()!=0)return;
   Object adapter=pagerClass.getMethod("getAdapter").invoke(pager);
   if(adapter==null){view.postDelayed(()->select(pager,view,attempt+1),80);return;}
   Class<?> adapterClass=adapter.getClass();
   Method getTitle=adapterClass.getMethod("getPageTitle",int.class);
   int total=((Number)adapterClass.getMethod("getCount").invoke(adapter)).intValue();
   for(int i=0;i<total;i++){
    Object raw=getTitle.invoke(adapter,i);
    String title=raw==null?"":raw.toString().toLowerCase(Locale.ROOT);
    if(title.contains("コメント")||title.contains("comment")||title.contains("留言")||title.contains("評論")){
     pagerClass.getMethod("setCurrentItem",int.class,boolean.class).invoke(pager,i,false);
     return;
    }
   }
  }catch(Exception e){android.util.Log.w("nicoid-panel","Could not select comments tab",e);}
 }
}
