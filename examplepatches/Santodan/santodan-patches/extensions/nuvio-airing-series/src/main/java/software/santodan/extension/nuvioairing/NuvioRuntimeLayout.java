package software.santodan.extension.nuvioairing;
import android.app.Application;
/** Explicit reflection names for the installed NuvioTV version. */
final class NuvioRuntimeLayout {
 private static volatile Boolean beta5;
 static String name(String original) {
  Boolean selected = beta5;
  if (selected == null) {
   try {
    Application app = (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
    selected = "1.1.0-beta.5".equals(app.getPackageManager().getPackageInfo(app.getPackageName(), 0).versionName);
    beta5 = selected;
   } catch (Exception error) { throw new IllegalStateException("Cannot resolve NuvioTV version", error); }
  }
  if (!selected) return original;
  switch (original) {
   case "ba.d3": return "ba.e3";
   case "sa.eb": return "sa.db";
   default: return original;
  }
 }
}
