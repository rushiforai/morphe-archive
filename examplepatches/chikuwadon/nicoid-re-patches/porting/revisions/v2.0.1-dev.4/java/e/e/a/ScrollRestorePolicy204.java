package e.e.a;
/** Pure policy: exactly one pagination movement for each newly loaded page. */
public final class ScrollRestorePolicy204 {
 private ScrollRestorePolicy204(){}
 public static boolean loaded(int count,int index){return count>index;}
 public static int next(int count,int index,int oldCount){
  if(count<=0||count>index||count==oldCount)return -1;
  return Math.max(0,count-2);
 }
 public static boolean needs(int index,int top,int first,int firstTop,boolean hasChild){
  return !hasChild || index!=first || Math.abs(top-firstTop)>2;
 }
}
