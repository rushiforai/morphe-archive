package dev.jason.gboardpatches.extension.sharedmodel;
import android.content.Context;
import android.os.*;
import app.johninnl.modelhost.api.TextRequest;
import java.lang.ref.WeakReference;
import java.util.concurrent.CompletableFuture;

/** Debounced native inline display. A request never blocks a typing callback, and only its exact editor can accept it. */
public final class SharedCompletionController {
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static WeakReference<Object> controller=new WeakReference<>(null);
 private static Context context;
 private static Runnable scheduled;
 private static CompletableFuture<String> pending;
 private static long generation;
 public static final class Suggestion {
  final EditorSnapshot snapshot;final long revision,generation;final String suffix;
  Suggestion(EditorSnapshot snapshot,long revision,long generation,String suffix){this.snapshot=snapshot;this.revision=revision;this.generation=generation;this.suffix=suffix;}
 }
 private SharedCompletionController(){}
 public static void remember(Object nativeController,Context app){controller=new WeakReference<>(nativeController);context=app.getApplicationContext();changed();}
 public static void changed(){
  generation++;if(scheduled!=null)MAIN.removeCallbacks(scheduled);if(pending!=null)pending.cancel(false);pending=null;
  Object owner=controller.get();if(owner!=null)invoke("clear",new Class<?>[]{Object.class},owner);
  if(context==null || owner==null || SharedInlineSettings.completionMode(context)!=1)return;
  final long version=generation;scheduled=()->request(version);MAIN.postDelayed(scheduled,200);
 }
 private static void request(long version){
  if(version!=generation || SharedInlineSettings.completionMode(context)!=1)return;
  long revision=GboardSharedWritingRuntime.currentRevision();EditorSnapshot snapshot=GboardSharedWritingRuntime.captureEditor();
  String prefix=snapshot==null?null:snapshot.completionPrefix();if(prefix==null || prefix.length()<8 || prefix.length()>2048)return;
  Object owner=controller.get();if(owner==null)return;
  TextRequest input=new TextRequest("complete",prefix,null,null,null,null,32,3000);
  CompletableFuture<String> request=SharedModelClient.request(context,input);pending=request;
  request.whenComplete((value,error)->MAIN.post(()->{
   if(pending!=request || version!=generation || error!=null || !snapshot.isCurrent(GboardSharedWritingRuntime.currentRevision()) || SharedInlineSettings.completionMode(context)!=1)return;
   String suffix=CompletionSuffix.checked(prefix,value);if(suffix==null)return;
   Suggestion suggestion=new Suggestion(snapshot,revision,version,suffix);
   invoke("show",new Class<?>[]{Object.class,String.class,Object.class},owner,suffix,suggestion);
  }));
 }
 public static boolean accept(Object marker){
  if(!(marker instanceof Suggestion))return false;if(Looper.myLooper()!=Looper.getMainLooper()){MAIN.post(()->accept(marker));return true;}Suggestion suggestion=(Suggestion)marker;
  if(suggestion.generation==generation && context!=null && SharedInlineSettings.completionMode(context)==1
     && suggestion.snapshot.isCurrent(GboardSharedWritingRuntime.currentRevision()))suggestion.snapshot.appendSuffix(suggestion.suffix,GboardSharedWritingRuntime.currentRevision());
  changed();return true;
 }
 public static void reset(){generation++;if(scheduled!=null)MAIN.removeCallbacks(scheduled);if(pending!=null)pending.cancel(false);pending=null;Object old=controller.get();if(old!=null)invoke("clear",new Class<?>[]{Object.class},old);controller.clear();context=null;}
 private static void invoke(String method,Class<?>[] types,Object...args){try{Class.forName("MorpheSharedCompletion188",true,SharedCompletionController.class.getClassLoader()).getMethod(method,types).invoke(null,args);}catch(ReflectiveOperationException ignored){}}
}
