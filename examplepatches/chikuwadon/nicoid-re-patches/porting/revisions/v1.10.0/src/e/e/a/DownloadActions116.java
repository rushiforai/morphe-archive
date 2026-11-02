package e.e.a;
import android.app.Activity;import android.content.*;import android.view.*;import java.util.*;
/** Finalize both presentations from the same row and action list. */
public final class DownloadActions116 {
 static final int MP4=18130,CACHE=10;
 static String videoId(Object row){for(String key:new String[]{"videourl","videoId","video_id"}){String id=HistoryRules.id(ListActions.value(row,key));if(id!=null&&id.matches("(?:sm|so|nm|ss)?[0-9]+"))return id;}return "";}
 public static void complete(Object listener,Object popup){try{List<ListActions.Action> actions=ListActions.ACTIONS.get(popup);if(actions==null)return;Object adapter=ListActions.get(listener,"e");Activity a=(Activity)ListActions.get(adapter,"d");Object values=ListActions.get(adapter,"b");int at=((Number)ListActions.get(listener,"c")).intValue();if(!(values instanceof List)||at<0||at>=((List<?>)values).size())return;Object row=((List<?>)values).get(at);Menu menu=(Menu)ListActions.get(popup,"a");normalize(menu,actions,a,row);}catch(Exception e){android.util.Log.w("nicoid-download","Cannot attach video download actions",e);}}
 static void normalize(Menu menu,List<ListActions.Action> actions,Activity a,Object row){String id=videoId(row);if(id.isEmpty())return;String title=ListActions.value(row,"title");CacheTitles117.remember(id,title);ListActions.Action mp4=null,cache=null;ArrayList<ListActions.Action> others=new ArrayList<>();for(ListActions.Action action:actions){if(action.id==MP4){if(mp4==null)mp4=action;}else if(action.id==CACHE){if(cache==null)cache=action;}else others.add(action);}
  if(mp4==null){MenuItem item=menu.add(0,MP4,0,PanelUi.tr(a,"MP4で保存","Save as MP4","另存為MP4"));mp4=new ListActions.Action(item,()->DownloadUi115.choose(a,id,title));}
  if(cache==null&&!ListActions.cacheList(a)){MenuItem item=menu.add(0,CACHE,0,UiStrings.translate("キャッシュ取得"));cache=new ListActions.Action(item,()->cache(a,id,title));}
  int at=Math.min(4,others.size());others.add(at,mp4);if(cache!=null)others.add(at+1,cache);menu.clear();actions.clear();for(int i=0;i<others.size();i++){ListActions.Action action=others.get(i);MenuItem item=menu.add(0,action.id,i,action.title).setEnabled(action.enabled);item.setOnMenuItemClickListener(clicked->{action.run.run();return true;});actions.add(new ListActions.Action(item,action.run));}
 }
 static void cache(Activity a,String id,String title){CacheTitles117.remember(id,title);Intent i=CachedPlayback.acquisitionIntent(a,id);if(android.os.Build.VERSION.SDK_INT>=26)CacheFolders.startForegroundService(a,i);else CacheFolders.startService(a,i);}
}
