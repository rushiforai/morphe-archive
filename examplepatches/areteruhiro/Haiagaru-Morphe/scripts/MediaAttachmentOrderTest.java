package app.morphe.extension.chmate;
import java.util.*;
public final class MediaAttachmentOrderTest {
 public static void main(String[] args){
  String album="https://imgur.com/a/EPEfjNv",yt="https://youtu.be/XqZsoesa55w",thumb="https://i.ytimg.com/vi/XqZsoesa55w/hqdefault.jpg",a="https://i.imgur.com/A.png",b="https://i.imgur.com/B.png";int checks=0;
  for(String video:Arrays.asList(yt,thumb)){
   String body=album+"\n"+yt;Map<String,Integer> map=new LinkedHashMap<>();map.put(a,0);map.put(b,0);
   if(!MediaAttachmentOrder.reorder(body,Arrays.asList(video,a,b),map).equals(Arrays.asList(a,b,video)))throw new AssertionError("album first");checks++;
   body=yt+"\n"+album;map.replaceAll((k,v)->yt.length()+1);
   if(!MediaAttachmentOrder.reorder(body,Arrays.asList(video,a,b),map).equals(Arrays.asList(video,a,b)))throw new AssertionError("album last");checks++;
  }
  String body=album+"\n"+yt;Map<String,Integer> map=new LinkedHashMap<>();map.put(a,0);map.put(b,0);
  if(!MediaAttachmentOrder.reorder(body,Arrays.asList(a,b,yt),map).equals(Arrays.asList(a,b,yt)))throw new AssertionError("repeat stable");checks++;
  if(!MediaAttachmentOrder.reorder(body,Arrays.asList(yt,a),Collections.emptyMap()).equals(Arrays.asList(yt,a)))throw new AssertionError("unresolved unchanged");checks++;
  if(!MediaAttachmentOrder.reorder(a+"\n"+body,Arrays.asList(a,yt),Collections.singletonMap(a,a.length()+1)).equals(Arrays.asList(a,yt)))throw new AssertionError("earlier direct image preserved");checks++;
  System.out.println("Attachment order: "+checks+" checks passed");
 }
}
