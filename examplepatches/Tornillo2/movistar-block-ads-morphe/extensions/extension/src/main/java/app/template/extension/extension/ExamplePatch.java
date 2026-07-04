package app.template.extension.extension;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import android.util.Log;

@SuppressWarnings("unused")
public class ExamplePatch {

    private static final String TAG = "MorpheBlockAds";

    public static boolean shouldBlockAndSkip(Object playerDataModel) {
        if (playerDataModel == null) {
            return false;
        }
        try {
            // Check if isAds() returns true
            Method isAdsMethod = playerDataModel.getClass().getMethod("isAds");
            Boolean isAds = (Boolean) isAdsMethod.invoke(playerDataModel);

            // Check if getTypeOfContent() returns "PROMO_AD"
            Method getTypeOfContentMethod = playerDataModel.getClass().getMethod("getTypeOfContent");
            String typeOfContent = (String) getTypeOfContentMethod.invoke(playerDataModel);

            if ((isAds != null && isAds) || "PROMO_AD".equals(typeOfContent)) {
                Log.d(TAG, "Ad detected (isAds=" + isAds + ", typeOfContent=" + typeOfContent + "). Blocking playback.");
                notifyPlayerEnded();
                return true;
            }
        } catch (Exception e) {
            Log.e(TAG, "Error inspecting PlayerDataModel", e);
        }
        return false;
    }

    /**
     * Fires the "ended" event on MainActivity so the web layer advances past the ad.
     * fireEvent is an instance method, so we retrieve the singleton instance via a
     * static field before invoking it.
     */
    private static void notifyPlayerEnded() {
        try {
            Class<?> mainActivityClazz = Class.forName("com.movistarplus.androidtv.MainActivity");

            // Try common singleton field names used in Movistar Plus builds.
            Object mainActivityInstance = null;
            for (String fieldName : new String[]{"instance", "INSTANCE", "sInstance", "mInstance"}) {
                try {
                    Field field = mainActivityClazz.getDeclaredField(fieldName);
                    field.setAccessible(true);
                    mainActivityInstance = field.get(null);
                    if (mainActivityInstance != null) break;
                } catch (NoSuchFieldException ignored) {}
            }

            if (mainActivityInstance == null) {
                Log.w(TAG, "Could not obtain MainActivity instance; skipping fireEvent.");
                return;
            }

            Method fireEventMethod = mainActivityClazz.getMethod("fireEvent", String.class);
            fireEventMethod.invoke(mainActivityInstance, "ended");
            Log.d(TAG, "fireEvent('ended') dispatched successfully.");
        } catch (Exception e) {
            Log.e(TAG, "Failed to dispatch fireEvent('ended')", e);
        }
    }
}

