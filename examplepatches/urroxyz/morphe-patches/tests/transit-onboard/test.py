#!/usr/bin/env python3
"""Run the real transmitter against deterministic Android/active-GO-flow fixtures."""
from pathlib import Path
import subprocess, tempfile
root = Path(__file__).resolve().parents[2]
sources = {
'android/os/Looper.java': 'package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();}}',
'android/os/Handler.java': '''package android.os; import java.util.*; public class Handler {
static final List<Runnable> queue=new ArrayList<>();public Handler(Looper l){}
public boolean post(Runnable r){queue.add(r);return true;}public boolean postDelayed(Runnable r,long ms){return post(r);}
public void removeCallbacks(Runnable r){queue.removeIf(x->x==r);}public static void flush(){int n=0;while(!queue.isEmpty()){if(n++>100)throw new AssertionError("callback loop");queue.remove(0).run();}}}''',
'android/content/Context.java': '''package android.content; public class Context {
public boolean enabled=true;public Context getApplicationContext(){return this;}public ClassLoader getClassLoader(){return getClass().getClassLoader();}
public Prefs getSharedPreferences(String name,int mode){if(!name.equals("xyz.urro.transit.go.v1"))throw new AssertionError("unstable settings namespace");return new Prefs(this);}
public static class Prefs {final Context c;Prefs(Context c){this.c=c;}public boolean getBoolean(String key,boolean def){if(!key.equals("activity_spoof"))throw new AssertionError();return c.enabled;}}}''',
'android/content/Intent.java':'package android.content; public class Intent {final String action;public Intent(String a){action=a;}public String getAction(){return action;}}',
'xyz/urro/transit/TransitHooks.java':'package xyz.urro.transit; public class TransitHooks {static boolean activityFeature(){return true;}}',
'xyz/urro/transit/GoSimulation.java':'package xyz.urro.transit; public class GoSimulation {static boolean delivering;}',
'xyz/urro/transit/GoModelDiagnostics.java':'package xyz.urro.transit; public class GoModelDiagnostics {static void trace(String a,String b){}}',
'xyz/urro/activityspoof/Transmitter.java':'''package xyz.urro.activityspoof;import android.content.Context;public class Transmitter {
public static int enters,exits;public static void set(Context c,int type,int confidence){if(type!=0||confidence!=100)throw new AssertionError();enters++;}public static void clear(Context c){exits++;}}''',
'com/thetransitapp/droid/shared/service/GoService.java':'''package com.thetransitapp.droid.shared.service;public class GoService {
public static VM e;public static class VM {public Flow e=new Flow();}public static class Flow {public Object value;public Object getValue(){return value;}}}''',
'djinni/java/src/TripDetails.java':'''package djinni.java.src;import java.util.*;public class TripDetails {
public enum Kind {TransitLeg}public enum Path {Start,Riding,End}final boolean active;final Path path;
public TripDetails(boolean active,Path path){this.active=active;this.path=path;}
public Object getGoSummaryCard(){return active?this:null;}public List<Leg> getItems(){return List.of(new Leg(path));}
public String getMainInstruction(){throw new AssertionError("read reminder instead of navigation state");}
public static class Leg {final Path p;Leg(Path p){this.p=p;}public Kind getItemType(){return Kind.TransitLeg;}public List<Segment> getSegments(){return List.of(new Segment(p));}}
public static class Segment {final Path p;Segment(Path p){this.p=p;}public Header getHeaderSection(){return new Header(p);}}
public static class Header {final Path p;Header(Path p){this.p=p;}public Path getPathType(){return p;}}}''',
'android/os/SystemClock.java':'package android.os; public class SystemClock {public static long now;public static long elapsedRealtime(){return now;}}',
'djinni/java/src/GOLiveActivityPlatformData.java':'''package djinni.java.src;public class GOLiveActivityPlatformData {
final Activity a;public GOLiveActivityPlatformData(boolean badge,String main){a=new Activity(new Instruction(badge,main));}
public Activity getAndroidWidget(){return a;}public Activity getMinimized(){return a;}
public static class Activity {final Instruction i;Activity(Instruction i){this.i=i;}public Instruction getInstruction(){return i;}}
public static class Instruction {final boolean b;final Text t;Instruction(boolean b,String m){this.b=b;t=new Text(m);}public Object getFloatingServiceName(){return b?this:null;}public Text getMainInstruction(){return t;}}
public static class Text {final String v;Text(String v){this.v=v;}public String getValue(){return v;}}}''',
'xyz/urro/transit/BackgroundTest.java':'''package xyz.urro.transit;
import android.os.*;import android.content.*;import com.thetransitapp.droid.shared.service.GoService;import djinni.java.src.*;import xyz.urro.activityspoof.Transmitter;
/** Observed on device: in the background GoService keeps publishing GO live models while its TripDetails stays frozen. */
public class BackgroundTest {
static int checks;static void eq(int a,int b){checks++;if(a!=b)throw new AssertionError("expected "+a+" got "+b);}
static Context c=new Context();
static void live(long t,boolean badge,String main){SystemClock.now=t;GoActivityTransmitter.onLive(c,new GOLiveActivityPlatformData(badge,main));Handler.flush();}
static void model(TripDetails t){GoService.e.e.value=t;GoActivityTransmitter.onModel(t);Handler.flush();}
public static void main(String[] a){
 GoService.e=new GoService.VM();GoActivityTransmitter.serviceCommand(new Intent("start-go"));Handler.flush();
 model(new TripDetails(true,TripDetails.Path.Start));eq(0,Transmitter.enters);
 // Screen off from here: TripDetails stays the same stale object.
 live(1000,false,"Go in <b>7</b> min");eq(0,Transmitter.enters);
 live(2000,true,"in 4 min");eq(0,Transmitter.enters); // waiting at the stop has the same structure as riding
 live(3000,true,"Get off in <b>25</b> stops");eq(1,Transmitter.enters); // native boarding, while the stale model says Start
 live(4000,true,"Get off in 24 stops");eq(1,Transmitter.enters);eq(0,Transmitter.exits); // stale model can't undo it
 live(5000,true,"Detour in effect");eq(0,Transmitter.exits); // detour text on the transit leg never ends a ride
 live(6000,true,"Your stop is next!");eq(1,Transmitter.enters);
 live(7000,false,"Walk 4 min");eq(0,Transmitter.exits); // one update isn't settled
 live(7500,false,"Walk 4 min");eq(0,Transmitter.exits); // nor a burst
 live(13000,false,"Walk 3 min");eq(1,Transmitter.exits); // native alighting, background
 // Foreground: a fresh model is authoritative and the same live level can't flap it back.
 live(20000,true,"Get off in 3 stops");eq(2,Transmitter.enters);
 model(new TripDetails(true,TripDetails.Path.Start));eq(2,Transmitter.exits);
 live(21000,true,"Get off in 2 stops");eq(2,Transmitter.enters);
 model(new TripDetails(true,TripDetails.Path.Riding));eq(3,Transmitter.enters);
 // GO ended: late live callbacks can't resurrect the vehicle; a new session starts clean.
 GoActivityTransmitter.serviceDestroyed(new GoService());Handler.flush();eq(3,Transmitter.exits);
 live(30000,true,"Get off in 2 stops");eq(3,Transmitter.enters);
 GoActivityTransmitter.serviceCommand(new Intent("start-go"));Handler.flush();GoService.e=new GoService.VM();GoService.e.e.value=new TripDetails(true,TripDetails.Path.Start);
 live(31000,true,"Get off in 9 stops");eq(4,Transmitter.enters);
 System.out.println("PASS background transmitter: "+checks+" assertions (frozen trip model, waiting vs riding, detour, settled alighting, fresh model authority, GO end)");
}}''',
'xyz/urro/transit/OnboardTest.java':'''package xyz.urro.transit;
import android.os.Handler;import android.content.*;import com.thetransitapp.droid.shared.service.GoService;import djinni.java.src.TripDetails;import xyz.urro.activityspoof.Transmitter;
public class OnboardTest {
static int checks;static void eq(int a,int b){checks++;if(a!=b)throw new AssertionError("expected "+a+" got "+b);}
static void update(Object x){GoService.e.e.value=x;GoActivityTransmitter.onLive(c,new Object());Handler.flush();}
static Context c=new Context();
public static void main(String[] a){
 GoService.e=new GoService.VM();update(new TripDetails(true,TripDetails.Path.Start));eq(0,Transmitter.enters);
 update(new TripDetails(true,TripDetails.Path.Riding));eq(1,Transmitter.enters);
 // A detour or translated reminder only wakes the observer; it cannot change native state.
 GoActivityTransmitter.onLive(c,"Detour in effect");Handler.flush();eq(0,Transmitter.exits);
 GoActivityTransmitter.onLive(c,"Déviation");Handler.flush();eq(0,Transmitter.exits);
 // Even a callback from a different itinerary must read the active GoService model.
 GoActivityTransmitter.onModel(new TripDetails(false,TripDetails.Path.Start));Handler.flush();eq(0,Transmitter.exits);
 update(null);eq(0,Transmitter.exits);update(new Object());eq(0,Transmitter.exits);
 update(new TripDetails(true,TripDetails.Path.Riding));eq(1,Transmitter.enters);
 update(new TripDetails(true,TripDetails.Path.Start));eq(1,Transmitter.exits);
 update(new TripDetails(true,TripDetails.Path.Riding));eq(2,Transmitter.enters);
 c.enabled=false;GoActivityTransmitter.preferenceChanged();Handler.flush();eq(2,Transmitter.exits);
 GoActivityTransmitter.init(c);GoActivityTransmitter.onLive(c,new Object());Handler.flush();eq(2,Transmitter.enters); // initialization preserves disabled setting
 c.enabled=true;GoActivityTransmitter.preferenceChanged();Handler.flush();eq(3,Transmitter.enters);
 GoService.e=null;GoActivityTransmitter.serviceCommand(new Intent("com.thetransitapp.droid.shared.service.GoService.ACTION_CLEANUP_AND_STOP"));Handler.flush();eq(3,Transmitter.exits);
 GoActivityTransmitter.serviceCommand(new Intent("start-go"));Handler.flush();
 GoService.e=new GoService.VM();update(null);eq(3,Transmitter.enters); // a new session cannot inherit an old vehicle
 update(new TripDetails(true,TripDetails.Path.Start));eq(3,Transmitter.enters);
 update(new TripDetails(true,TripDetails.Path.Riding));eq(4,Transmitter.enters);
 update(new TripDetails(false,TripDetails.Path.End));eq(4,Transmitter.exits);
 update(new TripDetails(true,TripDetails.Path.Riding));eq(5,Transmitter.enters);
 GoActivityTransmitter.serviceDestroyed(new Object());Handler.flush();eq(4,Transmitter.exits); // other services don't end GO
 GoActivityTransmitter.serviceDestroyed(new GoService());Handler.flush();eq(5,Transmitter.exits);
 // The static model can still be stale after stopSelf. Late callbacks must not resurrect it.
 update(new TripDetails(true,TripDetails.Path.Riding));eq(5,Transmitter.enters);
 GoActivityTransmitter.serviceCommand(new Intent("start-go"));Handler.flush();eq(6,Transmitter.enters);

 System.out.println("PASS native transmitter: "+checks+" assertions (detour, translation, preview, missing data, alighting, cancellation, preferences)");
}}'''
}
with tempfile.TemporaryDirectory() as d:
    d = Path(d)
    for name, text in sources.items():
        p = d/name
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(text)
    real = root/'extensions/extension/src/main/java/xyz/urro/transit'
    subprocess.run(['javac', '-d', str(d/'classes'), *map(str, d.rglob('*.java')),
                    str(real/'GoActivityTransmitter.java'), str(real/'GoVehicleState.java'),
                    str(real/'GoLiveRide.java'), str(real/'GoInstruction.java')], check=True)
    subprocess.run(['java', '-cp', str(d/'classes'), 'xyz.urro.transit.OnboardTest'], check=True)
    subprocess.run(['java', '-cp', str(d/'classes'), 'xyz.urro.transit.BackgroundTest'], check=True)
