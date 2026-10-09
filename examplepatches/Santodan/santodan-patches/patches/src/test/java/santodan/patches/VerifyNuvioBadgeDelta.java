package santodan.patches;
import software.santodan.extension.nuviomerged.NuvioBadgeDelta;
import java.util.*;
public final class VerifyNuvioBadgeDelta {
 public static void main(String[] args) {
  NuvioBadgeDelta delta = new NuvioBadgeDelta();
  Map<String,Set<Integer>> history=new HashMap<>();
  for(int i=0;i<3000;i++)history.put("show"+i,Set.of(1));
  Map<String,Set<Integer>> cache=new HashMap<>();cache.put("series:show1",Set.of(1,2));
  if(delta.changed(history,cache).size()!=1)throw new AssertionError("Full history leaked into cache delta");
  if(!delta.changed(history,cache).isEmpty())throw new AssertionError("Unchanged cache republished");
  history.put("show1",Set.of(1,2));
  if(delta.changed(history,cache).size()!=1)throw new AssertionError("Watch update ignored");
  cache.put("tv:show2",Set.of(1));
  if(delta.changed(history,cache).size()!=1)throw new AssertionError("New metadata ignored");
  cache.clear();delta.changed(history,cache);cache.put("series:show1",Set.of(1,2,3));
  if(delta.changed(history,cache).size()!=1)throw new AssertionError("Revalidation after eviction ignored");
  System.out.println("PASS: changed cached metadata only, unchanged publication skipped, watch updates and cache eviction preserved");
 }
}
