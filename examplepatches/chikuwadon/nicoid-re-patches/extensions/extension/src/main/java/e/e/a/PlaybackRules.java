package e.e.a;

/** Platform-independent policy rules, shared by both player modes. */
public final class PlaybackRules {
    public static final float[] SPEEDS=new float[59];
    static {for(int i=0;i<SPEEDS.length;i++)SPEEDS[i]=(i+2)/20f;}
    public static float defaultSpeed(String value) {
        try {float result=Float.parseFloat(value);if(!Float.isNaN(result)&&!Float.isInfinite(result)&&result>=.1f&&result<=3f)return Math.round(result*20)/20f;}catch(RuntimeException ignored){}
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
