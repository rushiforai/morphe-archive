package xyz.urro.transit;

/**
 * Reads boarding state from the GO live model Transit passes to its notification builder.
 *
 * Replaces the former native getDebugInfo probe: on the live 6.3.5 ride that call never returned
 * JSON, so it was always treated as "no GO trip". Instruction text is the authoritative on-vehicle
 * signal Transit itself shows the rider. Anything unexpected fails closed to "not aboard".
 */
final class GoStateExtractor {
 static final class Snapshot {
  final boolean active,aboard;final String vehicle,shape;
  Snapshot(boolean active,boolean aboard,String vehicle,String shape){this.active=active;this.aboard=aboard;this.vehicle=vehicle;this.shape=shape;}
  static final Snapshot NONE=new Snapshot(false,false,null,"none");
 }

 private static Object call(Object o,String name){
  if(o==null)return null;
  try{return o.getClass().getMethod(name).invoke(o);}catch(ReflectiveOperationException|RuntimeException e){return null;}
 }

 /** Raw SmartString text (component1), or null. */
 static String raw(Object smart){
  Object v=call(smart,"component1");
  return v instanceof String?(String)v:null;
 }

 /** GOLiveActivityPlatformData -> main instruction of the minimized or Android widget activity. */
 static Snapshot fromLive(Object data){
  if(data==null)return Snapshot.NONE;
  String text=mainText(data);
  if(text==null)return Snapshot.NONE;
  GoInstruction.Result r=GoInstruction.classify(text);
  return new Snapshot(true,r.aboard(),r.vehicle,GoInstruction.shape(text));
 }
 static String mainText(Object data){
  Object activity=call(data,"getMinimized");
  if(activity==null)activity=call(data,"getAndroidWidget");
  return raw(call(call(activity,"getInstruction"),"getMainInstruction"));
 }
}
