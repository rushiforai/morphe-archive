package e.e.a;

import java.util.ArrayList;
import java.util.Random;

/** Original, offline bicycle runner physics in logical screen units. */
public final class BikeRunModel {
    public static final float RIDER_X = 120, GRAVITY = 1600, JUMP = -650;
    public static final float START_SPEED = 440, EDGE_GRACE = .10f;
    public static final class Hazard {
        public float x;
        public final float width, height;
        public final boolean gap;
        public final boolean spikes;
        Hazard(float x, float width, float height, boolean gap) { this(x,width,height,gap,false); }
        Hazard(float x, float width, float height, boolean gap, boolean spikes) { this.x=x; this.width=width; this.height=height; this.gap=gap; this.spikes=spikes; }
    }
    public final ArrayList<Hazard> hazards = new ArrayList<>();
    private final Random random;
    public float y, velocity, distance, spawn;
    private float gapTime;
    private boolean falling;
    private int jumpsUsed;
    public boolean started, over;
    public BikeRunModel(long seed) { random = new Random(seed); reset(); }
    public void reset() { hazards.clear(); y=velocity=distance=gapTime=0; spawn=700; jumpsUsed=0; falling=false; started=over=false; }
    // Hills, platforms and steps use one profile for both drawing and collisions.
    public static float terrain(float worldX) {
        if (worldX<=600) return 0;
        float phase=(worldX-600)%4400;
        if (phase<450) return -180*phase/450;
        if (phase<1850) return -180;
        if (phase<2300) return -180+180*(phase-1850)/450;
        if (phase<2850) return 0;
        if (phase<3110) return -100;
        if (phase<3370) return -200;
        if (phase<3630) return -100;
        return 0;
    }
    /** Check the entire approach, obstacle and landing, including every terrain boundary. */
    public static boolean flatSpan(float start,float end) {
        float base=terrain(start);
        for(float x=start+4;x<end;x+=4)if(Math.abs(terrain(x)-base)>.01f)return false;
        return Math.abs(terrain(end)-base)<=.01f;
    }
    public float placement(float width) {
        float approach=240+speed()*.1f, landing=160+speed()*.1f;
        for(float x=760;x<760+8800;x+=20)
            if(flatSpan(distance+x-approach,distance+x+width+landing))return x;
        return Float.NaN;
    }
    public float groundAt(float screenX) { return terrain(distance+screenX); }
    public float slopeAt(float screenX) { float delta=groundAt(screenX+4)-groundAt(screenX-4); return Math.abs(delta)>8?0:delta/8; }
    public float speed() { return START_SPEED+Math.min(distance/65,280); }
    public void tap() {
        if (over) reset();
        started=true;
        if (jumpsUsed < 2) { velocity=JUMP; gapTime=0; jumpsUsed++; }
    }
    public void step(float dt) {
        if (!started || over || dt<=0) return;
        dt=Math.min(dt, .035f);
        float oldGround=groundAt(RIDER_X);
        float movement=speed()*dt;
        distance+=movement; spawn-=movement;
        float rise=oldGround-groundAt(RIDER_X);
        // A vertical step must be jumped; descending ledges produce a fall.
        if(rise>20 && y>-rise+10){over=true;return;}
        // A grounded bicycle follows slopes. An airborne bicycle keeps its world height.
        if (falling || y<0 || velocity<0 || rise < -20) {
            y+=rise;
            velocity+=GRAVITY*dt; y+=velocity*dt;
            if (!falling && y>=0) { y=0; velocity=0; }
        }
        if (spawn<=0) {
            boolean gap=random.nextBoolean();
            // Introduce double-jump challenges after the opening section.
            boolean tall = distance > 1000 && random.nextInt(4) == 0;
            float width = gap ? (tall ? speed() * .95f : 115 + random.nextInt(40)) : 36 + random.nextInt(22);
            float height = gap ? 0 : tall ? 165 + random.nextInt(16) : 28 + random.nextInt(27);
            boolean spikes=!gap && !tall && random.nextBoolean();
            if(spikes){width=distance>2500?100+random.nextInt(70):60+random.nextInt(40);height=30;}
            // Never fall back to an invalid slope/step after a fixed number of attempts.
            float x=placement(width);
            if(Float.isNaN(x)){spawn=100;return;}
            hazards.add(new Hazard(x+movement, width, height, gap,spikes));
            // Leave room to land and recharge both jumps before the next obstacle.
            spawn=(x-760)+Math.max(440 + random.nextInt(220), width + speed() * 1.25f);
        }
        boolean unsupported=false;
        for (int n=hazards.size()-1; n>=0; n--) {
            Hazard h=hazards.get(n); h.x-=movement;
            if (h.gap) {
                // Inset cliff edges and allow a brief last-moment jump.
                if (RIDER_X>h.x+14 && RIDER_X<h.x+h.width-14) unsupported=true;
            } else {
                float base=groundAt(h.x+h.width/2)-groundAt(RIDER_X);
                // Collision box is smaller than the visible bicycle and obstacle.
                if (RIDER_X+14>h.x+8 && RIDER_X-14<h.x+h.width-8 && y>base-h.height+10) over=true;
            }
            if (h.x+h.width<0) hazards.remove(n);
        }
        if(unsupported && y>=0 && velocity>=0)falling=true;
        gapTime=unsupported?gapTime+dt:0;
        if (!unsupported && !falling && y==0 && velocity==0) jumpsUsed=0;
        if (falling && y>220) over=true;
        if (falling && y<0)falling=false;
    }
    public int score() { return (int)(distance/10); }
}
