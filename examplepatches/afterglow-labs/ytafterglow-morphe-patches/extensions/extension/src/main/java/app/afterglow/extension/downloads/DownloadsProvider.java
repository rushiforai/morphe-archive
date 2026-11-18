package app.afterglow.extension.downloads;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;

import java.io.FileNotFoundException;
import java.io.IOException;

/** Grant-scoped, read-only access to indexed Vault files; arbitrary paths are never accepted. */
public final class DownloadsProvider extends ContentProvider {
    @Override public boolean onCreate() {return true;}
    private String id(Uri uri) throws FileNotFoundException {
        if(getContext()==null || uri==null || !"content".equals(uri.getScheme()) || !(getContext().getPackageName()+".afterglow.downloads").equals(uri.getAuthority()) || uri.getPathSegments().size()!=1 || uri.getQuery()!=null || uri.getFragment()!=null)throw new FileNotFoundException("Invalid Vault URI.");
        String id=uri.getPathSegments().get(0);try{DownloadStorage.validId(id);}catch(IOException e){throw new FileNotFoundException("Invalid Vault item.");}return id;
    }
    private DownloadLibrary library() throws FileNotFoundException {
        DownloadManager manager=DownloadManager.get(getContext());
        // ContentProvider calls run on binder workers, including after process recreation.
        if(!manager.awaitLoaded(10000))throw new FileNotFoundException("The Vault is still loading.");return manager.library();
    }
    @Override public ParcelFileDescriptor openFile(Uri uri,String mode) throws FileNotFoundException {
        if(!"r".equals(mode))throw new FileNotFoundException("Vault files are read-only.");
        String id=id(uri);try{return ParcelFileDescriptor.open(library().fileForItem(id),ParcelFileDescriptor.MODE_READ_ONLY);}catch(IOException e){throw new FileNotFoundException("The Vault file is unavailable.");}
    }
    @Override public String getType(Uri uri) {
        try{LibraryItem item=library().item(id(uri));return item==null?null:item.mimeType;}catch(FileNotFoundException e){return null;}
    }
    @Override public Cursor query(Uri uri,String[] projection,String selection,String[] arguments,String sort) {
        try {
            LibraryItem item=library().item(id(uri));if(item==null)return null;
            String[] columns=projection==null?new String[]{OpenableColumns.DISPLAY_NAME,OpenableColumns.SIZE}:projection;
            MatrixCursor cursor=new MatrixCursor(columns,1);Object[] row=new Object[columns.length];
            for(int i=0;i<columns.length;i++){if(OpenableColumns.DISPLAY_NAME.equals(columns[i]))row[i]=DownloadLibrary.exportName(item);else if(OpenableColumns.SIZE.equals(columns[i]))row[i]=item.fileSize;}
            cursor.addRow(row);return cursor;
        }catch(FileNotFoundException e){return null;}
    }
    @Override public Uri insert(Uri uri,ContentValues values){throw new UnsupportedOperationException("Read-only Vault.");}
    @Override public int delete(Uri uri,String selection,String[] arguments){throw new UnsupportedOperationException("Read-only Vault.");}
    @Override public int update(Uri uri,ContentValues values,String selection,String[] arguments){throw new UnsupportedOperationException("Read-only Vault.");}
}
