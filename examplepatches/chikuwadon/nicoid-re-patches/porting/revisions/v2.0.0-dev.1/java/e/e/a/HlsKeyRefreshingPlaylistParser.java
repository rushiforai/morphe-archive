package e.e.a;
import android.net.Uri;
import androidx.media3.exoplayer.hls.playlist.*;
import androidx.media3.exoplayer.upstream.ParsingLoadable;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicLong;
/**
 * Media3 caches HLS AES-128 keys by URI. A server may rotate key bytes without
 * changing the advertised key URL. Give each playlist generation its own key
 * cache identity using a URI fragment, which is never sent in HTTP requests.
 * The signed query, key path, segment contents and encryption IV stay intact.
 */
public final class HlsKeyRefreshingPlaylistParser implements HlsPlaylistParserFactory {
 private static final int MAX_BYTES=2*1024*1024;
 private final AtomicLong generations=new AtomicLong();
 public final AtomicLong blankGapTags=new AtomicLong();
 public final AtomicLong llPartsSuppressed=new AtomicLong();
 public volatile boolean sawAes128;
 @Override public ParsingLoadable.Parser<HlsPlaylist> createPlaylistParser(){
  return wrapped(new HlsPlaylistParser());
 }
 @Override public ParsingLoadable.Parser<HlsPlaylist> createPlaylistParser(
     HlsMultivariantPlaylist master,HlsMediaPlaylist previous){
  return wrapped(new HlsPlaylistParser(master,previous));
 }
 private ParsingLoadable.Parser<HlsPlaylist> wrapped(ParsingLoadable.Parser<HlsPlaylist> delegate){
  return (Uri uri,InputStream stream)->{
   ByteArrayOutputStream bytes=new ByteArrayOutputStream();
   byte[] buffer=new byte[8192];
   for(int n;(n=stream.read(buffer))!=-1;){
    if(bytes.size()+n>MAX_BYTES)throw new IOException("HLS_PLAYLIST_TOO_LARGE");
    bytes.write(buffer,0,n);
   }
   String content=new String(bytes.toByteArray(),StandardCharsets.UTF_8);
   String[] lines=content.split("(?<=\\n)",-1);
   long generation=generations.incrementAndGet();
   StringBuilder updated=new StringBuilder(content.length()+128);
   for(String entry:lines){
    boolean hasLf=entry.endsWith("\n");
    String line=hasLf?entry.substring(0,entry.length()-1):entry;
    boolean hasCr=line.endsWith("\r");
    if(hasCr)line=line.substring(0,line.length()-1);
    if(HlsKeyRefreshPolicy.isAes128KeyLine(line))sawAes128=true;
    updated.append(HlsKeyRefreshPolicy.rewriteLine(line,generation));
    if(hasCr)updated.append('\r');
    if(hasLf)updated.append('\n');
   }
   HlsBlankSegmentPolicy.Result normalized=HlsBlankSegmentPolicy.annotate(updated.toString());
   if(normalized.added>0){
    long previous=blankGapTags.getAndAdd(normalized.added);
    if(previous==0)android.util.Log.i("nicoid-live","HLS blank filler detected; marked as gap without player reset");
   }
   HlsFullSegmentPolicy.Result fullOnly=HlsFullSegmentPolicy.normalize(normalized.playlist);
   if(fullOnly.converted){
    long previous=llPartsSuppressed.getAndAdd(fullOnly.partsFound);
    if(previous==0)android.util.Log.i("nicoid-live","Low-latency partial HLS detected; using full segments to stabilize encrypted CMAF");
   }
   int segments=0,discontinuities=0,keyTags=0;
   for(String entry:lines){
    if(entry.startsWith("#EXTINF:"))segments++;
    if(entry.startsWith("#EXT-X-DISCONTINUITY"))discontinuities++;
    if(HlsKeyRefreshPolicy.isAes128KeyLine(entry))keyTags++;
   }
   NicoliveDiagnostics.record("HLS_PLAYLIST","generation="+generation+" segments="+segments+
     " aesTags="+keyTags+" gapTags="+normalized.added+" discontinuities="+discontinuities+
     " partTags="+fullOnly.partsFound+" fullOnly="+fullOnly.converted);
   return delegate.parse(uri,new ByteArrayInputStream(fullOnly.playlist.getBytes(StandardCharsets.UTF_8)));
  };
 }
}
