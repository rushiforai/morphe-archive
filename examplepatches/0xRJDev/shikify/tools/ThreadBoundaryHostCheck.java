import java.lang.reflect.*;
import java.util.*;
import com.rubenmayayo.reddit.models.reddit.CommentViewModel;
public class ThreadBoundaryHostCheck {
 public static class Data extends ArrayList<Object> {int reads,copies;@Override public Object get(int index){reads++;return super.get(index);}@Override public Object[] toArray(){copies++;return super.toArray();}}
 public static class Adapter {
  androidx.recyclerview.widget.RecyclerView$g observer;
  public void registerAdapterDataObserver(androidx.recyclerview.widget.RecyclerView$g value){observer=value;}
  public void unregisterAdapterDataObserver(androidx.recyclerview.widget.RecyclerView$g value){if(observer==value)observer=null;}
 }
 public static class Fragment {public Data B=new Data();public Adapter C=new Adapter();}
 static int count;static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);count++;System.out.println("PASS: "+label);}
 static Object field(Object c,String name)throws Exception{Field f=c.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(c);}
 public static void main(String[] args)throws Exception{
  Class<?> cls=Class.forName("app.morphe.extension.boost.CommentsScreenTweaks$Controller");
  Constructor<?> ctor=cls.getDeclaredConstructor(Object.class,android.view.ViewGroup.class);ctor.setAccessible(true);Object c=ctor.newInstance(new Object(),null);
  Method refresh=cls.getDeclaredMethod("refresh",List.class),same=cls.getDeclaredMethod("same",List.class);refresh.setAccessible(true);same.setAccessible(true);
  CommentViewModel parent=new CommentViewModel(0),child=new CommentViewModel(1),grandchild=new CommentViewModel(2),next=new CommentViewModel(0),last=new CommentViewModel(1);
  List<Object> data=new ArrayList<>(List.of(new Object(),parent,child,grandchild,next,last));refresh.invoke(c,data);
  check(Arrays.equals((boolean[])field(c,"starts"),new boolean[]{false,true,false,false,true,false}),"Native compiled controller groups parent/descendant starts");
  check(Arrays.equals((boolean[])field(c,"ends"),new boolean[]{false,false,false,true,false,true}),"Native compiled controller closes at final visible descendants");
  check((Boolean)same.invoke(c,data),"Unchanged dataset keeps the cache stable");
  child.S=false;grandchild.S=false;check(!(Boolean)same.invoke(c,data),"Visibility mutation invalidates cache without list replacement");refresh.invoke(c,data);
  check(((boolean[])field(c,"ends"))[1],"Collapsed parent closes when hidden descendants remain in the dataset");
  check(!((boolean[])field(c,"shown"))[2] && !((boolean[])field(c,"shown"))[3],"Hidden descendants are excluded from the visible projection");
  check((Boolean)same.invoke(c,data),"Collapsed dataset settles without repeated invalidation");
  child.S=true;grandchild.S=true;check(!(Boolean)same.invoke(c,data),"Expansion flags invalidate the collapsed cache");refresh.invoke(c,data);
  check(!((boolean[])field(c,"ends"))[1] && ((boolean[])field(c,"ends"))[3],"Expansion restores the final descendant corner");
  CommentViewModel replacement=new CommentViewModel(0);data.set(2,replacement);check(!(Boolean)same.invoke(c,data),"Same-size model replacement invalidates the cache");refresh.invoke(c,data);
  check(((boolean[])field(c,"ends"))[1] && ((boolean[])field(c,"starts"))[2],"Replacement root starts a separate group");
  last.S=false;refresh.invoke(c,data);check(((boolean[])field(c,"ends"))[4],"Hidden final child rounds its visible parent");
  Object observer=field(c,"changes");Field dirty=cls.getDeclaredField("dirty");dirty.setAccessible(true);
  for(String name:List.of("a","b","c","d","e","f","g")){
   dirty.setBoolean(c,false);Class<?>[] parameters=name.equals("c") ? new Class<?>[]{int.class,int.class,Object.class}:List.of("d","e","f").contains(name) ? new Class<?>[]{int.class,int.class}:new Class<?>[0];
   Method event=observer.getClass().getMethod(name,parameters);
   if(parameters.length==0)event.invoke(observer);else if(parameters.length==2)event.invoke(observer,0,1);else event.invoke(observer,0,1,null);
   check(dirty.getBoolean(c),"Native observer event "+name+" invalidates the controller");
  }
  Fragment fragment=new Fragment();for(int i=0;i<10000;i++)fragment.B.add(new CommentViewModel(i%3));
  Object live=ctor.newInstance(fragment,new android.view.ViewGroup());Method preDraw=cls.getMethod("onPreDraw");preDraw.setAccessible(true);preDraw.invoke(live);
  check(fragment.C.observer!=null,"Compiled controller registers with the adapter ABI");
  Object stable=field(live,"snapshot");fragment.B.reads=fragment.B.copies=0;
  for(int i=0;i<240;i++)preDraw.invoke(live);
  check(fragment.B.reads==0 && fragment.B.copies==0 && field(live,"snapshot")==stable,"240 steady callbacks with 10,000 models perform no dataset scan or copy");
  fragment.B.reads=fragment.B.copies=0;fragment.C.observer.c(15,1,null);preDraw.invoke(live);
  check(fragment.B.reads==1 && fragment.B.copies==0 && field(live,"snapshot")==stable,"One content-only row notification checks one model and does not rebuild 10,000 boundaries");
  fragment.B.reads=fragment.B.copies=0;fragment.C.observer.c(10,3,null);fragment.C.observer.c(12,2,null);preDraw.invoke(live);
  check(fragment.B.reads==4 && fragment.B.copies==0,"Overlapping content notifications coalesce into one bounded range check");
  CommentViewModel hidden=(CommentViewModel)fragment.B.get(1);hidden.S=false;fragment.C.observer.c(1,1,null);preDraw.invoke(live);
  check(!((boolean[])field(live,"shown"))[1],"Observed in-place visibility mutation updates rounded boundaries");
  check(fragment.B.copies==1,"One dataset notification produces exactly one refresh");
  for(int i=0;i<120;i++)preDraw.invoke(live);check(fragment.B.copies==1,"Subsequent frames reuse the refreshed projection");
  CommentViewModel nesting=(CommentViewModel)fragment.B.get(2);nesting.R=0;fragment.C.observer.c(2,1,null);preDraw.invoke(live);
  check(((boolean[])field(live,"starts"))[2],"Content-range notification detects in-place nesting changes");
  fragment.B.set(5,new CommentViewModel(0));fragment.C.observer.c(5,1,null);preDraw.invoke(live);
  check(((boolean[])field(live,"starts"))[5],"Content-range notification detects replacement models without a size change");
  Adapter previous=fragment.C;fragment.C=new Adapter();preDraw.invoke(live);
  check(previous.observer==null && fragment.C.observer!=null,"Replacing adapter transfers registration without retaining the old observer");
  Method unobserve=cls.getDeclaredMethod("unobserve");unobserve.setAccessible(true);unobserve.invoke(live);
  check(fragment.C.observer==null,"Cleanup unregisters the dataset observer");
  System.out.println("HOST THREAD BOUNDARY CHECKS PASSED: "+count);
 }
}
