package org.ungoogled.ui;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.location.Location;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/** Local navigation observations shared with De-Waze and Flitsmeister, serialized on the UI thread. */
public final class ExternalTelemetry {
    private ExternalTelemetry() {}
    static final String ACTION="nl.johninnl.navigation.NAVIGATION_STATE";
    static final String REQUEST="nl.johninnl.navigation.NAVIGATION_STATE_REQUEST";
    static final String KEY_SOURCE="external_navigation_source", KEY_WIDGET="external_navigation_widget";
    static final String LEGACY="waze_bridge";
    static final String[] SOURCES={"",LEGACY,TelemetryStore.WAZE,TelemetryStore.FLITSMEISTER};
    static final String[] LABELS={"Off · Google Maps", "Waze · Share alerts with Maps", "De-Waze · navigation data", "Flitsmeister · navigation data"};
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static TelemetryStore store=new TelemetryStore();
    private static final RoadWarningEngine warnings=new RoadWarningEngine();
    private static Context app;
    private static String source="",publisherSession="",warning="";
    private static boolean registered,navigating;
    private static Location fix;
    private static long fixAt=-1,nativeSpeedAt=-1,nativeLimitAt=-1;
    private static Double nativeSpeed,nativeLimit;
    private static WeakReference<Activity> foreground=new WeakReference<>(null);
    private static CompactSpeedView widget;
    private static View hiddenBadge;
    private static String pinSignature="";

    private static SharedPreferences prefs(Context c){return c.getSharedPreferences(Shapes.PREFS,Context.MODE_PRIVATE);}
    static String source(Context c){return prefs(c).getString(KEY_SOURCE,prefs(c).getBoolean(WazeAlerts.KEY_ON,false)?LEGACY:"");}
    static int sourceIndex(Context c){String value=source(c);for(int i=0;i<SOURCES.length;i++)if(SOURCES[i].equals(value))return i;return 0;}
    static boolean suppressNativeFlock(){return modern()&&store.suppressNativeFlock(SystemClock.elapsedRealtime());}
    static boolean legacy(){return LEGACY.equals(source);}
    static boolean modern(){return TelemetryStore.supported(source);}
    static boolean widgetEnabled(Context c){return prefs(c).getBoolean(KEY_WIDGET,true);}
    static void setWidget(Context c,boolean enabled){prefs(c).edit().putBoolean(KEY_WIDGET,enabled).apply();refresh(c);}
    static void select(Context c,String value){
        boolean allowed=false;for(String candidate:SOURCES)if(candidate.equals(value))allowed=true;
        if(!allowed)value="";
        prefs(c).edit().putString(KEY_SOURCE,value).putBoolean(WazeAlerts.KEY_ON,!value.isEmpty()).commit();
        refresh(c);WazeAlerts.refresh(c);SavedOnMap.refresh();
    }
    static void refresh(Context context){
        app=context.getApplicationContext();
        String next=source(context);
        boolean changed=!next.equals(source);
        if(changed){source=next;store=new TelemetryStore();store.select(source);publisherSession="";warnings.reset();warning="";WazeAlerts.resetSource();}
        if(modern()&&!registered){
            IntentFilter filter=new IntentFilter(ACTION);
            if(Build.VERSION.SDK_INT>=33)app.registerReceiver(RECEIVER,filter,Context.RECEIVER_EXPORTED);else app.registerReceiver(RECEIVER,filter);
            registered=true;request();MAIN.removeCallbacks(TICK);MAIN.post(TICK);
        }else if(!modern()&&registered){app.unregisterReceiver(RECEIVER);registered=false;MAIN.removeCallbacks(TICK);removeWidget();}
        if(changed&&registered)request();
        update();
    }
    private static final BroadcastReceiver RECEIVER=new BroadcastReceiver(){
        @Override public void onReceive(Context c,Intent intent){
            if(!ACTION.equals(intent.getAction()))return;
            try{
                Bundle extras=intent.getExtras();if(extras==null)return;
                String sender=Build.VERSION.SDK_INT>=34?getSentFromPackage():intent.getStringExtra("source_package");
                if(Build.VERSION.SDK_INT>=34&&(sender==null||!TelemetryStore.supported(sender)||getSentFromUid()!=c.getPackageManager().getApplicationInfo(sender,0).uid))return;
                Map<String,Object> values=new HashMap<>();for(String key:extras.keySet())values.put(key,extras.get(key));
                if(store.accept(values,sender,SystemClock.elapsedRealtime())){
                    if(source.equals(sender)){
                        String session=intent.getStringExtra("publisher_session_id");
                        if(!session.equals(publisherSession)){publisherSession=session;warnings.reset();}
                    }
                    update();
                }
            }catch(Exception ignored){ /* Reject malformed extras and unknown framework senders. */ }
        }
    };
    static void request(){
        if(app==null||!modern())return;
        app.sendBroadcast(new Intent(REQUEST).setPackage(source).putExtra("from",app.getPackageName()).addFlags(Intent.FLAG_RECEIVER_FOREGROUND));
    }
    static TelemetryStore.View view(){return store.view(SystemClock.elapsedRealtime());}
    static Float speedMps(){Double external=view().currentKmh;if(external!=null)return (float)(external/3.6);if(freshNative(nativeSpeedAt,5000)&&nativeSpeed!=null)return nativeSpeed.floatValue()/3.6f;return null;}
    static Double limitKmh(){Double external=view().limitKmh;return external!=null?external:freshNative(nativeLimitAt,30000)?nativeLimit:null;}
    private static boolean freshNative(long at,long age){long now=SystemClock.elapsedRealtime();return at>=0&&now>=at&&now-at<=age;}
    static void nativeSpeedMps(float speed) {
        nativeSpeedAt=SystemClock.elapsedRealtime();
        nativeSpeed=Float.isFinite(speed)&&speed>=0&&speed<=500/3.6?speed*3.6:null;
    }
    static void nativeSpeed(int speed,boolean kmh){nativeSpeedAt=SystemClock.elapsedRealtime();nativeSpeed=speed>=0&&speed*(kmh?1:1.609344)<=500?speed*(kmh?1.0:1.609344):null;}
    static void nativeLimit(int limit,boolean kmh){nativeLimitAt=SystemClock.elapsedRealtime();nativeLimit=limit>0&&limit*(kmh?1:1.609344)<=500?limit*(kmh?1.0:1.609344):null;}
    static void nativeSpeedometer(int speed,int limit,boolean kmh){nativeSpeed(speed,kmh);nativeLimit(limit,kmh);}

    static void fix(Location value){
        if(value==null)return;long now=SystemClock.elapsedRealtime(),at=value.getElapsedRealtimeNanos()/1000000;
        if(at<0||at<fixAt||at>now||now-at>10000||!Double.isFinite(value.getLatitude())||Math.abs(value.getLatitude())>90||!Double.isFinite(value.getLongitude())||Math.abs(value.getLongitude())>180||(value.hasAccuracy()&&value.getAccuracy()>50))return;
        fix=new Location(value);fixAt=at;
        // A native GPS speed is a fallback only; never infer stationary zero from a missing speed.
        if(value.hasSpeed()&&Float.isFinite(value.getSpeed())&&value.getSpeed()>=0&&value.getSpeed()*3.6<=500){nativeSpeed=value.getSpeed()*3.6;nativeSpeedAt=at;}
        update();
    }
    static void navigating(boolean active){navigating=active;update();}
    static String provider(){return TelemetryStore.FLITSMEISTER.equals(source)?"Flitsmeister":TelemetryStore.WAZE.equals(source)?"De-Waze":LEGACY.equals(source)?"Waze":"Google Maps";}
    static String status(){
        if(!modern())return LEGACY.equals(source)?WazeAlerts.legacyStatus():"Off · Google Maps";
        TelemetryStore.View v=view();
        String out=provider()+(v.external?" · connected":" unavailable · Google Maps fallback");
        if(v.external&&(v.currentKmh==null||v.limitKmh==null))out+=" · Maps where needed";
        if(v.zoneActive)out+="\n"+(v.averageKmh==null?"Observed partial average pending":String.format(Locale.getDefault(),"Observed partial average %.0f km/h",v.averageKmh))+String.format(Locale.getDefault()," · %s%.0f%% · %s remaining",v.progressEstimated?"≈":"",v.progressPercent,distance(v.remainingMeters,PowerSaving.miles()));
        else if(v.approachDistanceMeters!=null)out+="\nAverage-speed zone "+(v.approachEstimated?"≈":"")+distance(v.approachDistanceMeters,PowerSaving.miles())+" ahead";
        return out;
    }
    static String distance(double meters,boolean imperial){
        if(imperial){double miles=meters/1609.344;return miles>=.1?String.format(Locale.getDefault(),"%.1f mi",miles):Math.round(meters*3.28084)+" ft";}
        return meters>=1000?String.format(Locale.getDefault(),"%.1f km",meters/1000):Math.round(meters)+" m";
    }
    static String compactWarning(){return warning;}
    static int kind(String kind){
        switch(kind){case "police":return WazeAlerts.POLICE;case "crash":return WazeAlerts.CRASH;case "hazard":return WazeAlerts.HAZARD;case "jam":return WazeAlerts.JAM;case "closure":return WazeAlerts.CLOSURE;case "camera":case "mobile_camera":return WazeAlerts.CAMERA;case "average_speed_zone":return WazeAlerts.ZONE;case "flock":return WazeAlerts.FLOCK;default:return WazeAlerts.OTHER;}
    }
    static List<WazeAlerts.Alert> mapAlerts(){
        List<WazeAlerts.Alert> out=new ArrayList<>();
        for(TelemetryStore.RoadAlert a:view().alerts)if(Double.isFinite(a.latitude)&&Double.isFinite(a.longitude))out.add(new WazeAlerts.Alert(source+":"+publisherSession+":"+a.kind+":"+a.id,kind(a.kind),a.latitude,a.longitude,a.triggerMeters,a.title,"From "+provider(),true));
        return out;
    }
    private static void update(){
        if(!modern())return;
        TelemetryStore.View v=view();RoadWarningEngine.Fix position=fix==null?null:new RoadWarningEngine.Fix(fix.getLatitude(),fix.getLongitude(),fix.hasBearing()?fix.getBearing():Double.NaN,fix.hasSpeed()?fix.getSpeed():Double.NaN,fixAt);
        // A kind disabled for map pins is disabled for warnings too.
        RoadWarningEngine.Warning ahead=warnings.update(filteredView(v),position,SystemClock.elapsedRealtime());
        warning=ahead==null?"":(ahead.estimated?"≈":"")+distance(ahead.distanceMeters,PowerSaving.miles())+" · "+warningLabel(ahead.kind);
        if(ahead!=null&&WazeAlerts.CHIME&&(navigating||foreground.get()!=null)&&warnings.shouldSpeak(ahead,SystemClock.elapsedRealtime())){
            Chime.alert();if(app!=null)Toast.makeText(app,warningLabel(ahead.kind)+" "+(ahead.estimated?"≈":"")+distance(ahead.distanceMeters,PowerSaving.miles())+" ahead",Toast.LENGTH_LONG).show();
        }
        if(navigating||foreground.get()!=null)SpeedAlerts.onTelemetry();
        StringBuilder signature=new StringBuilder(source).append(':').append(publisherSession).append(':').append(suppressNativeFlock());
        for(TelemetryStore.RoadAlert a:v.alerts)signature.append('|').append(a.id).append(':').append(a.kind).append(':').append(a.latitude).append(':').append(a.longitude).append(':').append(a.title);
        String pins=signature.toString();if(!pins.equals(pinSignature)){pinSignature=pins;SavedOnMap.refresh();}
        render();
    }
    private static TelemetryStore.View filteredView(TelemetryStore.View original){
        return original.withAlerts(alert->(WazeAlerts.KINDS&(1<<kind(alert.kind)))!=0,(WazeAlerts.KINDS&(1<<WazeAlerts.ZONE))!=0);
    }
    private static String warningLabel(String kind){switch(kind){case "average_speed_zone":return "Average-speed zone";case "mobile_camera":return "Mobile camera";case "camera":return "Speed camera";case "police":return "Police";case "closure":return "Road closure";case "jam":return "Traffic jam";case "flock":return "Flock camera";case "crash":return "Crash";default:return "Hazard";}}
    private static final Runnable TICK=new Runnable(){public void run(){if(!registered)return;update();MAIN.postDelayed(this,1000);}};
    static void resume(Activity activity){
        if(activity.getClass().getName().equals("com.google.android.maps.MapsActivity")){foreground=new WeakReference<>(activity);request();render();}
    }
    static void pause(Activity activity){if(foreground.get()==activity){foreground.clear();removeWidget();}}
    private static void removeWidget(){
        if(widget!=null&&widget.getParent() instanceof ViewGroup)((ViewGroup)widget.getParent()).removeView(widget);
        widget=null;if(hiddenBadge!=null){hiddenBadge.setAlpha(1f);hiddenBadge=null;}
    }
    private static void render(){
        Activity activity=foreground.get();if(!modern()||activity==null||!widgetEnabled(activity)){removeWidget();return;}
        ViewGroup content=activity.findViewById(android.R.id.content);if(!(content instanceof FrameLayout))return;
        if(widget==null){widget=new CompactSpeedView(activity);widget.setOnClickListener(v->activity.startActivity(Screens.intent(activity,CustomizationActivity.class).putExtra(CustomizationActivity.EXTRA_PAGE,CustomizationActivity.PAGE_WAZE)));content.addView(widget);}
        float density=activity.getResources().getDisplayMetrics().density;
        FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,ViewGroup.LayoutParams.WRAP_CONTENT,Gravity.BOTTOM|Gravity.START);
        lp.leftMargin=Math.round(16*density);lp.bottomMargin=Math.round(112*density);
        View badge=Shapes.findSpeedBadge(content);
        if(badge!=null){View card=Shapes.badgeCard(badge,content);if(hiddenBadge!=card){if(hiddenBadge!=null)hiddenBadge.setAlpha(1f);hiddenBadge=card;card.setAlpha(0f);}int[] location=new int[2],origin=new int[2];card.getLocationOnScreen(location);content.getLocationOnScreen(origin);lp.leftMargin=Math.max(0,location[0]-origin[0]);lp.bottomMargin=Math.max(Math.round(24*density),content.getHeight()-(location[1]-origin[1]+card.getHeight()));}
        widget.setLayoutParams(lp);widget.refresh(Shapes.navDarkScheme());widget.bringToFront();
    }
}
