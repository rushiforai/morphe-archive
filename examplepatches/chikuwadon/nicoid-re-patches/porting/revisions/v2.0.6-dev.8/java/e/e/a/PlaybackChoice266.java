package e.e.a;

/** One-shot explicit video menu choice, independent of stored tap preferences.
 * Avoids modifying native preference values and survives asynchronous launches.
 */
public final class PlaybackChoice266 {
 public static final int NONE=0;
 public static final int NORMAL=1;
 public static final int FULLSCREEN=2;
 private static final long TTL_MS=12000L;
 private static int pending=NONE;
 private static long armedAt;
 private PlaybackChoice266(){}

 public static synchronized void armNormal(long elapsedMs){
  pending=NORMAL;
  armedAt=elapsedMs;
 }
 public static synchronized void armFullscreen(long elapsedMs){
  pending=FULLSCREEN;
  armedAt=elapsedMs;
 }
 public static synchronized int consume(long elapsedMs){
  int result=(pending!=NONE&&elapsedMs>=armedAt&&
              elapsedMs-armedAt<=TTL_MS)?pending:NONE;
  pending=NONE;
  armedAt=0L;
  return result;
 }
 public static synchronized void cancel(){
  pending=NONE;
  armedAt=0L;
 }
}
