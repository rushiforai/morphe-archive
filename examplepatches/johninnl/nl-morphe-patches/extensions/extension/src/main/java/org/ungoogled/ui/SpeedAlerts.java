package org.ungoogled.ui;

/**
 * Speeding chime, as Waze has: a short chime the moment the speed passes the speed limit by the
 * chosen margin. Maps itself only turns its speedometer red, at 5 mph / 10 km/h over. The patch
 * reports every change of the navigation speedometer's speed or speed limit here; after a chime it
 * stays quiet until the speed is back down to the limit, and for 20 seconds at least.
 */
public final class SpeedAlerts {
    private SpeedAlerts() {}

    /** When it chimes: never, past the limit, when the speedometer turns red, 10 mph / 20 km/h over. */
    public static final int OFF = 0, AT_LIMIT = 1, RED = 2, FAR = 3;

    /** Over the margin since the last chime. */
    private static boolean over;
    private static long chimedAt;

    /** Rewritten by the patch: the speedometer's speed, in its own units; -1 when unknown. */
    static int speed(Object speedometer) { return -1; }

    /** Rewritten by the patch: the speed limit, in the same units; -1 when there is none. */
    static int limit(Object speedometer) { return -1; }

    /** Rewritten by the patch: whether those units are km/h. */
    static boolean kmh(Object speedometer) { return false; }

    /** Rewritten by the patch: incoming units, or the holder's units when Maps keeps them. */
    static int nativeUnits(Object wrapper, Object units) { return -1; }

    /** Every native setter call is an observation, even when its displayed integer stays unchanged. */
    public static void onNativeSpeedMps(float speed) { ExternalTelemetry.nativeSpeedMps(speed); }
    public static void onNativeLimitInput(Object wrapper, int limit, Object units) {
        int selected = nativeUnits(wrapper, units);
        if (selected >= 0) ExternalTelemetry.nativeLimit(limit, selected == 1);
    }

    /** Separate native setters preserve each field's observation clock. */
    public static void onCurrentSpeedometer(Object speedometer) {
        try {if(speedometer!=null)ExternalTelemetry.nativeSpeed(speed(speedometer),kmh(speedometer));}catch(Throwable ignored){}
        onSpeedometer(speedometer);
    }
    public static void onLimitSpeedometer(Object speedometer) {
        try {if(speedometer!=null)ExternalTelemetry.nativeLimit(limit(speedometer),kmh(speedometer));}catch(Throwable ignored){}
        onSpeedometer(speedometer);
    }
    /** From the navigation speedometer, each time its speed or speed limit changes. */
    public static void onSpeedometer(Object speedometer) {
        if(ExternalTelemetry.modern()){onTelemetry();return;}
        try {check(speedometer==null?-1:speed(speedometer),speedometer==null?-1:limit(speedometer),speedometer!=null&&kmh(speedometer));}
        catch(Throwable t){android.util.Log.w("UA","speeding chime",t);}
    }
    static void onTelemetry(){
        boolean kmh=!PowerSaving.miles();Float current=ExternalTelemetry.speedMps();Double maximum=ExternalTelemetry.limitKmh();
        check(current==null?-1:Math.round(current*(kmh?3.6f:2.236936f)),maximum==null?-1:(int)Math.round(kmh?maximum:maximum/1.609344),kmh);
    }
    private static void check(int speed,int limit,boolean kmh){
        int mode=Shapes.SPEEDING_CHIME;
        if(mode==OFF||speed<0||limit<=0){over=false;return;}
        long now=android.os.SystemClock.elapsedRealtime();
        if(!over&&speed>=limit+margin(mode,kmh)&&now-chimedAt>=20000L){over=true;chimedAt=now;Chime.speeding();}
        else if(over&&speed<=limit)over=false;
    }

    /** How far over the limit [mode] chimes, in the speedometer's units. */
    static int margin(int mode, boolean kmh) {
        switch (mode) {
            case AT_LIMIT: return 1;
            case FAR: return kmh ? 20 : 10;
            default: return kmh ? 10 : 5;   // RED: where Maps turns the speedometer red
        }
    }
}
