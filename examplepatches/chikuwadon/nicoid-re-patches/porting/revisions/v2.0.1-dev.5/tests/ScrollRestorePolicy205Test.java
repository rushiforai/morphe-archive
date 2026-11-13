import e.e.a.ScrollRestorePolicy205;
public final class ScrollRestorePolicy205Test {
 static void expect(boolean b){if(!b)throw new AssertionError("single-jump restore");}
 public static void main(String[] args){
  expect(ScrollRestorePolicy205.ready(100,99,600,true,true));
  expect(!ScrollRestorePolicy205.ready(100,100,600,true,true));
  expect(!ScrollRestorePolicy205.ready(150,100,0,true,true));
  expect(!ScrollRestorePolicy205.ready(150,100,600,false,true));
  expect(!ScrollRestorePolicy205.ready(150,100,600,true,false));
  expect(!ScrollRestorePolicy205.userMoved(1,0,1,0,true));
  expect(!ScrollRestorePolicy205.userMoved(1,-12,1,0,true));
  expect(ScrollRestorePolicy205.userMoved(1,-20,1,0,true));
  expect(ScrollRestorePolicy205.userMoved(2,0,1,0,true));
  expect(!ScrollRestorePolicy205.userMoved(2,0,1,0,false));
  expect(ScrollRestorePolicy205.MAX_WAIT_MS<=1200);
  System.out.println("PASS: visible list and single-jump restore decision policy");
 }
}
