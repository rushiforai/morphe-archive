package e.e.a;
/** Preserve valid duration metadata while legacy player UI changes lifecycle. */
public final class MediaSeek205 {
 private MediaSeek205(){}
 public static long validDuration(Object state,long latest){
  if(latest>0)return latest;
  if(state==null)return latest;
  try{
   java.lang.reflect.Field field=state.getClass().getDeclaredField("lastDuration");
   field.setAccessible(true);
   long previous=field.getLong(state);
   return previous>0?previous:latest;
  }catch(Exception ignored){return latest;}
 }
}
