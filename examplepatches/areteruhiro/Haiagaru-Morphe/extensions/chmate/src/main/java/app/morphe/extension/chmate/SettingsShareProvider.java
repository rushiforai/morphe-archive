package app.morphe.extension.chmate;

import android.content.*;
import android.database.*;
import android.net.Uri;
import android.os.*;
import android.provider.OpenableColumns;
import java.io.*;

/** Only generated, read-only .haiagaru exports are grantable. */
public final class SettingsShareProvider extends ContentProvider {
    @Override public boolean onCreate(){return true;}
    private File file(Uri uri)throws FileNotFoundException{
        String name=uri.getLastPathSegment();
        if(uri.getPathSegments().size()!=1||name==null||!name.matches("[a-f0-9-]{36}\\.haiagaru"))throw new FileNotFoundException();
        File f=new File(new File(getContext().getCacheDir(),"haiagaru-shares"),name);if(!f.isFile())throw new FileNotFoundException();return f;
    }
    @Override public String getType(Uri uri){return "application/vnd.haiagaru.settings";}
    @Override public ParcelFileDescriptor openFile(Uri uri,String mode)throws FileNotFoundException{
        if(!"r".equals(mode))throw new FileNotFoundException("read only");return ParcelFileDescriptor.open(file(uri),ParcelFileDescriptor.MODE_READ_ONLY);
    }
    @Override public Cursor query(Uri uri,String[] projection,String selection,String[] args,String sort){
        try{File f=file(uri);String[] cols=projection==null?new String[]{OpenableColumns.DISPLAY_NAME,OpenableColumns.SIZE}:projection;
            MatrixCursor c=new MatrixCursor(cols);Object[] row=new Object[cols.length];for(int i=0;i<cols.length;i++){
                if(OpenableColumns.DISPLAY_NAME.equals(cols[i]))row[i]="Haiagaru設定.haiagaru";else if(OpenableColumns.SIZE.equals(cols[i]))row[i]=f.length();
            }c.addRow(row);return c;
        }catch(IOException e){return null;}
    }
    @Override public Uri insert(Uri u,ContentValues v){throw new UnsupportedOperationException();}
    @Override public int update(Uri u,ContentValues v,String s,String[] a){throw new UnsupportedOperationException();}
    @Override public int delete(Uri u,String s,String[] a){throw new UnsupportedOperationException();}
}
