package nl.johninnl.wuplaycar;
import android.os.*;
import android.net.Uri;
import android.graphics.drawable.Icon;
import androidx.core.graphics.drawable.IconCompat;
/** Additive IconCompat ABI used by the injected Car SDK; the input stripped these methods. */
public final class ArtworkIcons {
 private ArtworkIcons(){}
 private static Object value(IconCompat icon){return NativeCalls.optional(icon,"mObj1");}
 private static void set(IconCompat icon,String field,Object value){try{icon.getClass().getField(field).set(icon,value);}catch(Exception e){throw new IllegalStateException("Artwork icon ABI changed",e);}}
 public static IconCompat create(Uri uri){IconCompat icon=new IconCompat();icon.mType=4;set(icon,"mObj1",uri.toString());return icon;}
 public static int type(IconCompat icon){return icon.mType==-1?((Icon)value(icon)).getType():icon.mType;}
 public static Uri uri(IconCompat icon){return icon.mType==-1?((Icon)value(icon)).getUri():Uri.parse((String)value(icon));}
 public static Bundle bundle(IconCompat icon){
  Bundle b=new Bundle();b.putInt("type",icon.mType);b.putInt("int1",icon.mInt1);b.putInt("int2",icon.mInt2);b.putString("string1",icon.mString1);
  if(icon.mType==-1||icon.mType==1||icon.mType==5)b.putParcelable("obj",(Parcelable)value(icon));
  else if(icon.mType==3)b.putByteArray("obj",(byte[])value(icon));else b.putString("obj",(String)value(icon));
  if(icon.mTintList!=null)b.putParcelable("tint_list",icon.mTintList);
  Object mode=NativeCalls.optional(icon,"mTintMode");if(mode instanceof android.graphics.PorterDuff.Mode&&mode!=android.graphics.PorterDuff.Mode.SRC_IN)b.putString("tint_mode",((android.graphics.PorterDuff.Mode)mode).name());return b;
 }
 public static IconCompat fromBundle(Bundle b){
  IconCompat icon=new IconCompat();icon.mType=b.getInt("type");icon.mInt1=b.getInt("int1");icon.mInt2=b.getInt("int2");icon.mString1=b.getString("string1");
  if(icon.mType==-1||icon.mType==1||icon.mType==5)set(icon,"mObj1",b.getParcelable("obj"));else if(icon.mType==3)set(icon,"mObj1",b.getByteArray("obj"));else set(icon,"mObj1",b.getString("obj"));
  icon.mTintList=b.getParcelable("tint_list");if(b.containsKey("tint_mode"))set(icon,"mTintMode",android.graphics.PorterDuff.Mode.valueOf(b.getString("tint_mode")));return icon;
 }
}
