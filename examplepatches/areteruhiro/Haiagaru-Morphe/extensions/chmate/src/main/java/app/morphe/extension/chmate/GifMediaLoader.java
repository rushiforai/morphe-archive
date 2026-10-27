package app.morphe.extension.chmate;

import android.content.Context;
import java.io.*;
import java.util.concurrent.TimeUnit;
import okhttp3.*;

/** Shared by poster generation and the player, with the same VPN decision for either. */
final class GifMediaLoader {
    private static final OkHttpClient CLIENT=new OkHttpClient.Builder().cookieJar(CookieJar.NO_COOKIES)
            .connectTimeout(15,TimeUnit.SECONDS).readTimeout(15,TimeUnit.SECONDS).callTimeout(45,TimeUnit.SECONDS).build();
    private static final java.util.concurrent.ScheduledExecutorService CANCELLATIONS=
            java.util.concurrent.Executors.newSingleThreadScheduledExecutor(task->{Thread t=new Thread(task,"Haiagaru-GIF-cancel");t.setDaemon(true);return t;});
    static File load(Context context,String raw,int limit,boolean force,GifFileCache.Cancellation cancelled)throws IOException{
        String url=PreviewUrls.normalize(raw);
        if(url==null||!GifAutoFetchPolicy.supported(url))throw new IOException("Invalid GIF URL");
        return GifFileCache.get(new File(context.getCacheDir(),"haiagaru-gif-files"),url,limit,force,cancelled,(output,stop)->{
            if(ImageVpnController.protectedPreview(url)){
                byte[] data=ImageVpnController.fetchPreview(url).getBody();
                if(data==null||data.length>limit)throw new IOException("GIF too large");
                output.write(data);return;
            }
            Request request=new Request.Builder().url(url).header("Accept","image/gif,image/*;q=0.9,*/*;q=0.1").build();
            Call call=CLIENT.newCall(request);Thread caller=Thread.currentThread();
            java.util.concurrent.ScheduledFuture<?> cancellation=CANCELLATIONS.scheduleAtFixedRate(()->{
                if(stop.getAsBoolean()||caller.isInterrupted())call.cancel();
            },0,100,TimeUnit.MILLISECONDS);
            try(Response response=call.execute()){
                if(!response.isSuccessful()||response.body()==null)throw new IOException("HTTP "+response.code());
                if(response.body().contentLength()>limit)throw new IOException("GIF too large");
                try(InputStream input=response.body().byteStream()){
                    byte[] buffer=new byte[32768];int n;
                    while((n=input.read(buffer))!=-1){
                        if(stop.getAsBoolean())throw new InterruptedIOException("GIF cancelled");
                        output.write(buffer,0,n);
                    }
                }
            }finally{cancellation.cancel(false);}
        });
    }
    private GifMediaLoader(){}
}
