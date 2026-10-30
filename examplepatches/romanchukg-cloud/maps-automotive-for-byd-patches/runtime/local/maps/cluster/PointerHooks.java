package local.maps.cluster;
import java.lang.reflect.Field;
import java.util.Arrays;

/** Exact AAOS 26.10 anchor schema. Cluster only: Y is always ours; X is ours only when
 * the horizontal setting is not 0, otherwise the native X (free viewport centre) is kept.
 * Both are absolute values, so the several anchor hooks on one update cannot accumulate.
 */
public final class PointerHooks {
 /** Native navigation uses a dp container offset, not the idle uun anchor.
  * No JNI call, route state mutation, or main-map fallback is made here.
  */
 public static Object adjustNavigationViewport(Object owner,Object viewport) {
  if(owner==null||viewport==null)return viewport;
  try {
   type(owner,"xay");Object manager=field(owner,"m").get(owner);
   if(!ClusterHost.isClusterViewport(manager))return viewport;
   if(!field(owner,"B").getBoolean(owner))return viewport;
   Object navigation=field(owner,ClusterZoom.NAVIGATION_STATE).get(owner);
   if(!Boolean.TRUE.equals(call(navigation,"isPresent")))return viewport;
   type(call(navigation,"get"),"agwh");type(viewport,"agvt");
   int flags=field(viewport,"b").getInt(viewport);
   if((flags&5)!=5)return viewport; // Original b() supplies full dimensions and offset.
   Object dimensions=field(viewport,"c").get(viewport),offset=field(viewport,"f").get(viewport);
   type(dimensions,"agwl");type(offset,"agwk");
   int sizes=field(dimensions,"b").getInt(dimensions);
   if((sizes&4)==0)return viewport;
   double height=field(dimensions,"e").getDouble(dimensions);
   float normalized=ClusterHost.clusterPointerY(manager,0f);
   if(!finite(height)||height<=0||height>32768||!finite(normalized)||normalized<-.5f||normalized>.5f)return viewport;
   int oldFlags=field(offset,"b").getInt(offset);if((oldFlags&1)==0)return viewport;
   double selected=normalized*height/2d,previous=field(offset,"d").getDouble(offset),previousX=field(offset,"c").getDouble(offset);
   if(!finite(previous)||!finite(previousX))return viewport;
   // Native X is the free rect centre offset in dp; it stays unless a horizontal value is chosen.
   float normalizedX=ClusterHost.clusterPointerX(manager,Float.NaN);double selectedX=previousX;
   if(!Float.isNaN(normalizedX)&&(sizes&2)!=0&&normalizedX>=-.5f&&normalizedX<=.5f){
    double width=field(dimensions,"d").getDouble(dimensions);
    if(finite(width)&&width>0&&width<=32768)selectedX=normalizedX*width/2d;
   }
   if(previous==selected&&previousX==selectedX)return viewport;
   // Y presence is added only when Y changes; native always supplies X (bit 1).
   Object changed=copyNavigationOffset(viewport,selectedX,selected,previous==selected?oldFlags:oldFlags|2);
   Object roundTrip=copyNavigationOffset(changed,previousX,previous,oldFlags);
   if(!Arrays.equals((byte[])call(viewport,"cy"),(byte[])call(roundTrip,"cy")))return viewport;
   // The activity can be detached while a native update is being prepared.
   if(!ClusterHost.isClusterViewport(manager)||field(owner,"m").get(owner)!=manager
      ||!field(owner,"B").getBoolean(owner))return viewport;
   ClusterHost.applyClusterPointerY(manager,normalized);
   if(selectedX!=previousX)ClusterHost.applyClusterPointerX(manager,normalizedX);
   return changed;
  }catch(ReflectiveOperationException|RuntimeException|LinkageError error){
   android.util.Log.w("MapsClusterTest","Navigation anchor schema: "+error.getClass().getSimpleName());return viewport;
  }
 }
 private static Object copyNavigationOffset(Object viewport,double x,double y,int offsetFlags)throws ReflectiveOperationException {
  Object offset=field(viewport,"f").get(viewport),builder=call(offset,"cF");call(builder,"bI");
  Object copy=field(builder,"b").get(builder);type(copy,"agwk");if(copy==offset)throw new IllegalStateException("Mutable anchor input");
  field(copy,"c").setDouble(copy,x);field(copy,"d").setDouble(copy,y);field(copy,"b").setInt(copy,offsetFlags);Object changed=call(builder,"bE");
  Object outer=call(viewport,"cF");call(outer,"bI");Object container=field(outer,"b").get(outer);type(container,"agvt");
  if(container==viewport)throw new IllegalStateException("Mutable container input");field(container,"f").set(container,changed);return call(outer,"bE");
 }
 private static boolean finite(double value){return !Double.isNaN(value)&&!Double.isInfinite(value);}
 private static void type(Object value,String expected){if(value==null||!expected.equals(value.getClass().getName()))throw new IllegalStateException("Unexpected navigation anchor schema");}
 private static Object call(Object value,String method)throws ReflectiveOperationException{return value.getClass().getMethod(method).invoke(value);}
 private static Field field(Object value,String name)throws ReflectiveOperationException{Field f=value.getClass().getDeclaredField(name);f.setAccessible(true);return f;}
    public static Object adjustCamera(Object manager,Object point) {
        Object adjusted=adjust(manager,point);
        if(adjusted!=null&&ClusterHost.isClusterViewport(manager))try {
            ClusterHost.applyClusterPointerY(manager,adjusted.getClass().getField("c").getFloat(adjusted));
            ClusterHost.applyClusterPointerX(manager,adjusted.getClass().getField("b").getFloat(adjusted));
        } catch(ReflectiveOperationException e){android.util.Log.w("MapsClusterTest","AAOS camera anchor",e);}
        return adjusted;
    }
    public static Object adjust(Object manager,Object point) {
        if(point==null||!ClusterHost.isClusterViewport(manager))return point;
        try {
            float oldX=point.getClass().getField("b").getFloat(point);
            float old=point.getClass().getField("c").getFloat(point);
            float x=ClusterHost.clusterPointerX(manager,oldX),y=ClusterHost.clusterPointerY(manager,old);
            return old==y&&oldX==x?point:point.getClass().getConstructor(float.class,float.class).newInstance(x,y);
        } catch(ReflectiveOperationException e) { android.util.Log.w("MapsClusterTest","AAOS anchor schema",e);return point; }
    }
}
