package nl.johninnl.navigation.alerts;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.LruCache;
import java.io.IOException;
import java.io.InputStream;

/** The same owner-supplied artwork for equivalent provider events. */
public final class WarningIcons {
    private WarningIcons() {}
    private static final LruCache<String,Bitmap> images=new LruCache<String,Bitmap>(2*1024*1024){
        @Override protected int sizeOf(String key,Bitmap value){return value.getAllocationByteCount();}
    };
    private static final Paint bitmapPaint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);

    public static String key(WarningEvent event){
        return IndicatorContract.icon(event);
    }

    public static boolean draw(Context context,Canvas canvas,WarningEvent event,RectF slot){
        if(event==null)return false;
        return drawKey(context,canvas,key(event),slot);
    }
    static boolean drawKey(Context context,Canvas canvas,String icon,RectF slot){
        if(context==null||slot.isEmpty())return false;
        int pixels=Math.max(1,Math.min(256,(int)Math.ceil(Math.max(slot.width(),slot.height()))));
        String cacheKey=icon+":"+pixels;Bitmap image=images.get(cacheKey);
        if(image==null){
            String asset="morphe/navigation-warning-icons/"+icon+".png";
            try{
                BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;
                try(InputStream input=context.getAssets().open(asset)){BitmapFactory.decodeStream(input,null,options);}
                options.inSampleSize=1;
                while(Math.max(options.outWidth,options.outHeight)/options.inSampleSize>pixels*2)options.inSampleSize*=2;
                options.inJustDecodeBounds=false;
                try(InputStream input=context.getAssets().open(asset)){image=BitmapFactory.decodeStream(input,null,options);}
                if(image==null)return false;images.put(cacheKey,image);
            }catch(IOException|RuntimeException unavailable){return false;}
        }
        float scale=Math.min(slot.width()/image.getWidth(),slot.height()/image.getHeight());
        float width=image.getWidth()*scale,height=image.getHeight()*scale;
        RectF fitted=new RectF(slot.centerX()-width/2,slot.centerY()-height/2,slot.centerX()+width/2,slot.centerY()+height/2);
        canvas.drawBitmap(image,null,fitted,bitmapPaint);return true;
    }
}
