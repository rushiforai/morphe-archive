package e.e.a;
import java.util.WeakHashMap;
/** Independent 1x animation clock; seek/reset discards per-comment onset anchors. */
public final class CommentMotionRules {
 private long now,advance;private int actual=-1;private float visual,rate=1;private boolean playing;private final WeakHashMap<Object,Float> starts=new WeakHashMap<>();
 public synchronized void frame(long time,int videoPosition,float speed,boolean running){long dt=actual<0?0:Math.max(0,time-now);speed=speed>0&&!Float.isNaN(speed)&&!Float.isInfinite(speed)?speed:1;
  boolean seek=actual>=0&&videoPosition!=actual&&(videoPosition<actual||Math.abs(videoPosition-actual-(running&&playing?dt*speed:0))>400);
  if(seek){starts.clear();visual=videoPosition/10f;}
  else if(actual<0)visual=videoPosition/10f;
  else if(running&&playing){if(videoPosition!=actual)advance=time;long remaining=Math.max(0,100-(now-advance));visual+=Math.min(dt,remaining)/10f;}
  actual=videoPosition;now=time;playing=running;rate=speed;
 }
 public synchronized float position(){return visual;}
 public synchronized float start(Object comment,float timestamp){Float start=starts.get(comment);if(start!=null)return start;float age=(actual/10f-timestamp)/Math.max(.1f,rate);float mapped=visual-age;if(age>=0)starts.put(comment,mapped);return mapped;}
}
