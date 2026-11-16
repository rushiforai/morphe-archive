package app.morphe.extension.chmate;

import android.content.Context;
import android.graphics.Bitmap;
import java.io.InputStream;
import java.lang.reflect.Method;

/** Reuses ChMate's own Image NG score for the opt-in thread list thumbnails. */
final class NativeImageNgList {
    static final String ENABLE="threadListNativeImageNg";
    private static NativeImageNgList binding;
    private static boolean unavailable;
    private final Method factory,score;

    static boolean fixed191(Context context){
        try(InputStream ignored=context.getAssets().open("haiagaru/image-ng-runtime-fixed")){return true;}
        catch(java.io.IOException missing){return false;}
    }

    private NativeImageNgList(Context context) throws Exception {
        String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
        String owner, accessor, method;
        if("0.8.10.191 dev".equals(version)){
            // The original 191 JNI can terminate the process during inference.
            if(!fixed191(context))throw new UnsupportedOperationException();
            owner="o.oca";accessor="b";method="VA_";
        }else if("0.8.10.226 dev".equals(version)){
            owner="o.getPaddingStart";accessor="c";method="d";
        }else if("0.8.10.242 dev".equals(version)){
            owner="o.asGoogleApiClient";accessor="a";method="e";
        }else throw new UnsupportedOperationException();
        Class<?> type=Class.forName(owner,false,context.getClassLoader());
        Class<?> factoryType=version.startsWith("0.8.10.242")?
                Class.forName(owner+"$IconCompatParcelizer",false,context.getClassLoader()):type;
        factory=factoryType.getDeclaredMethod(accessor,Context.class);
        score=type.getDeclaredMethod(method,Bitmap.class,String.class);
        factory.setAccessible(true);score.setAccessible(true);
    }

    static synchronized boolean flagged(Context context,Bitmap bitmap,String url){
        if(unavailable)return false;
        try{
            if(binding==null)binding=new NativeImageNgList(context);
            Object classifier=binding.factory.invoke(null,context);
            if(classifier==null)return false;
            // Keep thumbnail-sized scores out of the cache used by the thread viewer.
            return ((Number)binding.score.invoke(classifier,bitmap,url+"#haiagaru-list-thumbnail")).doubleValue()>=ThumbnailAppearance.threshold();
        }catch(Exception|LinkageError ignored){unavailable=true;return false;}
    }
}
