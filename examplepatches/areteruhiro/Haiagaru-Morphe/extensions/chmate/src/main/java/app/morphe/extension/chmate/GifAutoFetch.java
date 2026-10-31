package app.morphe.extension.chmate;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
import java.util.concurrent.*;

/** Native attachments only; never changes response links or starts playback on its own. */
final class GifAutoFetch {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ThreadPoolExecutor WORKER = new ThreadPoolExecutor(1, 1, 30, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(16), new ThreadPoolExecutor.AbortPolicy());
    private static final Map<String, String> POSTERS = new LinkedHashMap<>(128,.75f,true);
    private static final Set<String> POSTER_URLS = new HashSet<>();
    private static final MediaAttemptGate ATTEMPTS = new MediaAttemptGate(128,60000);
    private static final Set<String> CHANGED_URLS = new HashSet<>();
    private static boolean changeQueued,changeAll;
    private static final Map<Object, Source> MODELS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final class Source {
        final String body;final String[] gifs;
        final Set<String> references=Collections.synchronizedSet(new HashSet<>());
        final Set<String> posters=Collections.synchronizedSet(new LinkedHashSet<>());
        Source(String body,Source previous) {
            this.body=body;gifs=GifAutoFetchPolicy.extract(body);Collections.addAll(references,gifs);
            if(previous!=null)synchronized(previous.posters){posters.addAll(previous.posters);}
        }
        void remember(String poster){synchronized(posters){posters.add(poster);while(posters.size()>64)posters.remove(posters.iterator().next());}}
    }
    static void changed(){queueChange(null);}
    private static void queueChange(String url){
        synchronized(CHANGED_URLS){if(url==null)changeAll=true;else CHANGED_URLS.add(url);
            if(changeQueued)return;changeQueued=true;MAIN.postDelayed(GifAutoFetch::flushChanges,32);}
    }
    private static void flushChanges(){
        Set<String> urls;boolean all;
        synchronized(CHANGED_URLS){urls=new HashSet<>(CHANGED_URLS);CHANGED_URLS.clear();all=changeAll;changeAll=false;changeQueued=false;}
        boolean affected=false;
        synchronized(MODELS){for(Map.Entry<Object,Source> item:MODELS.entrySet()){
            if(item.getKey()==null)continue;Source source=item.getValue();boolean matches=all;
            if(!matches)synchronized(source.references){for(String url:urls)if(source.references.contains(url)){matches=true;break;}}
            if(!matches)continue;affected=true;
            try{for(java.lang.reflect.Field field:NativeFields.all(item.getKey().getClass())){
                if(field.getType()!=CharSequence[].class||java.lang.reflect.Modifier.isStatic(field.getModifiers()))continue;
                NativeFields.find(field.getDeclaringClass(),field.getName()).set(item.getKey(),null);
            }}catch(ReflectiveOperationException ignored){ }
        }}
        if(affected||all)Haiagaru.refreshImgurAttachments();
    }
    static String[] project(Object model, String body, String[] original) {
        Source source;
        synchronized (MODELS) {
            source = MODELS.get(model);
            if (source == null || !Objects.equals(source.body, body)) {
                source = new Source(body,source);
                if (MODELS.size() >= 4096) MODELS.remove(MODELS.keySet().iterator().next());
                MODELS.put(model, source);
            }
        }
        int mode = Haiagaru.gifAutoFetchMode();
        LinkedHashSet<String> result = new LinkedHashSet<>(), gifs = new LinkedHashSet<>();
        synchronized (POSTERS) {
            for (String url : original) {
                if (GifAutoFetchPolicy.supported(url)) gifs.add(PreviewUrls.normalize(url));
                else if (!source.posters.contains(url)&&!POSTER_URLS.contains(url)) result.add(url);
            }
        }
        // Native arrays may already contain a previous mode's projection. Re-extract direct
        // links so changing OFF -> ON can restore them without changing the posted text.
        Collections.addAll(gifs, source.gifs);
        source.references.addAll(gifs);
        for (String url : gifs) {
            if (GifAutoFetchPolicy.image(mode)) {
                String poster;
                synchronized (POSTERS) { poster = POSTERS.get(url); }
                if (poster != null) {source.remember(poster);result.add(poster);}
                else request(url);
            }
            if (GifAutoFetchPolicy.gif(mode)) result.add(url);
        }
        String[] projected = result.toArray(new String[0]);
        return Arrays.equals(original, projected) ? original : projected;
    }
    private static void request(String url) {
        if(!ATTEMPTS.begin(url,android.os.SystemClock.elapsedRealtime()))return;
        try{WORKER.execute(()->{
            boolean success=false;
            try{generate(url);synchronized(POSTERS){success=POSTERS.containsKey(url);}}
            finally{ATTEMPTS.finish(url,success,android.os.SystemClock.elapsedRealtime());}
        });}catch(RejectedExecutionException full){ATTEMPTS.cancel(url);}
    }
    private static void generate(String url) {
        HttpURLConnection connection = null;
        Bitmap bitmap = null;
        File staging = null;
        try {
            android.content.Context context = Haiagaru.applicationContextForExtension();
            if (context == null || !GifAutoFetchPolicy.image(Haiagaru.gifAutoFetchMode())) return;
            File directory = new File(context.getCacheDir(), "haiagaru-gif-posters");
            if (!directory.isDirectory() && !directory.mkdirs()) return;
            byte[] digest = java.security.MessageDigest.getInstance("SHA-256").digest(url.getBytes("UTF-8"));
            StringBuilder key = new StringBuilder("gif-");
            for (byte b : digest) key.append(String.format(Locale.ROOT, "%02x", b & 255));
            File image = new File(directory, key + ".jpg");
            if (!image.isFile()) {
                File original=GifMediaLoader.load(context,url,8*1024*1024,false,
                        ()->!GifAutoFetchPolicy.image(Haiagaru.gifAutoFetchMode()));
                BitmapFactory.Options options = new BitmapFactory.Options(); options.inJustDecodeBounds = true;
                BitmapFactory.decodeFile(original.getAbsolutePath(), options);
                if (options.outWidth <= 0 || options.outHeight <= 0 || options.outWidth > 16384 || options.outHeight > 16384) return;
                options.inJustDecodeBounds = false; options.inSampleSize = 1;
                while (Math.max(options.outWidth, options.outHeight) / options.inSampleSize > 480) options.inSampleSize *= 2;
                bitmap = BitmapFactory.decodeFile(original.getAbsolutePath(), options);
                if (bitmap == null) return;
                staging = File.createTempFile("poster-", ".jpg", directory);
                try (OutputStream file = new FileOutputStream(staging)) { if (!bitmap.compress(Bitmap.CompressFormat.JPEG, 85, file)) return; }
                if (!staging.renameTo(image)) return;
            }
            String poster = VideoThumbnailServer.register(key.toString(), image);
            synchronized (POSTERS) {
                String old=POSTERS.put(url,poster);if(old!=null)POSTER_URLS.remove(old);POSTER_URLS.add(poster);
                while(POSTERS.size()>512){String oldest=POSTERS.keySet().iterator().next();POSTER_URLS.remove(POSTERS.remove(oldest));}
            }
            if (GifAutoFetchPolicy.image(Haiagaru.gifAutoFetchMode())) queueChange(url);
        } catch (Exception | OutOfMemoryError unavailable) {
            android.util.Log.w("HaiagaruMedia", "GIF poster unavailable", unavailable);
        } finally {
            if (connection != null) connection.disconnect();
            if (bitmap != null) bitmap.recycle();
            if (staging != null && staging.isFile()) staging.delete();
        }
    }
    private GifAutoFetch() { }
}
