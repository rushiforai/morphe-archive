package app.morphe.extension.chmate;

import android.content.Context;
import android.graphics.*;
import java.util.WeakHashMap;

/** Display effects only; original decoded bitmaps and native thumbnails stay untouched. */
public final class ThumbnailAppearance {
    static final String GRAY="thumbnailGrayscale", MOSAIC="thumbnailMosaic", STRENGTH="thumbnailMosaicStrength", SENSITIVITY="imageNgSensitivity";
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
        int edge=BLOCKS[level-1];
        int max=Math.max(source.getWidth(),source.getHeight());if(max<=edge||source.isRecycled())return null;
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
        if(gray||mosaic){
            String name=view.getClass().getName();
            boolean old=name.equals("o.qaf"), middle=name.equals("o.TTRewardExpressVideoActivity");
            String flag=old?"D":middle?"A":"mIsNgAuto";
            if(old||middle||name.equals("o.zzbes"))try {
                if(NativeFields.find(view.getClass(),flag).getBoolean(view)){
                    Bitmap reduced=null;
                    if(mosaic)try {
                        Object decoded=NativeFields.find(view.getClass(),old?"c":middle?"b":"a").get(view);
                        if(decoded!=null){
                            Bitmap[] frames=(Bitmap[])NativeFields.find(decoded.getClass(),old?"c":"e").get(decoded);
                            if(frames!=null&&frames.length>0&&frames[0]!=null)
                                reduced=small(frames[0],strength(context));
                        }
                    }catch(ReflectiveOperationException|RuntimeException ignored){}
                    draw(canvas,image,matrix,nativePaint,gray,reduced);
                    return;
                }
            }catch(ReflectiveOperationException ignored){}
        }
        canvas.drawBitmap(image,matrix,nativePaint);
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
