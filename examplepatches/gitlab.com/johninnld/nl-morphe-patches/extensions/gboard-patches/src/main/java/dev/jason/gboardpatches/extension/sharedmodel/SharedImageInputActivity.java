package dev.jason.gboardpatches.extension.sharedmodel;

import android.app.Activity;
import android.content.*;
import android.graphics.*;
import android.media.ExifInterface;
import android.os.*;
import java.io.*;
import java.lang.ref.WeakReference;
import java.util.concurrent.*;
import java.util.function.Consumer;

/** Private, transparent handoff to the normal Android image picker; it adds no settings screen. */
public final class SharedImageInputActivity extends Activity {
    static final class Choice {
        final Bitmap bitmap;
        final byte[] encoded;
        Choice(Bitmap bitmap,byte[] encoded){this.bitmap=bitmap;this.encoded=encoded;}
    }
    private static final int PICK=7411;
    private static Pending pending;
    private static final class Pending {final String ticket=java.util.UUID.randomUUID().toString();final Consumer<Choice> callback;final WeakReference<android.inputmethodservice.InputMethodService> ime;Pending(Consumer<Choice> c){callback=c;ime=new WeakReference<>(GboardSharedWritingRuntime.currentService());}}
    static void choose(Context context,Consumer<Bitmap> callback){chooseImage(context,choice->callback.accept(choice==null?null:choice.bitmap));}
    static void chooseImage(Context context,Consumer<Choice> callback){
        if(pending!=null){callback.accept(null);return;}
        Pending request=new Pending(callback);pending=request;
        try{context.startActivity(new Intent(context,SharedImageInputActivity.class).putExtra("ticket",request.ticket).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));}
        catch(RuntimeException unavailable){if(pending==request)pending=null;callback.accept(null);return;}
        new Handler(Looper.getMainLooper()).postDelayed(()->{if(pending==request){pending=null;request.callback.accept(null);}},120000);
    }
    @Override public void onCreate(Bundle state){setTheme(android.R.style.Theme_Translucent_NoTitleBar);super.onCreate(state);if(pending==null||!pending.ticket.equals(getIntent().getStringExtra("ticket"))){finish();return;}if(state==null)try{startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("image/*").addCategory(Intent.CATEGORY_OPENABLE),PICK);}catch(RuntimeException unavailable){complete(null);}}
    @Override protected void onActivityResult(int request,int code,Intent data){super.onActivityResult(request,code,data);if(request!=PICK)return;if(code!=RESULT_OK||data==null||data.getData()==null){complete(null);return;}android.net.Uri uri=data.getData();ExecutorService worker=Executors.newSingleThreadExecutor();worker.execute(()->{Bitmap bitmap=null;byte[] original=null;try{ByteArrayOutputStream bytes=new ByteArrayOutputStream();try(InputStream in=getContentResolver().openInputStream(uri)){if(in==null)throw new IOException();byte[] buffer=new byte[32768];int n;while((n=in.read(buffer))!=-1){if(bytes.size()+n>16*1024*1024)throw new IOException();bytes.write(buffer,0,n);}}byte[] encoded=bytes.toByteArray();BitmapFactory.Options bounds=new BitmapFactory.Options();bounds.inJustDecodeBounds=true;BitmapFactory.decodeByteArray(encoded,0,encoded.length,bounds);if(bounds.outWidth<=0||bounds.outHeight<=0)throw new IOException();BitmapFactory.Options decode=new BitmapFactory.Options();decode.inSampleSize=sampleSize(bounds.outWidth,bounds.outHeight);bitmap=BitmapFactory.decodeByteArray(encoded,0,encoded.length,decode);int orientation=ExifInterface.ORIENTATION_NORMAL;try{orientation=new ExifInterface(new ByteArrayInputStream(encoded)).getAttributeInt(ExifInterface.TAG_ORIENTATION,ExifInterface.ORIENTATION_NORMAL);}catch(IOException unsupportedMetadata){}if(decode.inSampleSize==1 && orientation==ExifInterface.ORIENTATION_NORMAL && ("image/png".equals(bounds.outMimeType)||"image/jpeg".equals(bounds.outMimeType)||"image/webp".equals(bounds.outMimeType)))original=encoded;Matrix transform=new Matrix();switch(orientation){case 2:transform.setScale(-1,1);break;case 3:transform.setRotate(180);break;case 4:transform.setScale(1,-1);break;case 5:transform.setRotate(90);transform.postScale(-1,1);break;case 6:transform.setRotate(90);break;case 7:transform.setRotate(270);transform.postScale(-1,1);break;case 8:transform.setRotate(270);break;}if(bitmap!=null&&!transform.isIdentity()){Bitmap rotated=Bitmap.createBitmap(bitmap,0,0,bitmap.getWidth(),bitmap.getHeight(),transform,true);if(rotated!=bitmap)bitmap.recycle();bitmap=rotated;}}catch(Exception failure){if(bitmap!=null)bitmap.recycle();bitmap=null;}Bitmap selected=bitmap;byte[] preserved=original;runOnUiThread(()->completeChoice(selected==null?null:new Choice(selected,preserved)));worker.shutdown();});}
    static int sampleSize(int width,int height){if(width<=0||height<=0)throw new IllegalArgumentException("INVALID_IMAGE");int sample=1;while(((width-1)/sample+1)*(long)((height-1)/sample+1)>8000000L || Math.max((width-1)/sample+1,(height-1)/sample+1)>4096)sample*=2;return sample;}
    private void complete(Bitmap bitmap){completeChoice(bitmap==null?null:new Choice(bitmap,null));}
    private void completeChoice(Choice choice){
        Bitmap bitmap=choice==null?null:choice.bitmap;
        SharedWritingDiagnostics.event(bitmap==null?"image.picker cancelled-or-unavailable":"image.picker image-ready");
        Pending request=pending;
        if(request==null||!request.ticket.equals(getIntent().getStringExtra("ticket"))){if(bitmap!=null)bitmap.recycle();finish();return;}
        finish();
        new Handler(Looper.getMainLooper()).postDelayed(()->{
            if(pending!=request){if(bitmap!=null)bitmap.recycle();return;}
            pending=null;
            android.inputmethodservice.InputMethodService keyboard=request.ime.get();
            if(keyboard!=null){if(Build.VERSION.SDK_INT>=28)keyboard.requestShowSelf(0);else{android.view.inputmethod.InputMethodManager manager=(android.view.inputmethod.InputMethodManager)keyboard.getSystemService(INPUT_METHOD_SERVICE);manager.showSoftInputFromInputMethod(keyboard.getWindow().getWindow().getAttributes().token,0);}}
            request.callback.accept(choice);
        },600);
    }
}
