package app.morphe.extension.shared.settings.preference.about;

import androidx.annotation.Nullable;

import org.json.JSONException;
import org.json.JSONObject;

import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.requests.Route;

class AboutRoutes {
    // EBPatcher: derivative-owned links; upstream credits remain available locally.
    private static final List<MorpheAboutPreference.WebLink> ABOUT_LINKS = List.of(
            new MorpheAboutPreference.WebLink(true, "EBPatcher source", null,
                    "https://github.com/emotionbug/EBPatcher-patches"),
            new MorpheAboutPreference.WebLink("Releases", null,
                    "https://github.com/emotionbug/EBPatcher-patches/releases"),
            new MorpheAboutPreference.WebLink("Report an issue", null,
                    "https://github.com/emotionbug/EBPatcher-patches/issues"),
            MorpheAboutPreference.CREDITS_LINK
    );

    private static final String GITHUB_URL = "https://raw.githubusercontent.com";
    private static final Route.CompiledRoute GITHUB_ROUTE_PATCHES = new Route(Route.Method.GET,
            "/emotionbug/EBPatcher-patches/refs/heads/main/patches-bundle.json"
    ).compile();

    @Nullable
    private static volatile String latestPatchesVersion;
    private static volatile long latestPatchesVersionLastCheckedTime;

    static boolean hasFetchedPatchersVersion() {
        final long updateCheckFrequency = 5 * 60 * 1000; // 5 minutes.
        final long now = System.currentTimeMillis();

        return latestPatchesVersion != null && (now - latestPatchesVersionLastCheckedTime) < updateCheckFrequency;
    }

    @Nullable
    static String getLatestPatchesVersion() {
        String version = latestPatchesVersion;
        if (version != null) return version;

        if (!Utils.isNetworkConnected()) return null;

        try {
            HttpURLConnection connection = Requester.getConnectionFromCompiledRoute(
                    GITHUB_URL, GITHUB_ROUTE_PATCHES);
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);
            Logger.printDebug(() -> "Fetching latest patches version links from: " + connection.getURL());

            // Do not show an exception toast if the server is down
            final int responseCode = connection.getResponseCode();
            if (responseCode != 200) {
                Logger.printDebug(() -> "Failed to get patches bundle. Response code: " + responseCode);
                return null;
            }

            JSONObject json = Requester.parseJSONObjectAndDisconnect(connection);
            version = json.getString("version");
            if (version.startsWith("v")) {
                version = version.substring(1);
            }
            latestPatchesVersion = version;
            latestPatchesVersionLastCheckedTime = System.currentTimeMillis();

            return version;
        } catch (SocketTimeoutException ex) {
            Logger.printInfo(() -> "Could not fetch patches version", ex); // No toast.
        } catch (JSONException ex) {
            Logger.printException(() -> "Could not parse about information", ex);
        } catch (Exception ex) {
            Logger.printException(() -> "Failed to get patches version", ex);
        }

        return null;
    }

    static List<MorpheAboutPreference.WebLink> fetchAboutLinks() {
        return ABOUT_LINKS;
    }
}
