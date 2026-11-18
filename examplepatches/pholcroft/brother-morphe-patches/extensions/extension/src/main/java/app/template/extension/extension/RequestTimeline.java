package app.template.extension.extension;

/** Offsets for a simulated sequential timeline; -1 means a duration is unavailable. */
public final class RequestTimeline {
 public static long[] durations(java.util.List<RequestRecord> requests){
  if(requests==null)throw new IllegalArgumentException();long[] durations=new long[requests.size()];
  for(int i=0;i<durations.length;i++){RequestRecord request=requests.get(i);durations[i]=request.cached?(request.details==null?-1:request.details.sampleNanos):request.endNanos-request.startNanos;}
  return durations;
 }
 public static long[] offsets(long[] durations){
  if(durations==null)throw new IllegalArgumentException();long[] offsets=new long[durations.length];long elapsed=0;
  for(int i=0;i<durations.length;i++){
   offsets[i]=elapsed;long duration=durations[i];
   if(elapsed<0||duration<0||duration>Long.MAX_VALUE-elapsed)elapsed=-1;else elapsed+=duration;
  }
  return offsets;
 }
 private RequestTimeline(){}
}
