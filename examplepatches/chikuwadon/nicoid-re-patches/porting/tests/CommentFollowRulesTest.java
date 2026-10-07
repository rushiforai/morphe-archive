import e.e.a.CommentFollowRules;
public class CommentFollowRulesTest {
 static void expect(long[] times,long now,int expected){int actual=CommentFollowRules.nearest(times,now);if(actual!=expected)throw new AssertionError("at "+now+": "+actual+" != "+expected);}
 public static void main(String[] args){
  expect(null,100,-1);expect(new long[]{},100,-1);
  expect(new long[]{1000,2000},999,-1);
  expect(new long[]{0,1000,2000},600,0);
  expect(new long[]{0,1000,1000,2000},1000,2);
  expect(new long[]{0,1000,1000,2000},1999,2);
  expect(new long[]{0,1000,2000},2500,2);
  expect(new long[]{2000,0,1000},1500,2);
  expect(new long[]{0,1000,2000},500,0); // seek backward
  expect(new long[]{-1,Long.MAX_VALUE,0},-100,2);
  expect(new long[]{Long.MAX_VALUE},Long.MAX_VALUE,-1);
  System.out.println("Follow rules pass: no future selection, tied timestamps, unsorted data, seeks, and invalid times.");
 }
}
