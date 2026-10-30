// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

/** 54H: the pause between continuous shell samples ends early when the head unit wakes up.
 * After BYD quickboot Maps is stopped and starts only from the sampler's next provider call. Thread.sleep counts
 * awake time only, so one 60 s sleep that spans car sleep ended 0-60 s after wake (Tang 54F +6.3 s, 54G +47 s).
 * Two signals, because it is unknown whether quickboot suspends the CPU or only turns the screens off:
 * a clock jump (elapsedRealtime gained more than uptimeMillis: the device slept) and interactive false -> true. */
final class VehicleWakeWait {
    /** Poll step; sleep visible as elapsed-uptime gap; at most one sample per MIN_GAP_MS. */
    static final long STEP_MS=1000, JUMP_MS=3000, MIN_GAP_MS=10000;
    static final String PERIOD="period", CLOCK_JUMP="clock_jump", INTERACTIVE="interactive";
    interface Source {
        long elapsed();
        long uptime();
        void sleep(long ms)throws InterruptedException;
        /** null while unknown. */
        Boolean interactive();
    }
    private VehicleWakeWait(){}
    /** Starts right after a sample and returns why the pause ended: PERIOD after exactly PERIOD_MS without a wake. */
    static String await(Source source)throws InterruptedException{
        long start=source.elapsed(),elapsed=start,uptime=source.uptime();
        Boolean was=source.interactive();String wake=null;
        while(true){
            if(wake!=null&&elapsed-start>=MIN_GAP_MS)return wake;
            if(wake==null&&elapsed-start>=VehicleReadingRules.PERIOD_MS)return PERIOD;
            long limit=(wake==null?VehicleReadingRules.PERIOD_MS:MIN_GAP_MS)-(elapsed-start);
            source.sleep(Math.max(1,Math.min(STEP_MS,limit)));
            long nextElapsed=source.elapsed(),nextUptime=source.uptime();Boolean now=source.interactive();
            if(wake==null&&(nextElapsed-elapsed)-(nextUptime-uptime)>JUMP_MS)wake=CLOCK_JUMP;
            else if(wake==null&&Boolean.FALSE.equals(was)&&Boolean.TRUE.equals(now))wake=INTERACTIVE;
            if(now!=null)was=now;
            elapsed=nextElapsed;uptime=nextUptime;
        }
    }
}
