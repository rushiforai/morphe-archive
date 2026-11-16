import e.e.a.CommentFlow220;
import java.util.IdentityHashMap;
public final class CommentFlow220Test {
 static class State {
   IdentityHashMap<Object,Object> active=new IdentityHashMap<>();
   int height=100;
 }
 static class Entry {
   int row; String text; float height=10f,speed=80f,start=0f,width=80f;
   Entry(int row,String text){this.row=row;this.text=text;}
 }
 static void check(boolean yes,String why){if(!yes)throw new AssertionError(why);}
 static boolean near(float a,float b){return Math.abs(a-b)<.0001f;}
 public static void main(String[] args){
  check(near(CommentFlow220.start(10f,10.1f),10f),"punctual");
  check(near(CommentFlow220.start(10f,10.25f),10.25f),"late from edge");
  check(near(CommentFlow220.height("a\nb",10f),21.5f),"multiline height");
  State s=new State(); Entry n=new Entry(-1,"new");
  int first=CommentFlow220.fallback(s,n,1f,400,5);
  check(first>=0&&first<5,"empty fallback lane");
  Entry occupied=new Entry(0,"old");
  occupied.start=1f; occupied.speed=20f;occupied.width=200f;
  s.active.put(occupied,occupied);
  for(int i=0;i<20;i++){
    int row=CommentFlow220.fallback(s,n,1f,400,5);
    check(row>=0&&row<5,"never drops a crowded comment");
    check(row!=0,"prefers a non-overlapping lane");
  }
  Entry wide=new Entry(-1,"a\nb\nc");
  for(int i=0;i<10;i++)check(CommentFlow220.fallback(s,wide,1f,400,5)<=3,
    "multiline footprint remains onscreen");
  check(CommentFlow220.fallback(s,n,1f,400,1)==0,"single crowded lane still displays");
  System.out.println("PASS: all eligible scrolling comments assigned; fixed ignored");
 }
}
