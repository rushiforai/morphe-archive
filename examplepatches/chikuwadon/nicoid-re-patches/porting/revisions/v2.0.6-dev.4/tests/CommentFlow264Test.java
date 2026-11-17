package e.e.a;
/** Pure-Java regression for java.lang.Integer e.e.a.q.k in the device log. */
public final class CommentFlow264Test {
 static final class Boxed { public Integer k=500; }
 static final class Primitive { public int k=500; }
 static final class Entry { public float start=100f;public Object comment;Entry(Object c){comment=c;} }
 private static void check(boolean yes,String why){if(!yes)throw new AssertionError(why);}
 public static void main(String[] args) {
  Object state=new Object();
  Boxed boxed=new Boxed();Entry late=new Entry(boxed);
  CommentFlow220.retime(state,late,300f,500f);
  check(boxed.k==700,"boxed k must extend duration without exception");
  check(late.start==300f,"late entry starts now");
  CommentFlow220.reset(state);check(boxed.k==500,"seek restores boxed k");
  Primitive prim=new Primitive();Entry legacy=new Entry(prim);
  CommentFlow220.retime(state,legacy,300f,500f);
  check(prim.k==700,"primitive int compatibility");
  CommentFlow220.reset(state);check(prim.k==500,"primitive restore");
  Boxed normal=new Boxed();Entry onTime=new Entry(normal);
  CommentFlow220.retime(state,onTime,110f,500f);
  check(normal.k==500&&onTime.start==100f,"on-time trajectory unchanged");
  Boxed expired=new Boxed();Entry old=new Entry(expired);
  CommentFlow220.retime(state,old,650f,500f);
  check(expired.k==500&&old.start==100f,"no rebasing expired entries");
  Boxed edited=new Boxed();Entry e=new Entry(edited);
  CommentFlow220.retime(state,e,300f,500f);
  edited.k=450;CommentFlow220.reset(state);
  check(edited.k==450,"user value not overwritten");
  System.out.println("PASS: boxed/primitive duration, seek restore, natural speed");
 }
}
