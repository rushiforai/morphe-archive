package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.*;
import android.graphics.Bitmap;
import android.os.*;
import app.johninnl.modelhost.api.*;
import java.io.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONObject;

/** A selected image goes through its own caller-private session; no camera/screen collection occurs in the provider. */
public final class SharedOcrRuntime {
    private SharedOcrRuntime(){}
    public static String recognize(Context context,Bitmap bitmap)throws Exception {return recognize(context,bitmap,null);}
    static String recognize(Context context,Bitmap bitmap,byte[] encoded)throws Exception {
        if(Looper.myLooper()==Looper.getMainLooper())throw new IllegalStateException("OCR_MUST_RUN_OFF_UI_THREAD");
        if(bitmap==null || bitmap.getWidth()*(long)bitmap.getHeight()>8000000L)throw new IllegalArgumentException("Crop the image below eight megapixels");
        Context app=context.getApplicationContext();SharedProviderIdentity.verify(app);CountDownLatch connected=new CountDownLatch(1);
        AtomicReference<HostCapabilities> capabilities=new AtomicReference<>();AtomicReference<HostStatus> status=new AtomicReference<>();AtomicReference<String> failure=new AtomicReference<>();
        ModelHostClient client=new ModelHostClient(new ComponentName(ModelHostClient.DEFAULT_PACKAGE,ModelHostClient.SERVICE_CLASS),Runnable::run);
        FutureTask<Void> binding=connectionTask(()->client.connect(app,new ConnectionListener(){
            public void onConnected(HostStatus s,HostCapabilities c){capabilities.set(c);status.set(s);connected.countDown();}
            public void onDisconnected(HostException e){failure.set(e.code);connected.countDown();}
        }),()->{failure.set("PROVIDER_UNAVAILABLE");connected.countDown();});
        File image=null;HostSession session=null;RequestHandle handle=null;
        try {
            if(!new Handler(Looper.getMainLooper()).post(binding))throw new IllegalStateException("PROVIDER_UNAVAILABLE");
            if(!connected.await(5,TimeUnit.SECONDS) || failure.get()!=null || status.get()==null)throw new IllegalStateException(failure.get()==null?"PROVIDER_UNAVAILABLE":failure.get());
            if(!status.get().enabled)throw new IllegalStateException("PROVIDER_STOPPED");
            if(!status.get().isReady())throw new IllegalStateException(SharedLocalAiState.safeCode(status.get().state));
            if(!capabilities.get().supports("ocr"))throw new IllegalStateException("ENABLE_OCR_IN_PROVIDER");
            image=File.createTempFile("shared-ocr-",".png",app.getCacheDir());
            try(FileOutputStream output=new FileOutputStream(image)){if(encoded!=null){if(encoded.length>16*1024*1024)throw new IOException("IMAGE_TOO_LARGE");output.write(encoded);}else if(!bitmap.compress(Bitmap.CompressFormat.PNG,100,output))throw new IOException("IMAGE_ENCODING_FAILED");}
            session=client.openSession(new SessionOptions("Gboard OCR",null,4096));
            CountDownLatch done=new CountDownLatch(1);AtomicReference<String> result=new AtomicReference<>();
            try(ParcelFileDescriptor descriptor=ParcelFileDescriptor.open(image,ParcelFileDescriptor.MODE_READ_ONLY)){
                handle=session.submitImage(new ImageRequest("ocr",null,null,1024),descriptor,json->{try{JSONObject o=new JSONObject(json);if(o.optBoolean("terminal")){SharedWritingDiagnostics.clientEvent("terminal",o.optString("clientRequestId"),"ocr",o.optString("code","ok".equals(o.optString("status"))?"OK":"OCR_FAILED"),o.optString("text").length());if("ok".equals(o.optString("status"))){String recognized=o.getString("text");SharedWritingDiagnostics.visionText(o.optString("clientRequestId"),recognized);result.set(recognized);}else failure.set(o.optString("code","OCR_FAILED"));done.countDown();}}catch(Exception e){failure.set("PROTOCOL_ERROR");done.countDown();}});
                SharedWritingDiagnostics.clientEvent("submit",handle.clientRequestId,"ocr","QUEUED",0);
            }
            if(!done.await(65,TimeUnit.SECONDS))throw new IllegalStateException("OCR_TIMEOUT");
            if(failure.get()!=null)throw new IllegalStateException(failure.get());
            if(result.get()==null)throw new IllegalStateException("OCR_FAILED");return result.get();
        }finally{
            // Skip a queued bind. If it has started, the SDK serializes connect and close.
            binding.cancel(false);
            try {
                if(handle!=null && !handle.isComplete())handle.cancel();
                if(session!=null)session.close();
            }finally{
                try{client.close();}finally{if(image!=null)image.delete();}
            }
        }
    }

    static FutureTask<Void> connectionTask(Runnable connect,Runnable failed){
        return new FutureTask<Void>(connect,null){
            @Override protected void setException(Throwable failure){
                failed.run();
                super.setException(failure);
            }
        };
    }
}
