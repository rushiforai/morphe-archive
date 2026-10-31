package app.ratbanana.extension.gaminghub;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Answers the game list request of Samsung's Game Optimizing Service (GOS) with Android's
 * own app categories. GOS answers only Samsung-signed callers, so a re-signed Gaming Hub
 * would otherwise never see any installed game.
 */
@SuppressWarnings("unused")
public final class AndroidGameList {

    private static final String TAG = "GamingHubPatches";

    private static final String PACKAGE_NAMES_COMMAND = "get_package_names";
    private static final String CATEGORY_KEY = "category_code";
    private static final String GAME_CATEGORY = "game";
    private static final String PACKAGE_NAMES_KEY = "package_names";
    private static final String PACKAGE_NAME_SEPARATOR = ",";

    private AndroidGameList() {
    }

    /**
     * Injection point.
     *
     * @param command  GOS command.
     * @param param    JSON parameters of the command. May be empty.
     * @param response GOS response. Null or without a package list when GOS refused the request.
     * @return The original response, or a game list built from Android's app categories
     * when GOS did not answer a game list request.
     */
    public static String replaceGosResponse(String command, String param, String response) {
        if (!PACKAGE_NAMES_COMMAND.equals(command) || !isGameCategory(param) || hasPackageNames(response)) {
            return response;
        }

        Context context = currentApplication();
        if (context == null) {
            return response;
        }

        try {
            List<String> games = getInstalledGames(context);
            Log.i(TAG, "GOS game list unavailable, using " + games.size() + " Android games");
            return new JSONObject()
                    .put(PACKAGE_NAMES_KEY, String.join(PACKAGE_NAME_SEPARATOR, games))
                    .toString();
        } catch (JSONException | RuntimeException ex) {
            Log.e(TAG, "Failed to build the game list", ex);
            return response;
        }
    }

    private static boolean isGameCategory(String param) {
        try {
            return param != null && !param.isEmpty()
                    && GAME_CATEGORY.equals(new JSONObject(param).optString(CATEGORY_KEY));
        } catch (JSONException ex) {
            return false;
        }
    }

    private static boolean hasPackageNames(String response) {
        try {
            return response != null && !response.isEmpty()
                    && new JSONObject(response).has(PACKAGE_NAMES_KEY);
        } catch (JSONException ex) {
            return false;
        }
    }

    static List<String> getInstalledGames(Context context) {
        PackageManager packageManager = context.getPackageManager();
        String ownPackageName = context.getPackageName();
        List<String> games = new ArrayList<>();

        for (ApplicationInfo app : packageManager.getInstalledApplications(0)) {
            if (!app.packageName.equals(ownPackageName)
                    && isGame(app)
                    && packageManager.getLaunchIntentForPackage(app.packageName) != null) {
                games.add(app.packageName);
            }
        }
        return games;
    }

    @SuppressWarnings("deprecation")
    private static boolean isGame(ApplicationInfo app) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O && app.category == ApplicationInfo.CATEGORY_GAME) {
            return true;
        }
        return (app.flags & ApplicationInfo.FLAG_IS_GAME) != 0;
    }

    @SuppressLint("PrivateApi")
    private static Context currentApplication() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (ReflectiveOperationException | RuntimeException ex) {
            Log.e(TAG, "Failed to get the application context", ex);
            return null;
        }
    }
}
