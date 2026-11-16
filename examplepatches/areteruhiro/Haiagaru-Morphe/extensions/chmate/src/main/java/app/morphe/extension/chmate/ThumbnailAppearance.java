package app.morphe.extension.chmate;

import android.content.Context;
import android.graphics.*;
import android.view.View;
import java.util.Collections;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.WeakHashMap;

/** Display effects only; original decoded bitmaps and native thumbnails stay untouched. */
public final class ThumbnailAppearance {
    static final String GRAY="thumbnailGrayscale", MOSAIC="thumbnailMosaic", STRENGTH="thumbnailMosaicStrength", SENSITIVITY="imageNgSensitivity";
    static final String ALWAYS_GRAY="alwaysMosaicGrayscale", ALWAYS_STRENGTH="alwaysMosaicCustomStrength";
    private static final WeakHashMap<Object,Boolean> ALWAYS=new WeakHashMap<>();
    private static final java.util.Map<Bitmap, Verdict> VERDICTS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThreadPoolExecutor DETECTOR=new ThreadPoolExecutor(1,1,20,TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(12));
    private static final class Verdict {
        final int generation;
        volatile int flags=ImageModeration.UNKNOWN;
        Verdict(int generation){this.generation=generation;}
    }
    static {DETECTOR.allowCoreThreadTimeOut(true);}
    public static void setNativeMosaic(Object view,boolean value){
        synchronized(ALWAYS){if(value)ALWAYS.put(view,true);else ALWAYS.remove(view);}
    }
    private static final ColorMatrixColorFilter MONO;
    private static final WeakHashMap<Bitmap,Reduced> REDUCED=new WeakHashMap<>();
    private static final class Reduced {
        final int generation;
        final Bitmap bitmap;
        Reduced(int generation,Bitmap bitmap){this.generation=generation;this.bitmap=bitmap;}
    }
    private static int cachedStrength;
    private static final int[] BLOCKS={48,32,20,12,6};
    static {ColorMatrix m=new ColorMatrix();m.setSaturation(0);MONO=new ColorMatrixColorFilter(m);}
    private static int strength(Context c){return Math.max(1,Math.min(5,FeatureSwitches.prefs(c).getInt(STRENGTH,3)));}
    private static Bitmap small(Bitmap source,int level){
        int max=Math.max(source.getWidth(),source.getHeight());
        if(max<=1||source.isRecycled())return null;
        int edge=Math.min(BLOCKS[level-1],Math.max(1,max/2));
        synchronized(REDUCED){
            if(cachedStrength!=level){REDUCED.clear();cachedStrength=level;}
            int generation=source.getGenerationId();
            Reduced cached=REDUCED.get(source);if(cached!=null&&cached.generation==generation)return cached.bitmap;
            Bitmap result=Bitmap.createScaledBitmap(source,Math.max(1,Math.round(source.getWidth()*(float)edge/max)),Math.max(1,Math.round(source.getHeight()*(float)edge/max)),true);
            if(REDUCED.size()>=128)REDUCED.clear();REDUCED.put(source,new Reduced(generation,result));return result;
        }
    }
    public static double threshold(){
        Context c=Haiagaru.applicationContextForExtension();
        int level=c==null?1:FeatureSwitches.prefs(c).getInt(SENSITIVITY,1);
        return level==0?0.65:level==2?0.35:0.5;
    }
    public static void drawDetected(Canvas canvas,Bitmap image,Matrix matrix,Paint nativePaint,Object view){
        Context context=Haiagaru.applicationContextForExtension();
        boolean gray=context!=null&&FeatureSwitches.enabled(GRAY,false);
        boolean mosaic=context!=null&&FeatureSwitches.enabled(MOSAIC,false);
        boolean always;
        synchronized(ALWAYS){always=ALWAYS.containsKey(view);}
        boolean alwaysGray=always&&FeatureSwitches.enabled(ALWAYS_GRAY,false);
        boolean alwaysStrength=always&&FeatureSwitches.enabled(ALWAYS_STRENGTH,false);
        if(gray||mosaic||alwaysGray||alwaysStrength){
            String name=view.getClass().getName();
            boolean old=name.equals("o.qaf"), middle=name.equals("o.TTRewardExpressVideoActivity");
            String flag=old?"D":middle?"A":"mIsNgAuto";
            if(old||middle||name.equals("o.zzbes"))try {
                boolean detected=NativeFields.find(view.getClass(),flag).getBoolean(view);
                if(detected||alwaysGray||alwaysStrength){
                    Bitmap reduced=null;
                    if(alwaysStrength||(detected&&mosaic)){
                        Bitmap frame=sourceFrame(view);
                        if(frame!=null)reduced=small(frame,strength(context));
                    }
                    draw(canvas,image,matrix,nativePaint,alwaysGray||(detected&&gray),reduced);
                    return;
                }
            }catch(ReflectiveOperationException ignored){}
        }
        canvas.drawBitmap(image,matrix,nativePaint);
    }
    private static Bitmap sourceFrame(Object view){
        String name=view.getClass().getName();
        boolean old=name.equals("o.qaf"),middle=name.equals("o.TTRewardExpressVideoActivity");
        try{
            Object decoded=NativeFields.find(view.getClass(),old?"c":middle?"b":"a").get(view);
            if(decoded==null)return null;
            Bitmap[] frames=(Bitmap[])NativeFields.find(decoded.getClass(),old?"c":"e").get(decoded);
            Bitmap frame=frames==null||frames.length==0?null:frames[0];
            return frame==null||frame.isRecycled()?null:frame;
        }catch(ReflectiveOperationException|RuntimeException ignored){return null;}
    }
    public static void moderateNative(Canvas canvas,Matrix matrix,Object owner){
        if(!(owner instanceof View))return;
        View view=(View)owner;
        Context context=view.getContext().getApplicationContext();
        int selected=ImageModeration.selected();
        if(selected==0||!ImageModeration.available(context))return;
        Bitmap bitmap=sourceFrame(view);
        if(bitmap==null)return;
        int generation=bitmap.getGenerationId();
        Verdict verdict=VERDICTS.get(bitmap);
        if(verdict==null||verdict.generation!=generation){
            Verdict pending=new Verdict(generation);
            VERDICTS.put(bitmap,pending);
            verdict=pending;
            try{
                DETECTOR.execute(()->{
                    if(!bitmap.isRecycled())pending.flags=ImageModeration.classify(context,bitmap);
                    view.postInvalidate();
                });
            }catch(java.util.concurrent.RejectedExecutionException busy){
                VERDICTS.remove(bitmap);
                view.postInvalidateDelayed(250);
            }
        }
        int flags=verdict.flags;
        if(flags==ImageModeration.UNKNOWN||(flags&selected)!=0){
            // Cover the native draw even where a processed transparent PNG has
            // empty pixels: scaling changes where the original would show through.
            Paint paint=new Paint();paint.setColor(Color.DKGRAY);
            int save=canvas.save();
            canvas.concat(matrix);
            canvas.drawRect(0,0,bitmap.getWidth(),bitmap.getHeight(),paint);
            canvas.restoreToCount(save);
        }
        if(flags!=ImageModeration.UNKNOWN&&(flags&selected)!=0){
            draw(canvas,bitmap,matrix,null,FeatureSwitches.enabled(GRAY,false),small(bitmap,strength(context)));
        }
    }
    static Bitmap mosaic(Context context,Bitmap image,boolean gray){
        Bitmap reduced=small(image,strength(context));
        Bitmap result=Bitmap.createBitmap(image.getWidth(),image.getHeight(),Bitmap.Config.ARGB_8888);
        Paint paint=new Paint();
        if(gray)paint.setColorFilter(MONO);
        new Canvas(result).drawBitmap(reduced==null?image:reduced,null,new RectF(0,0,result.getWidth(),result.getHeight()),paint);
        return result;
    }
    private static void draw(Canvas canvas,Bitmap image,Matrix matrix,Paint nativePaint,boolean gray,Bitmap reduced){
        if(!gray&&reduced==null){canvas.drawBitmap(image,matrix,nativePaint);return;}
        Paint paint=nativePaint==null?new Paint():new Paint(nativePaint);
        Bitmap display=reduced==null?image:reduced;
        if(reduced!=null)paint.setFilterBitmap(false);
        // Put grayscale after any native paint color filter rather than replacing it.
        if(gray&&paint.getColorFilter()==null){paint.setColorFilter(MONO);gray=false;}
        int saved=canvas.save();
        try{
            canvas.concat(matrix);
            RectF target=new RectF(0,0,image.getWidth(),image.getHeight());
            if(gray){Paint layer=new Paint();layer.setColorFilter(MONO);canvas.saveLayer(target,layer);}
            canvas.drawBitmap(display,null,target,paint);
        }finally{canvas.restoreToCount(saved);}
    }
    private ThumbnailAppearance(){}
}
