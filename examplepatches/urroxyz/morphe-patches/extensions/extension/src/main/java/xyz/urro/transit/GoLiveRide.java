package xyz.urro.transit;

/**
 * Background ride edges from GO's live notification, the only native GO model Transit keeps
 * delivering while its trip screen is hidden. The live model has no riding flag: waiting at the
 * stop and riding share the same structure. Boarding is therefore the edge into a transit-leg
 * instruction (route badge on the main instruction) that uses an aboard-only template; alighting
 * is the route badge leaving the main instruction. Other text on the transit leg, such as a
 * detour notice, never ends a ride. Fresh TripDetails models stay authoritative.
 */
final class GoLiveRide {
 static final long EXIT_SETTLE_MS=5000;
 static final class Snapshot {
  final boolean transitLeg;final boolean aboardTemplate;
  Snapshot(boolean transitLeg,boolean aboardTemplate){this.transitLeg=transitLeg;this.aboardTemplate=aboardTemplate;}
  boolean entering(){return transitLeg&&aboardTemplate;}
 }
 private boolean entered;private int absent;private long absentSince;

 private static Object get(Object o,String name)throws ReflectiveOperationException{return o==null?null:o.getClass().getMethod(name).invoke(o);}
 /** Null when the callback isn't a GO live-activity model or its shape is unknown. */
 static Snapshot read(Object data){
  if(data==null)return null;
  try{
   Object activity=get(data,"getAndroidWidget");if(activity==null)activity=get(data,"getMinimized");
   Object instruction=get(activity,"getInstruction");if(instruction==null)return null;
   boolean leg=get(instruction,"getFloatingServiceName")!=null;
   Object text=get(instruction,"getMainInstruction");Object value=text==null?null:get(text,"getValue");
   boolean aboard=value instanceof String&&GoInstruction.classify((String)value).aboard();
   return new Snapshot(leg,aboard);
  }catch(ReflectiveOperationException|RuntimeException e){return null;}
 }
 /** TRUE on a boarding edge, FALSE on a settled alighting edge, otherwise null. */
 Boolean next(Snapshot s,long now){
  if(s==null)return null;
  if(s.transitLeg){absent=0;}
  else if(absent++==0)absentSince=now;
  if(s.entering()){if(!entered){entered=true;return Boolean.TRUE;}return null;}
  if(!s.transitLeg){entered=false;if(absent>=2&&now-absentSince>=EXIT_SETTLE_MS){absent=Integer.MIN_VALUE/2;return Boolean.FALSE;}}
  return null;
 }
 void reset(){entered=false;absent=0;absentSince=0;}
}
