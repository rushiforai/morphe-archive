import e.e.a.ScrollRestorePolicy204;
public final class ScrollRestorePolicy204Test {
 static void ok(boolean b){if(!b)throw new AssertionError("scroll restore policy");}
 public static void main(String[] args){
  ok(ScrollRestorePolicy204.next(40,250,-1)==38);
  ok(ScrollRestorePolicy204.next(40,250,40)==-1);
  ok(ScrollRestorePolicy204.next(0,250,-1)==-1);
  ok(ScrollRestorePolicy204.next(251,250,100)==-1);
  ok(ScrollRestorePolicy204.loaded(251,250));
  ok(!ScrollRestorePolicy204.loaded(250,250));
  ok(!ScrollRestorePolicy204.needs(50,-12,50,-11,true));
  ok(ScrollRestorePolicy204.needs(50,-12,3,0,true));
  ok(ScrollRestorePolicy204.needs(50,-12,50,0,true));
  ok(ScrollRestorePolicy204.needs(50,-12,50,0,false));
  System.out.println("PASS: paged scroll restoration policy");
 }
}
