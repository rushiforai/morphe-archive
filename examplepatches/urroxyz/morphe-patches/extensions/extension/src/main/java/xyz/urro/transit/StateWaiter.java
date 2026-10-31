package xyz.urro.transit;
/** Pure monotonic bounded wait; unknown is never confirmation. */
public final class StateWaiter {
 public enum Result { WAITING, CONFIRMED, TIMED_OUT }
 private final boolean wanted;
 private final long start, timeout;
 private Result result=Result.WAITING;
 public StateWaiter(boolean wanted,long start,long timeout){if(start<0||timeout<0)throw new IllegalArgumentException();this.wanted=wanted;this.start=start;this.timeout=timeout;}
 public Result observe(boolean known,boolean active,long now){
  if(result!=Result.WAITING)return result;
  if(now<start)return result=Result.TIMED_OUT;
  if(known&&active==wanted)return result=Result.CONFIRMED;
  if(now-start>=timeout)return result=Result.TIMED_OUT;
  return result;
 }
}
