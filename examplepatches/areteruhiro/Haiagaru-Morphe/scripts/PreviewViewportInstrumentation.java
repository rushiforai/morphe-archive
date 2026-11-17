package app.haiagaru.tests.previewviewport;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.widget.*;import java.lang.reflect.*;import java.util.concurrent.*;

/** Real ListView and 242's native RecyclerView, delayed text/thumbnail sizes and footer rows. */
public final class PreviewViewportInstrumentation extends Instrumentation {
 public static final class Fragment {final View view;Fragment(View view){this.view=view;}public View getView(){return view;}}
 int checks;Activity host;Dialog dialog;ViewGroup list;Object adapter;Class<?> position;int[] heights=new int[60];boolean recycler;boolean had;boolean enabled;SharedPreferences prefs;
 void ok(boolean v,String why){if(!v)throw new AssertionError(why);checks++;}
 Method method(Class<?> c,String name,Class<?>...p)throws Exception{Method m=c.getDeclaredMethod(name,p);m.setAccessible(true);return m;}
 Object call(Object target,String name,Class<?>[] types,Object...args)throws Exception{return target.getClass().getMethod(name,types).invoke(target,args);}
 Object stat(String name,Class<?>[] types,Object...args)throws Exception{return method(position,name,types).invoke(null,args);}
 <T>T main(Callable<T> action)throws Exception{FutureTask<T> f=new FutureTask<>(action);runOnMainSync(f);return f.get(10,TimeUnit.SECONDS);}
 void pause()throws Exception{Thread.sleep(280);waitForIdleSync();}
 void notifyRows()throws Exception{if(adapter instanceof BaseAdapter)((BaseAdapter)adapter).notifyDataSetChanged();else call(adapter,"notifyDataSetChanged",new Class<?>[0]);}
 int index(View child)throws Exception{return recycler?(Integer)call(list,"getChildAdapterPosition",new Class<?>[]{View.class},child):((ListView)list).getPositionForView(child);}
 View child(int row)throws Exception{for(int i=0;i<list.getChildCount();i++)if(index(list.getChildAt(i))==row)return list.getChildAt(i);return null;}
 int first()throws Exception{for(int i=0;i<list.getChildCount();i++)if(list.getChildAt(i).getBottom()>list.getPaddingTop())return index(list.getChildAt(i));return -1;}
 void select(int row,int offset)throws Exception{
  stat("cancel",new Class<?>[]{View.class},list);
  if(!recycler)((ListView)list).setSelectionFromTop(row,offset);else{Object manager=call(list,"getLayoutManager",new Class<?>[0]);call(list,"scrollToPosition",new Class<?>[]{int.class},row);Field f=manager.getClass().getSuperclass().getDeclaredField("k");f.setAccessible(true);f.setInt(manager,offset);list.requestLayout();}
 }
 void setup(boolean useRecycler,int padding)throws Exception{
  main(()->{
   if(dialog!=null)dialog.dismiss();recycler=useRecycler;java.util.Arrays.fill(heights,100);
   dialog=new Dialog(host);
   if(useRecycler){
    ClassLoader loader=getTargetContext().getClassLoader();Class<?> type=loader.loadClass("androidx.recyclerview.widget.RecyclerView");list=(ViewGroup)type.getConstructor(Context.class).newInstance(host);
    Object manager=loader.loadClass("jp.syoboi.a2chMate.view.MyLinearLayoutManager").getConstructor(Context.class).newInstance(host);
    for(Method m:type.getMethods())if(m.getName().equals("setLayoutManager")&&m.getParameterTypes().length==1)m.invoke(list,manager);
    adapter=Class.forName("app.haiagaru.tests.previewviewport.PreviewRecyclerAdapter").getConstructor(int[].class).newInstance((Object)heights);
    for(Method m:type.getMethods())if(m.getName().equals("setAdapter")&&m.getParameterTypes().length==1)m.invoke(list,adapter);
   }else{
    list=new ListView(host);adapter=new BaseAdapter(){public int getCount(){return heights.length;}public Object getItem(int p){return p;}public long getItemId(int p){return p;}public View getView(int p,View reused,ViewGroup parent){TextView v=reused instanceof TextView?(TextView)reused:new TextView(host);v.setText(p==59?"おわり":p==30?"ここまで読んだ":"レス "+p);v.setLayoutParams(new AbsListView.LayoutParams(-1,heights[p]));return v;}};((ListView)list).setAdapter((BaseAdapter)adapter);
   }
   list.setPadding(0,18,0,padding);list.setClipToPadding(true);dialog.setContentView(list);dialog.show();dialog.getWindow().setLayout(680,760);dialog.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);if(Build.VERSION.SDK_INT>=27){dialog.getWindow().getDecorView().setKeepScreenOn(true);}
   stat("opening",new Class<?>[]{View.class},list);return null;
  });pause();
 }
 void change(int row,int height,String writer)throws Exception{
  View body=child(row);ok(body!=null,"resize target attached "+row);
  Class<?> type=getTargetContext().getClassLoader().loadClass("app.morphe.extension.chmate."+writer);
  method(type,writer.equals("SiteCards")?"write":"setText",TextView.class,CharSequence.class).invoke(null,body,"リンクカード\n非同期の読み込みが完了しました");
  heights[row]=height;ViewGroup.LayoutParams params=body.getLayoutParams();params.height=height;body.setLayoutParams(params);
 }
 void exercise(boolean useRecycler,int padding)throws Exception{
  setup(useRecycler,padding);
  main(()->{select(30,-22);return null;});pause();
  final int[] anchor=main(()->new int[]{first(),child(first()).getTop()});
  main(()->{stat("opening",new Class<?>[]{View.class},list);change(anchor[0],440,"SiteCards");ok((Boolean)stat("pending",new Class<?>[]{View.class},list),"first visible card anchors immediately after open");return null;});pause();
  main(()->{ok(first()==anchor[0]&&Math.abs(child(anchor[0]).getTop()-anchor[1])<=1,"unread/header position retained after card expansion");return null;});
  main(()->{select(20,-13);return null;});pause();final int[] middle=main(()->new int[]{first(),child(first()).getTop()});
  final boolean[] guarding={true};final int[] frames={0,0};
  main(()->{
   list.getViewTreeObserver().addOnDrawListener(()->{if(guarding[0])try{frames[0]++;View first=child(middle[0]);if(first==null||Math.abs(first.getTop()-middle[1])>1)frames[1]++;}catch(Exception e){frames[1]++;}});
   change(middle[0]+1,410,"XPostPreview");Object before=((java.util.Map<?,?>)field(position,"PENDING").get(null)).get(list);
   stat("beforeListChange",new Class<?>[]{View.class},list);Object after=((java.util.Map<?,?>)field(position,"PENDING").get(null)).get(list);ok(before==after,"link and thumbnail updates share one anchor");notifyRows();return null;
  });pause();
  main(()->{guarding[0]=false;ok(first()==middle[0]&&Math.abs(child(middle[0]).getTop()-middle[1])<=1,"middle card stays at original position");ok(frames[0]>0&&frames[1]==0,"no displaced frame drawn during async relayout: "+frames[1]+"/"+frames[0]+" recycler="+recycler+" padding="+padding);return null;});
  main(()->{select(59,0);return null;});pause();
  main(()->{ok(!list.canScrollVertically(1),"initial footer at end");change(58,480,"SiteCards");return null;});pause();
  main(()->{View footer=child(59);ok(footer!=null&&Math.abs(footer.getBottom()-(list.getHeight()-padding))<=1,"end footer pinned above applied bottom inset "+padding);return null;});
  Thread.sleep(650);
  main(()->{change(59,1100,"XPostPreview");return null;});pause();
  main(()->{View footer=child(59);ok(footer!=null&&Math.abs(footer.getBottom()-(list.getHeight()-padding))<=1,"late card taller than viewport retains bottom");return null;});
  main(()->{select(20,-9);return null;});pause();
  main(()->{View body=child(21);stat("beforeChange",new Class<?>[]{View.class},body);MotionEvent event=MotionEvent.obtain(0,0,MotionEvent.ACTION_DOWN,1,1,0);stat("onTouch",new Class<?>[]{View.class,MotionEvent.class},body,event);event.recycle();ok(!(Boolean)stat("pending",new Class<?>[]{View.class},list),"user touch cancels pending resize");select(10,-4);return null;});pause();
  main(()->{View target=child(10);ok(first()==10&&target!=null&&Math.abs(target.getTop()-(list.getPaddingTop()-4))<=1,"user navigation wins: first="+first()+" targetTop="+(target==null?"absent":target.getTop())+" padding="+list.getPaddingTop());stat("opening",new Class<?>[]{View.class},list);prefs.edit().putBoolean("previewScrollPositionRetention",false).commit();stat("beforeChange",new Class<?>[]{View.class},child(11));ok(!(Boolean)stat("pending",new Class<?>[]{View.class},list),"disabled retention stays disabled");prefs.edit().putBoolean("previewScrollPositionRetention",true).commit();return null;});
  if(!recycler)main(()->{
   stat("beforeChange",new Class<?>[]{View.class},child(11));ok((Boolean)stat("pending",new Class<?>[]{View.class},list),"preview pending before filter");
   Class<?> filter=getTargetContext().getClassLoader().loadClass("app.morphe.extension.chmate.FilterPosition");method(filter,"beforeFragment",Object.class,boolean.class).invoke(null,new Fragment(list),true);
   ok(!(Boolean)stat("pending",new Class<?>[]{View.class},list),"filter navigation cancels preview anchor");stat("beforeChange",new Class<?>[]{View.class},child(11));ok(!(Boolean)stat("pending",new Class<?>[]{View.class},list),"preview yields while filter is pending");
   Object pending=((java.util.Map<?,?>)field(filter,"pending").get(null)).get(list);ok(pending!=null,"real filter observer registered");method(pending.getClass(),"close").invoke(pending);return null;
  });
  main(()->{
   Class<?> reading=getTargetContext().getClassLoader().loadClass("app.morphe.extension.chmate.ReadingPosition"),sessionType=getTargetContext().getClassLoader().loadClass("app.morphe.extension.chmate.ReadingPosition$Session"),anchorType=getTargetContext().getClassLoader().loadClass("app.morphe.extension.chmate.ReadingPosition$Anchor");
   Constructor<?> constructor=sessionType.getDeclaredConstructor(Object.class,Activity.class,View.class);constructor.setAccessible(true);Object key=new Fragment(list),session=constructor.newInstance(key,host,list);java.util.Map<Object,Object> sessions=(java.util.Map<Object,Object>)field(reading,"SESSIONS").get(null);sessions.put(key,session);
   try{
    field(sessionType,"restoring").setBoolean(session,true);stat("beforeChange",new Class<?>[]{View.class},child(11));ok(!(Boolean)stat("pending",new Class<?>[]{View.class},list),"native unread restoration takes priority");field(sessionType,"restoring").setBoolean(session,false);
    Constructor<?> a=anchorType.getDeclaredConstructor(String.class,String.class,boolean.class,int.class,int.class,Object.class);a.setAccessible(true);Object old=a.newInstance("fixture","https://example.invalid/fixture/",false,10,-4,adapter);field(sessionType,"coldPreview").set(session,old);field(sessionType,"openingAnchor").set(session,old);
    method(reading,"beforeMediaRefresh",View.class).invoke(null,list);ok((Boolean)stat("pending",new Class<?>[]{View.class},list),"real media refresh uses shared viewport anchor");ok(field(sessionType,"coldPreview").get(session)==null&&field(sessionType,"openingAnchor").get(session)==null,"completed opening recovery hands off to async viewport owner");stat("cancel",new Class<?>[]{View.class},list);
   }finally{sessions.remove(key);method(sessionType,"close").invoke(session);}return null;
  });
 }
 Field field(Class<?> c,String n)throws Exception{Field f=c.getDeclaredField(n);f.setAccessible(true);return f;}
 public void onCreate(Bundle args){super.onCreate(args);start();}
 public void onStart(){Bundle result=new Bundle();try{
  Context app=getTargetContext();ok(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated reporter only");position=app.getClassLoader().loadClass("app.morphe.extension.chmate.XPostPreviewPosition");
  Class<?> options=app.getClassLoader().loadClass("app.morphe.extension.chmate.WacchoiSearchOptions");String pref=(String)field(options,"PREFS").get(null);prefs=app.getSharedPreferences(pref,0);had=prefs.contains("previewScrollPositionRetention");enabled=prefs.getBoolean("previewScrollPositionRetention",true);prefs.edit().putBoolean("previewScrollPositionRetention",true).commit();
  host=startActivitySync(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));main(()->{host.setShowWhenLocked(true);host.setTurnScreenOn(true);return null;});
  exercise(false,0);exercise(false,96);if(app.getPackageName().endsWith("242")){exercise(true,0);exercise(true,96);}
  result.putString("result","PASS "+checks+" real viewport/footer/async-resize checks");finish(Activity.RESULT_OK,result);
 }catch(Throwable e){result.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}finally{try{main(()->{if(list!=null)stat("cancel",new Class<?>[]{View.class},list);if(dialog!=null)dialog.dismiss();if(host!=null)host.finish();return null;});}catch(Exception ignored){}if(prefs!=null){SharedPreferences.Editor edit=prefs.edit();if(had)edit.putBoolean("previewScrollPositionRetention",enabled);else edit.remove("previewScrollPositionRetention");edit.commit();}}}
}
