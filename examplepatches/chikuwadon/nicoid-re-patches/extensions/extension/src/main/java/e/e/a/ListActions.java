package e.e.a;

import android.app.*;
import android.content.*;
import android.os.Handler;
import android.os.Looper;
import android.view.*;
import android.widget.*;
import java.util.*;

public final class ListActions {
 static final Set<Object> LONG=Collections.newSetFromMap(new IdentityHashMap<Object,Boolean>());
 static final Map<Object,List<Action>> ACTIONS=new WeakHashMap<>();
 private static final int SUPER_LONG_EXTRA_MS=950;
 private static final Handler MAIN=new Handler(Looper.getMainLooper());

 static final class Action {
  final String title;final boolean enabled;final int id;final Runnable run;
  Action(MenuItem item,Runnable run){title=item.getTitle().toString();enabled=item.isEnabled();id=item.getItemId();this.run=run;}
 }

 static Object get(Object o,String key)throws Exception{return o.getClass().getField(key).get(o);}
 static String value(Object row,String key){try{Object v=row.getClass().getMethod("a",String.class).invoke(row,key);return v==null?"":v.toString();}catch(Exception e){return "";}}

 public static void bind(View view,Object adapter,int position){
  try{
   ArrayList<?> rows=(ArrayList<?>)get(adapter,"b");if(position<0||position>=rows.size())return;
   Object row=rows.get(position);if(BulkSelection.bind(view,adapter,row))return;view.getOverlay().clear();String url=value(row,"videourl");
   if(!url.matches("https?://[^/]*nicovideo.jp/(?:watch|shorts)/.*"))return;
   view.setOnClickListener(v->{AdapterView<?> list=findList(v);if(list==null)return;int index=list.getPositionForView(v);if(index>=0)list.performItemClick(v,index,list.getItemIdAtPosition(index));});
   Hold hold=new Hold(adapter,row,url,value(row,"title"));
   view.setOnTouchListener(hold);view.setOnLongClickListener(hold);
  }catch(Exception e){android.util.Log.w("nicoid-menu","Unable to bind video actions",e);}
 }

 private static final class Hold implements View.OnTouchListener,View.OnLongClickListener {
  final Object adapter,row;final String url,title;final Handler handler=MAIN;
  boolean longPressed,superHandled;Runnable pending;
  Hold(Object adapter,Object row,String url,String title){this.adapter=adapter;this.row=row;this.url=url;this.title=title;}
  @Override public boolean onLongClick(View view){
   longPressed=true;AdapterView<?> list=findList(view);
   if(list==null||(!LocalPlaylists.hasAdapter(adapter)&&list.getOnItemLongClickListener()==null)){showActions(view,adapter,row,url,title);return true;}
   pending=()->{if(!view.isPressed())return;superHandled=dispatchSuperLong(view,adapter,row,list);};
   handler.postDelayed(pending,SUPER_LONG_EXTRA_MS);return true;
  }
  @Override public boolean onTouch(View view,MotionEvent event){
   if(event.getActionMasked()==MotionEvent.ACTION_DOWN){longPressed=false;superHandled=false;cancel();}
   else if(event.getActionMasked()==MotionEvent.ACTION_UP){if(longPressed){boolean show=!superHandled;cancel();if(show)showActions(view,adapter,row,url,title);}}
   else if(event.getActionMasked()==MotionEvent.ACTION_CANCEL){cancel();}
   return false;
  }
  void cancel(){if(pending!=null){handler.removeCallbacks(pending);pending=null;}}
 }

 private static AdapterView<?> findList(View view){ViewParent parent=view.getParent();while(parent!=null){if(parent instanceof AdapterView)return (AdapterView<?>)parent;parent=parent.getParent();}return null;}
 private static boolean dispatchSuperLong(View view,Object adapter,Object row,AdapterView<?> list){
  if(LocalPlaylists.superLong(adapter,row))return true;
  AdapterView.OnItemLongClickListener listener=list.getOnItemLongClickListener();if(listener==null)return false;
  int position=list.getPositionForView(view);if(position<0)return false;
  Object owner=BulkSelection.owner(list);if(owner!=null)return BulkSelection.enter(owner,position);
  try{return listener.onItemLongClick(list,view,position,list.getItemIdAtPosition(position));}
  catch(Exception e){android.util.Log.w("nicoid-menu","Unable to enter selection mode",e);return false;}
 }
 public static void adjustHistoryMenu(Object activity,Menu menu){try{int type=activity.getClass().getField("E").getInt(activity);if(type==4)menu.removeItem(0x7f0f020a);if(type==8)menu.removeItem(0x7f0f020b);if(type==4||type==8){android.content.SharedPreferences prefs=android.preference.PreferenceManager.getDefaultSharedPreferences((Context)activity);MenuItem shuffle=menu.add(0,18120,50,PanelUi.tr((Context)activity,"シャッフル再生","Shuffle playback","隨機播放"));shuffle.setCheckable(true);shuffle.setChecked(prefs.getBoolean("continuous_play",false)&&prefs.getInt("continuous_play_mode",0)==2);}}catch(Exception e){android.util.Log.w("nicoid-menu","Unable to adjust history menu",e);}}
 public static boolean handleHistoryShuffle(Object activity,MenuItem item){if(item.getItemId()!=18120)return false;try{android.content.SharedPreferences prefs=android.preference.PreferenceManager.getDefaultSharedPreferences((Context)activity);prefs.edit().putBoolean("continuous_play",true).putInt("continuous_play_mode",2).apply();Class.forName("com.sauzask.nicoid.NicoidVideoListActivity").getField("I").setBoolean(null,true);Class.forName("com.sauzask.nicoid.NicoidVideoListActivity").getField("J").setInt(null,2);activity.getClass().getMethod("invalidateOptionsMenu").invoke(activity);item.setChecked(true);}catch(Exception e){android.util.Log.w("nicoid-menu","Unable to enable history shuffle",e);}return true;}
 private static void showActions(View view,Object adapter,Object row,String url,String title){
  Object listener=null;try{int index=((ArrayList<?>)get(adapter,"b")).indexOf(row);if(index<0)return;listener=Class.forName("e.e.a.b0$a").getConstructor(Class.forName("e.e.a.b0"),String.class,String.class,int.class,String.class).newInstance(adapter,url,title,index,HistoryRules.id(url));LONG.add(listener);((View.OnClickListener)listener).onClick(view);}
  catch(Exception e){android.util.Log.w("nicoid-menu","Unable to show video actions",e);}finally{if(listener!=null)LONG.remove(listener);}
 }

 public static void extra(Object listener,Object popup){try{Object adapter=get(listener,"e");Activity host=(Activity)get(adapter,"d");int index=(Integer)get(listener,"c");ArrayList<?> rows=(ArrayList<?>)get(adapter,"b");if(index<0||index>=rows.size())return;Object row=rows.get(index);String owner=(String)get(row,"y");Menu menu=(Menu)get(popup,"a");ArrayList<MenuItem> original=new ArrayList<>();for(int n=0;n<menu.size();n++)original.add(menu.getItem(n));Object callback=Class.forName("e.e.a.b0$a$a").getConstructor(listener.getClass()).newInstance(listener);menu.clear();List<Action> actions=new ArrayList<>();int order=0;boolean inserted=false;for(MenuItem item:original){MenuItem copy=menu.add(0,item.getItemId(),order++,item.getTitle());copy.setEnabled(item.isEnabled());Runnable run=()->{try{callback.getClass().getMethod("onMenuItemClick",MenuItem.class).invoke(callback,item);}catch(Exception e){android.util.Log.w("nicoid-menu","Video action failed",e);}};copy.setOnMenuItemClickListener(i->{run.run();return true;});actions.add(new Action(copy,run));if(item.getOrder()==5&&!inserted){addExtra(menu,actions,host,owner,row,order);order+=2;inserted=true;}}if(!inserted)addExtra(menu,actions,host,owner,row,order);ACTIONS.put(popup,actions);}catch(Exception e){android.util.Log.w("nicoid-menu","Unable to add video actions",e);}}
 private static void addExtra(Menu menu,List<Action> actions,Activity host,String owner,Object row,int order){MenuItem playlist=menu.add(0,18102,order,PanelUi.tr(host,"プレイリストに追加","Add to playlist","加入播放清單"));Runnable add=()->LocalPlaylists.addRow(host,row);playlist.setOnMenuItemClickListener(i->{add.run();return true;});actions.add(new Action(playlist,add));MenuItem block=menu.add(0,18101,order+1,PanelUi.tr(host,"投稿者をNG","Block uploader","封鎖投稿者"));Runnable ng=()->ContentFilter.confirmOwner(host,owner);block.setOnMenuItemClickListener(i->{ng.run();return true;});actions.add(new Action(block,ng));}
 public static void show(Object listener,Object popup){try{List<Action> actions=ACTIONS.remove(popup);if(!LONG.contains(listener)||actions==null){popup.getClass().getMethod("a").invoke(popup);return;}Object adapter=get(listener,"e");Activity host=(Activity)get(adapter,"d");Context c=PlaybackSession.dialogContext(host);String title=String.valueOf(get(listener,"b"));CharSequence[] labels=new CharSequence[actions.size()];for(int n=0;n<labels.length;n++)labels[n]=actions.get(n).title;AlertDialog dialog=new AlertDialog.Builder(c).setTitle(title).setItems(labels,(d,n)->{Action action=actions.get(n);if(action.enabled){if(action.id==18101||action.id==18102)action.run.run();else LocalPlaylists.withAdapterMode(host,adapter,action.run);}}).create();UiDialogs.show(dialog);}catch(Exception e){android.util.Log.w("nicoid-menu","Unable to display video actions",e);}}
}
