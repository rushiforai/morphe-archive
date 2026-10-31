package e.e.a;
import android.app.*;import android.view.*;import android.widget.*;import android.os.*;import android.net.Uri;import java.util.*;import java.util.concurrent.*;
/** Deletes list membership, never the list itself. Failed rows remain selected. */
public final class AccountRemoval227 {
 static final ExecutorService WORK=Executors.newSingleThreadExecutor();static final Handler MAIN=new Handler(Looper.getMainLooper());static final Set<Object> BUSY=Collections.newSetFromMap(new IdentityHashMap<Object,Boolean>());
 static final Map<Object,String> MEMBER_IDS=Collections.synchronizedMap(new WeakHashMap<Object,String>());
 public static void capture(Object row,org.json.JSONObject membership){String id=membership.optString("itemId","");if(id.matches("[0-9]+"))MEMBER_IDS.put(row,id);}
 static String membershipId(Object row){String id=MEMBER_IDS.get(row);return id!=null?id:ListActions.value(row,"item_id");}
 static String error(Exception e){String m=e.getMessage();return m!=null&&m.matches("HTTP [0-9]{3}( [A-Z][A-Z0-9_]{1,47}(/[A-Z][A-Z0-9_]{1,47})?)?")?m:e.getClass().getSimpleName();}
 static int kind(Activity a){try{int type=a.getClass().getField("E").getInt(a);return type==9?2:type==5?1:0;}catch(Exception e){return 0;}}
 static boolean skip(Activity a,CharSequence label){int k=kind(a);return k>0&&String.valueOf(label).equals(UiStrings.translate(k==2?"とりあえずマイリスト登録":"マイリスト登録"));}
 static String path(boolean later,String list,Object row)throws Exception{
  String id=membershipId(row);
  if(!id.matches("[0-9]+")||!later&&!list.matches("[0-9]+"))throw new IllegalArgumentException("Invalid membership identifier");
  return "https://nvapi.nicovideo.jp/v1/users/me/"+(later?"watch-later?itemIds=":"mylists/"+Uri.encode(list)+"/items?itemIds=")+Uri.encode(id);
 }
 public static boolean delete(Object owner,ArrayList<?> chosen){
  final Activity a;final boolean later;final String list;try{a=(Activity)Playback214.get(owner,"o0");int type;try{type=((Number)Playback214.get(owner,"g0")).intValue();}catch(Exception missing){return false;}int k=type==9?2:type==5?1:0;if(k==0)return false;later=k==2;list=String.valueOf(Playback214.get(owner,"d0"));}catch(Exception e){return false;}
  if(!BUSY.add(owner))return true;VideoDetails.initializeCookies(a);final ArrayList<Object> selected=new ArrayList<Object>(chosen);WORK.execute(()->{
   final String[] failure={""};ArrayList<Object> removed=new ArrayList<Object>();for(Object row:selected)try{if(later)WatchLater245.remove(path(true,list,row));else VideoDetails.request(path(false,list,row),"DELETE",true,new NetworkTask());removed.add(row);}catch(Exception e){failure[0]=error(e);String diagnostic=(later?"Watch-later":"Mylist")+" membership delete failed: "+failure[0];ModernDebug.record(diagnostic);android.util.Log.w("nicoid-mylist",diagnostic);}
   MAIN.post(()->{BUSY.remove(owner);try{((ArrayList<?>)Playback214.get(owner,"a0")).removeAll(removed);((BaseAdapter)Playback214.get(owner,"p0")).notifyDataSetChanged();if(!a.isDestroyed()){BulkSelection.refresh(owner);if(removed.size()==selected.size())BulkSelection.done(owner);else Toast.makeText(a,PanelUi.tr(a,"削除できなかった動画はリストに残しています","Videos that could not be removed remain in the list","未能移除的影片仍保留在清單中")+(failure[0].isEmpty()?"":" ("+failure[0]+")"),1).show();}}catch(Exception e){android.util.Log.w("nicoid-mylist","Cannot refresh membership deletion",e);}});
  });return true;
 }
 static void confirm(Activity a,Object row){final Object origin;try{origin=Playback214.get(a,"F");}catch(Exception e){return;}UiDialogs.show(UiDialogs.builder(PlaybackSession.dialogContext(a)).setTitle(PanelUi.tr(a,"このリストから動画を削除しますか？","Remove video from this list?","從此清單移除影片？")).setPositiveButton(UiStrings.translate("削除"),(d,w)->{try{ArrayList<Object> chosen=new ArrayList<Object>();chosen.add(row);delete(origin,chosen);}catch(Exception e){android.util.Log.w("nicoid-mylist","Cannot select membership",e);}}).setNegativeButton(android.R.string.cancel,null).create());}
}
