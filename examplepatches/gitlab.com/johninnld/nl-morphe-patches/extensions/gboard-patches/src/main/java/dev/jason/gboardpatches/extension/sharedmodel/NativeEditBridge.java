package dev.jason.gboardpatches.extension.sharedmodel;
import java.lang.reflect.Method;
/** Default-package native adapter is reached only after patch-time validation/installation. */
public final class NativeEditBridge {
 private NativeEditBridge(){}
 private static Class<?> adapter()throws ReflectiveOperationException{return Class.forName("MorpheSharedEditor188",true,NativeEditBridge.class.getClassLoader());}
 static boolean readyForTransition(android.inputmethodservice.InputMethodService ime){
  return ime!=null && ime.isInputViewShown() && ime.getWindow()!=null && ime.getWindow().getWindow()!=null && ime.getWindow().getWindow().getDecorView().isShown();
 }
 public static boolean available(){try{return (Boolean)adapter().getMethod("available").invoke(null);}catch(ReflectiveOperationException missing){return false;}}
 public static void invalidate(){try{adapter().getMethod("invalidate").invoke(null);}catch(ReflectiveOperationException ignored){}}
 /** Restore the Writing Tools keyboard through its native keyboard transition.
  * The access-point event alone is consumed by JarvisExtension; after an Activity handoff
  * that extension may no longer be active, so it cannot open its own keyboard.
  */
 static void activate(android.inputmethodservice.InputMethodService ime)throws ReflectiveOperationException{
  ClassLoader loader=ime.getClass().getClassLoader();
  Class<?> source=Class.forName("adbd",false,loader),trigger=Class.forName("aicj",false,loader),triggerType=Class.forName("avgf",false,loader),style=Class.forName("aeaj",false,loader);
  java.lang.reflect.Field accessPoint=source.getDeclaredField("d");accessPoint.setAccessible(true);
  Object reason=null;for(Object value:triggerType.getEnumConstants())if("KEYBOARD_FROM_ACCESS_POINT".equals(((Enum<?>)value).name()))reason=value;
  if(reason==null)throw new NoSuchFieldException("Native access-point trigger changed");
  Method make=trigger.getDeclaredMethod("d",triggerType);make.setAccessible(true);Object info=make.invoke(null,reason);
  Method metadata=Class.forName("pve",false,loader).getDeclaredMethod("a",source,trigger,boolean.class,style);metadata.setAccessible(true);
  Object values=metadata.invoke(null,accessPoint.get(null),info,false,null);
  Class<?> keyboard=Class.forName("agoo",false,loader),request=Class.forName("agoq",false,loader),transition=Class.forName("aars",false,loader),event=Class.forName("adan",false,loader);
  java.lang.reflect.Field writing=Class.forName("pva",true,loader).getDeclaredField("a");writing.setAccessible(true);
  java.lang.reflect.Constructor<?> constructor=request.getDeclaredConstructor(keyboard,Object.class);constructor.setAccessible(true);
  Method open=transition.getDeclaredMethod("a",request);open.setAccessible(true);
  Object envelope=open.invoke(null,constructor.newInstance(writing.get(null),values));
  java.lang.reflect.Field payload=transition.getDeclaredField("b");payload.setAccessible(true);
  Method dispatch=Class.forName("afae",false,loader).getDeclaredMethod("bT",event);dispatch.setAccessible(true);
  SharedWritingDiagnostics.event("writing.activation keyboard-transition");dispatch.invoke(ime,payload.get(envelope));
 }
 static void leaveWriting(android.inputmethodservice.InputMethodService ime)throws ReflectiveOperationException{
  ClassLoader loader=ime.getClass().getClassLoader();Class<?> event=Class.forName("adan",false,loader),service=Class.forName("afae",false,loader);
  java.lang.reflect.Field type=Class.forName("pva",true,loader).getDeclaredField("a");type.setAccessible(true);
  Method make=event.getDeclaredMethod("e",int.class,Object.class);make.setAccessible(true);Object request=make.invoke(null,-10151,type.get(null));
  Method dispatch=service.getDeclaredMethod("bT",event);dispatch.setAccessible(true);dispatch.invoke(ime,request);
 }
 /** Restore the original OCR keyboard after Android's document picker hid it. */
 static void activateOcr(android.inputmethodservice.InputMethodService ime)throws ReflectiveOperationException{
  ClassLoader loader=ime.getClass().getClassLoader();
  Class<?> keyboard=Class.forName("agoo",false,loader),request=Class.forName("agoq",false,loader),transition=Class.forName("aars",false,loader),event=Class.forName("adan",false,loader);
  java.lang.reflect.Field ocr=Class.forName("nyr",true,loader).getDeclaredField("g");ocr.setAccessible(true);
  java.lang.reflect.Constructor<?> constructor=request.getDeclaredConstructor(keyboard);constructor.setAccessible(true);
  Method make=transition.getDeclaredMethod("a",request);make.setAccessible(true);
  Object envelope=make.invoke(null,constructor.newInstance(ocr.get(null)));
  java.lang.reflect.Field payload=transition.getDeclaredField("b");payload.setAccessible(true);
  Method dispatch=Class.forName("afae",false,loader).getDeclaredMethod("bT",event);dispatch.setAccessible(true);dispatch.invoke(ime,payload.get(envelope));
 }
 public static String prepare()throws ReflectiveOperationException{return (String)adapter().getMethod("prepare").invoke(null);}
 public static boolean apply(String text,String operation)throws ReflectiveOperationException{return (Boolean)adapter().getMethod("apply",String.class,String.class).invoke(null,text,operation);}
}
