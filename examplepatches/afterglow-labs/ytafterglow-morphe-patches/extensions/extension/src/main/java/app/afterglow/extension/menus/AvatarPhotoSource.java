package app.afterglow.extension.menus;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;

/** Bounded public-image transfer. Native image URLs remain in memory only. */
public final class AvatarPhotoSource {
    public static final int MAX_BYTES=8*1024*1024;
    public interface ConnectionFactory {HttpURLConnection open(URI uri) throws IOException;}
    private AvatarPhotoSource() {}
    public static byte[] read(String url) throws IOException {
        return read(url,uri->(HttpURLConnection)uri.toURL().openConnection());
    }
    public static byte[] read(String url,ConnectionFactory factory) throws IOException {
        String large=AvatarPhotoPolicy.largeUrl(url);if(large==null)throw new IOException("Unsupported image source");
        URI current=URI.create(large);
        for(int redirect=0;redirect<=4;redirect++) {
            if(!AvatarPhotoPolicy.allowed(current))throw new IOException("Unsupported image source");
            HttpURLConnection connection=factory.open(current);
            try {
                connection.setInstanceFollowRedirects(false);connection.setConnectTimeout(15000);connection.setReadTimeout(20000);
                connection.setRequestProperty("Accept","image/*");connection.setRequestProperty("Accept-Encoding","identity");
                int status=connection.getResponseCode();
                if(status==301||status==302||status==303||status==307||status==308) {
                    String next=connection.getHeaderField("Location");if(next==null)throw new IOException("Missing image redirect");
                    try{current=current.resolve(next);}catch(IllegalArgumentException error){throw new IOException("Invalid image redirect");}
                    continue;
                }
                if(status!=200)throw new IOException("Image request failed");
                long expected=connection.getContentLengthLong();
                if(expected>MAX_BYTES)throw new IOException("Image is too large");
                String type=connection.getContentType();
                if(type!=null&&!type.toLowerCase(java.util.Locale.ROOT).startsWith("image/"))throw new IOException("Invalid image response");
                try(InputStream input=connection.getInputStream();ByteArrayOutputStream output=new ByteArrayOutputStream()) {
                    byte[] buffer=new byte[16384];int count;
                    while((count=input.read(buffer))!=-1) {
                        if(Thread.currentThread().isInterrupted())throw new IOException("Image request cancelled");
                        if(count>MAX_BYTES-output.size())throw new IOException("Image is too large");
                        output.write(buffer,0,count);
                    }
                    if(output.size()==0||(expected>=0&&output.size()!=expected))throw new IOException("Incomplete image response");
                    return output.toByteArray();
                }
            }finally{connection.disconnect();}
        }
        throw new IOException("Too many image redirects");
    }
}
