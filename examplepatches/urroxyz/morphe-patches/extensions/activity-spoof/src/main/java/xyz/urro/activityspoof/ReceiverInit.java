package xyz.urro.activityspoof;
import android.content.*;
import android.database.Cursor;
import android.net.Uri;
/** Startup only. The provider is private and has an application-specific authority. */
public final class ReceiverInit extends ContentProvider {
 @Override public boolean onCreate(){ReceiverRuntime.init(getContext());return true;}
 public Cursor query(Uri u,String[] p,String s,String[] a,String o){return null;}
 public String getType(Uri u){return null;}
 public Uri insert(Uri u,ContentValues v){throw new UnsupportedOperationException();}
 public int delete(Uri u,String s,String[] a){throw new UnsupportedOperationException();}
 public int update(Uri u,ContentValues v,String s,String[] a){throw new UnsupportedOperationException();}
}
