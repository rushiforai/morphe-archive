import android.media.MediaExtractor;
import java.io.*;
import java.net.*;

/** Independent Android shell process: distinguish Frida/app effects from the platform extractor. */
public final class GifExtractorDiagnostic {
    public static void main(String[] args)throws Exception {
        File target=File.createTempFile("haiagaru-gif-diagnostic-",".mp4",new File("/data/local/tmp"));
        HttpURLConnection connection=null;
        try{
            connection=(HttpURLConnection)new URL("https://video.twimg.com/tweet_video/G51IpxIXsAAZGU0.mp4").openConnection();
            connection.setConnectTimeout(8000);connection.setReadTimeout(8000);
            System.out.println("HTTP "+connection.getResponseCode());
            try(InputStream in=connection.getInputStream();FileOutputStream out=new FileOutputStream(target)){
                byte[] bytes=new byte[16384];int n,total=0;
                while((n=in.read(bytes))!=-1){total+=n;if(total>2*1024*1024)throw new IOException("Diagnostic limit");out.write(bytes,0,n);}
                System.out.println("BYTES "+total);
            }
            try(FileInputStream in=new FileInputStream(target)){
                byte[] head=new byte[2048];int length=in.read(head);
                for(int i=0;i+40<length;i++){
                    String type=new String(head,i,4,"US-ASCII");
                    if(type.equals("avc1"))System.out.println("AVC_DIMENSIONS "+(((head[i+28]&255)<<8)|(head[i+29]&255))+"x"+(((head[i+30]&255)<<8)|(head[i+31]&255)));
                    if(type.equals("avcC"))System.out.println("AVC_PROFILE "+(head[i+5]&255)+" LEVEL "+(head[i+7]&255));
                }
            }
            MediaExtractor extractor=new MediaExtractor();
            try{
                extractor.setDataSource(target.getAbsolutePath());
                System.out.println("TRACKS "+extractor.getTrackCount());
                for(int i=0;i<extractor.getTrackCount();i++)System.out.println(extractor.getTrackFormat(i));
            }finally{extractor.release();}
        }finally{
            if(connection!=null)connection.disconnect();
            if(!target.delete())System.out.println("Temporary diagnostic file retained: "+target);
        }
    }
}
