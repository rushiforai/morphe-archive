package e.e.a;
import android.content.*;import android.content.pm.*;import android.os.Build;import java.util.*;
/** Export only diagnostic platform metadata, with no device/account identifiers. */
public final class DebugHeader237 {
 static final String MARKER="nicoid Re diagnostic information\n";
 public static String header(Context c){StringBuilder b=new StringBuilder(MARKER);b.append("Patch: ").append(PatchVersion237.value()).append('\n');try{PackageInfo p=c.getPackageManager().getPackageInfo(c.getPackageName(),0);b.append("App: ").append(c.getPackageName()).append(' ').append(p.versionName).append(" (").append(Build.VERSION.SDK_INT>=28?p.getLongVersionCode():p.versionCode).append(")\n");}catch(Exception e){b.append("App: unavailable\n");}b.append("Device: ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL).append('\n');b.append("Android: ").append(Build.VERSION.RELEASE).append(" (API ").append(Build.VERSION.SDK_INT).append(")\n");b.append("Security patch: ").append(Build.VERSION.SECURITY_PATCH).append('\n');b.append("ABIs: ").append(Arrays.toString(Build.SUPPORTED_ABIS)).append('\n');b.append("Locale: ").append(Locale.getDefault().toLanguageTag()).append('\n');b.append("Time zone: ").append(TimeZone.getDefault().getID()).append('\n');return b.toString();}
 public static String prepend(Context c,String text){String body=text==null?"":text;return body.startsWith(MARKER)?body:header(c)+"\n"+body;}
}
