package fixtures.availability;

import bv.c;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicInteger;
import w4.*;

/** Fake only external page delivery. Owned paging and native coroutine/page classes are real DEX. */
public final class AvailabilityPaging {
 static int checks;
 static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS "+why);}
 static Object unsafe;static Method allocate;
 static Object model(String name)throws Exception{return allocate.invoke(unsafe,Class.forName("com.bedrockstreaming.component.layout.domain.core.model."+name));}
 static void set(Object object,String name,Object value)throws Exception{Field f=object.getClass().getDeclaredField(name);f.setAccessible(true);f.set(object,value);}
 static Object item(boolean locked)throws Exception{
  Object target=model("Target$App$Play");if(locked){Object wrapper=model("Target$Lock$RequireSubscriptionLock");set(wrapper,"O",target);target=wrapper;}
  Object action=model("Action");set(action,"P",target);Object item=model("ClassicItem");set(item,"N",action);return item;
 }
 static final class Completion implements Zu.d {
  int count;Object result;public Zu.i getContext(){return Zu.j.N;}
  public void resumeWith(Object value){count++;result=value;}
 }
 static final class Caller extends c {
  Caller(Zu.d completion){super(completion);}public Object invokeSuspend(Object value){jq.g.U(value);return value;}
 }
 static final class Source extends W1 {
  final Map<Object,Object> pages=new HashMap<>();final List<Object> keys=new ArrayList<>();
  Object suspendKey; c pending;Zu.i context;
  public Object b(X1 state){return Integer.valueOf(999);}
  public Object d(W1$a params,c continuation){
   Object key=params.a();keys.add(key);context=continuation.getContext();
   if(Objects.equals(key,suspendKey)){pending=continuation;return av.a.N;}
   Object page=pages.get(key);if(page==null)throw new AssertionError("Unexpected raw key "+key);return page;
  }
 }
 static W1 wrapped(Source source)throws Exception{
  try{return (W1)Class.forName("patches.videoland.FilteredSource").getConstructor(W1.class).newInstance(source);}
  catch(ClassNotFoundException missing){throw new AssertionError("Filtered paging source missing",missing);}
 }
 static W1$b$c page(Object item,Object previous,Object next){return new W1$b$c(Collections.singletonList(item),previous,next,100,100);}
 static Object load(W1 source,W1$a params,Completion done){return source.d(params,new Caller(done));}
 public static int run()throws Exception{
  Class<?> u=Class.forName("sun.misc.Unsafe");Field f=u.getDeclaredField("theUnsafe");f.setAccessible(true);unsafe=f.get(null);allocate=u.getMethod("allocateInstance",Class.class);
  Object blocked=item(true),available=item(false);Source raw=new Source();
  raw.pages.put(1,page(blocked,null,2));raw.pages.put(2,page(available,1,3));Completion done=new Completion();W1 visible=wrapped(raw);
  W1$b$c result=(W1$b$c)load(visible,new W1$a$d(1,10,false),done);
  check(raw.keys.equals(Arrays.asList(1,2)),"refresh follows raw keys through a wholly filtered page");
  check(result.N.size()==1&&result.N.get(0)==available&&result.O==null&&Integer.valueOf(3).equals(result.P),"refresh retains identity and spanning keys");
  check(result.Q==Integer.MIN_VALUE&&result.R==Integer.MIN_VALUE,"compact page does not retain raw placeholder counts");
  check(done.count==0&&raw.context==done.getContext(),"immediate result preserves caller context without resuming it");
  check(visible.b(null)==null,"refresh restarts without treating visible positions as raw offsets");
  raw=new Source();raw.pages.put(20,page(blocked,0,40));raw.pages.put(40,page(available,20,60));
  result=(W1$b$c)load(wrapped(raw),new W1$a$a(20,10,false),new Completion());
  check(raw.keys.equals(Arrays.asList(20,40))&&Integer.valueOf(0).equals(result.O)&&Integer.valueOf(60).equals(result.P),"append keeps original raw range keys");
  raw=new Source();raw.pages.put(40,page(blocked,20,60));raw.pages.put(20,page(available,0,40));
  result=(W1$b$c)load(wrapped(raw),new W1$a$c(40,10,false),new Completion());
  check(raw.keys.equals(Arrays.asList(40,20))&&Integer.valueOf(0).equals(result.O)&&Integer.valueOf(60).equals(result.P),"prepend follows previous raw keys");
  raw=new Source();raw.suspendKey=1;raw.pages.put(2,page(available,1,null));done=new Completion();visible=wrapped(raw);
  check(load(visible,new W1$a$d(1,10,false),done)==av.a.N,"asynchronous source retains suspension marker");
  raw.pending.resumeWith(page(blocked,null,2));
  check(done.count==1&&((W1$b$c)done.result).N.get(0)==available&&raw.keys.equals(Arrays.asList(1,2)),"asynchronous filtered page completes exactly once after later data");
  raw=new Source();raw.suspendKey=1;done=new Completion();visible=wrapped(raw);load(visible,new W1$a$d(1,10,false),done);
  CancellationException cancel=new CancellationException("fixture");Object failure=Class.forName("Vu.q").getConstructor(Throwable.class).newInstance(cancel);raw.pending.resumeWith(failure);
  Field cause=done.result.getClass().getDeclaredField("N");cause.setAccessible(true);
  check(done.count==1&&cause.get(done.result)==cancel,"cancellation retains original failure identity");
  raw=new Source();raw.pages.put(1,page(blocked,null,1));Object cycle=load(wrapped(raw),new W1$a$d(1,10,false),new Completion());
  check(cycle instanceof W1$b$a&&((W1$b$a)cycle).N instanceof IllegalStateException&&raw.keys.size()==1,"non-progressing raw key becomes an error rather than a false end");
  raw=new Source();Object backend=new W1$b$a(new IllegalArgumentException("fixture backend"));raw.pages.put(1,backend);
  check(load(wrapped(raw),new W1$a$d(1,10,false),new Completion())==backend,"native backend error result preserved");
  raw=new Source();Object invalid=new W1$b$b();raw.pages.put(1,invalid);
  check(load(wrapped(raw),new W1$a$d(1,10,false),new Completion())==invalid,"native invalid result preserved");
  raw=new Source();raw.pages.put(1,page(blocked,null,2));raw.pages.put(2,page(blocked,1,null));
  result=(W1$b$c)load(wrapped(raw),new W1$a$d(1,10,false),new Completion());
  check(result.N.isEmpty()&&result.O==null&&result.P==null&&raw.keys.equals(Arrays.asList(1,2)),"genuine exhausted chain returns empty only after all raw pages");
  raw=new Source();visible=wrapped(raw);AtomicInteger notices=new AtomicInteger();visible.a.b((jv.a)()->{notices.incrementAndGet();return Vu.M.a;});raw.c();
  check(notices.get()==1,"raw invalidation reaches visible source once");
  raw=new Source();visible=wrapped(raw);notices.set(0);raw.a.b((jv.a)()->{notices.incrementAndGet();return Vu.M.a;});visible.c();
  check(notices.get()==1,"visible invalidation reaches raw source once");
  newer(blocked,available);
  CoverButtons.run();
  legacy(blocked,available);
  rows(blocked,available);
  return checks;
 }

 static void newer(Object blocked,Object available)throws Exception{
  Class<?> paramsType=Class.forName("a8.b"),getType=Class.forName("com.bedrockstreaming.component.layout.domain.usecase.GetBlockUseCase");
  Object params=paramsType.getConstructor(String.class,String.class,String.class,String.class,List.class,int.class,int.class,boolean.class,Integer.class)
   .newInstance("fixture","programme","fixture","fixture",Arrays.asList(blocked,available),10,2,false,null);
  Object getBlock=allocate.invoke(unsafe,getType); // No dependencies: any backend call would fail this fixture.
  Object nativeFactory=Class.forName("com.bedrockstreaming.component.layout.paging3.DefaultItemsPagerFactory").getConstructor(getType).newInstance(getBlock);
  jv.a factory=(jv.a)Class.forName("V.s").getConstructor(Object.class,int.class,Object.class).newInstance(params,15,nativeFactory);
  Method project=Class.forName("patches.videoland.Availability").getMethod("visibleFactory",Class.forName("com.bedrockstreaming.component.layout.domain.core.model.Block"),jv.a.class);
  jv.a visible=(jv.a)project.invoke(null,collectionBlock(),factory);W1 source=(W1)visible.invoke();
  W1$b$c page=(W1$b$c)load(source,new W1$a$d(1,10,false),new Completion());
  check(page.N.size()==1&&page.N.get(0)==available&&page.P==null,"newer factory filters actual native source seed without network work");
  check(project.invoke(null,model("Block$LayoutBlock"),factory)==factory,"newer structural source factory remains original");
 }
 static int rowCount(Object row)throws Exception{
  try{return (Integer)Class.forName("patches.videoland.Availability").getMethod("rowCount",Class.forName("Qk.t")).invoke(null,row);}
  catch(NoSuchMethodException missing){throw new AssertionError("Exhausted row projection missing",missing);}
 }
 static final class PlainAdapter extends androidx.recyclerview.widget.RecyclerView$a {
  int count=1;@Override public int c(){return count;}
 }
 static boolean sectionChanged(Object parent,int index)throws Exception{
  Object observer=Class.forName("Nk.a$b").getConstructor(Class.forName("Nk.a"),int.class).newInstance(parent,index);
  return (Boolean)Class.forName("patches.videoland.Availability").getMethod("sectionsChanged",Class.forName("Nk.a$b")).invoke(null,observer);
 }
 static final class AdapterObserver extends androidx.recyclerview.widget.RecyclerView$b {
  int count;Thread thread;@Override public void a(){count++;thread=Thread.currentThread();}
 }
 static final List<Object> retainedRows=new ArrayList<>();
 static Object row(Object block,A1 list)throws Exception{
  Object model=allocate.invoke(unsafe,Class.forName("d8.a"));set(model,"N",block);set(model,"O",list);
  Object row=allocate.invoke(unsafe,Class.forName("Qk.t"));set(row,"Q",model);
  Object adapterObservable=allocate.invoke(unsafe,Class.forName("androidx.recyclerview.widget.I"));Field listeners=android.database.Observable.class.getDeclaredField("mObservers");listeners.setAccessible(true);listeners.set(adapterObservable,new ArrayList<>());
  Field observable=row.getClass().getSuperclass().getDeclaredField("N");observable.setAccessible(true);observable.set(row,adapterObservable);
  retainedRows.add(row);return row;
 }
 static void rows(Object blocked,Object available)throws Exception{
  if(android.os.Looper.getMainLooper()==null)android.os.Looper.prepareMainLooper();
  emptySeedHeaders(available);
  Object block=collectionBlock();Source raw=new Source();H original=nativeList(raw,page(blocked,null,null));A1 visible=project(block,original);
  check(rowCount(row(block,visible))==0,"exhausted empty collection collapses its outer row");
  raw=new Source();raw.suspendKey=20;original=nativeList(raw,page(blocked,null,20));visible=project(block,original);Object pendingRow=row(block,visible);
  check(rowCount(pendingRow)==1,"pending empty collection retains its loading row");
  AdapterObserver observer=new AdapterObserver();pendingRow.getClass().getMethod("u",Class.forName("androidx.recyclerview.widget.RecyclerView$b")).invoke(pendingRow,observer);
  raw.pending.resumeWith(page(blocked,0,null));
  check(rowCount(pendingRow)==0,"last filtered page exhausts and collapses pending row");
  raw=new Source();raw.suspendKey=20;original=nativeList(raw,page(blocked,null,20));visible=project(block,original);pendingRow=row(block,visible);rowCount(pendingRow);
  raw.pending.resumeWith(page(available,0,null));
  check(rowCount(pendingRow)==1&&visible.size()==1,"last available page retains row through native publication");
  check(rowCount(row(model("Block$LayoutBlock"),visible))==1,"structural and unknown templates keep their outer row");
  Object replacement=row(block,project(block,nativeList(new Source(),page(blocked,null,null))));
  set(replacement,"Q",Class.forName("Qk.t").getDeclaredField("Q").get(pendingRow));
  check(rowCount(replacement)==1,"replaced row reads current model rather than stale exhaustion");
  Source delayed=new Source();delayed.suspendKey=20;A1 emptyPending=project(block,nativeList(delayed,page(blocked,null,20)));
  Object section=row(block,emptyPending),leaf=combined(section),sibling=row(block,project(block,nativeList(new Source(),page(available,null,null)))),root=combined(leaf,sibling);
  AdapterObserver rootObserver=new AdapterObserver();root.getClass().getMethod("u",Class.forName("androidx.recyclerview.widget.RecyclerView$b")).invoke(root,rootObserver);
  check(nativeCount(root)==2,"native nested section adapter caches pending row and available sibling");
  delayed.pending.resumeWith(page(blocked,0,null));
  Field canQuit=android.os.MessageQueue.class.getDeclaredField("mQuitAllowed");canQuit.setAccessible(true);canQuit.setBoolean(android.os.Looper.myQueue(),true);
  new android.os.Handler(android.os.Looper.getMainLooper()).post(()->android.os.Looper.getMainLooper().quit());android.os.Looper.loop();
  check(observer.count==1&&observer.thread==Thread.currentThread(),"exhausted row posts a coalesced native adapter notification on UI looper");
  check(nativeCount(leaf)==0&&nativeCount(root)==1,"native nested parent removes exhausted season from cached item count");
  Object slots=Class.forName("Nk.a").getField("S").get(root);check(Class.forName("Nk.a$a").getField("c").getInt(Array.get(slots,1))==0,"native sibling offset follows removed season header");
  set(section,"Q",Class.forName("Qk.t").getField("Q").get(sibling));section.getClass().getMethod("f").invoke(section);
  check(nativeCount(leaf)==1&&nativeCount(root)==2,"native nested parent restores season when available model replaces it");
  check(!sectionChanged(root,0),"unchanged section count retains native range update");
  Object uninitialized=combined(sibling);check(!sectionChanged(uninitialized,0),"uninitialized parent cache retains native initialization path");
  PlainAdapter unrelated=new PlainAdapter();Object untouched=combined(unrelated);nativeCount(untouched);unrelated.count=0;
  check(!sectionChanged(untouched,0),"unrelated adapter count change retains original notification behavior");
 }

 static void emptySeedHeaders(Object available)throws Exception{
  Class<?> paramsType=Class.forName("a8.b");Object params=paramsType.getConstructor(String.class,String.class,String.class,String.class,List.class,int.class,int.class,boolean.class,Integer.class)
   .newInstance("fixture","programme","fixture","season",Collections.emptyList(),10,40,true,1);
  Object factory=allocate.invoke(unsafe,Class.forName("c8.e"));Object missing=factory.getClass().getMethod("a",paramsType).invoke(factory,params);
  check(missing==null,"native empty paginated seed creates no source despite next-page metadata");
  Object block=collectionBlock(),content=model("LayoutBlockContent");set(content,"Q",Collections.emptyList());
  set(content,"R",Class.forName("com.bedrockstreaming.component.layout.domain.core.model.ItemPagination").getConstructor(int.class,Integer.class,int.class).newInstance(10,1,40));set(block,"U",content);
  check(rowCount(row(block,(A1)missing))==0,"season header without episodes or a native pager is omitted despite next marker");
  set(content,"Q",Collections.singletonList(available));check(rowCount(row(block,null))==1,"materialized available season without pager retains its header");
  set(block,"U",null);check(rowCount(row(block,null))==1,"unknown season content without pager remains visible");
 }

 static Object combined(Object... children)throws Exception{
  Class<?> adapter=Class.forName("androidx.recyclerview.widget.RecyclerView$a");Object array=Array.newInstance(adapter,children.length);
  for(int i=0;i<children.length;i++)Array.set(array,i,children[i]);
  return Class.forName("Nk.a").getConstructor(array.getClass()).newInstance(new Object[]{array});
 }
 static int nativeCount(Object adapter)throws Exception{return (Integer)adapter.getClass().getMethod("c").invoke(adapter);}
 static A1 project(Object block,A1 raw)throws Exception{
  try{return (A1)Class.forName("patches.videoland.Availability").getMethod("visiblePager",Class.forName("com.bedrockstreaming.component.layout.domain.core.model.Block"),A1.class).invoke(null,block,raw);}
  catch(NoSuchMethodException missing){throw new AssertionError("Legacy paging projection missing",missing);}
 }
 static Object collectionBlock()throws Exception{
  Object block=model("Block$LayoutBlock");Field template=Class.forName("com.bedrockstreaming.component.layout.domain.core.model.Block").getDeclaredField("P");template.setAccessible(true);
  template.set(block,Class.forName("com.bedrockstreaming.component.layout.domain.core.model.BlockTemplateId").getField("V").get(null));return block;
 }
 static H nativeList(Source source,W1$b$c seed)throws Exception{
  A1$b builder=new A1$b(source,seed,new A1$e(10,3,true,10,Integer.MAX_VALUE));
  Bv.x dispatcher=(Bv.x)Class.forName("Bv.F0").getField("O").get(null);builder.f=dispatcher;builder.g=dispatcher;return builder.a();
 }
 static void legacy(Object blocked,Object available)throws Exception{
  Object block=collectionBlock();Source raw=new Source();raw.suspendKey=20;raw.pages.put(40,page(available,20,null));
  H original=nativeList(raw,page(blocked,null,20));A1 visible=project(block,original);
  check(visible!=original&&original.size()==201&&original.get(100)==blocked,"legacy presentation copies list without changing cached raw seed");
  check(visible.size()==0&&raw.keys.equals(Arrays.asList(20))&&raw.pending!=null,"empty legacy seed bootstraps asynchronous native append");
  raw.pending.resumeWith(page(blocked,0,40));
  check(visible.size()==1&&visible.get(0)==available&&raw.keys.equals(Arrays.asList(20,40)),"legacy native PagedList reaches available later page through filtered intermediate");
  check(!visible.R.c&&original.R.c&&visible.R.a==original.R.a&&visible.R.b==original.R.b&&visible.R.d==original.R.d&&visible.R.e==original.R.e,"legacy raw configuration preserved except compact placeholders");
  check(visible.P==original.P&&((H)visible).h0.e==original.h0.e,"legacy native notify and fetch dispatchers retained");
  check(project(model("Block$LayoutBlock"),original)==original&&project(block,visible)==visible&&project(block,null)==null,"legacy unknown collections null and already-filtered lists retained");
  raw=new Source();original=nativeList(raw,page(blocked,null,null));visible=project(block,original);
  check(visible.isEmpty()&&raw.keys.isEmpty(),"exhausted legacy seed performs no extra request");
 }
}
