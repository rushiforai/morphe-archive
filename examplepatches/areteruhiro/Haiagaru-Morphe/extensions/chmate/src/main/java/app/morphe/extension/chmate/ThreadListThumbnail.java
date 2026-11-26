package app.morphe.extension.chmate;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.widget.BaseAdapter;
import android.widget.TextView;
import android.view.View;
import android.view.ViewGroup;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicBoolean;

/** Native title-only thumbnail decoration. Works for both ListView and RecyclerView. */
public final class ThreadListThumbnail {
    private static final AtomicLong TASK_ORDER=new AtomicLong();
    private static final ExecutorService IO=new ThreadPoolExecutor(2,2,0,TimeUnit.MILLISECONDS,
            new PriorityBlockingQueue<>(),r->{Thread t=new Thread(r,"Haiagaru-thread-thumbnail");t.setDaemon(true);return t;});
    private static final ExecutorService ANIMANCH_IO=Executors.newSingleThreadExecutor(r->{
        Thread thread=new Thread(r,"Haiagaru-animanch-thumbnail");
        thread.setDaemon(true);
        return thread;
    });
    private static final Map<String,List<Bitmap>> IMAGES=Collections.synchronizedMap(new LinkedHashMap<String,List<Bitmap>>(64,.75f,true){
        @Override protected boolean removeEldestEntry(Map.Entry<String,List<Bitmap>> entry){return size()>64;}
    });
    private static final Map<String,List<String>> SOURCES=Collections.synchronizedMap(new LinkedHashMap<String,List<String>>(64,.75f,true){
        @Override protected boolean removeEldestEntry(Map.Entry<String,List<String>> entry){return size()>128;}
    });
    private static final Map<String,Long> FAILED=Collections.synchronizedMap(new LinkedHashMap<String,Long>(128,.75f,true){
        @Override protected boolean removeEldestEntry(Map.Entry<String,Long> entry){return size()>1200;}
    });
    private static final Set<String> PENDING=ConcurrentHashMap.newKeySet();
    private static final Set<String> ANIMANCH_PENDING=ConcurrentHashMap.newKeySet();
    static final String REGISTERED_ACTION="threadListRegisteredImageAction";
    private static final Map<String,Boolean> HIDDEN=Collections.synchronizedMap(new LinkedHashMap<String,Boolean>(64,.75f,true){
        @Override protected boolean removeEldestEntry(Map.Entry<String,Boolean> entry){return size()>128;}
    });
    private static final Map<View,RowState> COLLAPSED=new WeakHashMap<>();
    private static final class RowState{
        final int height,visibility,accessibility;
        RowState(View row){height=row.getLayoutParams().height;visibility=row.getVisibility();accessibility=row.getImportantForAccessibility();}
    }
    static void restoreRow(Object object){
        View row=rowView(object);
        if(row==null)return;
        RowState saved=COLLAPSED.remove(row);
        if(saved==null)return;
        ViewGroup.LayoutParams params=row.getLayoutParams();
        if(params!=null){params.height=saved.height;row.setLayoutParams(params);}
        row.setVisibility(saved.visibility);row.setImportantForAccessibility(saved.accessibility);
    }
    private static View rowView(Object object){
        if(object instanceof View)return (View)object;
        if(object==null)return null;
        try{return (View)object.getClass().getField("itemView").get(object);}
        catch(ReflectiveOperationException|RuntimeException ignored){return null;}
    }
    private static void collapseRow(Object object){
        View row=rowView(object);
        if(row==null||COLLAPSED.containsKey(row)||row.getLayoutParams()==null)return;
        COLLAPSED.put(row,new RowState(row));
        ViewGroup.LayoutParams params=row.getLayoutParams();
        params.height=0;row.setLayoutParams(params);
        row.setVisibility(View.GONE);row.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
    }
    private static final Map<Object,Boolean> ADAPTERS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThreadLocal<Selection> CURRENT=new ThreadLocal<>();
    private static final AtomicBoolean REFRESH=new AtomicBoolean();

    private static final class Selection {
        final Context context;
        final SiteBoardGateway gateway;
        final String site;
        final ThreadListThumbnailRules.Board five;
        TextView title;
        String id;
        Selection(Context context,String site,ThreadListThumbnailRules.Board five){
            this.context=context;this.site=site;this.five=five;
            this.gateway=site==null?null:SiteBoardGateway.get(context);
        }
        String cacheKey(int count){return (site==null?"5ch:"+five.host+":"+five.name+":"+id:"site:"+site+":"+id)+":"+count;}
    }

    /** Called at native adapter entry, before any title or subject is bound. */
    public static void begin(Object adapter){
        CURRENT.remove();
        if(adapter==null||!MobileMediaPolicy.allowed(MobileMediaPolicy.LIST))return;
        Context context=Haiagaru.applicationContextForExtension();
        if(context==null)return;
        String site=SiteThreadMetadata.currentBoard();
        if(site!=null){
            if(!ThreadListThumbnailSettings.selected(context,"site:"+site))return;
            CURRENT.set(new Selection(context,site,null));ADAPTERS.put(adapter,true);return;
        }
        String member=adapter.getClass().getName().equals("o.m8a")?"r":adapter.getClass().getName().equals("o.getWriteBytesTotal")?"g":adapter.getClass().getName().equals("o.zzavb")?"c":null;
        if(member==null)return;
        try{
            Field field=adapter.getClass().getDeclaredField(member);field.setAccessible(true);
            Object board=field.get(adapter);
            ThreadListThumbnailRules.Board five=ThreadListThumbnailRules.board(board==null?null:board.toString());
            if(five==null)return;
            ThreadListThumbnailSettings.rememberFiveCh(context,five);
            if(!ThreadListThumbnailSettings.selected(context,five.settingsKey()))return;
            CURRENT.set(new Selection(context,null,five));ADAPTERS.put(adapter,true);
        }catch(ReflectiveOperationException | RuntimeException ignored){/* Unknown native adapters remain untouched. */}
    }

    /** The subject can be read after setText on some ChMate builds. */
    public static void title(TextView title){
        if(title==null)return;
        // Native adapters recycle title views, including rows without an opening image.
        // Restore the original native thumbnail before this recycled row is decorated.
        Drawable[] current=title.getCompoundDrawablesRelative();
        if(current[0] instanceof ThumbnailDrawable){
            ThumbnailDrawable previous=(ThumbnailDrawable)current[0];
            title.setCompoundDrawablesRelative(previous.nativeStart,current[1],current[2],current[3]);
            title.setCompoundDrawablePadding(previous.nativePadding);
        }
        Selection state=CURRENT.get();if(state!=null)state.title=title;
    }

    public static void subject(Object row){
        Selection state=CURRENT.get();if(state==null||row==null)return;
        state.id=null;
        String type=row.getClass().getName();
        String name=type.equals("o.MaxAdViewImplExternalSyntheticLambda1")?"e":type.equals("o.CertificateChainCleaner")?"b":type.equals("o.setSkipText")?"d":null;
        if(name==null)return;
        try{
            Field field=row.getClass().getDeclaredField(name);field.setAccessible(true);
            long number=field.getLong(row);
            if(state.site!=null)state.id=SiteThreadIds.source(Long.toString(number));
            else if(number>=1_000_000_000L&&number<SiteThreadIds.BASE)state.id=Long.toString(number);
        }catch(Exception unknown){/* Never guess a thread from a recycled row. */}
    }

    /** Called before each native row return, after both subject and title are known. */
    public static void end(Object row){
        restoreRow(row);
        Selection state=CURRENT.get();CURRENT.remove();
        if(state==null||state.id==null||state.title==null||!ThreadListThumbnailSettings.enabled(state.context))return;
        int maxImages=ThreadListThumbnailSettings.imageCount(state.context);
        android.content.SharedPreferences preferences=FeatureSwitches.prefs(state.context);
        int selected=preferences.getBoolean(ImageModeration.LIST,false)&&ImageModeration.available(state.context)?ImageModeration.selected():0;
        int action=preferences.getInt(REGISTERED_ACTION,0);
        boolean gray=preferences.getBoolean(ThumbnailAppearance.GRAY,false);
        boolean nativeNg=preferences.getBoolean(NativeImageNgList.ENABLE,false);
        long registeredRevision=action==0?0:RegisteredImageNg.listRevision(state.context);
        String sourceKey=state.cacheKey(maxImages);
        String key=sourceKey+":"+action+":"+registeredRevision+":"+selected+":"+gray+":"+preferences.getInt(ThumbnailAppearance.STRENGTH,3)+":"+nativeNg+":"+preferences.getInt(ThumbnailAppearance.SENSITIVITY,1);
        if(HIDDEN.containsKey(key)){collapseRow(row);return;}
        List<Bitmap> bitmaps=IMAGES.get(key);
        if(bitmaps!=null){decorate(state.title,bitmaps);return;}
        long now=SystemClock.elapsedRealtime();Long retry=FAILED.get(key);
        SiteBoardProtocol.Board board=state.site==null?null:state.gateway.boards.get(state.site);
        boolean animanch=board!=null&&board.kind.equals("animanch");
        Set<String> pending=animanch?ANIMANCH_PENDING:PENDING;
        if((retry!=null&&retry>now)||pending.size()>=(animanch?12:40)||!pending.add(key))return;
        ExecutorService executor=animanch?ANIMANCH_IO:IO;
        Runnable task=()->{
            try{
                if(!MobileMediaPolicy.allowed(MobileMediaPolicy.LIST))return;
                List<String> sources=SOURCES.get(sourceKey);
                if(sources==null){
                    // Collect spare candidates so an unavailable video does not hide later images.
                    int candidateLimit=Math.min(16,Math.max(4,maxImages*4));
                    sources=state.site==null?fiveChOpeningImages(state.context,state.five,state.id,candidateLimit):state.gateway.openingImages(state.site,state.id,candidateLimit,state.context);
                    sources=Collections.unmodifiableList(new ArrayList<>(sources));
                    SOURCES.put(sourceKey,sources);
                }
                if(sources.isEmpty()){FAILED.put(key,SystemClock.elapsedRealtime()+30*60_000L);return;}
                List<Bitmap> decoded=new ArrayList<>();
                boolean awaitingVideo=false;
                for(String source:sources){
                    if(decoded.size()>=maxImages&&action!=2)break;
                    try{
                        byte[] bytes;
                        if(ThreadListThumbnailRules.videoUrl(source)){
                            String poster=XMediaAttachments.readyThumbnailPoster(source);
                            if(poster==null){
                                if(FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true)&&Haiagaru.mediaAutoFetchMode()!=3){
                                    VideoFrameThumbnail.request(source);
                                    awaitingVideo=true;
                                }
                                continue;
                            }
                            bytes=poster.startsWith("http://127.0.0.1:")
                                    ?VideoThumbnailServer.registeredBytes(poster,3*1024*1024)
                                    :fetch(state.context,poster,3*1024*1024,true);
                        }else{
                            bytes=openingImageBytes(state,source);
                        }
                        if(bytes==null)continue;
                        boolean registered=action!=0&&!ThreadListThumbnailRules.videoUrl(source)
                                &&RegisteredImageNg.listMatch(state.context,bytes);
                        if(registered&&action==2){
                            HIDDEN.put(key,true);FAILED.remove(key);refresh();return;
                        }
                        if(registered&&action==1||decoded.size()>=maxImages)continue;
                        Bitmap bitmap=decode(bytes);
                        if(bitmap!=null){
                            int flags=selected==0?0:ImageModeration.classify(state.context,bitmap);
                            if(flags==ImageModeration.UNKNOWN){bitmap.recycle();continue;}
                            if(registered&&action==3||(flags&selected)!=0||(nativeNg&&NativeImageNgList.flagged(state.context,bitmap,source))){
                                Bitmap obscured=ThumbnailAppearance.mosaic(state.context,bitmap,gray);
                                bitmap.recycle();bitmap=obscured;
                            }
                            decoded.add(bitmap);
                        }
                    }catch(ThumbnailRequestPacing.Deferred limited){throw limited;}
                    catch(IOException unavailable){/* Keep the other valid opening images. */}
                }
                if(decoded.isEmpty()){
                    if(!awaitingVideo&&action==1){IMAGES.put(key,Collections.emptyList());refresh();}
                    else FAILED.put(key,SystemClock.elapsedRealtime()+(awaitingVideo?30:15)*60_000L);
                    return;
                }
                IMAGES.put(key,Collections.unmodifiableList(decoded));FAILED.remove(key);refresh();
            }catch(ThumbnailRequestPacing.Deferred limited){
                FAILED.put(key,limited.retryAt);
            }catch(Exception unavailable){FAILED.put(key,SystemClock.elapsedRealtime()+15*60_000L);}
            finally{pending.remove(key);}
        };
        if(animanch)executor.execute(task);
        else executor.execute(new PriorityTask(task,state.title.isShown()?0:1,TASK_ORDER.getAndIncrement()));
    }

    private static final class PriorityTask implements Runnable,Comparable<PriorityTask>{
        private final Runnable task;private final int priority;private final long order;
        PriorityTask(Runnable task,int priority,long order){this.task=task;this.priority=priority;this.order=order;}
        @Override public void run(){task.run();}
        @Override public int compareTo(PriorityTask other){int rank=Integer.compare(priority,other.priority);return rank!=0?rank:Long.compare(order,other.order);}
    }

    private static byte[] openingImageBytes(Selection state,String url)throws IOException{
        String host=ThumbnailRequestPacing.host(url);
        if(state.site!=null&&(host.equals(ThumbnailRequestPacing.DEFAULT_HOST)||host.endsWith(".2chan.net")))
            return state.gateway.openingImageBytes(state.context,url);
        return fetch(state.context,url,3*1024*1024,true);
    }

    /** Called by the video decoder after a real frame poster is registered. */
    static void frameReady(String videoUrl){
        boolean changed=false;
        synchronized(SOURCES){
            for(Map.Entry<String,List<String>> entry:SOURCES.entrySet())if(entry.getValue().contains(videoUrl)){
                String prefix=entry.getKey()+":";
                synchronized(IMAGES){IMAGES.keySet().removeIf(key->key.startsWith(prefix));}
                synchronized(FAILED){FAILED.keySet().removeIf(key->key.startsWith(prefix));}
                changed=true;
            }
        }
        if(changed)refresh();
    }

    private static void decorate(TextView title,List<Bitmap> bitmaps){
        CharSequence original=title.getText();
        if(original==null||original.length()==0||bitmaps.isEmpty())return;
        // A single compound drawable holds all thumbnails and reserves its whole width
        // on every title line, including when ChMate wraps the title to 2+ lines.
        Drawable[] nativeDrawables=title.getCompoundDrawablesRelative();
        int originalPadding=title.getCompoundDrawablePadding();
        ThumbnailDrawable drawable=new ThumbnailDrawable(title,bitmaps,nativeDrawables[0],originalPadding);
        title.setCompoundDrawablePadding(Math.round(8*title.getResources().getDisplayMetrics().density));
        title.setCompoundDrawablesRelative(drawable,nativeDrawables[1],nativeDrawables[2],nativeDrawables[3]);
    }
    private static final class ThumbnailDrawable extends Drawable {
        final Drawable nativeStart;
        final int nativePadding;
        final List<Bitmap> images;
        final RectF[] targets;
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
        ThumbnailDrawable(TextView title,List<Bitmap> bitmaps,Drawable original,int padding){
            nativeStart=original;nativePadding=padding;images=bitmaps;
            float density=title.getResources().getDisplayMetrics().density;
            int requested=Math.round(ThreadListThumbnailSettings.sizeDp(title.getContext())*density);
            int viewWidth=title.getWidth()>0?title.getWidth():title.getResources().getDisplayMetrics().widthPixels;
            int maxWidth=Math.max(Math.round(24*density),Math.round(viewWidth*.45f));
            int gap=Math.round(3*density);
            int available=Math.max(1,(maxWidth-gap*(bitmaps.size()-1))/bitmaps.size());
            int box=Math.max(1,Math.min(requested,available));
            targets=new RectF[bitmaps.size()];
            float x=0,height=0;
            for(int i=0;i<bitmaps.size();i++){
                Bitmap bitmap=bitmaps.get(i);
                float scale=Math.min((float)box/bitmap.getWidth(),(float)box/bitmap.getHeight());
                float w=Math.max(1,bitmap.getWidth()*scale),h=Math.max(1,bitmap.getHeight()*scale);
                targets[i]=new RectF(x,0,x+w,h);
                x+=w+(i==bitmaps.size()-1?0:gap);
                height=Math.max(height,h);
            }
            for(RectF target:targets)target.offset(0,(height-target.height())/2f);
            setBounds(0,0,(int)Math.ceil(x),(int)Math.ceil(height));
        }
        @Override public void draw(Canvas canvas){
            for(int i=0;i<images.size();i++)canvas.drawBitmap(images.get(i),null,targets[i],paint);
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);invalidateSelf();}
        @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
        @Override public int getIntrinsicWidth(){return getBounds().width();}
        @Override public int getIntrinsicHeight(){return getBounds().height();}
    }

    private static Bitmap decode(byte[] bytes){
        BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;
        BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);
        if(options.outWidth<1||options.outHeight<1||options.outWidth>16000||options.outHeight>16000)return null;
        options.inJustDecodeBounds=false;options.inPreferredConfig=Bitmap.Config.RGB_565;
        options.inSampleSize=1;
        while(Math.max(options.outWidth,options.outHeight)/options.inSampleSize>160)options.inSampleSize*=2;
        return BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);
    }

    private static List<String> fiveChOpeningImages(Context context,ThreadListThumbnailRules.Board board,String id,int limit)throws IOException{
        String address=board.threadUrl(id);
        String dat=board.openingDatUrl(id);
        if(dat!=null){
            String opening=EdgeOpeningDat.body((first,last)->ThumbnailRequestPacing.fetch(context,dat,
                    gate->fetchOpeningDat(dat,first,last,gate)),board.host.equals("die-or.work")?2:1);
            return ThreadListThumbnailRules.openingTextMedia(opening,address,limit);
        }
        byte[] html=ThumbnailRequestPacing.fetch(context,address+"1",gate->fetchOpeningHtml(address+"1",id,gate));
        return ThreadListThumbnailRules.firstFiveChImages(new String(html,java.nio.charset.StandardCharsets.UTF_8),address,limit);
    }

    private static byte[] fetchOpeningHtml(String address,String id,ThumbnailRequestPacing.Gate gate)throws IOException{
        HttpURLConnection connection=(HttpURLConnection)URI.create(address).toURL().openConnection();
        connection.setInstanceFollowRedirects(false);connection.setConnectTimeout(6000);connection.setReadTimeout(10000);
        connection.setRequestProperty("User-Agent","Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 Chrome/120 Mobile Safari/537.36");
        try{
            int status=connection.getResponseCode();
            if(gate!=null)gate.check(status,connection.getHeaderField("Retry-After"));
            if(status!=200)throw new IOException("HTTP "+status);
            try(InputStream input=new java.io.FilterInputStream(AppTrafficUsage.counting(Haiagaru.applicationContextForExtension(),"thread_list_images",connection.getInputStream())){
                @Override public void close()throws IOException{connection.disconnect();super.close();}
            }){
                String html=OpeningPostHtml.read(input,connection.getContentType(),address,"five",id,unused->false);
                connection.disconnect();return html.getBytes(java.nio.charset.StandardCharsets.UTF_8);
            }
        }finally{connection.disconnect();}
    }

    private static EdgeOpeningDat.Part fetchOpeningDat(String address,int first,int last,ThumbnailRequestPacing.Gate gate)throws IOException{
        HttpURLConnection connection=(HttpURLConnection)URI.create(address).toURL().openConnection();
        connection.setInstanceFollowRedirects(false);connection.setConnectTimeout(6000);connection.setReadTimeout(10000);
        connection.setRequestProperty("User-Agent","Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 Chrome/120 Mobile Safari/537.36");
        connection.setRequestProperty("Range","bytes="+first+"-"+last);
        connection.setRequestProperty("Accept-Encoding","identity");
        try{
            int status=connection.getResponseCode();
            if(gate!=null)gate.check(status,connection.getHeaderField("Retry-After"));
            if(status!=200&&status!=206)throw new IOException("HTTP "+status);
            int cap=status==200?EdgeOpeningDat.MAX_BYTES+1:last-first+2;
            try(InputStream input=AppTrafficUsage.counting(Haiagaru.applicationContextForExtension(),"thread_list_images",connection.getInputStream())){
                EdgeOpeningDat.Part part=new EdgeOpeningDat.Part(status,connection.getHeaderField("Content-Range"),
                        connection.getContentType(),EdgeOpeningDat.read(input,cap,address.startsWith("https://die-or.work/")?2:1));
                connection.disconnect();return part;
            }
        }finally{connection.disconnect();}
    }

    /** No redirect or non-HTTPS fallback: only explicitly selected public sources. */
    private static byte[] fetch(Context context,String address,int limit,boolean image)throws IOException{
        return ThumbnailRequestPacing.fetch(context,address,gate->fetch(address,limit,image,gate));
    }

    private static byte[] fetch(String address,int limit,boolean image,ThumbnailRequestPacing.Gate gate)throws IOException{
        if(!ThreadListThumbnailRules.publicImage(address))throw new IOException("取得先が対応範囲外です");
        if(image&&ImageVpnController.protectedPreview(address)){
            app.morphe.extension.chmate.vpn.nativecore.imagevpn.Image result=ImageVpnController.fetchPreview(address);
            byte[] body=result.getBody();String contentType=result.getContentType();
            if(body==null||body.length>limit||contentType==null||!contentType.toLowerCase(java.util.Locale.ROOT).startsWith("image/"))
                throw new IOException("VPN経由でサムネイルを取得できません");
            AppTrafficUsage.recordFeatureBytes(Haiagaru.applicationContextForExtension(),"thread_list_images",body.length);
            return body;
        }
        limit=(int)MobileMediaPolicy.fileLimit(limit);
        HttpURLConnection c=(HttpURLConnection)URI.create(address).toURL().openConnection();
        c.setInstanceFollowRedirects(false);c.setConnectTimeout(6000);c.setReadTimeout(10000);
        c.setRequestProperty("User-Agent","Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 Chrome/120 Mobile Safari/537.36");
        try{
            int status=c.getResponseCode();
            if(gate!=null)gate.check(status,c.getHeaderField("Retry-After"));
            if(status!=200)throw new IOException("HTTP "+status);
            String type=c.getContentType();
            if(image&&(type==null||!type.toLowerCase(java.util.Locale.ROOT).startsWith("image/")))throw new IOException("画像ではありません");
            if(c.getContentLengthLong()>limit)throw new IOException("取得上限を超えました");
            try(InputStream in=AppTrafficUsage.counting(Haiagaru.applicationContextForExtension(),"thread_list_images",c.getInputStream());ByteArrayOutputStream result=new ByteArrayOutputStream()){
                byte[] buffer=new byte[8192];int n;
                while((n=in.read(buffer))!=-1){if(result.size()+n>limit)throw new IOException("取得上限を超えました");result.write(buffer,0,n);}
                return result.toByteArray();
            }
        }finally{c.disconnect();}
    }

    static void refresh(){
        if(!REFRESH.compareAndSet(false,true))return;
        new Handler(Looper.getMainLooper()).postDelayed(()->{
            REFRESH.set(false);List<Object> adapters;
            synchronized(ADAPTERS){adapters=new ArrayList<>(ADAPTERS.keySet());}
            for(Object adapter:adapters)if(adapter!=null)try{
                if(adapter instanceof BaseAdapter)((BaseAdapter)adapter).notifyDataSetChanged();
                else adapter.getClass().getMethod("notifyDataSetChanged").invoke(adapter);
            }catch(Exception ignored){/* A future native rebind still consumes the ready bitmap. */}
        },ThreadListThumbnailSettings.fastDisplay(Haiagaru.applicationContextForExtension())?50:500);
    }
    private ThreadListThumbnail(){}
}
