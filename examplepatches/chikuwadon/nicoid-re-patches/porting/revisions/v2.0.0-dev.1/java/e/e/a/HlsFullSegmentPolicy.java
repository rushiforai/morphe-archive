package e.e.a;

/**
 * Prefer complete HLS media segments on NicoLive.
 *
 * LL-HLS parts/preload hints can cause rapid reloads and errors when the
 * provider encrypts CMAF partial segments incompatibly with Media3's AES-128
 * full-segment decryptor. Preserve the full EXTINF timeline and key/IV tags.
 *
 * A playlist with no complete EXTINF segments is never modified.
 */
public final class HlsFullSegmentPolicy {
 private HlsFullSegmentPolicy(){}

 public static final class Result {
  public final String playlist;
  public final int partsFound;
  public final int removedTags;
  public final boolean converted;
  public Result(String playlist,int partsFound,int removedTags,boolean converted){
   this.playlist=playlist;this.partsFound=partsFound;this.removedTags=removedTags;this.converted=converted;
  }
 }
 public static Result normalize(String source){
  if(source==null||source.isEmpty())return new Result(source,0,0,false);
  String[] lines=source.split("(?<=\\n)",-1);
  int fullSegments=0,parts=0;
  for(String entry:lines){
   if(entry.startsWith("#EXTINF:"))fullSegments++;
   if(entry.startsWith("#EXT-X-PART:"))parts++;
  }
  // Master and parts-only playlists must pass through without modification.
  if(fullSegments<2||parts==0)return new Result(source,parts,0,false);
  StringBuilder result=new StringBuilder(source.length());
  int removed=0;
  for(String entry:lines){
   if(entry.startsWith("#EXT-X-PART:")||
      entry.startsWith("#EXT-X-PART-INF:")||
      entry.startsWith("#EXT-X-PRELOAD-HINT:")||
      entry.startsWith("#EXT-X-SERVER-CONTROL:")||
      entry.startsWith("#EXT-X-RENDITION-REPORT:")){
    removed++;
    continue;
   }
   result.append(entry);
  }
  return new Result(result.toString(),parts,removed,removed>0);
 }
}
