package app.morphe.extension.chmate;

import android.content.*;import android.net.Uri;import android.os.SystemClock;
import java.io.*;import java.net.*;import java.util.*;

/** A user-started, bounded download for external players that cannot stream imgpile. */
final class ExternalVideoCache {
    static final String KEY="externalImgpileVideoCache";
    static final long MAX_BYTES=128L*1024*1024,MAX_AGE=24L*60*60*1000;
    interface Cancel {boolean cancelled();}
    static boolean eligible(String value){
        if(!DirectVideoUrls.supported(value))return false;
        try{URI uri=URI.create(value);return "https".equalsIgnoreCase(uri.getScheme())&&"cdn.imgpile.com".equalsIgnoreCase(uri.getHost())&&(uri.getPort()==-1||uri.getPort()==443);}
        catch(IllegalArgumentException invalid){return false;}
    }
    static boolean prepare(Context context,Intent intent){
        if(context==null||intent.getData()==null||intent.getComponent()!=null||intent.getPackage()!=null
                ||!eligible(intent.getDataString())||!VideoViewerSettings.prefs(context).getBoolean(KEY,true))return false;
        if(Haiagaru.videoViewerEnabled()&&!VideoViewerSettings.nativeVideo(context))return false;
        intent.setClass(context,ExternalVideoPlaybackActivity.class);return true;
    }
    static File directory(Context context)throws IOException{
        File directory=new File(context.getCacheDir(),"haiagaru-external-video");
        if(!directory.isDirectory()&&!directory.mkdirs())throw new IOException("storage");return directory;
    }
    static void cleanup(File directory,long now){
        File[] files=directory.listFiles((dir,name)->name.matches("[a-f0-9-]{36}\\.(mp4|part)"));if(files==null)return;
        Arrays.sort(files,Comparator.comparingLong(File::lastModified).reversed());long total=0;
        for(File file:files){total+=file.length();if(now-file.lastModified()>MAX_AGE||total>MAX_BYTES*2)file.delete();}
    }
    static File download(Context context,String address,Cancel cancel)throws IOException{
        if(!eligible(address))throw new IOException("unsupported URL");
        File dir=directory(context);cleanup(dir,System.currentTimeMillis());
        File part=new File(dir,UUID.randomUUID()+".part");boolean completed=false;HttpURLConnection connection=null;
        long deadline=SystemClock.elapsedRealtime()+60000;URL url=new URL(address);
        try{
            for(int redirects=0;;redirects++){
                if(cancel.cancelled())throw new InterruptedIOException("cancelled");
                long remaining=deadline-SystemClock.elapsedRealtime();if(remaining<=0)throw new java.net.SocketTimeoutException();
                connection=(HttpURLConnection)url.openConnection();connection.setInstanceFollowRedirects(false);
                connection.setConnectTimeout((int)Math.min(8000,remaining));connection.setReadTimeout((int)Math.min(8000,remaining));
                int status=connection.getResponseCode();
                if(status==301||status==302||status==303||status==307||status==308){
                    String location=connection.getHeaderField("Location");if(location==null||redirects>=5)throw new IOException("redirect");
                    URL next=new URL(url,location);if(!"https".equalsIgnoreCase(next.getProtocol())||next.getUserInfo()!=null)throw new IOException("redirect");
                    connection.disconnect();connection=null;url=next;continue;
                }
                String type=connection.getContentType();
                if("challenge".equalsIgnoreCase(connection.getHeaderField("cf-mitigated"))||type!=null&&type.toLowerCase(Locale.ROOT).contains("html"))throw new IOException("access check");
                if(status!=200)throw new IOException("HTTP "+status);
                if(connection.getContentLengthLong()>MAX_BYTES)throw new IOException("size limit");
                break;
            }
            long total=0;try(InputStream input=connection.getInputStream();OutputStream output=new FileOutputStream(part)){
                byte[] buffer=new byte[32768];int count;
                while(true){
                    if(cancel.cancelled())throw new InterruptedIOException("cancelled");
                    long remaining=deadline-SystemClock.elapsedRealtime();if(remaining<=0)throw new java.net.SocketTimeoutException();
                    connection.setReadTimeout((int)Math.min(8000,remaining));count=input.read(buffer);if(count<0)break;
                    total+=count;if(total>MAX_BYTES)throw new IOException("size limit");output.write(buffer,0,count);
                }
            }
            if(total==0||cancel.cancelled())throw new IOException("empty or cancelled");
            File file=new File(dir,part.getName().replace(".part",".mp4"));if(!part.renameTo(file))throw new IOException("storage");
            completed=true;return file;
        }finally{if(connection!=null)connection.disconnect();if(!completed)part.delete();}
    }
    static Uri uri(Context context,File file){return new Uri.Builder().scheme("content").authority(context.getPackageName()+".haiagaru.video-cache").appendPath(file.getName()).build();}
    static Intent playback(Context context,File file){Uri uri=uri(context,file);Intent intent=new Intent(Intent.ACTION_VIEW).setDataAndType(uri,"video/mp4").addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);intent.setClipData(ClipData.newRawUri("動画",uri));return intent;}
    private ExternalVideoCache(){}
}
