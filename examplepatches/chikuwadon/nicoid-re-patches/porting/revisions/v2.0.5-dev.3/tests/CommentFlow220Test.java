import e.e.a.CommentFlow220;

public final class CommentFlow220Test {
 private static void check(boolean ok,String why){
  if(!ok)throw new AssertionError(why);
 }
 private static boolean close(float a,float b){return Math.abs(a-b)<0.0001f;}
 public static void main(String[] args){
  check(close(CommentFlow220.start(10f,10.1f),10f),"punctual comment retained");
  check(close(CommentFlow220.start(10f,10.25f),10.25f),"late entrance from right");
  check(close(CommentFlow220.start(12f,10f),12f),"future comment unmodified");
  check(close(CommentFlow220.height("abc",11f),11f),"single row");
  check(close(CommentFlow220.height("a\nb",11f),23.65f),"two rows");
  check(close(CommentFlow220.height("a\nb\nc",11f),36.3f),"three rows");
  System.out.println("PASS: entry timing and multiline lane extent");
 }
}
