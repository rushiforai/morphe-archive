package app.johninnl.modelhost.api;

import android.content.*;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import java.io.*;

/** Only grantable, immutable APK copies in this SDK's private cache. No arbitrary paths or write mode. */
public final class ProviderApkProvider extends ContentProvider {
    @Override public boolean onCreate(){return true;}
    static File directory(Context context)throws HostException{File directory=new File(context.getCacheDir(),"local-model-host-apks");if(!directory.isDirectory()&&!directory.mkdirs())throw new HostException("APK_CACHE_UNAVAILABLE");File[] old=directory.listFiles();if(old!=null)for(File f:old)if(f.getName().matches("[a-f0-9-]{36}\\.apk") && System.currentTimeMillis()-f.lastModified()>86400000L)f.delete();return directory;}
    private File file(Uri uri)throws FileNotFoundException{
        String name=uri.getLastPathSegment();
        if(uri.getPathSegments().size()!=1 || name==null || !name.matches("[a-f0-9-]{36}\\.apk"))throw new FileNotFoundException("Invalid APK token");
        try{File dir=directory(getContext());File file=new File(dir,name);if(!file.getCanonicalFile().getParentFile().equals(dir.getCanonicalFile()) || !file.isFile())throw new FileNotFoundException("APK unavailable");return file;}catch(HostException|IOException e){throw new FileNotFoundException("APK unavailable");}
    }
    @Override public String getType(Uri uri){return "application/vnd.android.package-archive";}
    @Override public Cursor query(Uri uri,String[] projection,String selection,String[] args,String sort){try{File file=file(uri);MatrixCursor c=new MatrixCursor(new String[]{OpenableColumns.DISPLAY_NAME,OpenableColumns.SIZE});c.addRow(new Object[]{"Local Model Host.apk",file.length()});return c;}catch(FileNotFoundException e){return null;}}
    @Override public ParcelFileDescriptor openFile(Uri uri,String mode)throws FileNotFoundException{if(!"r".equals(mode))throw new FileNotFoundException("Read-only APK");return ParcelFileDescriptor.open(file(uri),ParcelFileDescriptor.MODE_READ_ONLY);}
    @Override public Uri insert(Uri uri,ContentValues values){throw new UnsupportedOperationException();}
    @Override public int update(Uri uri,ContentValues values,String selection,String[] args){throw new UnsupportedOperationException();}
    @Override public int delete(Uri uri,String selection,String[] args){throw new UnsupportedOperationException();}
}
