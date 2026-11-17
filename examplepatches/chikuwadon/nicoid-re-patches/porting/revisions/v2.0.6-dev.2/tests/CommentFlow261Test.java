package e.e.a;
import java.util.IdentityHashMap;

/** Comments must keep a natural horizontal speed even after seek/start loads. */
public final class CommentFlow261Test {
 private static class Comment {
  int k=500;
 }
 private static class Entry {
  Object comment;
  int row;
  String text="text";
  float height=10f,width=200f,start,speed;
 }
 private static class State {
  int height=100;
  IdentityHashMap<Object,Entry> active=new IdentityHashMap<>();
 }
 private static void check(boolean value,String msg){if(!value)throw new AssertionError(msg);}
 private static boolean eq(float a,float b){return Math.abs(a-b)<.001f;}
 private static Entry entry(Comment c,float start){Entry e=new Entry();e.comment=c;e.start=start;e.speed=2f;return e;}
 public static void main(String[] args){
  State state=new State();
  Comment c=new Comment();
  Entry start=entry(c,100);
  CommentFlow220.retime(state,start,300,500);
  check(eq(start.start,300f),"Start at right edge");
  check(eq(start.speed,2f),"Playback start must not accelerate");
  check(c.k==700,"Extend lifetime, not velocity");
  check(eq((c.k-(300-100))*start.speed,1000f),"Full natural-speed travel");
  CommentFlow220.reset(state);
  check(c.k==500,"Seek must restore original duration");
  Entry backSeek=entry(c,100);
  CommentFlow220.retime(state,backSeek,599,500);
  check(eq(backSeek.speed,2f),"Near-end seeks must not hyperaccelerate");
  check(c.k==999,"Late near-end comment must have full visual lifetime");
  CommentFlow220.reset(state);
  check(c.k==500,"Repeated seeks must not accumulate duration");

  Entry normal=entry(c,100);
  CommentFlow220.retime(state,normal,110,500);
  check(eq(normal.start,100)&&eq(normal.speed,2)&&c.k==500,
        "On-time comments stay unchanged");
  Entry expired=entry(c,100);
  CommentFlow220.retime(state,expired,700,500);
  check(eq(expired.start,100)&&c.k==500,"Already-expired comments not revived");

  // A changed user setting must not be overridden by stale seek cleanup.
  Entry settings=entry(c,100);
  CommentFlow220.retime(state,settings,300,500);
  c.k=800;
  CommentFlow220.reset(state);
  check(c.k==800,"Preserve changed configured duration");

  State rows=new State();
  Entry incoming=entry(new Comment(),0);
  incoming.speed=2;
  check(CommentFlow220.fallback(rows,incoming,0,1000,10)==0,
        "Empty frame should start from upper row");
  Entry occupied=entry(new Comment(),0);
  occupied.row=0;occupied.speed=2;occupied.width=100;
  rows.active.put(occupied.comment,occupied);
  check(CommentFlow220.fallback(rows,incoming,0,1000,10)==1,
        "First available row should beat arbitrary lower row");
  check(eq(CommentFlow220.height("a\nb",10),21.5f),
        "Multiline height unchanged");
  System.out.println("PASS: start/seek stays at normal speed and lifetime is preserved");
  System.out.println("PASS: seek reset restores lifetime and stable rows remain intact");
 }
}
