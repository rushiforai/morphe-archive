package e.e.a;

/** Smooth between coarse player position samples; never run past a stalled sample. */
public final class CommentClockRules {
    private long sample=-1, anchor, lastTime;
    private double displayed;
    private float speed=1;
    public synchronized int position(long raw, boolean playing, float rate, long now) {
        raw=Math.max(0,raw); rate=rate>0&&!Float.isNaN(rate)&&!Float.isInfinite(rate)?rate:1;
        double predicted=displayed+Math.max(0,now-lastTime)*speed;
        boolean reset=sample<0||!playing||rate!=speed||now<lastTime||(raw!=sample&&Math.abs(raw-predicted)>250)||raw<sample;
        if(reset){displayed=raw;anchor=now;}
        else if(raw!=sample){displayed=predicted+(raw-predicted)*.2;anchor=now;}
        else displayed=predicted;
        // Position sources may stop advancing while buffering; cap extrapolation.
        displayed=Math.max(raw,Math.min(displayed,raw+Math.min(100,Math.max(0,now-anchor))*rate));
        sample=raw;lastTime=now;speed=rate;
        return (int)Math.min(Integer.MAX_VALUE,displayed);
    }
}
