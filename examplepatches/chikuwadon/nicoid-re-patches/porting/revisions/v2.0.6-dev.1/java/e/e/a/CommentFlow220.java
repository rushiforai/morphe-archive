package e.e.a;

/** Helps newly received scrolling comments enter naturally and reserve their drawn rows. */
public final class CommentFlow220 {
 private static final float LATE_GRACE_CENTISECONDS=18f; // 180 ms
 private CommentFlow220(){}

 /** Only called once for a newly placed comment; never changes an active trajectory. */
 public static float start(float intended,float visualNow){
  if(Float.isNaN(intended)||Float.isNaN(visualNow)||
     Float.isInfinite(intended)||Float.isInfinite(visualNow))return intended;
  return intended; // Retiming needs the original timestamp and duration
 }

 /** Keep the original expiry while newly received late comments start at the
  * right edge. The renderer compares elapsed video time to the ORIGINAL onset,
  * so an unchanged 5-second traversal would otherwise disappear halfway.
  * Units are centiseconds in CommentMotion/CommentDuration.
  */
 public static void retime(Object incoming,float visualNow,float duration){
  if(incoming==null||!Float.isFinite(visualNow)||!Float.isFinite(duration)
     ||duration<=0f)return;
  try{
   Class<?> type=incoming.getClass();
   java.lang.reflect.Field startField=field(type,"start"),speedField=field(type,"speed");
   float originalStart=startField.getFloat(incoming);
   float age=visualNow-originalStart;
   if(!Float.isFinite(age)||age<=LATE_GRACE_CENTISECONDS||age>=duration)return;
   float originalSpeed=speedField.getFloat(incoming);
   float adjusted=originalSpeed*duration/(duration-age);
   if(!Float.isFinite(adjusted)||adjusted<=0f)return;
   startField.setFloat(incoming,visualNow);
   speedField.setFloat(incoming,adjusted);
  }catch(ReflectiveOperationException error){
   // Keep the existing path if an incoming object changed its structure.
  }
 }

 /** Actual painted height of multiline scrolling text (line step is 1.15x). */
 public static float height(String text,float fontHeight){
  if(text==null||text.indexOf('\n')<0)return fontHeight;
  int rows=1;
  for(int i=0;i<text.length();i++)if(text.charAt(i)=='\n')rows++;
  return fontHeight*(1f+1.15f*(rows-1));
 }

 /** Bounded last-resort selection when all collision-free scrolling lanes are full.
  * Never drops a comment. Fixed comments are excluded from the active map.
  * Tie-breaks prefer the uppermost row to prevent arbitrary lower placement.
  */
 private static java.lang.reflect.Field field(Class<?> type,String name)
     throws ReflectiveOperationException {
  java.lang.reflect.Field f=type.getDeclaredField(name);
  f.setAccessible(true);
  return f;
 }
 private static float real(float x,float otherwise){
  return Float.isFinite(x)?x:otherwise;
 }
 private static int rows(float height,int fullHeight,int count){
  if(fullHeight<=0||count<=0||height<=0f||!Float.isFinite(height))return 1;
  return Math.max(1,Math.min(count,(int)Math.ceil(height*count/(float)fullHeight)));
 }
 private static final class Occupied {
  int row,span;
  float right,speed;
  Occupied(int r,int s,float x,float v){row=r;span=s;right=x;speed=v;}
 }
 public static int fallback(Object state,Object incoming,float now,int width,int totalRows){
  if(totalRows<=1)return 0;
  int rows=Math.max(1,totalRows);
  try{
   java.lang.reflect.Field activeField=field(state.getClass(),"active");
   java.lang.reflect.Field heightField=field(state.getClass(),"height");
   java.util.IdentityHashMap<?,?> active=
     (java.util.IdentityHashMap<?,?>)activeField.get(state);
   int viewHeight=heightField.getInt(state);
   Class<?> kind=incoming.getClass();
   java.lang.reflect.Field fRow=field(kind,"row"),fText=field(kind,"text"),
      fHeight=field(kind,"height"),fWidth=field(kind,"width"),
      fStart=field(kind,"start"),fSpeed=field(kind,"speed");
   int need=rows(height((String)fText.get(incoming),fHeight.getFloat(incoming)),
                 viewHeight,rows);
   int choices=Math.max(1,rows-need+1);
   float speed=real(fSpeed.getFloat(incoming),1f);
   java.util.ArrayList<Occupied> used=new java.util.ArrayList<>();
   if(active!=null)for(Object o:active.values()){
    if(o==null)continue;
    int lane=fRow.getInt(o);
    if(lane<0)continue;
    int span=rows(height((String)fText.get(o),fHeight.getFloat(o)),viewHeight,rows);
    float x=width-(now-fStart.getFloat(o))*fSpeed.getFloat(o)+fWidth.getFloat(o);
    used.add(new Occupied(lane,span,real(x,width),real(fSpeed.getFloat(o),1f)));
   }
   float best=Float.POSITIVE_INFINITY;
   int bestLane=0;
   for(int candidate=0;candidate<choices;candidate++){
    float penalty=0f;
    for(Occupied o:used){
     if(candidate>=o.row+o.span||candidate+need<=o.row)continue;
     if(o.right+8f<=width&&(o.right<=0f||speed<=o.speed||
        (width-o.right-8f)/Math.max(.001f,speed-o.speed)>=
         o.right/Math.max(.001f,o.speed)))continue;
     int shared=Math.min(candidate+need,o.row+o.span)-Math.max(candidate,o.row);
     penalty+=Math.max(1,shared)*(1.5f+
       Math.max(0f,Math.min(1f,o.right/Math.max(1f,width))));
    }
    if(penalty<best){best=penalty;bestLane=candidate;if(best==0f)break;}
   }
   return bestLane;
  }catch(Exception error){
   // Rendering is more important than a reflection failure.
   return 0;
  }
 }

}
