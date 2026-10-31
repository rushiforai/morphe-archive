package xyz.urro.transit;
import java.util.HashSet;
import java.util.Collection;
/** Per-command event cursor. Wall-time comparisons alone are unsafe across clock adjustments.
 * Capture baseline before dispatch; only newly observed event identities may confirm it.
 */
public final class ObservationFence {
 private final long generation,deadline,start;
 private final HashSet<String> seen;
 public ObservationFence(long generation,long now,long budget,Collection<String> baseline){
  if(now<0||budget<0||baseline.size()>2048)throw new IllegalArgumentException();
  this.generation=generation;start=now;deadline=Math.addExact(now,budget);seen=new HashSet<>(baseline);
 }
 public boolean accept(long token,long now,String identity){
  return token==generation&&now>=start&&now<=deadline&&identity!=null&&seen.size()<4096&&seen.add(identity);
 }
}
