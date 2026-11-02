package e.e.a;
import android.content.*;import android.net.Uri;import java.lang.ref.WeakReference;
/** The original search form supplies keyword/tag, ordering, dates, duration and history. */
public final class TabSearch228 {
 public static void edit(android.app.Activity a,String request){if(menu(a))return;try{Class.forName("e.e.a.v0").getMethod("a",Context.class,String.class).invoke(null,a,request);}catch(Exception e){android.util.Log.w("nicoid-tabs","Cannot open search editor",e);}}
 public static boolean menu(android.app.Activity a){if(!MultiTabs227.enabled())return false;MultiTabs227.Host h=MultiTabs227.HOSTS.get(a);if(h==null)return false;SavedTabs227.Tab t=MultiTabs227.data().find(h.currentId);h.query(t!=null&&t.kind==0?t:null);return true;}
 static void open(MultiTabs227.Host host,SavedTabs227.Tab existing){
  final WeakReference<MultiTabs227.Host> ref=new WeakReference<MultiTabs227.Host>(host);
  Context context=new ContextWrapper(host.a){boolean accepted;
   @Override public void startActivity(Intent result){
    MultiTabs227.Host h=ref.get();if(accepted||h==null||h.a.isDestroyed()||!MultiTabs227.enabled())return;
    if(result.getData()==null){super.startActivity(result);return;}accepted=true;
    SavedTabs227.Tab t=existing==null?new SavedTabs227.Tab():existing;t.url=result.getDataString();t.kind=0;t.screen="list";t.type=result.getIntExtra("type",0);t.position=0;t.top=0;
    Uri uri=result.getData();String word=uri.getQueryParameter("keyword");if(word==null)word=uri.getQueryParameter("tag");if(word==null)word=uri.getLastPathSegment();t.label=word==null?"検索":word;
    if(existing==null)h.addTab(t);else{h.generation++;TabPager233.destroy(h.a);TabPreview235.CACHE.remove(t.id);h.removePage(t.id);try{MultiTabs227.invoke(MultiTabs227.invoke(h.a,"i",new Class<?>[0]),"n",new Class<?>[0]);h.activate(t.id);MultiTabs227.data().selected=t.id;MultiTabs227.save();h.bar();}catch(Exception e){android.util.Log.w("nicoid-tabs","Cannot reload edited search",e);}}
   }
  };
  try{SearchSnapshot110.editing(context,existing==null?null:existing.url);Class<?> nativeSearch=Class.forName("e.e.a.v0");if(existing==null)nativeSearch.getMethod("a",Context.class,String.class,int[].class).invoke(null,context,null,null);else nativeSearch.getMethod("a",Context.class,String.class).invoke(null,context,existing.url);}
  catch(Exception e){android.util.Log.w("nicoid-tabs","Cannot open native search form",e);}
 }
}
