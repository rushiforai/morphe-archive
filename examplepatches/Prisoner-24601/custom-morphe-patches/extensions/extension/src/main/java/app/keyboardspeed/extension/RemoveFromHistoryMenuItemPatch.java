package app.keyboardspeed.extension;

import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Adds a 'Remove from watch history' item to the menu of videos in feeds and lists.
 * <p>
 * A video is removed from the watch history with the feedback token of its entry in the watch history, the same as
 * the 'Remove from watch history' item of the watch history page. The watch history is read until the entry of the
 * video is found, and its token is sent. The requests are made by the Morphe YouTube patches, with the account
 * signed in to the app.
 */
@SuppressWarnings("unused")
public final class RemoveFromHistoryMenuItemPatch {
    private static final String TAG = "RemoveFromHistory";

    private static final String MORPHE_FLYOUT_UTILS = "app.morphe.extension.youtube.patches.utils.FlyoutUtils";
    private static final String MORPHE_PLAYLIST_ROUTES =
            "app.morphe.extension.youtube.patches.utils.requests.PlaylistRoutes";
    private static final String MORPHE_ROUTE = "app.morphe.extension.shared.requests.Route";
    private static final String MORPHE_AUTH_UTILS = "app.morphe.extension.shared.innertube.utils.AuthUtils";
    private static final String MORPHE_REQUESTER = "app.morphe.extension.shared.requests.Requester";
    private static final String MORPHE_UTILS = "app.morphe.extension.shared.Utils";

    private static final String[] ICON_NAMES = {
            // The themed icons follow the light and dark theme of the app.
            "yt_outline_trash_can_vd_theme_24",
            "yt_outline_experimental_trash_can_vd_theme_24",
            "yt_outline_experimental_history_vd_theme_24",
    };
    private static final String ITEM_TEXT = "Remove from watch history";

    private static final String HISTORY_BROWSE_ID = "FEhistory";

    /**
     * Pages of the watch history that are read to find the video, the most recent first.
     */
    private static final int MAX_HISTORY_PAGES = 8;

    private static final int HTTP_OK = 200;

    private RemoveFromHistoryMenuItemPatch() {
    }

    /**
     * Injection point. Called when the menu of a video in a feed or list opens,
     * before the Morphe items are added.
     *
     * @param menu  The menu, for the flyout menu utilities of Morphe.
     * @param index The index of the next item.
     * @return The index of the next item.
     */
    public static int addMenuItem(Object menu, int index) {
        try {
            Class<?> flyoutUtils = morpheClass(MORPHE_FLYOUT_UTILS);
            String videoId = (String) flyoutUtils.getMethod("getFlyoutVideoId").invoke(null);
            if (videoId == null || videoId.isEmpty()) {
                return index; // Not the menu of a video, such as the menu of a post.
            }

            Activity activity = getActivity();
            if (activity == null) {
                return index;
            }
            Drawable icon = getIcon(activity);
            View.OnClickListener onClick = view -> {
                dismissMenu();
                removeFromHistory(videoId);
            };

            Method addButton = flyoutUtils.getMethod("addFlyoutButton", Object.class, Drawable.class,
                    String.class, View.OnClickListener.class, int.class);
            final int next = (int) addButton.invoke(null, menu, icon, ITEM_TEXT, onClick, index);
            return next < 0 ? index : next;
        } catch (Exception ex) {
            Log.e(TAG, "addMenuItem failure", ex);
            return index;
        }
    }

    private static Drawable getIcon(Context context) {
        for (String name : ICON_NAMES) {
            final int id = context.getResources().getIdentifier(name, "drawable", context.getPackageName());
            if (id != 0) {
                return context.getDrawable(id);
            }
        }
        return null;
    }

    private static void dismissMenu() {
        try {
            morpheClass(MORPHE_FLYOUT_UTILS).getMethod("dismissFlyout").invoke(null);
        } catch (Exception ex) {
            Log.e(TAG, "dismissMenu failure", ex);
        }
    }

    /**
     * Removes the video from the watch history. Must be called on the main thread.
     */
    private static void removeFromHistory(String videoId) {
        final Map<?, ?> authHeaders;
        try {
            Class<?> authUtils = morpheClass(MORPHE_AUTH_UTILS);
            if ((boolean) authUtils.getMethod("isNotLoggedIn").invoke(null)) {
                showToast("Sign in to remove videos from the watch history");
                return;
            }
            // The headers of the account that is signed in now, not when the request runs.
            authHeaders = (Map<?, ?>) authUtils.getMethod("getRequestHeader").invoke(null);
        } catch (Exception ex) {
            Log.e(TAG, "Morphe request headers not found", ex);
            showToast("Removing from the watch history is not available");
            return;
        }

        new Thread(() -> {
            String message;
            try {
                message = removeFromHistory(videoId, authHeaders);
            } catch (Exception ex) {
                Log.e(TAG, "Remove from watch history failed for video: " + videoId, ex);
                message = "Could not remove from the watch history";
            }
            final String toast = message;
            new Handler(Looper.getMainLooper()).post(() -> showToast(toast));
        }, "RemoveFromHistory").start();
    }

    /**
     * @return The message for the user.
     */
    private static String removeFromHistory(String videoId, Map<?, ?> authHeaders) throws Exception {
        Class<?> routes = morpheClass(MORPHE_PLAYLIST_ROUTES);
        Object browseRoute = routes.getField("BROWSE_PLAYLIST").get(null); // browse?prettyPrint=false

        // The body of a playlist browse has the client context of the Morphe requests.
        JSONObject firstPage = new JSONObject(new String(
                (byte[]) routes.getMethod("browsePlaylistBody", String.class).invoke(null, "x"),
                StandardCharsets.UTF_8));
        firstPage.put("browseId", HISTORY_BROWSE_ID);
        JSONObject context = firstPage.getJSONObject("context");

        JSONObject body = firstPage;
        int entriesSeen = 0;
        for (int page = 0; page < MAX_HISTORY_PAGES && body != null; page++) {
            JSONObject response = post(routes, browseRoute, body, authHeaders);

            List<String> tokens = new ArrayList<>();
            findFeedbackTokens(response, videoId, tokens);
            if (!tokens.isEmpty()) {
                Log.d(TAG, "Found the history entry of " + videoId + " on page " + (page + 1)
                        + " with " + tokens.size() + " feedback tokens");
                return sendFeedback(routes, context, tokens.get(0), authHeaders)
                        ? "Removed from watch history"
                        : "Could not remove from the watch history";
            }

            entriesSeen += countKey(response, "videoId");
            String continuation = findContinuation(response);
            if (continuation == null) {
                break;
            }
            body = new JSONObject();
            body.put("context", context);
            body.put("continuation", continuation);
        }
        Log.d(TAG, "History entry not found: " + videoId + ", video ids seen: " + entriesSeen);
        return entriesSeen == 0
                ? "Could not read the watch history"
                : "Not found in the recent watch history";
    }

    private static boolean sendFeedback(Class<?> routes, JSONObject context, String token,
                                        Map<?, ?> authHeaders) throws Exception {
        JSONObject body = new JSONObject();
        body.put("context", context);
        JSONArray tokens = new JSONArray();
        tokens.put(token);
        body.put("feedbackTokens", tokens);

        JSONObject response = post(routes, feedbackRoute(), body, authHeaders);
        JSONArray responses = response.optJSONArray("feedbackResponses");
        final boolean processed = responses != null && responses.length() > 0
                && responses.optJSONObject(0) != null
                && responses.optJSONObject(0).optBoolean("isProcessed", false);
        Log.d(TAG, "Feedback response: " + response);
        return processed;
    }

    private static Object feedbackRoute() throws Exception {
        Class<?> route = morpheClass(MORPHE_ROUTE);
        Class<?> method = morpheClass(MORPHE_ROUTE + "$Method");
        Object post = null;
        for (Object constant : method.getEnumConstants()) {
            if (((Enum<?>) constant).name().equals("POST")) post = constant;
        }
        Constructor<?> constructor = route.getConstructor(method, String.class);
        Object uncompiled = constructor.newInstance(post, "feedback?prettyPrint=false");
        return route.getMethod("compile", String[].class).invoke(uncompiled, (Object) new String[0]);
    }

    private static JSONObject post(Class<?> routes, Object route, JSONObject body,
                                   Map<?, ?> authHeaders) throws Exception {
        byte[] bytes = body.toString().getBytes(StandardCharsets.UTF_8);
        HttpURLConnection connection = (HttpURLConnection) routes
                .getMethod("getConnection", route.getClass(), Map.class)
                .invoke(null, route, authHeaders);
        connection.setFixedLengthStreamingMode(bytes.length);
        connection.getOutputStream().write(bytes);

        final int responseCode = connection.getResponseCode();
        if (responseCode != HTTP_OK) {
            connection.disconnect();
            throw new IllegalStateException("Response code: " + responseCode);
        }
        return (JSONObject) morpheClass(MORPHE_REQUESTER)
                .getMethod("parseJSONObjectAndDisconnect", HttpURLConnection.class)
                .invoke(null, connection);
    }

    // region Reading the watch history response.

    /**
     * Finds the feedback token of the history entry of the video: in the smallest part of the response that has
     * the video id and feedback tokens, and no other video. The token of a menu item about the history is used,
     * or the only token of the entry.
     */
    private static void findFeedbackTokens(Object node, String videoId, List<String> result) throws Exception {
        tokensFoundIn(node, videoId, result);
    }

    /**
     * @return If the node has the video id.
     */
    private static boolean tokensFoundIn(Object node, String videoId, List<String> result) throws Exception {
        boolean hasVideo = false;
        if (node instanceof JSONObject object) {
            for (Iterator<String> keys = object.keys(); keys.hasNext(); ) {
                String key = keys.next();
                Object value = object.get(key);
                if (key.equals("videoId") && videoId.equals(value)) {
                    hasVideo = true;
                } else if (tokensFoundIn(value, videoId, result)) {
                    hasVideo = true;
                }
                if (!result.isEmpty()) {
                    return true;
                }
            }
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) {
                if (tokensFoundIn(array.get(i), videoId, result)) {
                    hasVideo = true;
                }
                if (!result.isEmpty()) {
                    return true;
                }
            }
        }
        if (hasVideo && node instanceof JSONObject && hasOnlyVideo(node, videoId)) {
            // The smallest node with the video and no other video: its feedback tokens are those of the entry.
            // A node with other videos too, such as the whole list, is never used, so no other video is removed.
            List<String[]> tokens = new ArrayList<>(); // { token, text near it }
            collectFeedbackTokens(node, "", tokens);
            for (String[] token : tokens) {
                if (token[1].toLowerCase(Locale.ROOT).contains("history")) {
                    result.add(token[0]);
                }
            }
            if (result.isEmpty() && tokens.size() == 1) {
                result.add(tokens.get(0)[0]);
            }
        }
        return hasVideo;
    }

    /**
     * @return If every video id in the node is the video id.
     */
    private static boolean hasOnlyVideo(Object node, String videoId) throws Exception {
        if (node instanceof JSONObject object) {
            for (Iterator<String> keys = object.keys(); keys.hasNext(); ) {
                String key = keys.next();
                Object value = object.get(key);
                if (key.equals("videoId") && !videoId.equals(value)) return false;
                if (!hasOnlyVideo(value, videoId)) return false;
            }
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) {
                if (!hasOnlyVideo(array.get(i), videoId)) return false;
            }
        }
        return true;
    }

    /**
     * Collects the feedback tokens of a node, each with the text of the menu item it belongs to.
     */
    private static void collectFeedbackTokens(Object node, String nearbyText, List<String[]> tokens) throws Exception {
        if (node instanceof JSONObject object) {
            String text = textOf(object);
            String itemText = text.isEmpty() ? nearbyText : text;
            for (Iterator<String> keys = object.keys(); keys.hasNext(); ) {
                String key = keys.next();
                Object value = object.get(key);
                if (key.equals("feedbackToken") && value instanceof String token) {
                    tokens.add(new String[]{token, itemText});
                } else {
                    collectFeedbackTokens(value, itemText, tokens);
                }
            }
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) {
                collectFeedbackTokens(array.get(i), nearbyText, tokens);
            }
        }
    }

    /**
     * @return The text of a menu item object, such as {text: {runs: [{text: ...}]}}, or an empty string.
     */
    private static String textOf(JSONObject object) {
        Object text = object.opt("text");
        if (text instanceof String string) {
            return string;
        }
        if (text instanceof JSONObject textObject) {
            if (textObject.has("simpleText")) {
                return textObject.optString("simpleText");
            }
            JSONArray runs = textObject.optJSONArray("runs");
            if (runs != null) {
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < runs.length(); i++) {
                    JSONObject run = runs.optJSONObject(i);
                    if (run != null) builder.append(run.optString("text"));
                }
                return builder.toString();
            }
        }
        return "";
    }

    /**
     * @return The token of the next page of the response, or null if none.
     */
    private static String findContinuation(Object node) throws Exception {
        if (node instanceof JSONObject object) {
            JSONObject command = object.optJSONObject("continuationCommand");
            if (command != null && command.has("token")) {
                return command.optString("token");
            }
            JSONObject next = object.optJSONObject("nextContinuationData");
            if (next != null && next.has("continuation")) {
                return next.optString("continuation");
            }
            for (Iterator<String> keys = object.keys(); keys.hasNext(); ) {
                String found = findContinuation(object.get(keys.next()));
                if (found != null) return found;
            }
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) {
                String found = findContinuation(array.get(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static int countKey(Object node, String key) throws Exception {
        int count = 0;
        if (node instanceof JSONObject object) {
            for (Iterator<String> keys = object.keys(); keys.hasNext(); ) {
                String name = keys.next();
                if (name.equals(key)) count++;
                count += countKey(object.get(name), key);
            }
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) {
                count += countKey(array.get(i), key);
            }
        }
        return count;
    }

    // endregion

    private static void showToast(String text) {
        Activity activity = getActivity();
        if (activity != null) {
            Toast.makeText(activity, text, Toast.LENGTH_SHORT).show();
        }
    }

    private static Activity getActivity() {
        try {
            return (Activity) morpheClass(MORPHE_UTILS).getMethod("getActivity").invoke(null);
        } catch (Exception ex) {
            Log.e(TAG, "getActivity failure", ex);
            return null;
        }
    }

    private static Class<?> morpheClass(String name) throws ClassNotFoundException {
        return Class.forName(name, true, RemoveFromHistoryMenuItemPatch.class.getClassLoader());
    }
}
