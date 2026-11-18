package nl.johninnl.wuplaycar;
import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;
import java.io.*;
/** Export through URI grants only; reject writes and unrelated package/UID callers. */
public final class ArtworkProvider extends ContentProvider {
 public boolean onCreate(){return true;}
 @Override public ParcelFileDescriptor openFile(Uri uri,String mode)throws FileNotFoundException {
  if(!"r".equals(mode))throw new FileNotFoundException("Artwork is read-only");
  if(Binder.getCallingUid()!=android.os.Process.myUid()&&!HostPackages.allowed(getContext().getPackageManager().getPackagesForUid(Binder.getCallingUid())))throw new SecurityException("Untrusted artwork reader");
  try{return ParcelFileDescriptor.open(CarArtwork.file(getContext(),uri.getLastPathSegment()),ParcelFileDescriptor.MODE_READ_ONLY);}catch(IOException e){throw new FileNotFoundException("Artwork unavailable");}
 }
 public String getType(Uri uri){return "image/jpeg";}
 public Cursor query(Uri uri,String[] projection,String selection,String[] args,String sort){return null;}
 public Uri insert(Uri uri,ContentValues values){throw new UnsupportedOperationException();}
 public int update(Uri uri,ContentValues values,String selection,String[] args){throw new UnsupportedOperationException();}
 public int delete(Uri uri,String selection,String[] args){throw new UnsupportedOperationException();}
}
