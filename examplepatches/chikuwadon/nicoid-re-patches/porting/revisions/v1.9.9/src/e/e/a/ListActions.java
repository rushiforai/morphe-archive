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
 private static final int POPUP_HOLD_MS=500;
 private static final Handler MAIN=new Handler(Looper.getMainLooper());

 /** One flat fill, retaining the original bottom-right triangle and hit target. */
 public static void corner(View button){button.setBackgroundTintList(null);button.setBackground(new Corner());}
 static final class Corner extends android.graphics.drawable.Drawable {
  final android.graphics.Paint paint=new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
  final android.graphics.Path path=new android.graphics.Path();int alpha=255;boolean pressed;
  public void draw(android.graphics.Canvas canvas){android.graphics.Rect b=getBounds();float leg=Math.min(b.width(),b.height())*.5625f;path.reset();path.moveTo(b.right-leg,b.bottom);path.lineTo(b.right,b.bottom-leg);path.lineTo(b.right,b.bottom);path.close();paint.setColor(DialogColors.LIST_CORNER);paint.setAlpha((pressed?204:153)*alpha/255);canvas.drawPath(path,paint);}
  public void setAlpha(int value){alpha=value;invalidateSelf();}
  public void setColorFilter(android.graphics.ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
  public int getOpacity(){return android.graphics.PixelFormat.TRANSLUCENT;}
  public boolean isStateful(){return true;}
  protected boolean onStateChange(int[] state){boolean next=false;for(int value:state)if(value==android.R.attr.state_pressed||value==android.R.attr.state_focused)next=true;if(next==pressed)return false;pressed=next;invalidateSelf();return true;}
 }

 static final class Action {
  final String title;final boolean enabled;final int id;final Runnable run;
  Action(MenuItem item,Runnable run){title=item.getTitle().toString();enabled=item.isEnabled();id=item.getItemId();this.run=run;}
 }

 static Object get(Object o,String key)throws Exception{return o.getClass().getField(key).get(o);}
 static String value(Object row,String key){try{Object v=row.getClass().getMethod("a",String.class).invoke(row,key);return v==null?"":v.toString();}catch(Exception e){return "";}}

 public static void bind(View view,Object adapter,int position){
  try{
   ArrayList<?> rows=(ArrayList<?>)get(adapter,"b");if(position<0||position>=rows.size())return;
   Object row=rows.get(position);VideoRows191.bind(view,adapter,row);CacheProgress.bind(view,adapter,row);if(BulkSelection.bind(view,adapter,row))return;view.getOverlay().clear();String url=value(row,"videourl");
   if(!url.matches("https?://[^/]*nicovideo.jp/(?:watch|shorts)/.*"))return;
   view.setOnClickListener(v->{AdapterView<?> list=findList(v);if(list==null)return;int index=list.getPositionForView(v);if(index>=0)list.performItemClick(v,index,list.getItemIdAtPosition(index));});
   Hold hold=new Hold(adapter,row,url,value(row,"title"));
   view.setOnTouchListener(hold);view.setOnLongClickListener(hold);
  }catch(Exception e){android.util.Log.w("nicoid-menu","Unable to bind video actions",e);}
 }

 private static Hold activeHold;
 static class Hold implements View.OnTouchListener,View.OnLongClickListener {
  final Object adapter,row;final String url,title;final Handler handler=MAIN;
  boolean longPressed,superHandled,down,cancelled;long started;float startX,startY;Runnable pending;PopupWindow popup;
  Hold(Object adapter,Object row,String url,String title){this.adapter=adapter;this.row=row;this.url=url;this.title=title;}
  @Override public boolean onLongClick(View view){
   if(cancelled||longPressed||pending!=null)return true;
   long delay=down?Math.max(0,Math.max(POPUP_HOLD_MS,ViewConfiguration.getLongPressTimeout())-(android.os.SystemClock.uptimeMillis()-started)):0;
   if(delay>0){pending=()->{pending=null;if(down&&!cancelled)open(view);};handler.postDelayed(pending,delay);}else open(view);
   return true;
  }
  void open(View view){
   longPressed=true;AdapterView<?> list=findList(view);
   if(list!=null&&(LocalPlaylists.hasAdapter(adapter)||BulkSelection.owner(list)!=null)){pending=()->{if(!down)return;superHandled=dispatchSuperLong(view,adapter,row,list);if(superHandled&&popup!=null)popup.dismiss();};handler.postDelayed(pending,SUPER_LONG_EXTRA_MS);}
   activeHold=this;try{showActions(view,adapter,row,url,title);}finally{activeHold=null;}
  }
  @Override public boolean onTouch(View view,MotionEvent event){
   if(event.getActionMasked()==MotionEvent.ACTION_DOWN){cancel();down=true;cancelled=false;longPressed=false;superHandled=false;started=android.os.SystemClock.uptimeMillis();startX=event.getX();startY=event.getY();}
   else if(event.getActionMasked()==MotionEvent.ACTION_MOVE&&!longPressed){int slop=ViewConfiguration.get(view.getContext()).getScaledTouchSlop();if(Math.abs(event.getX()-startX)>slop||Math.abs(event.getY()-startY)>slop){cancelled=true;cancel();}}
   else if(event.getActionMasked()==MotionEvent.ACTION_POINTER_DOWN){cancelled=true;down=false;cancel();if(popup!=null)popup.dismiss();}
   else if(event.getActionMasked()==MotionEvent.ACTION_UP){down=false;cancel();if(popup!=null&&!superHandled){popup.setTouchable(true);popup.setFocusable(true);popup.setOutsideTouchable(true);popup.update();}}
   else if(event.getActionMasked()==MotionEvent.ACTION_CANCEL){down=false;cancelled=true;cancel();if(popup!=null)popup.dismiss();}
   return false;
  }
  void cancel(){if(pending!=null){handler.removeCallbacks(pending);pending=null;}}
 }
 private static void heldPopup(Activity host,String title,List<Action> actions,Hold hold,Object adapter){Context c=PlaybackSession.dialogContext(host);LinearLayout box=PanelUi.column(c);box.setPadding(PanelUi.dp(c,20),PanelUi.dp(c,12),PanelUi.dp(c,20),PanelUi.dp(c,12));box.setBackground(PanelUi.round(c,UiDialogs.surface(c),20));TextView heading=PanelUi.text(c,title,16);heading.setMaxLines(3);heading.setPadding(0,0,0,PanelUi.dp(c,8));box.addView(heading);ScrollView scroll=new ScrollView(c);LinearLayout rows=PanelUi.column(c);scroll.addView(rows);box.addView(scroll,new LinearLayout.LayoutParams(-1,Math.min(PanelUi.dp(c,360),host.getResources().getDisplayMetrics().heightPixels/2)));PopupWindow window=new PopupWindow(box,Math.min(host.getResources().getDisplayMetrics().widthPixels-PanelUi.dp(c,32),PanelUi.dp(c,420)),-2,false);hold.popup=window;window.setBackgroundDrawable(PanelUi.round(c,UiDialogs.surface(c),20));window.setElevation(0);window.setTouchable(!hold.down);window.setFocusable(!hold.down);window.setOutsideTouchable(!hold.down);for(Action action:actions){TextView item=PanelUi.text(c,action.title.toString(),15);item.setGravity(Gravity.CENTER_VERTICAL);item.setMinHeight(PanelUi.dp(c,46));item.setEnabled(action.enabled);item.setAlpha(action.enabled?1:.4f);rows.addView(item);item.setOnClickListener(v->{window.dismiss();if(action.enabled)LocalPlaylists.withAdapterMode(host,adapter,action.run);});}window.showAtLocation(host.getWindow().getDecorView(),Gravity.CENTER,0,0);}
 static AdapterView<?> findList(View view){ViewParent parent=view.getParent();while(parent!=null){if(parent instanceof AdapterView)return (AdapterView<?>)parent;parent=parent.getParent();}return null;}
 private static boolean dispatchSuperLong(View view,Object adapter,Object row,AdapterView<?> list){
  if(LocalPlaylists.superLong(adapter,row))return true;
  AdapterView.OnItemLongClickListener listener=list.getOnItemLongClickListener();if(listener==null)return false;
  int position=list.getPositionForView(view);if(position<0)return false;
  Object owner=BulkSelection.owner(list);if(owner!=null){try{return BulkSelection.enter(owner,BulkSelection.rows(owner).indexOf(row));}catch(Exception e){return false;}}
  try{return listener.onItemLongClick(list,view,position,list.getItemIdAtPosition(position));}
  catch(Exception e){android.util.Log.w("nicoid-menu","Unable to enter selection mode",e);return false;}
 }
 private static void showActions(View view,Object adapter,Object row,String url,String title){
  Object listener=null;try{int index=((ArrayList<?>)get(adapter,"b")).indexOf(row);if(index<0)return;listener=Class.forName("e.e.a.b0$a").getConstructor(Class.forName("e.e.a.b0"),String.class,String.class,int.class,String.class).newInstance(adapter,url,title,index,HistoryRules.id(url));LONG.add(listener);((View.OnClickListener)listener).onClick(view);}
  catch(Exception e){android.util.Log.w("nicoid-menu","Unable to show video actions",e);}finally{if(listener!=null)LONG.remove(listener);}
 }

 public static void extra(Object listener,Object popup){try{Object adapter=get(listener,"e");Activity host=(Activity)get(adapter,"d");int index=(Integer)get(listener,"c");ArrayList<?> rows=(ArrayList<?>)get(adapter,"b");if(index<0||index>=rows.size())return;Object row=rows.get(index);String owner=(String)get(row,"y");Menu menu=(Menu)get(popup,"a");ArrayList<MenuItem> original=new ArrayList<>();for(int n=0;n<menu.size();n++)original.add(menu.getItem(n));Object callback=Class.forName("e.e.a.b0$a$a").getConstructor(listener.getClass()).newInstance(listener);menu.clear();List<Action> actions=new ArrayList<>();int order=0;boolean inserted=false;for(MenuItem item:original){if(cacheList(host)&&item.getItemId()==10||AccountRemoval227.skip(host,item.getTitle()))continue;MenuItem copy=menu.add(0,item.getItemId(),order++,item.getTitle());copy.setEnabled(item.isEnabled());Runnable run=()->{try{callback.getClass().getMethod("onMenuItemClick",MenuItem.class).invoke(callback,item);}catch(Exception e){android.util.Log.w("nicoid-menu","Video action failed",e);}};copy.setOnMenuItemClickListener(i->{run.run();return true;});actions.add(new Action(copy,run));if(item.getOrder()==5&&!inserted){addExtra(menu,actions,host,owner,row,order);order+=3;inserted=true;}}if(!inserted)addExtra(menu,actions,host,owner,row,order);ACTIONS.put(popup,actions);}catch(Exception e){android.util.Log.w("nicoid-menu","Unable to add video actions",e);}}
 private static void addExtra(Menu menu,List<Action> actions,Activity host,String owner,Object row,int order){if(AccountRemoval227.kind(host)>0){MenuItem remove=menu.add(0,18105,order+5,PanelUi.tr(host,"マイリストを削除","Remove from mylist","從播放清單移除"));Runnable delete=()->AccountRemoval227.confirm(host,row);remove.setOnMenuItemClickListener(i->{delete.run();return true;});actions.add(new Action(remove,delete));}if(cacheList(host)||history(host)){String label=cacheList(host)?PanelUi.tr(host,"キャッシュを削除","Delete cache","刪除快取"):PanelUi.tr(host,"視聴履歴を削除","Delete watch history","刪除觀看紀錄");MenuItem remove=menu.add(0,18104,order+4,label);Runnable delete=()->BulkSelection.deleteOne(host,row);remove.setOnMenuItemClickListener(i->{delete.run();return true;});actions.add(new Action(remove,delete));}MenuItem playlist=menu.add(0,18102,order,PanelUi.tr(host,"プレイリストに追加","Add to playlist","加入播放清單"));Runnable add=()->LocalPlaylists.addRow(host,row);playlist.setOnMenuItemClickListener(i->{add.run();return true;});actions.add(new Action(playlist,add));if(cacheList(host)){MenuItem retry=menu.add(0,18103,order+2,UiStrings.translate("キャッシュを再取得"));Runnable retrieve=()->CacheRetry.confirm(host,HistoryRules.id(value(row,"videourl")),value(row,"title"));retry.setOnMenuItemClickListener(i->{retrieve.run();return true;});actions.add(new Action(retry,retrieve));}MenuItem block=menu.add(0,18101,order+1,PanelUi.tr(host,"投稿者をNG","Block uploader","封鎖投稿者"));Runnable ng=()->ContentFilter.confirmOwner(host,owner);block.setOnMenuItemClickListener(i->{ng.run();return true;});actions.add(new Action(block,ng));}
 public static void show(Object listener,Object popup){try{List<Action> actions=ACTIONS.remove(popup);if(!LONG.contains(listener)||actions==null){popup.getClass().getMethod("a").invoke(popup);return;}Object adapter=get(listener,"e");Activity host=(Activity)get(adapter,"d");Context c=PlaybackSession.dialogContext(host);String title=String.valueOf(get(listener,"b"));if(activeHold!=null){heldPopup(host,title,actions,activeHold,adapter);return;}CharSequence[] labels=new CharSequence[actions.size()];for(int n=0;n<labels.length;n++)labels[n]=actions.get(n).title;AlertDialog dialog=UiDialogs.builder(c).setTitle(title).setItems(labels,(d,n)->{Action action=actions.get(n);if(action.enabled){if(action.id==18101||action.id==18102)action.run.run();else LocalPlaylists.withAdapterMode(host,adapter,action.run);}}).create();UiDialogs.show(dialog);}catch(Exception e){android.util.Log.w("nicoid-menu","Unable to display video actions",e);}}
 static boolean history(Activity host){try{int kind=host.getClass().getField("E").getInt(host);return kind==4||kind==8;}catch(Exception e){return false;}}
 static boolean cacheList(Activity host){return host!=null&&host.getClass().getName().equals("com.sauzask.nicoid.NicoidCacheManagerActivity");}
 public static void adjustHistoryMenu(Object object,Menu menu){try{
  Activity a=(Activity)object;android.content.SharedPreferences prefs=android.preference.PreferenceManager.getDefaultSharedPreferences(a);MenuItem continuous=menu.findItem(0x7f0f0201);if(continuous==null){MylistFollow190.menu(a,menu);return;}
  int type=a.getClass().getField("E").getInt(a);if(type==4)menu.removeItem(0x7f0f020a);if(type==8)menu.removeItem(0x7f0f020b);menu.removeItem(18120);menu.removeItem(18121);
  ArrayList<MenuItem> old=new ArrayList<>();for(int n=0;n<menu.size();n++)old.add(menu.getItem(n));
  old.sort((x,y)->Integer.compare(menuRank(x.getItemId()),menuRank(y.getItemId())));menu.clear();int order=0;
  for(MenuItem item:old){MenuItem copy=menu.add(item.getGroupId(),item.getItemId(),order++,item.getTitle());copy.setCheckable(item.isCheckable()).setChecked(item.isChecked()).setEnabled(item.isEnabled()).setVisible(item.isVisible());if(item.getIcon()!=null){copy.setIcon(item.getIcon());copy.setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM);}
   if(item.getItemId()==0x7f0f0201){boolean shuffle=prefs.getBoolean("continuous_play",false)&&prefs.getInt("continuous_play_mode",0)==2;copy.setChecked(!shuffle&&prefs.getBoolean("continuous_play",false));copy.setOnMenuItemClickListener(i->{playback(a,!i.isChecked(),false);return true;});MenuItem random=menu.add(0,18120,order++,UiStrings.translate("シャッフル再生"));random.setCheckable(true).setChecked(shuffle).setOnMenuItemClickListener(i->{playback(a,!i.isChecked(),true);return true;});}
  }
  if(type==4||type==8)historyHeader(a,0);themeHeader(a);MylistFollow190.menu(a,menu);
 }catch(Exception e){android.util.Log.w("nicoid-list","Unable to update list options",e);}}
 private static int menuRank(int id){return id==0x7f0f0201?0:id==1?1:id==0x7f0f0120?2:3;}
 public static boolean handleHistoryShuffle(Object object,MenuItem item){if(item.getItemId()!=18120)return false;try{playback((Activity)object,!item.isChecked(),true);}catch(Exception e){android.util.Log.w("nicoid-list","Unable to change playback mode",e);}return true;}
 private static void playback(Activity a,boolean enabled,boolean shuffle){try{android.preference.PreferenceManager.getDefaultSharedPreferences(a).edit().putBoolean("continuous_play",enabled).putInt("continuous_play_mode",shuffle?2:0).apply();Class<?> c=Class.forName("com.sauzask.nicoid.NicoidVideoListActivity");c.getField("I").setBoolean(null,enabled);c.getField("J").setInt(null,shuffle?2:0);a.invalidateOptionsMenu();}catch(Exception e){android.util.Log.w("nicoid-list","Unable to update playback mode",e);}}
 private static void themeHeader(Activity a){int id=a.getResources().getIdentifier("description","id",a.getPackageName());View description=id==0?null:a.findViewById(id);if(description instanceof TextView){description.setBackgroundColor(UiDialogs.surface(a));((TextView)description).setTextColor(ThemeChoice.textColor(description));}}
 private static final Map<ListView,java.lang.ref.WeakReference<Spinner>> HISTORY_HEADERS=new WeakHashMap<>();
 public static void historyLoaded(Object fragment){try{Activity a=(Activity)get(fragment,"o0");int type=(Integer)get(fragment,"h0");if(type!=4&&type!=8)return;historyHeader(a,fragment,0);sortHistory(fragment,android.preference.PreferenceManager.getDefaultSharedPreferences(a).getInt("history_sort_v2_"+type,0));}catch(Exception error){android.util.Log.w("nicoid-history","Unable to refresh sorted history",error);}}
 private static void historyHeader(Activity a,int attempt){try{historyHeader(a,get(a,"F"),attempt);}catch(Exception ignored){}}
 private static void historyHeader(Activity a,Object fragment,int attempt){MAIN.postDelayed(()->{if(a.isFinishing()||a.isDestroyed())return;try{int type=((Number)get(fragment,"g0")).intValue();if(type!=4&&type!=8)return;ListView list=(ListView)get(fragment,"b0");if(list==null)throw new IllegalStateException();java.lang.ref.WeakReference<Spinner> existing=HISTORY_HEADERS.get(list);if(existing!=null&&existing.get()!=null)return;Spinner control=new Spinner(a);control.setTag("nicoid_history_sort");control.setPadding(PanelUi.dp(a,8),0,PanelUi.dp(a,8),0);control.setAdapter(new ArrayAdapter<String>(a,android.R.layout.simple_spinner_dropdown_item,sortLabels(type==8)));control.setSelection(android.preference.PreferenceManager.getDefaultSharedPreferences(a).getInt("history_sort_v2_"+type,0));LinearLayout header=new LinearLayout(a);header.setPadding(PanelUi.dp(a,5),PanelUi.dp(a,5),PanelUi.dp(a,5),PanelUi.dp(a,5));header.addView(control,new LinearLayout.LayoutParams(-1,PanelUi.dp(a,42)));list.addHeaderView(header,null,false);HISTORY_HEADERS.put(list,new java.lang.ref.WeakReference<Spinner>(control));control.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> parent){}public void onItemSelected(AdapterView<?> parent,View view,int n,long id){if(view instanceof TextView)((TextView)view).setTextColor(ThemeChoice.textColor(view));android.preference.PreferenceManager.getDefaultSharedPreferences(a).edit().putInt("history_sort_v2_"+type,n).apply();sortHistory(fragment,n);}});}catch(Exception error){if(attempt<40)historyHeader(a,fragment,attempt+1);else android.util.Log.w("nicoid-history","Unable to install history sort header",error);}},attempt==0?0:50);}
 static String[] sortLabels(boolean local){String[] labels={"視聴日時が新しい順","視聴日時が古い順","新しい順","古い順","タイトル昇順","タイトル降順","再生数が多い順","再生数が少ない順","コメント数が多い順","コメント数が少ない順","マイリスト数が多い順","マイリスト数が少ない順","再生時間が長い順","再生時間が短い順"};for(int n=0;n<labels.length;n++)labels[n]=UiStrings.translate(labels[n]);return labels;}
 @SuppressWarnings("unchecked") private static void sortHistory(Object fragment,int mode){try{ArrayList<Object> rows=(ArrayList<Object>)get(fragment,"a0");Object adapter=get(fragment,"p0");sortRows(rows,Math.max(0,Math.min(13,mode)));ArrayList<Object> displayed=(ArrayList<Object>)get(adapter,"b");if(displayed!=rows){displayed.clear();displayed.addAll(rows);}((BaseAdapter)adapter).notifyDataSetChanged();}catch(Exception e){android.util.Log.w("nicoid-list","Unable to sort history",e);}}
 static void sortRows(List<Object> rows,int mode){final Map<Object,Integer> ordinal=new IdentityHashMap<>();final Map<Object,Long> values=new IdentityHashMap<>();final Map<Object,String> titles=new IdentityHashMap<>();for(int n=0;n<rows.size();n++){Object row=rows.get(n);ordinal.put(row,n);if(mode<2)values.put(row,HistorySupport.watched(row));else if(mode<4)values.put(row,HistorySupport.posted(row));else if(mode<6)titles.put(row,value(row,"title"));else if(mode<12){long[] counts=counts(row);values.put(row,counts[(mode-6)/2]);}else values.put(row,length(row));}Collections.sort(rows,(x,y)->{if(mode<4)return HistorySortRules.compare(values.get(x),values.get(y),ordinal.get(x),ordinal.get(y),mode%2==1);int compared;if(mode<6){compared=titles.get(x).compareToIgnoreCase(titles.get(y));if(mode==5)compared=-compared;}else{long first=values.get(x),second=values.get(y);if(first<0||second<0){if(first>=0)return -1;if(second>=0)return 1;return Integer.compare(ordinal.get(x),ordinal.get(y));}compared=mode%2==0?Long.compare(second,first):Long.compare(first,second);}return compared==0?Integer.compare(ordinal.get(x),ordinal.get(y)):compared;});}
 static long[] counts(Object row){String source=value(row,"videoinfo").replaceAll("<[^>]+>","");int newline=source.indexOf('\n');if(newline>=0)source=source.substring(0,newline);long[] parsed=VideoCountRules.parse(source);if(parsed!=null)return new long[]{parsed[0],parsed[1],parsed[3]};long[] result=new long[3];String[] keys={"rawplay","rawres","rawmylis"};for(int n=0;n<3;n++)try{result[n]=Long.parseLong(value(row,keys[n]).replace(",",""));}catch(Exception ignored){result[n]=-1;}return result;}
 static long length(Object row){try{long seconds=0;String[] parts=value(row,"length").split(":");if(parts.length<2||parts.length>3)return -1;for(String part:parts){long n=Long.parseLong(part);if(n<0)return -1;if(seconds>(Long.MAX_VALUE-n)/60)return -1;seconds=seconds*60+n;}return seconds;}catch(Exception ignored){return -1;}}
}
