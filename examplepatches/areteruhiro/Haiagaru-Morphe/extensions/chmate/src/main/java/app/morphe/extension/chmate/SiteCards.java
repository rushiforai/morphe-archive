package app.morphe.extension.chmate;

import android.graphics.Bitmap;
import android.os.*;
import android.text.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

/** Shares native response binding with X previews, using a separate metadata/cache policy. */
final class SiteCards {
    static final String MAX_PER_RESPONSE_KEY="siteCardsMaxPerResponse";
    static final String CACHE_HOURS_KEY="siteCardsCacheHours";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ThreadPoolExecutor WORKER=new ThreadPoolExecutor(2,2,30,TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(32),new ThreadPoolExecutor.AbortPolicy());
    private static final LinkedHashMap<String,Entry> CACHE=new LinkedHashMap<>(128,.75f,true);
    private static final android.util.LruCache<String,Bitmap> IMAGES=new android.util.LruCache<String,Bitmap>(8*1024*1024){
        @Override protected int sizeOf(String key,Bitmap value){return value.getAllocationByteCount();}
    };
    private static final java.util.WeakHashMap<TextView,Boolean> VIEWS=new java.util.WeakHashMap<>();
    private static final ThreadLocal<TextView> WRITING=new ThreadLocal<>();
    private static final Pattern URL=Pattern.compile("https?://[^\\s<>\"'()（）]+",Pattern.CASE_INSENSITIVE);
    private static int revision;
    private static volatile int generation;
    private static final Object DISK = new Object();
    private static final class Entry {
        SiteCardMetadata.Data data; boolean pending,imageTried,imageLoaded; long expiry;
        final ArrayList<WeakReference<TextView>> waiting=new ArrayList<>();
    }
    private static final class Marker {
        final int revision,width,sourceHash; final boolean images;
        Marker(TextView view,CharSequence source){revision=SiteCards.revision;width=width(view);images=Haiagaru.siteCardImages();
            sourceHash=XPostPreview.originalText(source).hashCode();}
        boolean current(TextView view){return revision==SiteCards.revision&&width==width(view)&&images==Haiagaru.siteCardImages()
                &&sourceHash==XPostPreview.originalText(strip(view.getText())).hashCode();}
    }
    static boolean writing(Object object){return object==WRITING.get();}
    static int width(TextView view){
        float density=view.getResources().getDisplayMetrics().density;
        int available=view.getWidth()-view.getCompoundPaddingLeft()-view.getCompoundPaddingRight();
        if(available<=0)available=view.getResources().getDisplayMetrics().widthPixels-Math.round(40*density);
        return Math.max(1,Math.min(available,Math.round(680*density)));
    }
    static CharSequence strip(CharSequence source){
        if(source instanceof Spanned){Spanned s=(Spanned)source;Marker[] markers=s.getSpans(0,s.length(),Marker.class);
            if(markers.length>0)return source.subSequence(0,s.getSpanStart(markers[0]));}
        return source;
    }
    private static List<String> urls(CharSequence source){
        LinkedHashSet<String> result=new LinkedHashSet<>();Matcher m=URL.matcher(XPostPreview.originalText(strip(source)));
        int maximum=Haiagaru.siteCardMaxPerResponse();
        while(m.find()&&result.size()<maximum){
            String url=m.group().replace("&amp;","&").replaceAll("[.,、。]+$","");url=SiteCardMetadata.safeUrl(url);
            if(url==null)continue;
            android.net.Uri uri=android.net.Uri.parse(url);String host=uri.getHost().toLowerCase(Locale.ROOT),path=uri.getPath();
            if(host.equals("x.com")||host.endsWith(".x.com")||host.equals("twitter.com")||host.endsWith(".twitter.com")
                    ||host.equals("youtu.be")||host.endsWith("youtube.com")||host.endsWith("5ch.io")||host.endsWith("5ch.net")
                    ||path!=null&&path.matches("(?i).+\\.(gif|jpe?g|png|webp|mp4|webm|mp3|pdf|zip|apk)(/.*)?"))continue;
            result.add(url);
        }return new ArrayList<>(result);
    }
    static void onBound(Object object){
        if(!(object instanceof TextView)||object instanceof EditText||writing(object)||Looper.myLooper()!=Looper.getMainLooper())return;
        TextView view=(TextView)object;CharSequence text=view.getText();
        if(!(text instanceof Spanned)||text instanceof Editable||text.length()>100000)return;
        if(!Haiagaru.siteCardsEnabled()) {if(strip(text)!=text)write(view,strip(text));return;}
        Marker[] markers=((Spanned)text).getSpans(0,text.length(),Marker.class);
        // Native binding calls us before the first row measurement, even while not shown.
        // Apply memory-cached cards now rather than changing short-thread gravity after restore.
        if(markers.length==0){
            CharSequence warm=decorate(text,view);
            if(warm!=text){write(view,warm);text=view.getText();}
        }
        if(!view.isShown())return;
        CharSequence raw=strip(text);
        List<String> urls=urls(raw);if(urls.isEmpty()){if(raw!=text)write(view,raw);return;}
        VIEWS.put(view,true);
        for(String url:urls)lookup(url,view);
        markers=((Spanned)text).getSpans(0,text.length(),Marker.class);
        if(markers.length>0&&markers[0].current(view))return;
        CharSequence rendered=decorate(raw,view);
        if(rendered!=text&&(!rendered.toString().equals(text.toString())||markers.length>0))write(view,rendered);
    }
    static CharSequence decorate(CharSequence source,TextView view){
        source=strip(source);if(!Haiagaru.siteCardsEnabled())return source;
        SpannableStringBuilder result=null;
        for(String url:urls(source)) {
            Entry entry=CACHE.get(url);if(entry==null||entry.data==null||entry.expiry<System.currentTimeMillis())continue;
            if(result==null)result=new SpannableStringBuilder(source);
            SiteCardMetadata.Data data=entry.data;
            result.append("\n\n");int start=result.length();
            result.append(data.title).append(" — ").append(data.description).append(" · ").append(android.net.Uri.parse(url).getHost());
            result.setSpan(new SiteCardSpan(data,Haiagaru.siteCardImages()?IMAGES.get(url):null,view),start,result.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            result.setSpan(new SiteLink(url),start,result.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        if(result==null)return source;
        result.setSpan(new Marker(view,source),source.length(),result.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);return result;
    }
    static final class SiteLink extends XPostPreviewTouch.PostLink {
        SiteLink(String url){super(url);}
        @Override public void onClick(android.view.View view){
            if(!Haiagaru.siteCardsEnabled())return;
            try{view.getContext().startActivity(new android.content.Intent(android.content.Intent.ACTION_VIEW,android.net.Uri.parse(getURL()))
                    .addCategory(android.content.Intent.CATEGORY_BROWSABLE).addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK));}
            catch(RuntimeException missing){Toast.makeText(view.getContext(),"リンクを開けるアプリがありません",Toast.LENGTH_SHORT).show();}
        }
    }
    private static void write(TextView view,CharSequence text){
        WRITING.set(view);try{XPostPreviewPosition.beforeChange(view);view.setText(text,TextView.BufferType.SPANNABLE);}finally{WRITING.remove();}
    }
    private static void lookup(String url,TextView view){
        Entry entry=CACHE.get(url);
        if(entry==null){
            if(CACHE.size()>=128){String remove=null;for(Map.Entry<String,Entry> e:CACHE.entrySet())if(!e.getValue().pending){remove=e.getKey();break;}
                if(remove==null)return;CACHE.remove(remove);}
            entry=new Entry();CACHE.put(url,entry);
        }
        long now=System.currentTimeMillis();
        boolean image=Haiagaru.siteCardImages();
        if(!entry.pending&&entry.expiry>now&&(entry.data==null||!image
                ||entry.imageTried&&(!entry.imageLoaded||IMAGES.get(url)!=null)))return;
        entry.waiting.removeIf(v->v.get()==null);
        boolean found=false;for(WeakReference<TextView> v:entry.waiting)if(v.get()==view)found=true;
        if(!found&&entry.waiting.size()<32)entry.waiting.add(new WeakReference<>(view));
        if(entry.pending)return;
        entry.pending=true;Entry target=entry;int token=generation;
        try{WORKER.execute(()->{
            if(token!=generation)return;
            SiteCardMetadata.Data data=target.data;Bitmap bitmap=null;
            try{
                if(data==null||target.expiry<=System.currentTimeMillis()){
                    data=SiteCardMetadata.cached(url);
                    if(data==null&&Haiagaru.siteCardsEnabled()){
                        data=SiteCardMetadata.fetch(url);
                        if(data!=null)synchronized(DISK){if(token==generation)SiteCardMetadata.store(data);}
                    }
                }
                if(data!=null&&image&&Haiagaru.siteCardsEnabled()&&Haiagaru.siteCardImages()&&!data.image.isEmpty())
                    bitmap=SiteCardMetadata.image(data.image,data.tunnel||ImageVpnController.protectedPreview(url));
            }catch(Exception|OutOfMemoryError ignored){}
            SiteCardMetadata.Data resolved=data;Bitmap thumbnail=bitmap;
            MAIN.post(()->{
                if(token!=generation||CACHE.get(url)!=target)return;
                target.pending=false;target.data=resolved;target.imageTried=image;
                target.imageLoaded=thumbnail!=null;
                target.expiry=resolved==null?System.currentTimeMillis()+300000:resolved.savedAt+Haiagaru.siteCardCacheDurationMillis();
                if(thumbnail!=null)IMAGES.put(url,thumbnail);
                revision++;ArrayList<WeakReference<TextView>> waiting=new ArrayList<>(target.waiting);target.waiting.clear();
                for(WeakReference<TextView> v:waiting){TextView current=v.get();if(current!=null)onBound(current);}
            });
        });}catch(RejectedExecutionException full){entry.pending=false;entry.expiry=now+10000;}
    }
    static void changed(){
        MAIN.post(()->{revision++;long maxAge=Haiagaru.siteCardCacheDurationMillis();
            for(Entry entry:CACHE.values())if(entry.data!=null)entry.expiry=entry.data.savedAt+maxAge;
            for(TextView view:new ArrayList<>(VIEWS.keySet()))if(view!=null)onBound(view);
            EmojiFontFallback.refreshVisibleRows();});
    }
    static void clear(Runnable completed){
        generation++;revision++;CACHE.clear();IMAGES.evictAll();
        new Thread(()->{synchronized(DISK){SiteCardMetadata.clear();}MAIN.post(()->{changed();completed.run();});},"Haiagaru-site-cache-clear").start();
    }
    private SiteCards(){}
}
