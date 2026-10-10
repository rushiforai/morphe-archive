package e.e.a;

import android.app.*;
import android.content.*;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.util.*;

/** Shared in-list selection controls for saved lists and watch history. */
public final class BulkSelection {
 private BulkSelection() {}
 private static final Map<Object,java.lang.ref.WeakReference<Object>> OWNERS=new WeakHashMap<>();
 private static final Set<Object> BUSY=Collections.newSetFromMap(new IdentityHashMap<Object,Boolean>());
 static Object get(Object o,String name)throws Exception{return o.getClass().getField(name).get(o);}
 static boolean cache(Object o){return o.getClass().getName().equals("com.sauzask.nicoid.NicoidCacheManagerActivity");}
 static boolean selecting(Object o)throws Exception{return o.getClass().getField(cache(o)?"G":"k0").getBoolean(o);}
 static ArrayList<?> rows(Object o)throws Exception{return (ArrayList<?>)get(o,cache(o)?"z":"a0");}
 static Activity activity(Object o)throws Exception{return cache(o)?(Activity)o:(Activity)get(o,"o0");}
 static void set(Object row,boolean selected)throws Exception{row.getClass().getMethod("a",String.class,Object.class).invoke(row,"isselect",selected);}
 static boolean checked(Object row)throws Exception{return Boolean.TRUE.equals(row.getClass().getMethod("a",String.class).invoke(row,"isselect"));}
 static void refresh(Object o)throws Exception{((BaseAdapter)get(o,cache(o)?"C":"p0")).notifyDataSetChanged();o.getClass().getMethod("updateSelectionCount").invoke(o);updateCount(o);}
 static void toggleMode(Object o)throws Exception{o.getClass().getMethod(cache(o)?"s":"Y").invoke(o);}
 public static void modeChanged(Object o){
  try{
   if(selecting(o)){OWNERS.put(get(o,cache(o)?"C":"p0"),new java.lang.ref.WeakReference<>(o));install(o);}
   else for(Object row:rows(o))set(row,false);
   refresh(o);
  }catch(Exception e){log(e);}
 }
 static String countText(Context c,int count){return PanelUi.tr(c,"選択中："+count+"件","Selected: "+count,"已選取："+count+"項");}
 static TextView countLabel(Context c,int count){TextView label=PanelUi.text(c,countText(c,count),14);label.setGravity(Gravity.CENTER);return label;}
 static void updateCount(Object o)throws Exception {
  int count=0;for(Object row:rows(o))if(checked(row))count++;
  Object label=get(o,cache(o)?"S":"selectionCount");if(label instanceof TextView)((TextView)label).setText(countText(activity(o),count));
 }
 static Object owner(AdapterView<?> list){
  try{Object listener=list.getOnItemLongClickListener();if(listener==null)return null;String name=listener.getClass().getName();
   if(name.equals("com.sauzask.nicoid.NicoidCacheManagerActivity$c"))return get(listener,"a");
   if(name.equals("com.sauzask.nicoid.NicoidVideoListFragment$f")){Object f=get(listener,"a");int kind=f.getClass().getField("g0").getInt(f);int type=f.getClass().getField("h0").getInt(f);if(type==4||kind==5||kind==8||kind==9)return f;}
  }catch(Exception e){log(e);}return null;
 }
 static boolean enter(Object o,int position){
  if(o==null)return false;
  try{ArrayList<?> rows=rows(o);if(position<0||position>=rows.size())return false;
   if(!selecting(o)){for(Object row:rows)set(row,false);toggleMode(o);}
   OWNERS.put(get(o,cache(o)?"C":"p0"),new java.lang.ref.WeakReference<>(o));
   set(rows.get(position),true);install(o);refresh(o);return true;
  }catch(Exception e){log(e);return false;}
 }
 static void install(Object o)throws Exception {
  Activity a=activity(o);View root=cache(o)?(View)get(o,"y"):(View)get(o,"Z");
  LinearLayout all=(LinearLayout)root.findViewById(0x7f08019a),actions=(LinearLayout)root.findViewById(0x7f0801bd);
  if(all==null||actions==null)throw new IllegalStateException("Missing selection controls");
  LinearLayout footer=(LinearLayout)root.findViewById(0x7f0801be);
  // The native footer contains an anonymous empty layout used only as a green separator.
  for(int n=0;n<footer.getChildCount();n++){View child=footer.getChildAt(n);if(child.getId()==View.NO_ID&&child instanceof ViewGroup&&((ViewGroup)child).getChildCount()==0)child.setVisibility(View.GONE);}
  Field countField=o.getClass().getField(cache(o)?"S":"selectionCount");TextView previous=(TextView)countField.get(o);
  if(previous!=null&&previous.getParent() instanceof ViewGroup)((ViewGroup)previous.getParent()).removeView(previous);
  TextView label=countLabel(a,0);countField.set(o,label);footer.addView(label,0,new LinearLayout.LayoutParams(-1,-2));
  all.removeAllViews();actions.removeAllViews();
  button(all,PanelUi.tr(a,"全選択","Select all","全選"),()->selectAll(o,true));
  button(all,PanelUi.tr(a,"全解除","Clear all","取消全選"),()->selectAll(o,false));
  button(actions,PanelUi.tr(a,"削除","Delete","刪除"),()->confirmDelete(o));
  // Only account mylists have an account folder to move out of.
  if(!cache(o)&&o.getClass().getField("g0").getInt(o)==5&&o.getClass().getField("h0").getInt(o)!=4)
   button(actions,PanelUi.tr(a,"移動","Move","移動"),()->nativeClick(o,"com.sauzask.nicoid.NicoidVideoListFragment$j"));
  button(actions,PanelUi.tr(a,"完了","Done","完成"),()->done(o));
 }
 static void button(LinearLayout row,String text,Runnable action){Context c=row.getContext();Button b=PanelUi.button(c,text);b.setTextSize(12);b.setMinWidth(0);b.setMinimumWidth(0);b.setOnClickListener(v->action.run());row.addView(b,new LinearLayout.LayoutParams(0,PanelUi.dp(c,48),1));}
 static void selectAll(Object o,boolean value){try{for(Object row:rows(o))set(row,value);refresh(o);}catch(Exception e){log(e);}}
 static void done(Object o){try{selectAll(o,false);if(selecting(o))toggleMode(o);refresh(o);}catch(Exception e){log(e);}}
 static void nativeClick(Object o,String type){try{((View.OnClickListener)Class.forName(type).getConstructor(o.getClass()).newInstance(o)).onClick(null);}catch(Exception e){log(e);}}
 static void confirmDelete(Object o){
  try{Activity a=activity(o);ArrayList<Object> selected=new ArrayList<>();for(Object row:rows(o))if(checked(row))selected.add(row);if(selected.isEmpty())return;
   UiDialogs.show(new AlertDialog.Builder(PlaybackSession.dialogContext(a)).setTitle(PanelUi.tr(a,"選択した動画を削除しますか？","Remove selected videos?","刪除所選影片？")).setMessage(Integer.toString(selected.size()))
    .setPositiveButton(PanelUi.tr(a,"削除","Delete","刪除"),(d,w)->delete(o,selected)).setNegativeButton(PanelUi.tr(a,"キャンセル","Cancel","取消"),null).create());
  }catch(Exception e){log(e);}
 }
 static void delete(Object o,ArrayList<Object> selected){
  try{
   if(!cache(o)&&o.getClass().getField("h0").getInt(o)==4){deleteAccountHistory(o,selected);return;}
   String type=cache(o)?"e.e.a.i":"e.e.a.z1";
   if(!cache(o)&&o.getClass().getField("g0").getInt(o)==8){
    ArrayList<?> rows=rows(o);boolean[] flags=new boolean[rows.size()];for(int n=0;n<flags.length;n++)flags[n]=selected.contains(rows.get(n));
    ((DialogInterface.OnClickListener)Class.forName("com.sauzask.nicoid.LocalHistoryBulkDelete").getConstructor(o.getClass(),boolean[].class).newInstance(o,flags)).onClick(null,-1);
   }else ((DialogInterface.OnClickListener)Class.forName(type).getConstructor(o.getClass(),ArrayList.class).newInstance(o,selected)).onClick(null,-1);
  }catch(Exception e){log(e);try{Toast.makeText(activity(o),PanelUi.tr(activity(o),"削除に失敗しました","Unable to delete","刪除失敗"),1).show();}catch(Exception ignored){}}
 }
 static void deleteAccountHistory(Object o,ArrayList<Object> selected)throws Exception {
  Activity a=activity(o);Object adapter=get(o,"p0");ArrayList<?> current=rows(o);if(!BUSY.add(o))return;
  new Thread(()->{ArrayList<Object> removed=new ArrayList<>();try{
    Method request=Class.forName("e.e.a.v0").getMethod("b",Context.class,String.class,Class.forName("org.apache.http.client.CookieStore"));
    Method status=Class.forName("org.apache.http.HttpResponse").getMethod("getStatusLine");Method code=Class.forName("org.apache.http.StatusLine").getMethod("getStatusCode");
    for(Object row:selected){String id=HistoryRules.id(ListActions.value(row,"videourl"));if(id.isEmpty())continue;
     Object response=request.invoke(null,a,"https://nvapi.nicovideo.jp/v1/users/me/watch/history?target="+android.net.Uri.encode(id),null);
     if(response!=null){int value=((Number)code.invoke(status.invoke(response))).intValue();if(value>=200&&value<300)removed.add(row);}
    }
   }catch(Exception e){log(e);}
   a.runOnUiThread(()->{BUSY.remove(o);current.removeAll(removed);((BaseAdapter)adapter).notifyDataSetChanged();done(o);if(removed.size()!=selected.size())Toast.makeText(a,PanelUi.tr(a,"一部の履歴を削除できませんでした","Some history entries could not be deleted","部分紀錄無法刪除"),1).show();});
  },"nicoid-history-delete").start();
 }
 static boolean bind(View view,Object adapter,Object row){
  java.lang.ref.WeakReference<Object> reference=OWNERS.get(adapter);Object o=reference==null?null:reference.get();if(o==null)return false;
  try{if(!selecting(o))return false;boolean checked=checked(row);view.setOnTouchListener(null);view.setOnLongClickListener(null);view.setLongClickable(false);
   view.setBackgroundColor(checked?(UiDialogs.accent(view.getContext())&0xffffff)|0x33000000:Color.TRANSPARENT);
   view.getOverlay().clear();SelectionMark mark=new SelectionMark(view.getContext(),checked);Runnable draw=()->{int size=PanelUi.dp(view.getContext(),40);mark.setBounds(view.getWidth()-size,0,view.getWidth(),size);};draw.run();view.post(draw);view.getOverlay().add(mark);
   view.setOnClickListener(v->{try{set(row,!checked(row));refresh(o);}catch(Exception e){log(e);}});return true;
  }catch(Exception e){log(e);return false;}
 }
 static final class SelectionMark extends Drawable {
  final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);final String label;
  SelectionMark(Context c,boolean checked){label=checked?"✓":"□";paint.setColor(UiDialogs.accent(c));paint.setTextSize(PanelUi.dp(c,22));paint.setTextAlign(Paint.Align.CENTER);}
  public void draw(Canvas canvas){Rect b=getBounds();canvas.drawText(label,b.centerX(),b.top+paint.getTextSize(),paint);}
  public void setAlpha(int alpha){paint.setAlpha(alpha);}public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
 }
 static void log(Exception e){android.util.Log.w("nicoid-selection","Selection operation failed",e);}
}
