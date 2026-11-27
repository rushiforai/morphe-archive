package dev.jason.gboardpatches.extension.sharedmodel;

import android.app.*;
import android.content.*;
import android.content.pm.ServiceInfo;
import android.graphics.*;
import android.hardware.display.*;
import android.media.*;
import android.media.projection.*;
import android.os.*;
import android.util.DisplayMetrics;
import android.view.*;
import java.lang.ref.WeakReference;
import java.util.function.Consumer;

/** User-confirmed one-shot screen capture. No Accessibility service, root or persistent projection. */
public final class SharedScreenCaptureActivity extends Activity {
    private static final int CAPTURE=7421;
    private static Pending pending;
    private static final class Pending {final String nonce=java.util.UUID.randomUUID().toString();final Consumer<Bitmap> callback;final WeakReference<android.inputmethodservice.InputMethodService> keyboard;Pending(Consumer<Bitmap> c){callback=c;keyboard=new WeakReference<>(GboardSharedWritingRuntime.currentService());}}
    static void capture(Context context,Consumer<Bitmap> callback){
        if(pending!=null){callback.accept(null);return;}
        Pending next=new Pending(callback);pending=next;
        try{context.startActivity(new Intent(context,SharedScreenCaptureActivity.class).putExtra("captureNonce",next.nonce).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));}
        catch(RuntimeException unavailable){if(pending==next)pending=null;callback.accept(null);return;}
        new Handler(Looper.getMainLooper()).postDelayed(()->{if(pending==next)finishCapture(next.nonce,null);},120000);
    }
    private static boolean valid(String nonce){return pending!=null && pending.nonce.equals(nonce);}
    private static void finishCapture(String nonce,Bitmap bitmap){SharedWritingDiagnostics.event(bitmap==null?"screen.capture no-image":"screen.capture image-ready");Pending current=pending;if(current==null||!current.nonce.equals(nonce)){if(bitmap!=null)bitmap.recycle();return;}new Handler(Looper.getMainLooper()).postDelayed(()->{if(pending!=current){if(bitmap!=null)bitmap.recycle();return;}pending=null;android.inputmethodservice.InputMethodService ime=current.keyboard.get();if(ime!=null){if(Build.VERSION.SDK_INT>=28)ime.requestShowSelf(0);else{android.view.inputmethod.InputMethodManager manager=(android.view.inputmethod.InputMethodManager)ime.getSystemService(INPUT_METHOD_SERVICE);manager.showSoftInputFromInputMethod(ime.getWindow().getWindow().getAttributes().token,0);}}current.callback.accept(bitmap);},450);}
    @Override public void onCreate(Bundle state){setTheme(android.R.style.Theme_Translucent_NoTitleBar);super.onCreate(state);String nonce=getIntent().getStringExtra("captureNonce");if(!valid(nonce)){finish();return;}if(state==null){android.inputmethodservice.InputMethodService ime=pending.keyboard.get();if(ime!=null)ime.requestHideSelf(0);try{MediaProjectionManager manager=(MediaProjectionManager)getSystemService(MEDIA_PROJECTION_SERVICE);startActivityForResult(manager.createScreenCaptureIntent(),CAPTURE);}catch(RuntimeException failure){finish();finishCapture(nonce,null);}}}
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(request!=CAPTURE)return;if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("screen.permission result="+result+" data="+(data!=null));String nonce=getIntent().getStringExtra("captureNonce");if(!valid(nonce)){finish();return;}if(result!=RESULT_OK||data==null){finish();finishCapture(nonce,null);return;}try{startForegroundService(new Intent(this,CaptureService.class).putExtra("captureNonce",nonce).putExtra("resultCode",result).putExtra("capturePermission",data));}catch(RuntimeException failure){finishCapture(nonce,null);}finish();}

    public static final class CaptureService extends Service {
        private final Handler main=new Handler(Looper.getMainLooper());
        private MediaProjection projection;private VirtualDisplay display;private ImageReader reader;private String nonce;private boolean finished;
        @Override public IBinder onBind(Intent intent){return null;}
        @Override public int onStartCommand(Intent intent,int flags,int startId){
            if(intent==null || !valid(intent.getStringExtra("captureNonce")) || nonce!=null){stopSelf(startId);return START_NOT_STICKY;}
            nonce=intent.getStringExtra("captureNonce");
            try{
                NotificationManager notifications=(NotificationManager)getSystemService(NOTIFICATION_SERVICE);String channel="local_ai_screen_context";notifications.createNotificationChannel(new NotificationChannel(channel,"Local AI screen context",NotificationManager.IMPORTANCE_LOW));
                Notification notification=new Notification.Builder(this,channel).setSmallIcon(android.R.drawable.ic_menu_view).setContentTitle("Reading screen for Local AI").setContentText("Capturing one image for your writing request").setOngoing(true).build();
                if(Build.VERSION.SDK_INT>=29)startForeground(7422,notification,ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PROJECTION);else startForeground(7422,notification);
                Intent permission=intent.getParcelableExtra("capturePermission");MediaProjectionManager manager=(MediaProjectionManager)getSystemService(MEDIA_PROJECTION_SERVICE);projection=manager.getMediaProjection(intent.getIntExtra("resultCode",0),permission);
                projection.registerCallback(new MediaProjection.Callback(){@Override public void onStop(){finish(null);}@Override public void onCapturedContentResize(int width,int height){resize(width,height);}},main);
                // Let Android dismiss its consent UI and return to the selected conversation first.
                main.postDelayed(this::startCapture,700);main.postDelayed(()->finish(null),12000);
            }catch(RuntimeException failure){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("screen.capture service-failure="+failure.getClass().getSimpleName());finish(null);}
            return START_NOT_STICKY;
        }
        private void startCapture(){if(finished)return;try{WindowManager windows=(WindowManager)getSystemService(WINDOW_SERVICE);int width,height;if(Build.VERSION.SDK_INT>=30){Rect bounds=windows.getMaximumWindowMetrics().getBounds();width=bounds.width();height=bounds.height();}else{DisplayMetrics metrics=new DisplayMetrics();windows.getDefaultDisplay().getRealMetrics(metrics);width=metrics.widthPixels;height=metrics.heightPixels;}if(!sizeAllowed(width,height)){finish(null);return;}reader=imageReader(width,height);display=projection.createVirtualDisplay("Local AI single screenshot",width,height,getResources().getConfiguration().densityDpi,DisplayManager.VIRTUAL_DISPLAY_FLAG_AUTO_MIRROR,reader.getSurface(),null,main);}catch(RuntimeException failure){finish(null);}}
        private ImageReader imageReader(int width,int height){ImageReader made=ImageReader.newInstance(width,height,PixelFormat.RGBA_8888,2);made.setOnImageAvailableListener(source->{if(finished || source!=reader)return;Bitmap bitmap=null,padded=null;try(Image image=source.acquireLatestImage()){if(image==null)return;Image.Plane plane=image.getPlanes()[0];int pixel=plane.getPixelStride(),row=plane.getRowStride();if(pixel!=4||row<image.getWidth()*pixel)throw new IllegalStateException();int paddedWidth=row/pixel;padded=Bitmap.createBitmap(paddedWidth,image.getHeight(),Bitmap.Config.ARGB_8888);java.nio.ByteBuffer sourceBytes=plane.getBuffer().duplicate();sourceBytes.rewind();java.nio.ByteBuffer pixels=java.nio.ByteBuffer.allocateDirect(Math.multiplyExact(row,image.getHeight()));pixels.put(sourceBytes);pixels.position(0);pixels.limit(pixels.capacity());padded.copyPixelsFromBuffer(pixels);bitmap=Bitmap.createBitmap(padded,0,0,image.getWidth(),image.getHeight());if(bitmap!=padded){padded.recycle();padded=null;}}catch(RuntimeException failure){if(bitmap!=null)bitmap.recycle();if(padded!=null&&!padded.isRecycled())padded.recycle();bitmap=null;}finish(bitmap);},main);return made;}
        private void resize(int width,int height){
            if(finished || display==null)return;if(!sizeAllowed(width,height)){finish(null);return;}
            ImageReader old=reader,replacement=null;boolean swapped=false;
            try{replacement=imageReader(width,height);display.resize(width,height,getResources().getConfiguration().densityDpi);display.setSurface(replacement.getSurface());reader=replacement;swapped=true;}
            catch(RuntimeException failure){finish(null);}
            finally{ImageReader release=swapped?old:replacement;if(release!=null && !closeAll(release::close))finish(null);}
        }
        private void finish(Bitmap bitmap){
            if(finished){if(bitmap!=null)bitmap.recycle();return;}finished=true;main.removeCallbacksAndMessages(null);
            VirtualDisplay oldDisplay=display;ImageReader oldReader=reader;MediaProjection oldProjection=projection;display=null;reader=null;projection=null;
            boolean stopped=closeAll(()->{if(oldDisplay!=null)oldDisplay.release();},()->{if(oldReader!=null)oldReader.close();},()->{if(oldProjection!=null)oldProjection.stop();});
            if(!stopped && bitmap!=null){bitmap.recycle();bitmap=null;}
            stopForeground(true);stopSelf();String completed=nonce;Bitmap image=bitmap;main.post(()->finishCapture(completed,image));
        }
        @Override public void onDestroy(){if(!finished)finish(null);super.onDestroy();}
    }
    static boolean closeAll(Runnable...releases){boolean closed=true;for(Runnable release:releases)try{release.run();}catch(RuntimeException failure){closed=false;}return closed;}
    static boolean sizeAllowed(int width,int height){return width>0&&height>0&&width*(long)height<=8000000L;}
}
