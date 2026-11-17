package e.e.a;
import java.util.IdentityHashMap;
/** Pure Java comment timing and lane-selection regression. */
public final class CommentFlow260Test {
 private static final class Entry {
  int row;
  String text="text";
  float height=10f,width=200f,start,speed;
 }
 private static final class State {
  int height=100;
  IdentityHashMap<Object,Entry> active=new IdentityHashMap<>();
 }
 private static void verify(boolean value,String reason){if(!value)throw new AssertionError(reason);}
 private static boolean eq(float a,float b){return Math.abs(a-b)<0.001f;}
 public static void main(String[] args){
  Entry late=new Entry();late.start=100f;late.speed=2f;
  float now=300f,duration=500f;
  verify(eq(CommentFlow220.start(late.start,now),100f),"Original onset lost");
  CommentFlow220.retime(late,now,duration);
  verify(eq(late.start,now),"Late comment starts at viewport edge");
  verify(eq(late.speed,2f*duration/(duration-200f)),"No compensating velocity");
  verify(eq((duration-200f)*late.speed,1000f),"Comment truncated before exit");
  Entry ontime=new Entry();ontime.start=100f;ontime.speed=2f;
  CommentFlow220.retime(ontime,110f,500f);
  verify(eq(ontime.start,100f)&&eq(ontime.speed,2f),"On-time path changed");
  Entry expired=new Entry();expired.start=100f;expired.speed=2f;
  CommentFlow220.retime(expired,601f,500f);
  verify(eq(expired.start,100f),"Expired comment restarted");
  State state=new State();Entry incoming=new Entry();incoming.speed=2f;
  verify(CommentFlow220.fallback(state,incoming,0f,1000,10)==0,
       "Empty rows should choose uppermost row");
  Entry busy=new Entry();busy.start=0f;busy.speed=2f;busy.width=100f;busy.row=0;
  state.active.put(new Object(),busy);
  verify(CommentFlow220.fallback(state,incoming,0f,1000,10)==1,
       "First nonoverlapping row should take priority");
  verify(eq(CommentFlow220.height("one\ntwo",10f),21.5f),"Multiline row height changed");
  System.out.println("PASS: late arrivals exit by original expiry, stable upper-row choice");
 }
}
