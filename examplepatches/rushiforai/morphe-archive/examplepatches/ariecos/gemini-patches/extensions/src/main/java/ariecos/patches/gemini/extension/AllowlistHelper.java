package ariecos.patches.gemini.extension;

public class AllowlistHelper {
    public static boolean isPatchedPackage(Object packageObj) {
        if (packageObj == null) return false;
        String packageName = packageObj.toString();
        return packageName.equals("app.morphe.android.apps.youtube.music")
            || packageName.equals("app.morphe.android.youtube");
    }
}
