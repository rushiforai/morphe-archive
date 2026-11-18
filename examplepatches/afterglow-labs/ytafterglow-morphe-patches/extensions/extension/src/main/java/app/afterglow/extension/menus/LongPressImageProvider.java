package app.afterglow.extension.menus;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.provider.MediaStore;
import android.provider.OpenableColumns;
import android.widget.Toast;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.diagnostics.DebugLog;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Pattern;

/** Read-only access to explicitly copied native comment/post captures. */
public final class LongPressImageProvider extends ContentProvider {
    private static final String DIRECTORY="afterglow-longpress-images";
    private static final Pattern NAME=Pattern.compile("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\\.png");
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"Afterglow image actions");t.setDaemon(true);return t;});
    private static final long MAX_FILE_BYTES=32L*1024*1024, MAX_AGE_MS=7L*24*60*60*1000;

    @Override public boolean onCreate(){return true;}
    private static File directory(Context context) throws Exception {
        File dir=new File(context.getCacheDir(),DIRECTORY);
        if(!dir.isDirectory()&&!dir.mkdirs())throw new FileNotFoundException("Image cache unavailable");
        return dir;
    }
    private File file(Uri uri) throws FileNotFoundException {
        try {
            if(uri==null||!"content".equals(uri.getScheme())||!authority(getContext()).equals(uri.getAuthority())
                    ||uri.getPathSegments().size()!=1||uri.getQuery()!=null||uri.getFragment()!=null)throw new FileNotFoundException();
            String name=uri.getLastPathSegment();if(name==null||!NAME.matcher(name).matches())throw new FileNotFoundException();
            File dir=directory(getContext()).getCanonicalFile(),file=new File(dir,name).getCanonicalFile();
            if(!dir.equals(file.getParentFile())||!file.isFile())throw new FileNotFoundException();
            return file;
        }catch(Exception error){throw new FileNotFoundException("Image is no longer available");}
    }
    private static String authority(Context context){return context.getPackageName()+".afterglow.longpress.images";}
    @Override public String getType(Uri uri){try{file(uri);return "image/png";}catch(FileNotFoundException error){return null;}}
    @Override public ParcelFileDescriptor openFile(Uri uri,String mode) throws FileNotFoundException {
        if(!"r".equals(mode))throw new FileNotFoundException("Read-only image");
        return ParcelFileDescriptor.open(file(uri),ParcelFileDescriptor.MODE_READ_ONLY);
    }
    @Override public Cursor query(Uri uri,String[] projection,String selection,String[] args,String order){
        try{
            File file=file(uri);String[] columns=projection==null?new String[]{OpenableColumns.DISPLAY_NAME,OpenableColumns.SIZE}:projection;
            MatrixCursor cursor=new MatrixCursor(columns,1);Object[] row=new Object[columns.length];
            for(int i=0;i<columns.length;i++)if(OpenableColumns.DISPLAY_NAME.equals(columns[i]))row[i]="Afterglow image.png";else if(OpenableColumns.SIZE.equals(columns[i]))row[i]=file.length();
            cursor.addRow(row);return cursor;
        }catch(FileNotFoundException error){return null;}
    }
    @Override public Uri insert(Uri uri,ContentValues values){throw new UnsupportedOperationException("Read-only image");}
    @Override public int update(Uri uri,ContentValues values,String where,String[] args){throw new UnsupportedOperationException("Read-only image");}
    @Override public int delete(Uri uri,String where,String[] args){throw new UnsupportedOperationException("Read-only image");}

    public static void copy(Activity activity,Bitmap image){
        Context context=activity.getApplicationContext();
        WORKER.execute(()->{
            try{
                File dir=directory(context);File[] previous=dir.listFiles();long now=System.currentTimeMillis();
                if(previous!=null)for(File item:previous)if(NAME.matcher(item.getName()).matches()&&now-item.lastModified()>MAX_AGE_MS)item.delete();
                String name=UUID.randomUUID()+".png";File output=new File(dir,name);
                try(OutputStream stream=new FileOutputStream(output)){
                    if(!image.compress(Bitmap.CompressFormat.PNG,100,stream))throw new IllegalStateException("Image encoding failed");
                }catch(Exception|OutOfMemoryError error){output.delete();throw error;}
                if(output.length()==0||output.length()>MAX_FILE_BYTES){output.delete();throw new IllegalStateException("Image too large");}
                Uri uri=new Uri.Builder().scheme("content").authority(authority(context)).appendPath(name).build();
                Afterglow.runOnMain(()->{
                    try{
                        ClipboardManager clipboard=(ClipboardManager)context.getSystemService(Context.CLIPBOARD_SERVICE);
                        if(clipboard==null)throw new IllegalStateException("Clipboard unavailable");
                        clipboard.setPrimaryClip(ClipData.newUri(context.getContentResolver(),"Afterglow image",uri));
                        toast(context,"Copied");
                    }catch(Exception error){failure(context,"copy",error);}
                });
            }catch(Exception|OutOfMemoryError error){failure(context,"copy",error);}
        });
    }
    public static void save(Activity activity,Bitmap image){
        Context context=activity.getApplicationContext();
        if(Build.VERSION.SDK_INT<29){toast(context,"Saving images requires Android 10 or newer on this build.");return;}
        WORKER.execute(()->{
            Uri destination=null;
            try{
                ContentValues values=new ContentValues();values.put(MediaStore.Images.Media.DISPLAY_NAME,"Afterglow-"+System.currentTimeMillis()+".png");
                values.put(MediaStore.Images.Media.MIME_TYPE,"image/png");values.put(MediaStore.Images.Media.RELATIVE_PATH,Environment.DIRECTORY_PICTURES+"/Afterglow");values.put(MediaStore.Images.Media.IS_PENDING,1);
                destination=context.getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI,values);
                if(destination==null)throw new IllegalStateException("Photo destination unavailable");
                try(OutputStream output=context.getContentResolver().openOutputStream(destination,"w")){
                    if(output==null||!image.compress(Bitmap.CompressFormat.PNG,100,output))throw new IllegalStateException("Image could not be saved");
                }
                values.clear();values.put(MediaStore.Images.Media.IS_PENDING,0);
                if(context.getContentResolver().update(destination,values,null,null)!=1)throw new IllegalStateException("Image could not be published");
                toast(context,"Saved");
            }catch(Exception|OutOfMemoryError error){
                if(destination!=null)try{context.getContentResolver().delete(destination,null,null);}catch(Exception ignored){}
                failure(context,"save",error);
            }
        });
    }
    private static void failure(Context context,String operation,Throwable error){DebugLog.write("long-press",operation+" image failed: "+error.getClass().getSimpleName());toast(context,"Could not "+operation+" this image.");}
    private static void toast(Context context,String message){Afterglow.runOnMain(()->Toast.makeText(context,message,Toast.LENGTH_SHORT).show());}
}
