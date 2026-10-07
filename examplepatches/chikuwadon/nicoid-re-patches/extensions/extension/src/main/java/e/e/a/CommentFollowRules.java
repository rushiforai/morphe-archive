package e.e.a;
/** Last already-displayed comment, including ties; never select a future comment. */
public final class CommentFollowRules {
 public static int nearest(long[] positions,long playbackMs){
  if(positions==null)return -1;long best=-1;int index=-1;
  for(int i=0;i<positions.length;i++){long time=positions[i];if(time>=0&&time!=Long.MAX_VALUE&&time<=Math.max(0,playbackMs)&&time>=best){best=time;index=i;}}
  return index;
 }
}
