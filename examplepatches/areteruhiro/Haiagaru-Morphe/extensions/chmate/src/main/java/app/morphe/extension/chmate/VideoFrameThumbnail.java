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
        if(!DirectVideoUrls.supported(url))return;
        if(!FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true))return;
        boolean four = fourAllowed();
        int minimumSeconds = Haiagaru.videoPreviewMinimumSeconds(), count = Haiagaru.videoPreviewCount();
        String variant = variant(four, minimumSeconds, count);
        String attempt = variant + ":" + url;
        if(XMediaAttachments.hasFramePoster(url,variant))return;
        if(!ATTEMPTED.begin(attempt,android.os.SystemClock.elapsedRealtime()))return;
        try{WORKER.execute(() -> {try{generate(url, four, variant, attempt, minimumSeconds, count);}
            finally{ATTEMPTED.finish(attempt,XMediaAttachments.hasFramePoster(url,variant),android.os.SystemClock.elapsedRealtime());}});}
        catch(java.util.concurrent.RejectedExecutionException unavailable){ATTEMPTED.cancel(attempt);}
    }
    static String currentVariant() { return variant(fourAllowed(), Haiagaru.videoPreviewMinimumSeconds(), Haiagaru.videoPreviewCount()); }
    private static String variant(boolean four, int minimumSeconds, int count) {
        return four ? "grid-v2-" + minimumSeconds + "-" + count : "single-v1";
    }
    private static HttpURLConnection connection(Context context, String url, boolean four) throws IOException {
        URL address = new URL(url);
        if (four && Haiagaru.videoPreviewWifiOnly() && android.os.Build.VERSION.SDK_INT >= 21) {
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
            if (!directory.exists() && !directory.mkdirs()) return;
            File image = new File(directory, key + ".jpg");
            if (!image.exists()) {
                if (VideoFrameDecodeService.blocked(context)) return;
                if (Haiagaru.mediaAutoFetchMode() == 3) return;
                // Settings/network may have changed while this request was queued.
                if (four && !fourAllowed()) { ATTEMPTED.cancel(attempt); return; }
                video = File.createTempFile("frame-", ".mp4", directory);
                long maxBytes = Haiagaru.videoThumbnailMaxMb() * 1024L * 1024L;
                long timeoutMs = Haiagaru.videoThumbnailTimeoutSeconds() * 1000L;
                long started = android.os.SystemClock.elapsedRealtime();
                connection = connection(context, url, four);
                connection.setInstanceFollowRedirects(false);
                connection.setConnectTimeout((int) Math.min(8000L, timeoutMs));
                connection.setReadTimeout((int) Math.min(8000L, timeoutMs));
                int status = connection.getResponseCode();
                if (status != 200 || connection.getContentLengthLong() > maxBytes) {
                    android.util.Log.w("HaiagaruMedia", "Video frame download rejected: HTTP " + status
                            + ", bytes=" + connection.getContentLengthLong() + ", limit=" + maxBytes);
                    return;
                }
                try (InputStream input = connection.getInputStream(); OutputStream output = new FileOutputStream(video)) {
                    byte[] buffer = new byte[8192];
                    long total = 0;
                        int bytesRead;
                    while (true) {
                        if(!FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true))return;
                        if (four && !fourAllowed()) { ATTEMPTED.cancel(attempt); return; }
                        long remaining = timeoutMs - (android.os.SystemClock.elapsedRealtime() - started);
                        if (remaining <= 0) return;
                        connection.setReadTimeout((int) Math.min(8000L, remaining));
                        bytesRead = input.read(buffer);
                        if (bytesRead == -1) break;
                        total += bytesRead;
                        if (total > maxBytes || android.os.SystemClock.elapsedRealtime() - started > timeoutMs) return;
                        output.write(buffer, 0, bytesRead);
                    }
                }
                File staging = File.createTempFile("preview-", ".jpg", directory);
                try {
                    if(!FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true))return;
                    if (!VideoFrameDecodeService.decode(context,video,staging,four,minimumSeconds,count)) return;
                    if (!staging.renameTo(image)) return;
                } finally { staging.delete(); }
            }
            String poster = VideoThumbnailServer.register(key.toString(), image);
            XMediaAttachments.setFramePoster(url, variant, poster);
            android.util.Log.i("HaiagaruMedia", "Video frame ready: " + poster);
            ImgurAlbumAttachments.refreshVideoModels();
        } catch (Exception error) {
            android.util.Log.w("HaiagaruMedia", "Video frame generation failed", error);
        } catch (OutOfMemoryError error) {
            android.util.Log.w("HaiagaruMedia", "Video frame exceeded available memory");
        } finally {
            if (connection != null) connection.disconnect();
            if (video != null) video.delete();
        }
    }

    /** Called only inside the private decoder process, never the UI/app process. */
    static boolean decodeFile(File video,File image,boolean four,int minimumSeconds,int count)throws Exception {
        MediaMetadataRetriever retriever=null;Bitmap frame=null;
        try {
            retriever=new MediaMetadataRetriever();
            retriever.setDataSource(video.getAbsolutePath());
            long duration=0;
            try{duration=Long.parseLong(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION));}catch(RuntimeException ignored){}
            frame=VideoPreviewPolicy.split(four,false,true,duration,minimumSeconds)?grid(retriever,duration,count):scaledFrame(retriever,0);
            if(frame==null)frame=scaledFrame(retriever,0);
            if(frame==null)return false;
            if(Math.max(frame.getWidth(),frame.getHeight())>640){float scale=640f/Math.max(frame.getWidth(),frame.getHeight());Bitmap smaller=Bitmap.createScaledBitmap(frame,Math.max(1,Math.round(frame.getWidth()*scale)),Math.max(1,Math.round(frame.getHeight()*scale)),true);if(smaller!=frame)frame.recycle();frame=smaller;}
            try(OutputStream out=new FileOutputStream(image)){return frame.compress(Bitmap.CompressFormat.JPEG,85,out);}
        }finally{if(frame!=null)frame.recycle();if(retriever!=null)try{retriever.release();}catch(Exception ignored){}}
    }

    private static Bitmap scaledFrame(MediaMetadataRetriever retriever, long milliseconds) {
        if (android.os.Build.VERSION.SDK_INT >= 27)
            return retriever.getScaledFrameAtTime(milliseconds * 1000, MediaMetadataRetriever.OPTION_CLOSEST, 640, 640);
        Bitmap raw = retriever.getFrameAtTime(milliseconds * 1000, MediaMetadataRetriever.OPTION_CLOSEST);
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
