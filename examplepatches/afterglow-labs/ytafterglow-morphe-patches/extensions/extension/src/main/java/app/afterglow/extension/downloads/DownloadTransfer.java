package app.afterglow.extension.downloads;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** HTTPS range transfer. A refreshed URL is rebound to a stable format identity before resuming. */
final class DownloadTransfer {
    interface Progress { void update(long bytes,long total); }
    interface Connections { HttpURLConnection open(URL url) throws IOException; }
    static final class HttpFailure extends IOException {
        final int status;
        HttpFailure(int status) { super("The media server returned HTTP "+status+".");this.status=status; }
    }
    static final class Control implements DownloadResolver.Cancellation {
        private volatile boolean cancelled;
        private HttpURLConnection connection;
        public boolean isCancelled() { return cancelled || Thread.currentThread().isInterrupted(); }
        public void throwIfCancelled() throws IOException { if(isCancelled()) throw new IOException("Download interrupted."); }
        synchronized void attach(HttpURLConnection c) throws IOException {throwIfCancelled();connection=c;}
        synchronized void detach() {connection=null;}
        void cancel() {HttpURLConnection current;synchronized(this){cancelled=true;current=connection;connection=null;}if(current!=null)current.disconnect();}
    }
    private static final Pattern RANGE=Pattern.compile("bytes ([0-9]+)-([0-9]+)/([0-9]+)");
    private static final long MEDIA_RANGE_BYTES=4L*1024*1024;
    private final Connections connections;
    DownloadTransfer() {this(url->(HttpURLConnection)url.openConnection());}
    DownloadTransfer(Connections connections) {this.connections=connections;}
    void download(DownloadResolver.Track track,File file,Control cancel,Progress progress) throws IOException {
        if(track==null || track.identity==null || track.identity.isEmpty() || track.identity.length()>4096) throw new IOException("The media format has no stable identity.");
        if(track.expectedBytes>DownloadPolicy.MAX_FILE_BYTES) throw new IOException("This download exceeds the Vault size limit.");
        File identity=DownloadStorage.child(file.getParentFile(),file.getName()+".identity");
        String expected=DownloadStorage.hash(track.identity+"\n"+track.mimeType+"\n"+track.expectedBytes);
        boolean matches=identity.isFile() && identity.length()==64 && expected.equals(new String(Files.readAllBytes(identity.toPath()),StandardCharsets.US_ASCII));
        if(!matches) {Files.deleteIfExists(file.toPath());Files.write(identity.toPath(),expected.getBytes(StandardCharsets.US_ASCII));}
        long offset=file.isFile()?file.length():0;
        if(offset>DownloadPolicy.MAX_FILE_BYTES || track.expectedBytes>0 && offset>track.expectedBytes) {Files.delete(file.toPath());offset=0;}
        // Complete parts survive a pause during mux; only an exact trusted expected size permits reuse.
        if(track.expectedBytes>0 && offset==track.expectedBytes) {progress.update(offset,offset);return;}
        URL url=secureUrl(track.url);String originalHost=url.getHost();HttpURLConnection c=null;boolean restartedRange=false;
        long knownTotal=track.expectedBytes>0?track.expectedBytes:-1;
        boolean media=track.role==DownloadResolver.Role.VIDEO||track.role==DownloadResolver.Role.AUDIO
                ||track.role==DownloadResolver.Role.COMBINED;
        int redirects=0;
        try {
            for(;;) {
                cancel.throwIfCancelled();c=connections.open(url);cancel.attach(c);
                c.setInstanceFollowRedirects(false);c.setConnectTimeout(20000);c.setReadTimeout(20000);c.setUseCaches(false);
                c.setRequestProperty("Accept-Encoding","identity");
                if(track.headers.size()>32) throw new IOException("Invalid request headers.");
                for(Map.Entry<String,String> h:track.headers.entrySet()) {
                    String k=h.getKey(),v=h.getValue();
                    if(k==null || v==null || !k.matches("[A-Za-z0-9-]{1,80}") || v.length()>8192 || v.contains("\r") || v.contains("\n")) throw new IOException("Invalid request headers.");
                    if(k.equalsIgnoreCase("Range") || k.equalsIgnoreCase("Host") || k.equalsIgnoreCase("Accept-Encoding") || k.equalsIgnoreCase("Content-Length")) continue;
                    if(!originalHost.equalsIgnoreCase(url.getHost()) && !(k.equalsIgnoreCase("User-Agent") || k.equalsIgnoreCase("Accept") || k.equalsIgnoreCase("Accept-Language"))) continue;
                    c.setRequestProperty(k,v);
                }
                // Explicit bounded media ranges avoid the CDN's playback-paced
                // delivery for both fresh and resumed transfers. Keep one writer.
                long requestedEnd=media?Math.min(DownloadPolicy.MAX_FILE_BYTES-1,offset+MEDIA_RANGE_BYTES-1):-1;
                if(media&&knownTotal>0)requestedEnd=Math.min(requestedEnd,knownTotal-1);
                c.setRequestProperty("Range","bytes="+offset+"-"+(requestedEnd>=0?requestedEnd:""));
                int status=c.getResponseCode();
                if(status==301 || status==302 || status==303 || status==307 || status==308) {
                    if(redirects++>=5) throw new IOException("The media server redirected too many times.");
                    String location=c.getHeaderField("Location");if(location==null) throw new IOException("Invalid redirect.");
                    url=secureUrl(new URL(url,location).toString());c.disconnect();cancel.detach();continue;
                }
                long total=knownTotal, responseBytes=c.getContentLengthLong(),rangeBytes=-1;
                if(status==416 && offset>0) {
                    String range=c.getHeaderField("Content-Range");
                    if(range!=null && range.matches("bytes \\*/[0-9]+")) {
                        long serverTotal=number(range.substring(8));
                        if(serverTotal==offset && serverTotal>0 && (total<0 || total==serverTotal)) {progress.update(offset,offset);return;}
                    }
                    if(!restartedRange) {
                        restartedRange=true;Files.deleteIfExists(file.toPath());offset=0;c.disconnect();cancel.detach();continue;
                    }
                    throw new HttpFailure(status);
                } else if(status==206) {
                    String range=c.getHeaderField("Content-Range");Matcher m=RANGE.matcher(range==null?"":range);
                    if(!m.matches()) throw new IOException("The server returned an invalid media range.");
                    long start=number(m.group(1)),end=number(m.group(2)),serverTotal=number(m.group(3));
                    if(start!=offset || end<start || serverTotal<=end || serverTotal>DownloadPolicy.MAX_FILE_BYTES || total>0 && serverTotal!=total || requestedEnd>=0&&end>requestedEnd || responseBytes>=0 && responseBytes!=end-start+1) throw new IOException("The media range changed. Retry this download.");
                    total=serverTotal;rangeBytes=end-start+1;
                } else if(status==200) {
                    // Server ignored Range: truncate rather than append duplicated bytes.
                    offset=0;
                    if(responseBytes>=0) {
                        if(total>0 && responseBytes!=total) throw new IOException("The media size changed. Retry this download.");
                        total=responseBytes;
                    }
                } else throw new HttpFailure(status);
                if(total>DownloadPolicy.MAX_FILE_BYTES || responseBytes>DownloadPolicy.MAX_FILE_BYTES) throw new IOException("This download exceeds the Vault size limit.");
                if(total>0 && file.getParentFile().getUsableSpace()<total-offset+DownloadPolicy.DISK_RESERVE) throw new IOException("Not enough free storage for this download.");
                long received=offset,body=0;
                try(InputStream in=c.getInputStream();FileOutputStream out=new FileOutputStream(file,offset>0)) {
                    byte[] buffer=new byte[256*1024];int n;
                    while((n=in.read(buffer))!=-1) {
                        cancel.throwIfCancelled();received+=n;body+=n;
                        if(received>DownloadPolicy.MAX_FILE_BYTES || total>=0 && received>total || rangeBytes>=0&&body>rangeBytes) throw new IOException("The media server returned too much data.");
                        if(file.getParentFile().getUsableSpace()<DownloadPolicy.DISK_RESERVE+n) throw new IOException("Not enough free storage for this download.");
                        out.write(buffer,0,n);progress.update(received,total);
                    }
                    out.getFD().sync();
                }
                cancel.throwIfCancelled();
                if(body<=0 || responseBytes>=0 && body!=responseBytes || rangeBytes>=0&&body!=rangeBytes) throw new IOException("The media transfer was interrupted.");
                if(status==206&&total>received) {
                    offset=received;knownTotal=total;redirects=0;
                    c.disconnect();cancel.detach();continue;
                }
                if(total>0&&received!=total)throw new IOException("The media transfer was interrupted.");
                progress.update(received,total>0?total:received);return;
            }
        }finally {if(c!=null)c.disconnect();cancel.detach();}
    }
    private static long number(String s) throws IOException {try{return Long.parseLong(s);}catch(NumberFormatException e){throw new IOException("Invalid media range.");}}
    private static URL secureUrl(String value) throws IOException {
        try {URL u=new URL(value);if(!"https".equalsIgnoreCase(u.getProtocol()) || u.getHost().isEmpty() || u.getUserInfo()!=null) throw new IOException("Media requires a secure HTTPS address.");return u;}
        catch(java.net.MalformedURLException e) {throw new IOException("Invalid media address.");}
    }
}
