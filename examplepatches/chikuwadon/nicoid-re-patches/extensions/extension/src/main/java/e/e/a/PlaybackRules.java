package e.e.a;

/** Platform-independent policy rules, shared by both player modes. */
public final class PlaybackRules {
    public static final float[] SPEEDS={.5f,.75f,1f,1.15f,1.25f,1.4f,1.5f,1.75f,2f};
    public static float defaultSpeed(String value) {
        try {float result=Float.parseFloat(value);for(float speed:SPEEDS)if(speed==result)return result;}catch(RuntimeException ignored){}
        return 1f;
    }
    public static long checkpoint(long position,long duration) {
        if(position<0)return -1;
        return duration>0 && position>=duration-2000?0:position;
    }
    public static boolean canRestore(long position,long duration,long current,long transfer) {
        return position>0 && current<1000 && transfer<=0 && (duration<=0 || position<duration-2000);
    }
    public static int version(Object value) {
        if(value instanceof Number)return ((Number)value).intValue();
        try{return Integer.parseInt(String.valueOf(value));}catch(RuntimeException ignored){return 2;}
    }
}
