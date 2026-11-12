package e.e.a;
import java.net.URI;
import java.util.Locale;

/** Preserve HLS timeline and skip dlive placeholder media via EXT-X-GAP. */
public final class HlsBlankSegmentPolicy {
 private HlsBlankSegmentPolicy(){}
 public static final class Result {
  public final String playlist; public final int added;
  Result(String playlist,int added){this.playlist=playlist;this.added=added;}
 }
 public static boolean isBlankMediaUri(String raw){
  if(raw==null)return false;
  String value=raw.trim();
  if(value.isEmpty()||value.startsWith("#"))return false;
  try {
   URI uri=new URI(value);
   String scheme=uri.getScheme(),host=uri.getHost();
   if(scheme!=null&&!"https".equalsIgnoreCase(scheme))return false;
   if(host!=null){
    String domain=host.toLowerCase(Locale.ROOT);
    if(!domain.equals("nicovideo.jp")&&!domain.endsWith(".nicovideo.jp"))return false;
   }
   String path=uri.getPath();
   return path!=null&&(path.contains("/blank/")||path.startsWith("blank/"));
  }catch(Exception e){return false;}
 }
 public static Result annotate(String manifest){
  if(manifest==null||manifest.isEmpty())return new Result(manifest,0);
  String[] entries=manifest.split("(?<=\\n)",-1);
  StringBuilder out=new StringBuilder(manifest.length()+96);
  boolean expectingSegment=false,alreadyGap=false;
  int added=0;
  for(String entry:entries){
   boolean lf=entry.endsWith("\n");
   String line=lf?entry.substring(0,entry.length()-1):entry;
   boolean cr=line.endsWith("\r");
   if(cr)line=line.substring(0,line.length()-1);
   if(line.startsWith("#EXTINF:")){expectingSegment=true;alreadyGap=false;}
   else if(expectingSegment&&line.equals("#EXT-X-GAP"))alreadyGap=true;
   else if(expectingSegment&&!line.isEmpty()&&!line.startsWith("#")){
    if(!alreadyGap&&isBlankMediaUri(line)){
     out.append("#EXT-X-GAP").append(cr?"\r\n":"\n");added++;
    }
    expectingSegment=false;
   }
   out.append(entry);
  }
  return new Result(out.toString(),added);
 }
}
