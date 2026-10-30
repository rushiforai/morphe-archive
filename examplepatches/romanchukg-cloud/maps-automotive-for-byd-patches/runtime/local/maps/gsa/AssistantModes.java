// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsa;

import android.app.Activity;
import android.content.Intent;
import android.os.*;
import android.util.Log;
import java.lang.reflect.*;

/** Protocol adapter for pinned GSA17.62.11. One short-lived command per explicit Maps gesture. */
public final class AssistantModes {
 private static final String ROOT="com.google.android.apps.search.assistant.surfaces.voice.robin.";
 private static final android.net.Uri API=android.net.Uri.parse("content://com.google.android.googlequicksearchbox.local.maps.assistant");
 public static void created(Activity activity){apply(activity,activity.getIntent());}
 public static void newIntent(Activity activity,Intent intent){apply(activity,intent);}
 private static Class<?> type(ClassLoader loader,String name)throws ClassNotFoundException{return Class.forName(name,true,loader);}
 private static Parcelable voice(ClassLoader l)throws Exception{
  Class<?> input=type(l,ROOT+"conversation.VoiceInputConfiguration");
  Object config=type(l,ROOT+"conversation.VoiceInputConfiguration$InternalAsr").getConstructor(boolean.class,boolean.class,type(l,ROOT+"speech.AudioSessionConfig"),type(l,ROOT+"speech.transcription.TranscriptionConfig"),type(l,"audu"),type(l,"avcs"),int.class).newInstance(true,false,null,null,null,null,62);
  return (Parcelable)type(l,ROOT+"AutoModality$Voice").getConstructor(input).newInstance(config);
 }
 private static Parcelable live(ClassLoader l,Parcelable previous,boolean floaty)throws Exception{
  Class<?> chat=type(l,ROOT+"data.ChatControllerId");Object id=null;
  if(previous!=null)for(Method getter:previous.getClass().getMethods())if(getter.getParameterTypes().length==0&&getter.getReturnType()==chat){id=getter.invoke(previous);if(id!=null)break;}
  // Some native zero-state routes do not have a conversation yet. Start a new native UUID session.
  if(id==null)id=chat.getConstructor(java.util.UUID.class).newInstance(java.util.UUID.randomUUID());
  Object args=type(l,"bhgw").getMethod("d",chat,type(l,"bhjx"),type(l,"bhfa"),type(l,"bhfb"),type(l,"ekso"),Boolean.class,type(l,"gkrg"),type(l,"fxir"),type(l,"fwtl")).invoke(null,id,null,null,null,null,null,null,null,null);
  String cls=ROOT+"routing.RobinRouterArgs$"+(floaty?"Floaty":"FullScreen")+"$ConversationMode";
  if(floaty)return (Parcelable)type(l,cls).getConstructor(chat,type(l,"bhem"),type(l,ROOT+"routing.RobinRouterArgs$Floaty$FromFab")).newInstance(id,args,null);
  return (Parcelable)type(l,cls).getConstructor(type(l,"bhem")).newInstance(args);
 }
 private static void apply(Activity activity,Intent intent){
  String name=activity.getClass().getName();boolean floaty=name.equals(ROOT+"ui.floaty.activity.FloatyActivity");
  if(!floaty&&!name.equals(ROOT+"main.MainActivity"))return;
  String mode;
  try{Bundle command=activity.getContentResolver().call(API,"consume",null,null);mode=command==null?null:command.getString("mode");}catch(RuntimeException unavailable){return;}
  if(mode==null)return;boolean applied=false;
  try{
   if(intent==null)throw new IllegalStateException("Native intent is unavailable");
   ClassLoader loader=activity.getClassLoader();
   if("microphone".equals(mode))intent.putExtra("autoModality",voice(loader));
   else{
    intent.setExtrasClassLoader(loader);Parcelable previous=intent.getParcelableExtra("robin_router_args");
    Parcelable route=live(loader,previous,floaty);intent.putExtra("robin_router_args",route);
   }
   applied=true;CarVoiceStrip.modeApplied(activity,mode);Log.i("GsaMapsMode","applied="+mode);
  }catch(Exception|LinkageError failure){
   applied=false;Log.w("GsaMapsMode","mode unavailable: "+failure.getClass().getSimpleName());
   android.widget.Toast.makeText(activity,"Choose the microphone or Live button in Gemini. One-tap mode is unavailable.",android.widget.Toast.LENGTH_LONG).show();
  }finally{
   Bundle result=new Bundle();result.putBoolean("applied",applied);result.putInt("pid",android.os.Process.myPid());
   try{activity.getContentResolver().call(API,"complete",mode,result);}catch(RuntimeException ignored){}
  }
 }
}
