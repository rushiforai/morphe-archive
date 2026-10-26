package io.github.pengusto.patches.tests;
import android.app.Instrumentation;
import android.os.Bundle;
import android.content.Intent;
import android.app.Activity;
import java.util.*;
import java.lang.reflect.*;
public class MergedProbe extends Instrumentation {
 int assertions=0;
 void check(boolean b){if(!b)throw new AssertionError("assertion "+assertions);assertions++;}
 public void onCreate(Bundle args){super.onCreate(args);if(!"ranchu".equals(android.os.Build.HARDWARE))throw new IllegalStateException("Disposable emulator only");start();}
 public void onStart(){Bundle result=new Bundle();try{
 ClassLoader loader=getTargetContext().getClassLoader();
 Class<?> model=Class.forName("e5.l",true,loader), emailType=Class.forName("e5.n",true,loader), helpers=Class.forName("io.github.pengusto.patches.extension.contacts.MergedFields",true,loader);
 Object email=emailType.getConstructor(String.class,int.class,String.class).newInstance("penguin@example.invalid",2,"");
 Constructor<?> ctor=model.getConstructors()[0];Class<?>[] types=ctor.getParameterTypes();Object[] values=new Object[types.length];
 for(int i=0;i<types.length;i++){Class<?> t=types[i];values[i]=t==int.class?1:t==String.class?"":t==ArrayList.class?new ArrayList<>():t.getName().equals("e5.s")?t.getConstructor(String.class,String.class).newInstance("",""):null;}
 Object second=ctor.newInstance(values);Field emails=model.getDeclaredField("w"),notes=model.getDeclaredField("E");emails.setAccessible(true);notes.setAccessible(true);
 ArrayList<Object> source=new ArrayList<>(Arrays.asList(email,email));emails.set(second,source);notes.set(second,"Second");
 ArrayList<Object> dup=new ArrayList<>(Arrays.asList(second));ArrayList empty=new ArrayList();
 ArrayList merged=(ArrayList)helpers.getMethod("emails",ArrayList.class,ArrayList.class).invoke(null,empty,dup);
 check(merged.size()==1);check(empty.isEmpty());check(source.size()==2);check(merged!=source);
 Method mergeNotes=helpers.getMethod("notes",String.class,ArrayList.class);
 check(mergeNotes.invoke(null,"First",dup).equals("First\n\nSecond"));check(mergeNotes.invoke(null,"Second",dup).equals("Second"));check(mergeNotes.invoke(null,"",dup).equals("Second"));check(notes.get(second).equals("Second"));
 android.content.SharedPreferences prefs=getTargetContext().getSharedPreferences("Prefs",0);boolean old=prefs.getBoolean("merge_duplicate_contacts",true);
 Activity activity=startActivitySync(new Intent().setClassName(getTargetContext(),"org.fossify.contacts.activities.ViewContactActivity").putExtra("contact_id",5).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
 Thread.sleep(1000);
 for(boolean enabled:new boolean[]{true,false,true}){
 prefs.edit().putBoolean("merge_duplicate_contacts",enabled).commit();
 runOnMainSync(()->{try{for(String m:new String[]{"H4","a5"}){Method method=activity.getClass().getDeclaredMethod(m);method.setAccessible(true);method.invoke(activity);}}catch(Exception e){throw new RuntimeException(e);}});
 int emailId=getTargetContext().getResources().getIdentifier("contact_email","id",getTargetContext().getPackageName());
 int noteId=getTargetContext().getResources().getIdentifier("contact_notes","id",getTargetContext().getPackageName());
 check((activity.findViewById(emailId)!=null)==enabled);
 if(enabled)check(((android.widget.TextView)activity.findViewById(noteId)).getText().toString().contains("Local note stays intact"));
 }
 prefs.edit().putBoolean("merge_duplicate_contacts",old).commit();runOnMainSync(activity::finish);
 result.putString("result","PASS: "+assertions+" merge/model/native-render assertions");finish(-1,result);
 }catch(Throwable e){result.putString("error",android.util.Log.getStackTraceString(e));finish(0,result);}}
}
