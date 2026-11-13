package e.e.a;
/** Plain-Java rules for one-shot asynchronous ListView restoration. */
public final class ScrollRestorePolicy205 {
 public static final long MAX_WAIT_MS=1100L;
 public static final long RETRY_MS=75L;
 private ScrollRestorePolicy205(){}
 public static boolean ready(int count,int savedPosition,int height,boolean attached,boolean shown){
  return count>savedPosition && height>0 && attached && shown;
 }
 public static boolean userMoved(int first,int firstTop,int original,int originalTop,boolean hasRow){
  return hasRow&&(first!=original||Math.abs(firstTop-originalTop)>16);
 }
}
