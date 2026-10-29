package e.e.a;
import android.app.*;import android.content.*;import android.graphics.*;import android.graphics.drawable.Drawable;import android.os.*;import android.preference.*;import android.view.*;import android.widget.*;
import java.lang.ref.WeakReference;import java.util.*;import org.json.*;
/** Histogram of fetched comments. No media requests, decoding, or playback polling. */
public final class CommentGraph215 {
 public static final String GRAPH="seek_comment_density";
 static final Map<Object,Binding> BINDINGS=new WeakHashMap<Object,Binding>();
 static final Map<Object,Snapshot> DATA=Collections.synchronizedMap(new WeakHashMap<Object,Snapshot>());
 static final Map<String,Snapshot> SHARED=Collections.synchronizedMap(new LinkedHashMap<String,Snapshot>());
 static final java.util.concurrent.atomic.AtomicBoolean REFRESH_PENDING=new java.util.concurrent.atomic.AtomicBoolean();
 static final Handler MAIN=new Handler(Looper.getMainLooper());
 static boolean enabled(Context c){return PreferenceManager.getDefaultSharedPreferences(c).getBoolean(GRAPH,true);}
 static final class Snapshot {final String id;final long duration;final int[] bins;final int count,max;Snapshot(String i,long d,int[] b,int n){id=i;duration=d;bins=b;count=n;int peak=0;for(int value:b)peak=Math.max(peak,value);max=peak;}}
 public static void publish(final Object model,ArrayList<?> comments){
  if(model==null||comments==null)return;
  try {JSONObject watch=(JSONObject)Playback214.get(model,"modernWatch"),video=watch==null?null:watch.optJSONObject("video");if(video==null)return;
   String id=String.valueOf(Playback214.get(model,"d"));long duration=video.optLong("duration",0)*1000L;if(!DetailData.matchesWatch(watch,id)||duration<=0)return;
   int[] bins=new int[180];int count=0;java.lang.reflect.Field time=null;Class<?> type=null;
   for(Object comment:comments){if(comment==null)continue;if(type!=comment.getClass()){type=comment.getClass();time=type.getField("d");}Object raw=time.get(comment);if(!(raw instanceof Number))continue;long pos=((Number)raw).longValue()*10L;if(pos<0||pos>duration)continue;bins[(int)Math.min(179,pos*180/duration)]++;count++;}
   Snapshot snap=new Snapshot(id,duration,bins,count);DATA.put(model,snap);synchronized(SHARED){SHARED.put(id,snap);while(SHARED.size()>8)SHARED.remove(SHARED.keySet().iterator().next());}if(REFRESH_PENDING.compareAndSet(false,true))MAIN.post(new Runnable(){public void run(){REFRESH_PENDING.set(false);for(Binding b:new ArrayList<Binding>(BINDINGS.values()))b.refresh();}});
  }catch(Exception e){ModernDebug.record("Comment graph unavailable: "+e.getClass().getSimpleName());}
 }
 public static void attach(Object owner){attachOwner(owner,false);}
 public static void attachPopup(Object owner){attachOwner(owner,true);}
 static void attachOwner(Object owner,boolean popup){try{View root=(View)Playback214.get(owner,popup?"a":"x1");SeekBar seek=(SeekBar)Playback214.get(owner,popup?"d":"Z");if(root==null)return;if(seek==null)seek=(SeekBar)PortraitTimeline213.find(root,"seekBar");if(seek==null)return;if(popup&&seek.getParent() instanceof View)root=(View)seek.getParent();Binding old=BINDINGS.get(owner);if(old!=null&&old.root==root&&old.seek==seek){old.refresh();return;}if(old!=null)old.dispose();Binding b=new Binding(owner,root,seek,popup);BINDINGS.put(owner,b);b.start();}catch(Exception e){ModernDebug.record("Comment graph attachment unavailable: "+e.getClass().getSimpleName());}}
 public static void settings(PreferenceActivity a){remove(a,"seek_thumbnails");remove(a,"seek_local_frequency");if(a.findPreference(GRAPH)!=null)return;PreferenceGroup group=parent(a.getPreferenceScreen(),a.findPreference("quality_mode"));if(group==null)group=a.getPreferenceScreen();CheckBoxPreference p=new CheckBoxPreference(a);p.setKey(GRAPH);p.setTitle(tr(a,"コメントの盛り上がり","Comment activity"));p.setSummary(tr(a,"取得済みコメントの時刻分布をシークバーに表示します。動画の全コメントの統計とは限りません","Show the time distribution of fetched comments on the seek bar; this may not cover all comments"));p.setDefaultValue(true);p.setChecked(enabled(a));group.addPreference(p);}
 static String tr(Context c,String ja,String en){return c.getResources().getConfiguration().locale.getLanguage().equals("ja")?ja:en;}
 static void remove(PreferenceActivity a,String key){Preference p=a.findPreference(key);PreferenceGroup g=parent(a.getPreferenceScreen(),p);if(p!=null&&g!=null)g.removePreference(p);}
 static PreferenceGroup parent(PreferenceGroup g,Preference a){if(a==null)return null;for(int i=0;i<g.getPreferenceCount();i++){Preference p=g.getPreference(i);if(p==a)return g;if(p instanceof PreferenceGroup){PreferenceGroup r=parent((PreferenceGroup)p,a);if(r!=null)return r;}}return null;}
 static final class Binding implements View.OnAttachStateChangeListener,View.OnLayoutChangeListener,SharedPreferences.OnSharedPreferenceChangeListener {
  final WeakReference<Object> owner;final View root;final SeekBar seek;final Overlay overlay;final SharedPreferences prefs;final boolean popup;boolean disposed;Snapshot snapshot;
  Binding(Object o,View r,SeekBar s,boolean pop){popup=pop;owner=new WeakReference<Object>(o);root=r;seek=s;overlay=new Overlay(this);prefs=PreferenceManager.getDefaultSharedPreferences(r.getContext());}
  void start(){root.addOnAttachStateChangeListener(this);root.addOnLayoutChangeListener(this);seek.addOnLayoutChangeListener(this);prefs.registerOnSharedPreferenceChangeListener(this);root.getOverlay().add(overlay);refresh();}
  void refresh(){if(disposed)return;try{Object o=owner.get();if(o==null){dispose();return;}Object model=Playback214.get(o,popup?"z":"h1");String id=(String)Playback214.get(o,popup?"f":"b0");Snapshot found=DATA.get(model);if(found==null||!found.id.equals(id))found=popup?SHARED.get(id):null;snapshot=found!=null&&found.id.equals(id)?found:null;}catch(Exception e){snapshot=null;}overlay.setBounds(0,0,root.getWidth(),root.getHeight());overlay.invalidateSelf();}
  void dispose(){if(disposed)return;disposed=true;root.removeOnAttachStateChangeListener(this);root.removeOnLayoutChangeListener(this);seek.removeOnLayoutChangeListener(this);prefs.unregisterOnSharedPreferenceChangeListener(this);root.getOverlay().remove(overlay);BINDINGS.remove(owner.get());snapshot=null;}
  public void onViewAttachedToWindow(View v){refresh();}public void onViewDetachedFromWindow(View v){dispose();}
  public void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob){refresh();}
  public void onSharedPreferenceChanged(SharedPreferences p,String key){if(GRAPH.equals(key))overlay.invalidateSelf();}
 }
 static final class Overlay extends Drawable {
  final Binding b;final Paint p=new Paint(3);final Path path=new Path();final int[] root=new int[2],bar=new int[2];Snapshot drawn;float oldLeft,oldRight,oldBase,oldDensity;boolean oldRtl;Overlay(Binding x){b=x;}
  public void draw(Canvas c){Snapshot data=b.snapshot;if(!enabled(b.root.getContext())||data==null||data.count==0||!b.seek.isShown()||b.seek.getAlpha()==0||b.seek.getWidth()==0)return;b.root.getLocationOnScreen(root);b.seek.getLocationOnScreen(bar);float left=bar[0]-root[0]+b.seek.getPaddingLeft(),right=bar[0]-root[0]+b.seek.getWidth()-b.seek.getPaddingRight(),d=b.root.getResources().getDisplayMetrics().density,base=bar[1]-root[1]+b.seek.getHeight()/2f-5*d;int max=data.max;if(max==0)return;p.setColor(0x9979bdb7);boolean rtl=b.seek.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL;if(drawn!=data||left!=oldLeft||right!=oldRight||base!=oldBase||d!=oldDensity||rtl!=oldRtl){drawn=data;oldLeft=left;oldRight=right;oldBase=base;oldDensity=d;oldRtl=rtl;path.rewind();path.moveTo(left,base);for(int i=0;i<180;i++){int n=rtl?179-i:i;path.lineTo(left+(right-left)*(i+.5f)/180,base-(b.popup?12:20)*d*data.bins[n]/max);}path.lineTo(right,base);path.close();}c.drawPath(path,p);}
  public void setAlpha(int a){}public void setColorFilter(ColorFilter f){}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
 }
}
