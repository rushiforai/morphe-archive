package e.e.a;

import java.util.ArrayList;
import java.util.Random;

/** Original, offline bicycle runner physics in logical screen units. */
public final class BikeRunModel {
    public static final float RIDER_X = 120, GRAVITY = 1600, JUMP = -650;
    public static final float START_SPEED = 350, EDGE_GRACE = .10f;
    public static final class Hazard {
        public float x;
        public final float width, height;
        public final boolean gap;
        Hazard(float x, float width, float height, boolean gap) { this.x=x; this.width=width; this.height=height; this.gap=gap; }
    }
    public final ArrayList<Hazard> hazards = new ArrayList<>();
    private final Random random;
    public float y, velocity, distance, spawn;
    private float gapTime;
    private int jumpsUsed;
    public boolean started, over;
    public BikeRunModel(long seed) { random = new Random(seed); reset(); }
    public void reset() { hazards.clear(); y=velocity=distance=gapTime=0; spawn=700; jumpsUsed=0; started=over=false; }
    // Smooth hill, then a level section. Screen and physics share this profile.
    public static float terrain(float worldX) {
        if (worldX<=600) return 0;
        float phase=(worldX-600)%1400;
        if (phase>=1000) return 0;
        return -35*(1-(float)Math.cos(phase*Math.PI*2/1000));
    }
    public float groundAt(float screenX) { return terrain(distance+screenX); }
    public float slopeAt(float screenX) { return (groundAt(screenX+4)-groundAt(screenX-4))/8; }
    public float speed() { return START_SPEED+Math.min(distance/100,150); }
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
        // A grounded bicycle follows slopes. An airborne bicycle keeps its world height.
        if (y<0 || velocity<0) {
            y+=oldGround-groundAt(RIDER_X);
            velocity+=GRAVITY*dt; y+=velocity*dt;
            if (y>=0) { y=0; velocity=0; }
        }
        if (spawn<=0) {
            boolean gap=random.nextBoolean();
            // Introduce double-jump challenges after the opening section.
            boolean tall = distance > 1000 && random.nextInt(4) == 0;
            float width = gap ? (tall ? speed() * .95f : 115 + random.nextInt(40)) : 36 + random.nextInt(22);
            float height = gap ? 0 : tall ? 165 + random.nextInt(16) : 28 + random.nextInt(27);
            hazards.add(new Hazard(760, width, height, gap));
            // Leave room to land and recharge both jumps before the next obstacle.
            spawn=Math.max(440 + random.nextInt(220), width + speed() * 1.25f);
        }
        boolean unsupported=false;
        for (int n=hazards.size()-1; n>=0; n--) {
            Hazard h=hazards.get(n); h.x-=movement;
            if (h.gap) {
                // Inset cliff edges and allow a brief last-moment jump.
                if (RIDER_X>h.x+14 && RIDER_X<h.x+h.width-14 && y>=-6 && velocity>=0) unsupported=true;
            } else {
                float base=groundAt(h.x+h.width/2)-groundAt(RIDER_X);
                // Collision box is smaller than the visible bicycle and obstacle.
                if (RIDER_X+14>h.x+8 && RIDER_X-14<h.x+h.width-8 && y>base-h.height+10) over=true;
            }
            if (h.x+h.width<0) hazards.remove(n);
        }
        gapTime=unsupported?gapTime+dt:0;
        if (!unsupported && y==0 && velocity==0) jumpsUsed=0;
        if (gapTime>EDGE_GRACE) over=true;
    }
    public int score() { return (int)(distance/10); }
}

