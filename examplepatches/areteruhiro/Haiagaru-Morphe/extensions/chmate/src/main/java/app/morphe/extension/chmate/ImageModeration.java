package app.morphe.extension.chmate;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.Log;
import ai.onnxruntime.OnnxTensor;
import ai.onnxruntime.OrtEnvironment;
import ai.onnxruntime.OrtSession;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.FloatBuffer;
import java.util.Collections;

/** Optional local classifier. The model and native libraries are supplied at patch time. */
final class ImageModeration {
    static final String ADULT="imageModerationAdult", GORE="imageModerationGore", LIST="imageModerationList";
    static final String MODEL="haiagaru/image-moderation/model.onnx";
    static final int UNKNOWN=-1, GORE_BIT=1, ADULT_BIT=2;
    private static volatile Boolean installed;
    private static volatile boolean failed;
    private static OrtSession session;
    private static final int SIZE=224;

    static boolean available(Context context){
        if(android.os.Build.VERSION.SDK_INT<24)return false;
        if(installed==null){
            try(InputStream input=context.getAssets().open(MODEL)){installed=true;}
            catch(java.io.IOException missing){installed=false;}
        }
        return installed;
    }
    static int selected(){
        return (FeatureSwitches.enabled(GORE,false)?GORE_BIT:0)|(FeatureSwitches.enabled(ADULT,false)?ADULT_BIT:0);
    }
    static synchronized int classify(Context context,Bitmap bitmap){
        if(!available(context)||failed)return UNKNOWN;
        try{
            OrtEnvironment environment=OrtEnvironment.getEnvironment();
            if(session==null){
                try(InputStream stream=context.getAssets().open(MODEL);
                    ByteArrayOutputStream bytes=new ByteArrayOutputStream(14*1024*1024);
                    OrtSession.SessionOptions options=new OrtSession.SessionOptions()){
                    byte[] chunk=new byte[8192];int n;
                    while((n=stream.read(chunk))!=-1)bytes.write(chunk,0,n);
                    options.setIntraOpNumThreads(1);
                    session=environment.createSession(bytes.toByteArray(),options);
                }
            }
            Bitmap input=Bitmap.createScaledBitmap(bitmap,SIZE,SIZE,true);
            int[] pixels=new int[SIZE*SIZE];
            try{input.getPixels(pixels,0,SIZE,0,0,SIZE,SIZE);}
            finally{if(input!=bitmap)input.recycle();}
            // This ONNX export performs normalization and softmax internally.
            float[] rgb=new float[3*pixels.length];
            for(int channel=0;channel<3;channel++){
                int shift=16-channel*8;
                for(int i=0;i<pixels.length;i++)rgb[channel*pixels.length+i]=(pixels[i]>>shift)&255;
            }
            try(OnnxTensor tensor=OnnxTensor.createTensor(environment,FloatBuffer.wrap(rgb),new long[]{1,3,SIZE,SIZE});
                OrtSession.Result output=session.run(Collections.singletonMap(session.getInputNames().iterator().next(),tensor))){
                float[] probability=((float[][])output.get(0).getValue())[0];
                if(probability.length!=3||Float.isNaN(probability[0])||Float.isNaN(probability[1]))return UNKNOWN;
                return (probability[0]>=.5?GORE_BIT:0)|(probability[1]>=.5?ADULT_BIT:0);
            }
        }catch(Exception|LinkageError error){
            Log.w("Haiagaru","Optional image classifier unavailable",error);
            failed=true;
            return UNKNOWN;
        }
    }
    private ImageModeration(){}
}
