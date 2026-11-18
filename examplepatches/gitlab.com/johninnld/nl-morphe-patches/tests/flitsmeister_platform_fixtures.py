"""Synthetic platform boundaries for actual Flitsmeister callback bodies on ART.

The parent runner replaces the Java callback stubs with production/source or
emitted smali. Network/Joda/navigation dependencies below are deliberate test
boundaries: these cases prove callback decisions, delegation and error handling,
not Android network services, native navigation or the Joda timezone database.
"""

CALLBACKS = {
    'timezone': {
        'constant': 'timeZoneCallbackCode',
        'owner': 'net/danlew/android/joda/TimeZoneChangedReceiver',
        'signature': 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
        'registers': 8,
        'parent': 'android/content/BroadcastReceiver',
        'fields': '',
        'helpers': r'''
.method public static synthetic getStringExtra$001(Landroid/content/Intent;Ljava/lang/String;)Ljava/lang/String;
 .registers 3
 invoke-virtual {p0, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
 move-result-object v0
 return-object v0
.end method
.method public static synthetic append$002(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
 .registers 3
 invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
 move-result-object v0
 return-object v0
.end method
.method public static synthetic append$003(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
 .registers 3
 invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
 move-result-object v0
 return-object v0
.end method
.method public static synthetic toString$004(Ljava/lang/StringBuilder;)Ljava/lang/String;
 .registers 2
 invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
 move-result-object v0
 return-object v0
.end method
''',
    },
    'location-mode': {
        'constant': 'locationModeCallbackCode',
        'owner': 'hza',
        'signature': 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
        'registers': 8,
        'parent': 'android/content/BroadcastReceiver',
        'fields': '.field public a:Li0d$a;\n.field public b:Leg7;',
        'helpers': r'''
.method public static synthetic b$001(Llza;)Z
 .registers 2
 invoke-interface {p0}, Llza;->b()Z
 move-result v0
 return v0
.end method
.method public static synthetic b$002(Li0d$a;Ljava/lang/Object;)V
 .registers 2
 invoke-virtual {p0, p1}, Li0d$a;->b(Ljava/lang/Object;)V
 return-void
.end method
''',
    },
    'map-connectivity': {
        'constant': 'mapConnectivityCallbackCode',
        'owner': 'org/maplibre/android/net/ConnectivityReceiver',
        'signature': 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
        'registers': 8,
        'parent': 'android/content/BroadcastReceiver',
        'fields': '.field public connected:Ljava/lang/Boolean;',
        # Original private signatures, with their Android/native leaf operations
        # replaced by controllable boundaries. Original public bridges are kept.
        'helpers': r'''
.method private isNetworkActive()Z
 .registers 2
 invoke-static {}, Lorg/maplibre/android/net/FixtureNetwork;->isNetworkActive()Z
 move-result v0
 return v0
.end method
.method private notifyListeners(Z)V
 .registers 2
 invoke-static {p1}, Lorg/maplibre/android/net/FixtureNetwork;->notifyListeners(Z)V
 return-void
.end method
.method public static synthetic isNetworkActive$001(Lorg/maplibre/android/net/ConnectivityReceiver;)Z
 .registers 2
 invoke-direct {p0}, Lorg/maplibre/android/net/ConnectivityReceiver;->isNetworkActive()Z
 move-result v0
 return v0
.end method
.method public static synthetic notifyListeners$002(Lorg/maplibre/android/net/ConnectivityReceiver;Z)V
 .registers 2
 invoke-direct {p0, p1}, Lorg/maplibre/android/net/ConnectivityReceiver;->notifyListeners(Z)V
 return-void
.end method
''',
    },
    'navigation-end': {
        'constant': 'navigationEndCallbackCode',
        'owner': 'org/maplibre/navigation/android/navigation/v5/navigation/MapLibreNavigationNotification$1',
        'signature': 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
        'registers': 8,
        'parent': 'android/content/BroadcastReceiver',
        'fields': '.field public this$0:Lorg/maplibre/navigation/android/navigation/v5/navigation/MapLibreNavigationNotification;',
        'helpers': '',
    },
    'night-mode': {
        'constant': 'nightModeCallbackCode',
        'owner': 'androidx/appcompat/app/AppCompatDelegateImpl$AutoNightModeManager$1',
        'signature': 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
        'registers': 8,
        'parent': 'android/content/BroadcastReceiver',
        'fields': '.field public this$1:Landroidx/appcompat/app/AppCompatDelegateImpl$AutoNightModeManager;',
        'helpers': r'''
.method public static synthetic onChange$001(Landroidx/appcompat/app/AppCompatDelegateImpl$AutoNightModeManager;)V
 .registers 1
 invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl$AutoNightModeManager;->onChange()V
 return-void
.end method
''',
    },
}


JAVA = {
    'net/danlew/android/joda/TimeZoneChangedReceiver.java': r'''
package net.danlew.android.joda;
public class TimeZoneChangedReceiver extends android.content.BroadcastReceiver {
 public void onReceive(android.content.Context context,android.content.Intent intent){}
}
''',
    'org/joda/time/DateTimeZone.java': r'''
package org.joda.time;
public final class DateTimeZone {
 public final String id;
 public static DateTimeZone current;
 public static RuntimeException conversionFailure,updateFailure;
 public static int conversions,updateAttempts,updates;
 public static String convertedId;
 public DateTimeZone(String id){this.id=id;}
 public static DateTimeZone forTimeZone(java.util.TimeZone zone){
  conversions++;convertedId=zone.getID();
  if(conversionFailure!=null)throw conversionFailure;
  return new DateTimeZone(zone.getID());
 }
 public static DateTimeZone forID(String id){return new DateTimeZone(id);}
 public static void setDefault(DateTimeZone zone){
  updateAttempts++;if(updateFailure!=null)throw updateFailure;current=zone;updates++;
 }
 public static DateTimeZone getDefault(){return current;}
 public static void reset(){
  current=new DateTimeZone("unchanged");conversionFailure=null;updateFailure=null;
  conversions=0;updateAttempts=0;updates=0;convertedId=null;
 }
}
''',
    'lza.java': r'''
public interface lza {boolean a();boolean b();}
''',
    'jza.java': r'''
public final class jza {
 public final android.content.Context a;public final lza b;
 public jza(android.content.Context context,lza status){a=context;b=status;}
}
''',
    'eg7.java': r'''
public final class eg7 {public Object a;}
''',
    'i0d.java': r'''
public final class i0d {
 public static final class a {
  public final java.util.List<Object> events=new java.util.ArrayList<>();
  public RuntimeException failure;
  public void b(Object event){if(failure!=null)throw failure;events.add(event);}
 }
}
''',
    'hza.java': r'''
public final class hza extends android.content.BroadcastReceiver {
 public i0d.a a;public eg7 b;
 public void onReceive(android.content.Context context,android.content.Intent intent){}
}
''',
    'org/maplibre/android/net/ConnectivityReceiver.java': r'''
package org.maplibre.android.net;
public class ConnectivityReceiver extends android.content.BroadcastReceiver {
 public Boolean connected;
 public void onReceive(android.content.Context context,android.content.Intent intent){}
}
''',
    'org/maplibre/android/net/FixtureNetwork.java': r'''
package org.maplibre.android.net;
public final class FixtureNetwork {
 public static boolean available;public static int queries;
 public static RuntimeException queryFailure,listenerFailure;
 public static final java.util.List<Boolean> events=new java.util.ArrayList<>();
 public static void reset(){available=false;queries=0;queryFailure=null;listenerFailure=null;events.clear();}
 public static boolean isNetworkActive(){queries++;if(queryFailure!=null)throw queryFailure;return available;}
 public static void notifyListeners(boolean value){if(listenerFailure!=null)throw listenerFailure;events.add(value);}
}
''',
    'org/maplibre/navigation/android/navigation/v5/navigation/MapLibreNavigation.java': r'''
package org.maplibre.navigation.android.navigation.v5.navigation;
public class MapLibreNavigation {
 public int stops;public RuntimeException failure;
 public void stopNavigation(){if(failure!=null)throw failure;stops++;}
}
''',
    'org/maplibre/navigation/android/navigation/v5/navigation/MapLibreNavigationNotification.java': r'''
package org.maplibre.navigation.android.navigation.v5.navigation;
public class MapLibreNavigationNotification {
 public MapLibreNavigation mapLibreNavigation;public int callbacks;
 public static void a(MapLibreNavigationNotification owner){owner.onEndNavigationBtnClick();}
 private void onEndNavigationBtnClick(){callbacks++;if(mapLibreNavigation!=null)mapLibreNavigation.stopNavigation();}
}
''',
    'org/maplibre/navigation/android/navigation/v5/navigation/MapLibreNavigationNotification$1.java': r'''
package org.maplibre.navigation.android.navigation.v5.navigation;
public class MapLibreNavigationNotification$1 extends android.content.BroadcastReceiver {
 public MapLibreNavigationNotification this$0;
 public void onReceive(android.content.Context context,android.content.Intent intent){}
}
''',
    'androidx/appcompat/app/AppCompatDelegateImpl$AutoNightModeManager.java': r'''
package androidx.appcompat.app;
public class AppCompatDelegateImpl$AutoNightModeManager {
 public int changes;public RuntimeException failure;
 public void onChange(){if(failure!=null)throw failure;changes++;}
}
''',
    'androidx/appcompat/app/AppCompatDelegateImpl$AutoNightModeManager$1.java': r'''
package androidx.appcompat.app;
public class AppCompatDelegateImpl$AutoNightModeManager$1 extends android.content.BroadcastReceiver {
 public AppCompatDelegateImpl$AutoNightModeManager this$1;
 public void onReceive(android.content.Context context,android.content.Intent intent){}
}
''',
}


PROBE_MEMBERS = r'''
 static void timezone(){
  final java.util.TimeZone saved=java.util.TimeZone.getDefault();
  try{
   test("timezone callback applies the system default, not the broadcast extra",()->{
    java.util.TimeZone.setDefault(java.util.TimeZone.getTimeZone("Europe/Amsterdam"));
    org.joda.time.DateTimeZone.reset();
    android.content.Intent intent=new android.content.Intent("android.intent.action.TIMEZONE_CHANGED");
    intent.putExtra("time-zone","America/New_York");
    new net.danlew.android.joda.TimeZoneChangedReceiver().onReceive(null,intent);
    check(org.joda.time.DateTimeZone.updates==1,"system default not updated exactly once");
    check("Europe/Amsterdam".equals(org.joda.time.DateTimeZone.current.id),"broadcast extra incorrectly selected timezone");
   });
   test("missing and invalid timezone extras still use the system default",()->{
    java.util.TimeZone.setDefault(java.util.TimeZone.getTimeZone("Asia/Tokyo"));
    net.danlew.android.joda.TimeZoneChangedReceiver receiver=new net.danlew.android.joda.TimeZoneChangedReceiver();
    org.joda.time.DateTimeZone.reset();receiver.onReceive(null,new android.content.Intent());
    check(org.joda.time.DateTimeZone.updates==1&&"Asia/Tokyo".equals(org.joda.time.DateTimeZone.current.id),"missing extra prevented system timezone update");
    android.content.Intent intent=new android.content.Intent();intent.putExtra("time-zone","not/a/real-zone");
    receiver.onReceive(null,intent);
    check(org.joda.time.DateTimeZone.updates==2&&"Asia/Tokyo".equals(org.joda.time.DateTimeZone.current.id),"invalid extra controlled system timezone update");
   });
   test("timezone conversion IllegalArgumentException is swallowed without an update",()->{
    org.joda.time.DateTimeZone.reset();org.joda.time.DateTimeZone.conversionFailure=new IllegalArgumentException("mapping failed");
    new net.danlew.android.joda.TimeZoneChangedReceiver().onReceive(null,new android.content.Intent());
    check(org.joda.time.DateTimeZone.conversions==1&&org.joda.time.DateTimeZone.updateAttempts==0,"conversion failure did not preserve boundary");
    check("unchanged".equals(org.joda.time.DateTimeZone.current.id),"failed conversion changed default");
   });
   test("timezone update IllegalArgumentException is swallowed",()->{
    org.joda.time.DateTimeZone.reset();org.joda.time.DateTimeZone.updateFailure=new IllegalArgumentException("update failed");
    new net.danlew.android.joda.TimeZoneChangedReceiver().onReceive(null,new android.content.Intent());
    check(org.joda.time.DateTimeZone.updateAttempts==1&&org.joda.time.DateTimeZone.updates==0,"update exception boundary lost");
   });
   test("timezone SecurityException remains visible",()->{
    org.joda.time.DateTimeZone.reset();SecurityException expected=new SecurityException("not permitted");
    org.joda.time.DateTimeZone.updateFailure=expected;
    try{new net.danlew.android.joda.TimeZoneChangedReceiver().onReceive(null,new android.content.Intent());throw new AssertionError("security failure swallowed");}
    catch(SecurityException actual){check(actual==expected,"security failure replaced");}
   });
   test("unexpected timezone conversion failures propagate",()->{
    org.joda.time.DateTimeZone.reset();IllegalStateException expected=new IllegalStateException("unexpected mapping failure");
    org.joda.time.DateTimeZone.conversionFailure=expected;
    try{new net.danlew.android.joda.TimeZoneChangedReceiver().onReceive(null,new android.content.Intent());throw new AssertionError("unexpected failure swallowed");}
    catch(IllegalStateException actual){check(actual==expected,"unexpected failure replaced");}
   });
   test("null timezone intent fails before entering conversion",()->{
    org.joda.time.DateTimeZone.reset();
    try{new net.danlew.android.joda.TimeZoneChangedReceiver().onReceive(null,null);throw new AssertionError("null intent swallowed");}
    catch(NullPointerException expected){check(org.joda.time.DateTimeZone.conversions==0,"intent extraction moved inside timezone conversion");}
   });
  }finally{java.util.TimeZone.setDefault(saved);org.joda.time.DateTimeZone.reset();}
 }
 static final class LocationProvider implements lza {
  boolean enabled;int queries,permissionQueries;RuntimeException failure;
  public boolean a(){permissionQueries++;return false;}
  public boolean b(){queries++;if(failure!=null)throw failure;return enabled;}
 }
 static hza locationReceiver(LocationProvider provider,i0d.a emitter){
  eg7 capture=new eg7();capture.a=new jza(null,provider);
  hza receiver=new hza();receiver.b=capture;receiver.a=emitter;return receiver;
 }
 static void locationMode(){
  test("location callback emits fresh true and false provider results",()->{
   LocationProvider provider=new LocationProvider();i0d.a emitter=new i0d.a();hza receiver=locationReceiver(provider,emitter);
   provider.enabled=true;receiver.onReceive(null,new android.content.Intent("android.location.MODE_CHANGED"));
   provider.enabled=false;receiver.onReceive(null,new android.content.Intent("android.location.MODE_CHANGED"));
   check(provider.queries==2&&provider.permissionQueries==0,"wrong location provider or cached state used");
   check(emitter.events.size()==2&&emitter.events.get(0)==Boolean.TRUE&&emitter.events.get(1)==Boolean.FALSE,"location state not forwarded exactly");
  });
  test("location callback invents no action or null-input guard",()->{
   LocationProvider provider=new LocationProvider();i0d.a emitter=new i0d.a();hza receiver=locationReceiver(provider,emitter);
   receiver.onReceive(null,null);receiver.onReceive(null,new android.content.Intent("unrelated"));
   check(provider.queries==2&&emitter.events.size()==2,"new filtering changed registered receiver semantics");
  });
  test("location provider failure is propagated before emission",()->{
   LocationProvider provider=new LocationProvider();i0d.a emitter=new i0d.a();RuntimeException expected=new IllegalStateException("provider failed");provider.failure=expected;
   try{locationReceiver(provider,emitter).onReceive(null,null);throw new AssertionError("provider failure swallowed");}
   catch(RuntimeException actual){check(actual==expected&&emitter.events.isEmpty(),"provider failure replaced or emitted");}
  });
  test("location emitter failure is not suppressed",()->{
   LocationProvider provider=new LocationProvider();i0d.a emitter=new i0d.a();RuntimeException expected=new IllegalStateException("emitter failed");emitter.failure=expected;
   try{locationReceiver(provider,emitter).onReceive(null,null);throw new AssertionError("emitter failure swallowed");}
   catch(RuntimeException actual){check(actual==expected&&provider.queries==1,"emitter failure replaced");}
  });
 }
 static void mapConnectivity(){
  test("explicit false and true map overrides suppress connectivity broadcasts",()->{
   org.maplibre.android.net.FixtureNetwork.reset();
   org.maplibre.android.net.ConnectivityReceiver receiver=new org.maplibre.android.net.ConnectivityReceiver();
   receiver.connected=Boolean.FALSE;receiver.onReceive(null,null);
   receiver.connected=Boolean.TRUE;receiver.onReceive(null,new android.content.Intent("fixture.changed"));
   check(org.maplibre.android.net.FixtureNetwork.queries==0&&org.maplibre.android.net.FixtureNetwork.events.isEmpty(),"explicit map override was ignored or forwarded");
  });
  test("unoverridden map state queries and notifies on every broadcast",()->{
   org.maplibre.android.net.FixtureNetwork.reset();
   org.maplibre.android.net.ConnectivityReceiver receiver=new org.maplibre.android.net.ConnectivityReceiver();
   org.maplibre.android.net.FixtureNetwork.available=false;receiver.onReceive(null,null);
   org.maplibre.android.net.FixtureNetwork.available=true;receiver.onReceive(null,new android.content.Intent("unrelated"));
   check(org.maplibre.android.net.FixtureNetwork.queries==2,"map broadcasts did not query real state exactly once");
   check(org.maplibre.android.net.FixtureNetwork.events.size()==2&&org.maplibre.android.net.FixtureNetwork.events.get(0)==Boolean.FALSE&&org.maplibre.android.net.FixtureNetwork.events.get(1)==Boolean.TRUE,"map network state was invented or discarded");
  });
  test("clearing a map override resumes actual state propagation",()->{
   org.maplibre.android.net.FixtureNetwork.reset();
   org.maplibre.android.net.ConnectivityReceiver receiver=new org.maplibre.android.net.ConnectivityReceiver();
   receiver.connected=Boolean.TRUE;receiver.onReceive(null,null);receiver.connected=null;receiver.onReceive(null,null);
   check(org.maplibre.android.net.FixtureNetwork.queries==1&&org.maplibre.android.net.FixtureNetwork.events.size()==1&&org.maplibre.android.net.FixtureNetwork.events.get(0)==Boolean.FALSE,"cleared override retained fabricated online state");
  });
  test("map network query failure remains visible",()->{
   org.maplibre.android.net.FixtureNetwork.reset();RuntimeException expected=new IllegalStateException("network failed");org.maplibre.android.net.FixtureNetwork.queryFailure=expected;
   try{new org.maplibre.android.net.ConnectivityReceiver().onReceive(null,null);throw new AssertionError("network failure swallowed");}
   catch(RuntimeException actual){check(actual==expected&&org.maplibre.android.net.FixtureNetwork.events.isEmpty(),"network failure replaced or notified");}
  });
  test("map listener failure remains visible",()->{
   org.maplibre.android.net.FixtureNetwork.reset();RuntimeException expected=new IllegalStateException("listener failed");org.maplibre.android.net.FixtureNetwork.listenerFailure=expected;
   try{new org.maplibre.android.net.ConnectivityReceiver().onReceive(null,null);throw new AssertionError("listener failure swallowed");}
   catch(RuntimeException actual){check(actual==expected&&org.maplibre.android.net.FixtureNetwork.queries==1,"listener failure replaced");}
  });
 }
 static org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigationNotification$1 navigationReceiver(
   org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigationNotification owner){
  org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigationNotification$1 receiver=
   new org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigationNotification$1();
  receiver.this$0=owner;return receiver;
 }
 static void navigationEnd(){
  test("navigation end delegates to real stop through the retained bridge",()->{
   org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigationNotification owner=
    new org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigationNotification();
   owner.mapLibreNavigation=new org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigation();
   org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigationNotification$1 receiver=navigationReceiver(owner);
   receiver.onReceive(null,null);receiver.onReceive(null,new android.content.Intent("fixture.changed"));
   check(owner.callbacks==2&&owner.mapLibreNavigation.stops==2,"navigation stop callback was skipped, filtered or duplicated");
  });
  test("navigation end retains the original helper null safety",()->{
   org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigationNotification owner=
    new org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigationNotification();
   navigationReceiver(owner).onReceive(null,null);check(owner.callbacks==1,"null-safe navigation helper was not called");
  });
  test("navigation stop failure propagates unchanged",()->{
   org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigationNotification owner=
    new org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigationNotification();
   owner.mapLibreNavigation=new org.maplibre.navigation.android.navigation.v5.navigation.MapLibreNavigation();
   RuntimeException expected=new IllegalStateException("stop failed");owner.mapLibreNavigation.failure=expected;
   try{navigationReceiver(owner).onReceive(null,null);throw new AssertionError("stop failure swallowed");}
   catch(RuntimeException actual){check(actual==expected&&owner.callbacks==1,"stop failure replaced");}
  });
 }
 static void nightMode(){
  test("night mode refreshes once for every delivered broadcast",()->{
   androidx.appcompat.app.AppCompatDelegateImpl$AutoNightModeManager owner=
    new androidx.appcompat.app.AppCompatDelegateImpl$AutoNightModeManager();
   androidx.appcompat.app.AppCompatDelegateImpl$AutoNightModeManager$1 receiver=
    new androidx.appcompat.app.AppCompatDelegateImpl$AutoNightModeManager$1();receiver.this$1=owner;
   receiver.onReceive(null,null);receiver.onReceive(null,new android.content.Intent("unrelated"));
   check(owner.changes==2,"night mode refresh was filtered or lost");
  });
  test("night mode refresh failure remains visible",()->{
   androidx.appcompat.app.AppCompatDelegateImpl$AutoNightModeManager owner=
    new androidx.appcompat.app.AppCompatDelegateImpl$AutoNightModeManager();
   RuntimeException expected=new IllegalStateException("night mode failed");owner.failure=expected;
   androidx.appcompat.app.AppCompatDelegateImpl$AutoNightModeManager$1 receiver=
    new androidx.appcompat.app.AppCompatDelegateImpl$AutoNightModeManager$1();receiver.this$1=owner;
   try{receiver.onReceive(null,null);throw new AssertionError("night mode failure swallowed");}
   catch(RuntimeException actual){check(actual==expected,"night mode failure replaced");}
  });
 }
'''


CASES = {
    'timezone': 'timezone();',
    'location-mode': 'locationMode();',
    'map-connectivity': 'mapConnectivity();',
    'navigation-end': 'navigationEnd();',
    'night-mode': 'nightMode();',
}
