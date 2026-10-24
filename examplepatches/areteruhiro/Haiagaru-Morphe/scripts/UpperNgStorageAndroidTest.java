package app.morphe.extension.chmate;
import android.content.Context;
import java.lang.reflect.*;
import java.util.*;

/** Test-package only; removes just the newly inserted item in finally. */
public final class UpperNgStorageAndroidTest {
 static Object call(Object target,Class<?> type,String name,Class<?>[] signature,Object...args)throws Exception{
  Method method=type.getDeclaredMethod(name,signature);method.setAccessible(true);return method.invoke(target,args);
 }
 static Object field(Object value,String name)throws Exception{Field f=value.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(value);}
 public static String run(Context context)throws Exception{
  if(!context.getPackageName().matches(".*\\.haiagaru\\.(settingsfix191|resumefix226|resumefix242)"))throw new AssertionError("Test package only");
  Class<?> type=Class.forName("app.morphe.extension.chmate.NativeNgStore");
  Constructor<?> ctor=type.getDeclaredConstructor(Context.class,String.class);ctor.setAccessible(true);Object store=ctor.newInstance(context,"NAME");
  List<?> before=(List<?>)call(store,type,"entries",new Class<?>[]{});int checks=0;
  for(boolean regex:new boolean[]{false,true}){
   String token="Qz9X-__haiagaru_test_"+UUID.randomUUID();
   Class<?> suffix=Class.forName("app.morphe.extension.chmate.WacchoiSuffixNg");
   short flags=(Short)call(null,suffix,"registrationFlags",new Class<?>[]{short.class,boolean.class,boolean.class,boolean.class,boolean.class},(short)0,regex,true,true,true);
   Object item=call(store,type,"item",new Class<?>[]{String.class,short.class,long.class,String.class},token,flags,System.currentTimeMillis(),"android");
   boolean added=false;
   try{
    call(store,type,"update",new Class<?>[]{Object.class,Object.class},null,item);added=true;
    List<?> after=(List<?>)call(store,type,"entries",new Class<?>[]{});Object found=null;
    for(Object entry:after)if(token.equals(field(entry,"pattern")))found=entry;
    if(found==null||after.size()!=before.size()+1)throw new AssertionError("Native registration missing");checks++;
    if(!"android".equals(field(found,"board")))throw new AssertionError("Board scope lost");checks++;
    if((Short)field(found,"flags")!=flags || (flags&0x70)!=(regex?0x20:0x10) || (flags&9)!=9)throw new AssertionError("Flags lost");checks++;
   }finally{if(added){
    List<?> now=(List<?>)call(store,type,"entries",new Class<?>[]{});ArrayList<Object> keep=new ArrayList<>();
    for(Object entry:now)if(!token.equals(field(entry,"pattern")))keep.add(field(entry,"nativeItem"));
    call(store,type,"replace",new Class<?>[]{List.class,List.class},now,keep);
   }}
  }
  List<?> restored=(List<?>)call(store,type,"entries",new Class<?>[]{});
  if(restored.size()!=before.size())throw new AssertionError("Restore size mismatch");
  for(int i=0;i<before.size();i++){
   Object a=before.get(i),b=restored.get(i);
   for(String name:new String[]{"pattern","board","flags","timestamp"})if(!Objects.equals(field(a,name),field(b,name)))throw new AssertionError("Original entries changed");
  }
  return "PASS "+(++checks)+" native NG storage checks; original entries restored";
 }
}
