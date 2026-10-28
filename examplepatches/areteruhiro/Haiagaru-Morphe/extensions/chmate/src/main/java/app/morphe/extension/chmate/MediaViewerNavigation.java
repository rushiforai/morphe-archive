package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Rect;
import android.net.Uri;
import android.os.SystemClock;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.util.*;

/** One current viewer Activity; moving media does not grow the Android back stack. */
public final class MediaViewerNavigation {
    static final String EXTRA="haiagaru.media.links";
    static final String THREAD_EXTRA="haiagaru.media.thread";
    private static final WeakHashMap<Activity,Swipe> SWIPES=new WeakHashMap<>();
    private static final WeakHashMap<Intent,ThreadGallery> THREAD_GALLERIES=new WeakHashMap<>();
    private static final class ThreadGallery {
        final ArrayList<String> source,links;final String selected;
        ThreadGallery(ArrayList<String> source,String selected,ArrayList<String> links){this.source=source;this.selected=selected;this.links=links;}
    }
    private static WeakReference<TextView> body=new WeakReference<>(null);
    private static long touched;
    private static final class Swipe {float x,y;boolean dragging,blocked,cancelling;String selected;MediaViewerBackGesture back;}
    private static final WeakHashMap<Activity,WeakReference<Object>> MODELS=new WeakHashMap<>();

    static void rememberBody(TextView view,MotionEvent event) {
        if(event.getActionMasked()!=MotionEvent.ACTION_UP||!Haiagaru.videoViewerEnabled()||!DirectBodySelection.isBody(view))return;
        body=new WeakReference<>(view);touched=SystemClock.uptimeMillis();
    }
    static void prepare(Intent intent) {
        if(intent.hasExtra(EXTRA)||intent.getData()==null)return;
        TextView view=body.get();body.clear();
        if(view==null||!view.isShown()||!view.hasWindowFocus()||SystemClock.uptimeMillis()-touched>5000)return;
        if(prepareThread(intent,view.getContext(),intent.getDataString()))return;
        ArrayList<String> links=MediaGallery.links(bodyLinks(view.getText()),intent.getDataString());
        if(links.size()>1)intent.putStringArrayListExtra(EXTRA,links);
    }
    /** Invoked at ChMate's original thumbnail Intent factory, while its source pane is still visible. */
    public static void prepareNativeIntent(Intent intent,android.content.Context context) {
        if(intent==null||context==null||!Haiagaru.videoViewerEnabled())return;
        ArrayList<String> nativeLinks=intent.getStringArrayListExtra("links");int index=intent.getIntExtra("index",0);
        if(nativeLinks==null||index<0||index>=nativeLinks.size())return;
        if(context.getClass().getName().equals("jp.syoboi.a2chMate.activity.ImageListActivity")
                &&VideoViewerSettings.prefs(context).getBoolean(VideoViewerSettings.THREAD_MEDIA,false)){
            intent.putStringArrayListExtra(EXTRA,MediaGallery.links(nativeLinks,nativeLinks.get(index),4096)).putExtra(THREAD_EXTRA,true);return;
        }
        prepareThread(intent,context,nativeLinks.get(index));
    }
    private static boolean prepareThread(Intent intent,android.content.Context context,String selected) {
        if(!VideoViewerSettings.prefs(context).getBoolean(VideoViewerSettings.THREAD_MEDIA,false))return false;
        ArrayList<String> links=ExtraQuickFilters.threadMedia(context,selected);
        if(links==null||links.size()<2)return false;
        intent.putStringArrayListExtra(EXTRA,links).putExtra(THREAD_EXTRA,true);return true;
    }
    static java.util.List<String> bodyLinks(CharSequence source) {
        StringBuilder text=new StringBuilder(XPostPreview.originalText(source));
        if(source instanceof android.text.Spanned){
            android.text.Spanned spans=(android.text.Spanned)source;
            android.text.style.URLSpan[] urls=spans.getSpans(0,text.length(),android.text.style.URLSpan.class);
            if(urls.length<=256){
                java.util.Arrays.sort(urls,(a,b)->Integer.compare(spans.getSpanStart(b),spans.getSpanStart(a)));
                int end=text.length();
                for(android.text.style.URLSpan span:urls){int from=spans.getSpanStart(span),to=spans.getSpanEnd(span);String url=span.getURL();
                    if(from>=0&&from<to&&to<=end&&url!=null&&url.length()<=8192){text.replace(from,to,url);end=from;}}
            }
        }
        return PreviewUrls.extract(text,128);
    }
    static ArrayList<String> links(Activity activity) {
        Intent intent=activity.getIntent();ArrayList<String> links=intent.getStringArrayListExtra(EXTRA);
        if(links==null)links=intent.getStringArrayListExtra("links");
        String selected=current(activity);boolean thread=intent.getBooleanExtra(THREAD_EXTRA,false);
        if(thread){
            // Our launch snapshot is immutable. Do not normalize thousands of URLs
            // again on every tap, gesture DOWN, or position counter update.
            ThreadGallery cached=THREAD_GALLERIES.get(intent);
            if(cached!=null&&cached.source==links&&Objects.equals(cached.selected,selected))return cached.links;
            ArrayList<String> result=MediaGallery.links(links,selected,4096);
            THREAD_GALLERIES.put(intent,new ThreadGallery(links,selected,result));return result;
        }
        return MediaGallery.links(links,selected);
    }
    static String current(Activity activity) {
        Intent intent=activity.getIntent();
        if(intent.getData()!=null)return PreviewUrls.normalize(intent.getDataString());
        ArrayList<String> links=intent.getStringArrayListExtra("links");int index=intent.getIntExtra("index",0);
        if(activity.getClass().getName().equals("jp.syoboi.a2chMate.activity.ImagesViewer2Activity")){
            Integer displayed=nativeIndex(activity);if(displayed!=null&&displayed>=0)index=displayed;
        }
        return links!=null&&index>=0&&index<links.size()?PreviewUrls.normalize(links.get(index)):null;
    }
    private static WeakReference<Activity> nativeOpening=new WeakReference<>(null);
    static void nativeOpening(Activity activity){nativeOpening=new WeakReference<>(activity);}
    /** Compose's screen-local ViewModelStore is separate from the Activity store. */
    public static void registerNativeModel(Object model){
        Activity activity=nativeOpening.get();
        if(activity==null||activity.isFinishing()||activity.isDestroyed()||model==null)return;
        try{
            java.lang.reflect.Field field=model.getClass().getDeclaredField("h");field.setAccessible(true);
            ArrayList<String> links=activity.getIntent().getStringArrayListExtra("links");
            if(links!=null&&links.equals(field.get(model)))MODELS.put(activity,new WeakReference<>(model));
        }catch(ReflectiveOperationException|RuntimeException ignored){}
    }
    private static Integer nativeIndex(Activity activity){
        // 191/226 keep their current page on the Activity. 242 uses a Compose
        // SavedStateHandle flow; the Intent and ViewModel.j are launch values.
        for(String name:new String[]{"f","o"})try{
            java.lang.reflect.Field field=activity.getClass().getDeclaredField(name);
            if(field.getType()==int.class){field.setAccessible(true);return field.getInt(activity);}
        }catch(ReflectiveOperationException ignored){}
        try{
            WeakReference<Object> cached=MODELS.get(activity);Object model=cached==null?null:cached.get();
            if(model==null){
                Object store=activity.getClass().getMethod("getViewModelStore").invoke(activity);
                for(java.lang.reflect.Field field:store.getClass().getDeclaredFields()){
                    if(!Map.class.isAssignableFrom(field.getType()))continue;
                    field.setAccessible(true);Object value=field.get(store);if(!(value instanceof Map))continue;
                    for(Object candidate:((Map<?,?>)value).values())if(candidate!=null&&candidate.getClass().getName().equals("jp.syoboi.a2chMate.activity.ImagesViewerViewModel")){model=candidate;break;}
                    if(model!=null)break;
                }
                if(model!=null)MODELS.put(activity,new WeakReference<>(model));
            }
            if(model!=null){
                java.lang.reflect.Field field=model.getClass().getDeclaredField("f");field.setAccessible(true);Object flow=field.get(model);
                java.lang.reflect.Method get=flow.getClass().getMethod("d");get.setAccessible(true);
                Object value=get.invoke(flow);if(value instanceof Number)return ((Number)value).intValue();
            }
        }catch(ReflectiveOperationException|RuntimeException ignored){}
        return pagerIndex(activity.getWindow().getDecorView());
    }
    private static Integer pagerIndex(View view){
        if(!view.isShown())return null;
        for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())
            if(type.getName().equals("androidx.viewpager.widget.ViewPager")||type.getName().equals("androidx.viewpager2.widget.ViewPager2"))
                try{return ((Number)view.getClass().getMethod("getCurrentItem").invoke(view)).intValue();}catch(Exception ignored){}
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){Integer found=pagerIndex(group.getChildAt(i));if(found!=null)return found;}}
        return null;
    }
    static Intent destination(Activity activity,ArrayList<String> links,int index) {
        String url=links.get(index);Intent intent=new Intent();ArrayList<String> nativeLinks=new ArrayList<>(links);int nativeIndex=index;
        if(activity.getIntent().getExtras()!=null)intent.putExtras(activity.getIntent().getExtras());
        // Shared-element names belong to the original thumbnail row, not this
        // new page or its expanded/reindexed native image list.
        intent.removeExtra("sharedElements");
        if(GifAutoFetchPolicy.supported(url)&&!VideoViewerSettings.nativeGif(activity))intent.setClass(activity,GifViewerActivity.class).setData(Uri.parse(url));
        else if(DirectVideoUrls.supported(url)&&!VideoViewerSettings.nativeVideo(activity))intent.setClass(activity,VideoViewerActivity.class).setData(Uri.parse(url));
        else {
            intent.setClassName(activity,"jp.syoboi.a2chMate.activity.ImagesViewer2Activity");
            // The native pager eagerly loads neighbours. Give it only still images;
            // our separate list keeps GIF/video neighbours without duplicate transfers.
            nativeLinks.clear();for(String item:links)
                if((!GifAutoFetchPolicy.supported(item)||VideoViewerSettings.nativeGif(activity))
                        &&(!DirectVideoUrls.supported(item)||VideoViewerSettings.nativeVideo(activity)))nativeLinks.add(item);
            nativeIndex=nativeLinks.indexOf(url);
        }
        return intent.putStringArrayListExtra(EXTRA,new ArrayList<>(links))
                .putStringArrayListExtra("links",nativeLinks).putExtra("index",nativeIndex);
    }
    /** Native pager contains only media ChMate can load. Its label must still
     * index the complete mixed-media gallery used by our swipe gesture. */
    public static void setNativeCounter(TextView view,CharSequence nativeLabel){
        CharSequence label=nativeLabel;
        try{
            android.content.Context context=view.getContext();
            for(int depth=0;depth<16&&context instanceof android.content.ContextWrapper&&!(context instanceof Activity);depth++){
                android.content.Context base=((android.content.ContextWrapper)context).getBaseContext();if(base==context)break;context=base;
            }
            if(context instanceof Activity){
                Activity activity=(Activity)context;Intent intent=activity.getIntent();
                ArrayList<String> gallery=intent.getStringArrayListExtra(EXTRA),nativeLinks=intent.getStringArrayListExtra("links");
                if(gallery!=null&&nativeLinks!=null&&nativeLabel!=null){
                    java.util.regex.Matcher page=java.util.regex.Pattern.compile("^\\s*([0-9]+)\\s*/\\s*[0-9]+\\s*$").matcher(nativeLabel);
                    if(page.matches()){
                        // The native callback formats the next page before updating
                        // its Activity field / pager; use the label's own index.
                        int index=Integer.parseInt(page.group(1))-1;
                        if(index>=0&&index<nativeLinks.size()){
                            String selected=PreviewUrls.normalize(nativeLinks.get(index));
                            ArrayList<String> all=MediaGallery.links(gallery,selected,intent.getBooleanExtra(THREAD_EXTRA,false)?4096:128);
                            int position=all.indexOf(selected);
                            if(position>=0)label=(position+1)+"/"+all.size();
                        }
                    }
                }
            }
        }catch(RuntimeException ignored){/* Leave native count intact for unknown media. */}
        view.setText(label);
    }
    static String counter(Activity activity) {
        ArrayList<String> links=links(activity);return links.size()>1?" · "+(links.indexOf(current(activity))+1)+"/"+links.size():"";
    }
    static boolean move(Activity activity,int step) {
        return move(activity,step,current(activity));
    }
    private static boolean move(Activity activity,int step,String selected){
        ArrayList<String> links=links(activity);int current=links.indexOf(selected),next=current+step;
        if(current<0||next<0||next>=links.size())return false;
        activity.startActivity(destination(activity,links,next));activity.finish();activity.overridePendingTransition(0,0);return true;
    }
    public static boolean onNativeTouch(Activity activity,MotionEvent event) {return onTouch(activity,event,null);}
    static boolean onTouch(Activity activity,MotionEvent event,View surface) {
        int action=event.getActionMasked();Swipe swipe=SWIPES.get(activity);
        // Validate installation/version once per gesture, not on every MOVE frame.
        if(action!=MotionEvent.ACTION_DOWN&&swipe==null)return false;
        if(action==MotionEvent.ACTION_DOWN&&!Haiagaru.videoViewerEnabled()
                ||!VideoViewerSettings.prefs(activity).getBoolean("videoViewerEnabled",true)
                ||!VideoViewerSettings.prefs(activity).getBoolean(activity.getIntent().getBooleanExtra(THREAD_EXTRA,false)
                        ?VideoViewerSettings.THREAD_MEDIA:VideoViewerSettings.MEDIA_SWIPE,!activity.getIntent().getBooleanExtra(THREAD_EXTRA,false))){
            SWIPES.remove(activity);return false;
        }
        if(swipe!=null&&swipe.cancelling)return false;
        if(action==MotionEvent.ACTION_DOWN){
            if(links(activity).size()<2)return false;
            swipe=new Swipe();swipe.selected=current(activity);swipe.x=event.getRawX();swipe.y=event.getRawY();
            Rect bounds=new Rect();View area=surface!=null?surface:activity.getWindow().getDecorView();
            swipe.blocked=!area.getGlobalVisibleRect(bounds)||!bounds.contains((int)swipe.x,(int)swipe.y)
                    ||controlAt(activity.getWindow().getDecorView(),swipe.x,swipe.y)
                    ||activity instanceof VideoViewerActivity&&((VideoViewerActivity)activity).isVideoToolbarTouch(swipe.x,swipe.y)
                    ||surface==null&&zoomed(activity.getWindow().getDecorView());
            if(!swipe.blocked){swipe.back=new MediaViewerBackGesture(activity);swipe.back.dispatch(event);}
            SWIPES.put(activity,swipe);return false;
        }
        if(swipe==null)return false;
        if(event.getPointerCount()>1||action==MotionEvent.ACTION_POINTER_DOWN){swipe.blocked=true;return swipe.dragging;}
        if(action==MotionEvent.ACTION_CANCEL){SWIPES.remove(activity);return false;}
        if(swipe.blocked){if(action==MotionEvent.ACTION_UP)SWIPES.remove(activity);return swipe.dragging;}
        if(swipe.back!=null&&swipe.back.dispatch(event)){SWIPES.remove(activity);return true;}
        boolean backPriority=swipe.back!=null&&swipe.back.active();
        float dx=event.getRawX()-swipe.x,dy=event.getRawY()-swipe.y;
        float threshold=Math.max(48,48*activity.getResources().getDisplayMetrics().density);
        int step=activity.getIntent().getBooleanExtra(THREAD_EXTRA,false)
                ?MediaGallery.threadStep(dx,dy,threshold):MediaGallery.step(dx,dy,threshold);
        if(action==MotionEvent.ACTION_MOVE&&step!=0&&!swipe.dragging&&!backPriority){
            swipe.dragging=true;swipe.cancelling=true;MotionEvent cancel=MotionEvent.obtain(event);cancel.setAction(MotionEvent.ACTION_CANCEL);
            try{activity.dispatchTouchEvent(cancel);}finally{cancel.recycle();swipe.cancelling=false;}
        }
        if(action==MotionEvent.ACTION_UP){
            SWIPES.remove(activity);if(swipe.dragging||backPriority&&step!=0){
                if(step!=0){
                    if(backPriority){
                        final Swipe completed=swipe;
                        // Native recognizers post completion to the main Handler.
                        activity.getWindow().getDecorView().post(()->{
                            if(!completed.back.returned()&&!activity.isFinishing()&&!activity.isDestroyed())move(activity,step,completed.selected);
                        });
                    }else move(activity,step,swipe.selected);
                }return true;}
        }
        return swipe.dragging;
    }
    private static boolean controlAt(View view,float x,float y) {
        Rect rect=new Rect();if(!view.isShown()||!view.getGlobalVisibleRect(rect)||!rect.contains((int)x,(int)y))return false;
        if(view instanceof Button||view instanceof ImageButton||view instanceof SeekBar||view instanceof EditText)return true;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)if(controlAt(group.getChildAt(i),x,y))return true;}
        return false;
    }
    private static boolean zoomed(View view) {
        if(!view.isShown())return false;
        if(view instanceof ImageView)try{
            java.lang.reflect.Method scale=view.getClass().getMethod("getScale");
            java.lang.reflect.Method minimum=view.getClass().getMethod("getMinimumScale");
            if(((Number)scale.invoke(view)).floatValue()>((Number)minimum.invoke(view)).floatValue()+0.01f)return true;
        }catch(ReflectiveOperationException ignored){}
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)if(zoomed(group.getChildAt(i)))return true;}
        return false;
    }
    private MediaViewerNavigation(){}
}
