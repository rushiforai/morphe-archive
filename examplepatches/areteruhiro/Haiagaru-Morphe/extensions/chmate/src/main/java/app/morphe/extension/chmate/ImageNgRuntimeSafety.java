package app.morphe.extension.chmate;

import android.content.Context;
import java.io.InputStream;

/** 191's original inference JNI crashes outside the Java exception mechanism. */
public final class ImageNgRuntimeSafety {
    private static volatile Boolean verified;
    public static boolean allow191Inference(){
        Boolean cached=verified;if(cached!=null)return cached;
        Context context=Haiagaru.applicationContextForExtension();
        if(context==null)return false;
        boolean allowed=false;
        try(InputStream marker=context.getAssets().open("haiagaru/image-ng-runtime-fixed")){
            allowed=marker.read()=='1';
        }catch(java.io.IOException missing){ }
        verified=allowed;
        return allowed;
    }
    private ImageNgRuntimeSafety(){}
}
