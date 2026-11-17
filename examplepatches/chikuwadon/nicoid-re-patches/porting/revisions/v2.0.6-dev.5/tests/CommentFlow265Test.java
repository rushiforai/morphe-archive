package e.e.a;
import java.util.IdentityHashMap;

/** No per-comment duration or velocity mutation, including seek and late frames. */
public final class CommentFlow265Test {
 static final class Comment { Integer k=500; }
 static final class Entry {
  float start=100f, speed=3f, width=250f, height=10f;
  int row;String text="text";Object comment;
  Entry(Object o){comment=o;}
 }
 static final class State{
  int height=100;
  IdentityHashMap<Object,Entry> active=new IdentityHashMap<>();
 }
 static void check(boolean condition,String message){if(!condition)throw new AssertionError(message);}
 public static void main(String[] args){
  Object state=new Object();
  for(float visualNow:new float[]{90f,110f,300f,499f,650f,2000f}){
   Comment model=new Comment();Entry entry=new Entry(model);
   CommentFlow220.retime(state,entry,visualNow,500f);
   check(model.k==500,"Duration changed at "+visualNow);
   check(entry.start==100f,"Start changed at "+visualNow);
   check(entry.speed==3f,"Velocity changed at "+visualNow);
   CommentFlow220.reset(state);
   check(model.k==500&&entry.speed==3f,"Seek/restoration affected duration");
  }
  check(CommentFlow220.start(100f,300f)==100f,
    "Late comment onset should preserve the source clock");
  State positions=new State();Entry incoming=new Entry(new Comment());
  check(CommentFlow220.fallback(positions,incoming,300f,1000,10)==0,
    "Empty row map must prefer the first row");
  Entry occupied=new Entry(new Comment());occupied.row=0;occupied.start=100f;
  positions.active.put(new Object(),occupied);
  check(CommentFlow220.fallback(positions,incoming,100f,1000,10)==1,
    "Prefer next free lane when first is occupied");
  System.out.println("PASS: normal comment velocity on resume/seek, duration intact, stable rows");
 }
}
