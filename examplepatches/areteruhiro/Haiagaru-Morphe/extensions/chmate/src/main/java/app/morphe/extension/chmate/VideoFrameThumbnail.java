package app.morphe.extension.chmate;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Color;
import android.media.MediaMetadataRetriever;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;

/** Bounded downloads, one worker, local decoder: never fetch or decode on the UI thread. */
final class VideoFrameThumbnail {
    private static final java.util.concurrent.ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private static final MediaAttemptGate ATTEMPTED = new MediaAttemptGate(128,60000);
    static boolean fourAllowed() {
        if (!Haiagaru.videoPreviewFourEnabled()) return false;
        if (!Haiagaru.videoPreviewWifiOnly()) return true;
        try {
            Context c = Haiagaru.applicationContextForExtension();
            android.net.ConnectivityManager cm = (android.net.ConnectivityManager)c.getSystemService(Context.CONNECTIVITY_SERVICE);
            android.net.NetworkInfo network = cm.getActiveNetworkInfo();
            return network != null && network.isConnected() && network.getType() == android.net.ConnectivityManager.TYPE_WIFI;
        } catch (RuntimeException ignored) { return false; }
    }
    static void request(String url) {
        enqueue(url,false);
    }
    /** Reuse a user-downloaded video even when the streaming request previously failed. */
    static void requestLocal(String url,File source){
        if(!DirectVideoUrls.supported(url)||!FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true)||Haiagaru.mediaAutoFetchMode()==3)return;
        boolean four=fourAllowed();int minimum=Haiagaru.videoPreviewMinimumSeconds(),count=Haiagaru.videoPreviewCount();
        String variant=variant(four,minimum,count);
        WORKER.execute(()->{
            Context context=Haiagaru.applicationContextForExtension();if(context==null)return;File staging=null;
            try{
                if(!FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true)||Haiagaru.mediaAutoFetchMode()==3||four&&!fourAllowed()||XMediaAttachments.hasFramePoster(url,variant)||!source.isFile())return;
                byte[] digest=MessageDigest.getInstance("SHA-256").digest((variant+":"+url).getBytes("UTF-8"));StringBuilder key=new StringBuilder();
                for(byte value:digest)key.append(String.format(java.util.Locale.ROOT,"%02x",value&255));
                File directory=new File(context.getCacheDir(),"haiagaru-video-frames");if(!directory.isDirectory()&&!directory.mkdirs())return;
                File image=new File(directory,key+".jpg");
                if(!image.isFile()||image.length()==0){
                    if(VideoFrameDecodeService.blocked(context))return;
                    staging=File.createTempFile("external-preview-",".jpg",directory);
                    if(!VideoFrameDecodeService.decode(context,source,staging,four,minimum,count)||!staging.renameTo(image))return;
                }
                XMediaAttachments.setFramePoster(url,variant,VideoThumbnailServer.register(key.toString(),image));
                ImgurAlbumAttachments.refreshVideoModels();ThreadListThumbnail.frameReady(url);
            }catch(Exception error){android.util.Log.w("HaiagaruMedia","Downloaded video preview unavailable",error);}
            finally{if(staging!=null)staging.delete();}
        });
    }
    static boolean retry(String url){return enqueue(url,true);}
    static boolean running(String url){return ATTEMPTED.running(currentVariant()+":"+url);}
    private static boolean enqueue(String url,boolean manual) {
        if(!DirectVideoUrls.supported(url)||!FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true)||Haiagaru.mediaAutoFetchMode()==3)return false;
        boolean four = fourAllowed();
        int minimumSeconds = Haiagaru.videoPreviewMinimumSeconds(), count = Haiagaru.videoPreviewCount();
        String variant = variant(four, minimumSeconds, count);
        String attempt = variant + ":" + url;
        if(XMediaAttachments.hasFramePoster(url,variant))return false;
        long now=android.os.SystemClock.elapsedRealtime();
        if(!(manual?ATTEMPTED.beginManual(attempt,now):ATTEMPTED.begin(attempt,now)))return false;
        try{WORKER.execute(() -> {try{
            if(manual){Context context=Haiagaru.applicationContextForExtension();if(context!=null)context.getSharedPreferences("haiagaru-video-decoder-health",0).edit().putBoolean("unsafe",false).commit();}
            generate(url, four, variant, attempt, minimumSeconds, count);}
            finally{ATTEMPTED.finish(attempt,XMediaAttachments.hasFramePoster(url,variant),android.os.SystemClock.elapsedRealtime());}});}
        catch(java.util.concurrent.RejectedExecutionException unavailable){ATTEMPTED.cancel(attempt);return false;}
        return true;
    }
    static String currentVariant() { return variant(fourAllowed(), Haiagaru.videoPreviewMinimumSeconds(), Haiagaru.videoPreviewCount()); }
    private static String variant(boolean four, int minimumSeconds, int count) {
        return four ? "grid-v2-" + minimumSeconds + "-" + count : "single-v1";
    }
    private static HttpURLConnection connection(Context context, String url, boolean four) throws IOException {
        return connectionForPreview(context, url, four && Haiagaru.videoPreviewWifiOnly());
    }
    private static HttpURLConnection previewResponse(Context context,String url,boolean four,long timeoutMs)throws IOException {
        long deadline=android.os.SystemClock.elapsedRealtime()+timeoutMs;URL current=new URL(url);
        for(int redirects=0;redirects<=5;redirects++){
            long remaining=deadline-android.os.SystemClock.elapsedRealtime();
            if(remaining<=0)throw new VideoThumbnailFailure(VideoThumbnailFailure.TIMEOUT);
            HttpURLConnection response=connection(context,current.toString(),four);
            try{
                response.setInstanceFollowRedirects(false);
                response.setConnectTimeout((int)Math.min(8000,remaining));response.setReadTimeout((int)Math.min(8000,remaining));
                int status=response.getResponseCode();
                if(status!=301&&status!=302&&status!=303&&status!=307&&status!=308)return response;
                String location=response.getHeaderField("Location");
                if(location==null||redirects==5)throw new VideoThumbnailFailure(VideoThumbnailFailure.HTTP,status);
                URL next=new URL(current,location);
                if(!("https".equals(next.getProtocol())||"http".equals(next.getProtocol()))
                        ||next.getUserInfo()!=null||"https".equals(current.getProtocol())&&!"https".equals(next.getProtocol()))
                    throw new VideoThumbnailFailure(VideoThumbnailFailure.HTTP,status);
                current=next;
            }catch(IOException|RuntimeException error){response.disconnect();throw error;}
            response.disconnect();
        }
        throw new VideoThumbnailFailure(VideoThumbnailFailure.NETWORK);
    }
    static HttpURLConnection connectionForPreview(Context context, String url, boolean wifiOnly) throws IOException {
        URL address = new URL(url);
        if (wifiOnly && android.os.Build.VERSION.SDK_INT >= 21) {
            android.net.ConnectivityManager cm = (android.net.ConnectivityManager)context.getSystemService(Context.CONNECTIVITY_SERVICE);
            for (android.net.Network network : cm.getAllNetworks()) {
                android.net.NetworkInfo info = cm.getNetworkInfo(network);
                if (info != null && info.isConnected() && info.getType() == android.net.ConnectivityManager.TYPE_WIFI)
                    return (HttpURLConnection)network.openConnection(address);
            }
            throw new IOException("Wi-Fi unavailable; no cellular fallback");
        }
        return (HttpURLConnection)address.openConnection();
    }
    private static void generate(String url, boolean four, String variant, String attempt, int minimumSeconds, int count) {
        Context context = Haiagaru.applicationContextForExtension();
        if (context == null) return;
        if(!FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true))return;
        File video = null;
        HttpURLConnection connection = null;
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest((variant + ":" + url).getBytes("UTF-8"));
            StringBuilder key = new StringBuilder();
            for (byte b : digest) key.append(String.format(java.util.Locale.ROOT, "%02x", b & 255));
            File directory = new File(context.getCacheDir(), "haiagaru-video-frames");
            if (!directory.exists() && !directory.mkdirs()) throw new VideoThumbnailFailure(VideoThumbnailFailure.STORAGE);
            File image = new File(directory, key + ".jpg");
            if (!image.isFile() || image.length()==0) {
                if (VideoFrameDecodeService.blocked(context)) throw new VideoThumbnailFailure(VideoThumbnailFailure.STOPPED);
                if (Haiagaru.mediaAutoFetchMode() == 3) return;
                // Settings/network may have changed while this request was queued.
                if (four && !fourAllowed()) { ATTEMPTED.cancel(attempt); return; }
                video = File.createTempFile("frame-", ".mp4", directory);
                long maxBytes = Haiagaru.videoThumbnailMaxMb() * 1024L * 1024L;
                long timeoutMs = Haiagaru.videoThumbnailTimeoutSeconds() * 1000L;
                long started = android.os.SystemClock.elapsedRealtime();
                connection = previewResponse(context, url, four, timeoutMs);
                int status = connection.getResponseCode();
                if("challenge".equalsIgnoreCase(connection.getHeaderField("cf-mitigated")))
                    throw new VideoThumbnailFailure(VideoThumbnailFailure.ACCESS_CHECK);
                String contentType=connection.getContentType();
                if(contentType!=null&&(contentType.toLowerCase(java.util.Locale.ROOT).contains("text/html")
                        ||contentType.toLowerCase(java.util.Locale.ROOT).contains("application/xhtml")))
                    throw new VideoThumbnailFailure(VideoThumbnailFailure.ACCESS_CHECK);
                boolean rangePreview = status == 200 && connection.getContentLengthLong() > maxBytes
                        && android.os.Build.VERSION.SDK_INT >= 23 && rangeSupported(url);
                if (status != 200 || (connection.getContentLengthLong() > maxBytes && !rangePreview)) {
                    android.util.Log.w("HaiagaruMedia", "Video frame download rejected: HTTP " + status
                            + ", bytes=" + connection.getContentLengthLong() + ", limit=" + maxBytes);
                    throw status!=200?new VideoThumbnailFailure(VideoThumbnailFailure.HTTP,status):new VideoThumbnailFailure(VideoThumbnailFailure.LIMIT);
                }
                if (rangePreview) {
                    connection.disconnect(); connection = null;
                } else try (InputStream input = connection.getInputStream(); OutputStream output = new FileOutputStream(video)) {
                    byte[] buffer = new byte[8192];
                    long total = 0;
                        int bytesRead;
                    while (true) {
                        if(!FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true))return;
                        if (four && !fourAllowed()) { ATTEMPTED.cancel(attempt); return; }
                        long remaining = timeoutMs - (android.os.SystemClock.elapsedRealtime() - started);
                        if (remaining <= 0) throw new VideoThumbnailFailure(VideoThumbnailFailure.TIMEOUT);
                        connection.setReadTimeout((int) Math.min(8000L, remaining));
                        bytesRead = input.read(buffer);
                        if (bytesRead == -1) break;
                        total += bytesRead;
                        if (total > maxBytes) throw new VideoThumbnailFailure(VideoThumbnailFailure.LIMIT);
                        if (android.os.SystemClock.elapsedRealtime() - started > timeoutMs) throw new VideoThumbnailFailure(VideoThumbnailFailure.TIMEOUT);
                        output.write(buffer, 0, bytesRead);
                    }
                }
                File staging = File.createTempFile("preview-", ".jpg", directory);
                try {
                    if(!FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true))return;
                    long remaining=timeoutMs-(android.os.SystemClock.elapsedRealtime()-started);
                    if(rangePreview&&remaining<=0)throw new VideoThumbnailFailure(VideoThumbnailFailure.TIMEOUT);
                    boolean decoded = rangePreview
                            ? VideoFrameDecodeService.decodeRemote(context,url,staging,four,minimumSeconds,count,
                                maxBytes,remaining,four && Haiagaru.videoPreviewWifiOnly())
                            : VideoFrameDecodeService.decode(context,video,staging,four,minimumSeconds,count);
                    if (!decoded) throw new VideoThumbnailFailure(VideoThumbnailFailure.DECODE);
                    if (!staging.renameTo(image)) throw new VideoThumbnailFailure(VideoThumbnailFailure.STORAGE);
                } finally { staging.delete(); }
            }
            String poster = VideoThumbnailServer.register(key.toString(), image);
            XMediaAttachments.setFramePoster(url, variant, poster);
            android.util.Log.i("HaiagaruMedia", "Video frame ready: " + poster);
            ImgurAlbumAttachments.refreshVideoModels();
            ThreadListThumbnail.frameReady(url);
        } catch (Exception error) {
            failed(url,variant,error);
            android.util.Log.w("HaiagaruMedia", "Video frame generation failed", error);
        } catch (OutOfMemoryError error) {
            failed(url,variant,error);
            android.util.Log.w("HaiagaruMedia", "Video frame exceeded available memory");
        } finally {
            if (connection != null) connection.disconnect();
            if (video != null) video.delete();
        }
    }

    private static void failed(String url,String variant,Throwable error){
        if(!FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true)||Haiagaru.mediaAutoFetchMode()==3)return;
        try{
            byte[] digest=MessageDigest.getInstance("SHA-256").digest((variant+":"+url).getBytes("UTF-8"));
            StringBuilder key=new StringBuilder();for(byte b:digest)key.append(String.format(java.util.Locale.ROOT,"%02x",b&255));
            XMediaAttachments.setFailurePoster(url,variant,VideoThumbnailServer.failure(key.toString(),VideoThumbnailFailure.from(error)));
            ImgurAlbumAttachments.refreshVideoModels();
        }catch(Exception|OutOfMemoryError unavailable){android.util.Log.w("HaiagaruMedia","Cannot display thumbnail failure");}
    }

    /** Called only inside the private decoder process, never the UI/app process. */
    static boolean rangeSupported(String url) {
        try { return "video.twimg.com".equalsIgnoreCase(new java.net.URI(url).getHost()) && DirectVideoUrls.supported(url); }
        catch (java.net.URISyntaxException error) { return false; }
    }
    static boolean decodeRemote(Context context,String url,File image,boolean four,int minimumSeconds,int count,
            long budget,long timeoutMs,boolean wifiOnly)throws Exception {
        if (android.os.Build.VERSION.SDK_INT < 23 || !rangeSupported(url)) return false;
        try (BoundedVideoDataSource data = new BoundedVideoDataSource(
                () -> connectionForPreview(context,url,wifiOnly),budget,timeoutMs)) {
            MediaMetadataRetriever retriever = new MediaMetadataRetriever();
            try {
                retriever.setDataSource(data);
                boolean result = decodeRetriever(retriever,image,four,minimumSeconds,count);
                android.util.Log.i("HaiagaruMedia","Video range preview: bytes="+data.transferredBytes()+", total="+data.getSize());
                return result;
            } finally { try { retriever.release(); } catch (Exception ignored) {} }
        }
    }
    static boolean decodeFile(File video,File image,boolean four,int minimumSeconds,int count)throws Exception {
        MediaMetadataRetriever retriever=new MediaMetadataRetriever();
        try {
            retriever.setDataSource(video.getAbsolutePath());
            return decodeRetriever(retriever,image,four,minimumSeconds,count);
        } finally { try { retriever.release(); } catch (Exception ignored) {} }
    }
    private static boolean decodeRetriever(MediaMetadataRetriever retriever,File image,boolean four,int minimumSeconds,int count)throws Exception {
        Bitmap frame=null;
        try {
            long duration=0;
            try{duration=Long.parseLong(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION));}catch(RuntimeException ignored){}
            frame=VideoPreviewPolicy.split(four,false,true,duration,minimumSeconds)?grid(retriever,duration,count):scaledFrame(retriever,0);
            if(frame==null)frame=scaledFrame(retriever,-1);
            if(frame==null&&duration>0)frame=scaledFrame(retriever,Math.min(1000,duration/2));
            if(frame==null)return false;
            if(Math.max(frame.getWidth(),frame.getHeight())>640){float scale=640f/Math.max(frame.getWidth(),frame.getHeight());Bitmap smaller=Bitmap.createScaledBitmap(frame,Math.max(1,Math.round(frame.getWidth()*scale)),Math.max(1,Math.round(frame.getHeight()*scale)),true);if(smaller!=frame)frame.recycle();frame=smaller;}
            try(OutputStream out=new FileOutputStream(image)){return frame.compress(Bitmap.CompressFormat.JPEG,85,out);}
        }finally{if(frame!=null)frame.recycle();}
    }

    private static Bitmap scaledFrame(MediaMetadataRetriever retriever, long milliseconds) {
        // Some codecs return no exact frame at timestamp zero, but expose a sync frame.
        // Keep decoding in the private service process and preserve the output size cap.
        Bitmap raw=null;
        if(android.os.Build.VERSION.SDK_INT>=27)try{
            raw=retriever.getScaledFrameAtTime(milliseconds<0?-1:milliseconds*1000,
                    MediaMetadataRetriever.OPTION_CLOSEST_SYNC,640,640);
        }catch(IllegalArgumentException ignored){}
        if(raw==null)raw=retriever.getFrameAtTime(milliseconds<0?-1:milliseconds*1000,
                MediaMetadataRetriever.OPTION_CLOSEST_SYNC);
        if (raw == null || Math.max(raw.getWidth(), raw.getHeight()) <= 640) return raw;
        float scale = 640f / Math.max(raw.getWidth(), raw.getHeight());
        Bitmap small = Bitmap.createScaledBitmap(raw, Math.max(1, Math.round(raw.getWidth() * scale)),
                Math.max(1, Math.round(raw.getHeight() * scale)), true);
        if (small != raw) raw.recycle();
        return small;
    }

    private static Bitmap grid(MediaMetadataRetriever retriever, long duration, int count) {
        int columns = VideoPreviewPolicy.columns(count), rows = (count + columns - 1) / columns;
        int size = 640 / columns;
        Bitmap result = Bitmap.createBitmap(size * columns, size * rows, Bitmap.Config.RGB_565);
        boolean complete = false;
        try {
            Canvas canvas = new Canvas(result); canvas.drawColor(Color.BLACK);
            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
            for (int i = 0; i < count; i++) {
                long time = VideoPreviewPolicy.positionMs(duration, i, count);
                Bitmap cell = scaledFrame(retriever, time);
                if (cell == null) return null;
                try {
                    int left = i % columns * size, top = i / columns * size;
                    float scale = Math.min((float)size / cell.getWidth(), (float)size / cell.getHeight());
                    float width = cell.getWidth() * scale, height = cell.getHeight() * scale;
                    canvas.drawBitmap(cell, null, new android.graphics.RectF(left + (size-width)/2,
                            top + (size-height)/2, left + (size+width)/2, top + (size+height)/2), paint);
                    float font = Math.max(12, size * .075f), band = font * 1.5f;
                    paint.setColor(0xcc000000); canvas.drawRect(left, top + size - band, left + size, top + size, paint);
                    paint.setColor(Color.WHITE); paint.setTextSize(font);
                    String label = VideoPreviewPolicy.time(time);
                    if (paint.measureText(label) > size - 8) paint.setTextSize(font * (size-8) / paint.measureText(label));
                    canvas.drawText(label, left + 4, top + size - 4, paint);
                } finally { cell.recycle(); }
            }
            complete = true; return result;
        } finally { if (!complete) result.recycle(); }
    }
}
