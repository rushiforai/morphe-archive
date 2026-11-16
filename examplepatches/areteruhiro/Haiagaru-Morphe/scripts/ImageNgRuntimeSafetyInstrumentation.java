package app.haiagaru.tests.imagesafety;
import android.app.Instrumentation;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.Bundle;
import java.io.InputStream;
import java.lang.reflect.*;

/** Runs only inside isolated 191 test packages, never the user's crashing app. */
public final class ImageNgRuntimeSafetyInstrumentation extends Instrumentation {
    @Override public void onCreate(Bundle args){super.onCreate(args);start();}
    @Override public void onStart(){
        Bundle result=new Bundle();Bitmap bitmap=null;
        try{
            Context context=getTargetContext();
            if(!context.getPackageName().matches(".*\\.reporter191(?:unsafe)?"))throw new AssertionError("isolated 191 package required");
            boolean fixed;
            try(InputStream in=context.getAssets().open("haiagaru/image-ng-runtime-fixed")){fixed=in.read()=='1';}
            catch(java.io.IOException missing){fixed=false;}
            Class<?> safety=context.getClassLoader().loadClass("app.morphe.extension.chmate.ImageNgRuntimeSafety");
            boolean allowed=(Boolean)safety.getMethod("allow191Inference").invoke(null);
            if(allowed!=fixed)throw new AssertionError("runtime guard mismatch");
            Class<?> classifier=context.getClassLoader().loadClass("o.oca");
            Method factory=classifier.getDeclaredMethod("b",Context.class);factory.setAccessible(true);
            Object instance=factory.invoke(null,context);
            Method score=classifier.getDeclaredMethod("VA_",Bitmap.class,String.class);score.setAccessible(true);
            bitmap=Bitmap.createBitmap(224,224,Bitmap.Config.ARGB_8888);bitmap.eraseColor(Color.rgb(52,83,102));
            float last=0;
            for(int i=0;i<12;i++){
                last=((Number)score.invoke(instance,bitmap,"https://i.imgur.com/HaiSafety"+i+".png")).floatValue();
                if(Float.isNaN(last)||last<0||last>1||!fixed&&last!=0)throw new AssertionError("invalid protected score "+last);
            }
            if(fixed){
                Method direct=classifier.getDeclaredMethod("VB_",Bitmap.class);direct.setAccessible(true);
                float actual=((Number)direct.invoke(instance,bitmap)).floatValue();
                if(Float.isNaN(actual)||actual<0||actual>1)throw new AssertionError("fixed inference unavailable");
            }
            result.putString("result","PASS 191 runtime "+(fixed?"fixed inference active":"unsafe inference blocked")+"; 12 calls; no image upload");
            finish(-1,result);
        }catch(Throwable error){result.putString("result",android.util.Log.getStackTraceString(error));finish(0,result);}
        finally{if(bitmap!=null)bitmap.recycle();}
    }
}
