package app.keyboardspeed.extension;

import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.util.List;
import java.util.Map;

/**
 * Adds a Comments item to the menu of videos in feeds and lists, such as the Home feed,
 * the watch history and playlists, which opens the comments panel of the video over the page,
 * without playing the video.
 * <p>
 * The item is added with the flyout menu utilities of the Morphe YouTube patches, like the Morphe items.
 * The comments panel is opened the same way as by the comment button of the Morphe feed cards:
 * the engagement panels of the video are requested, and its comments panel is shown with a command.
 */
@SuppressWarnings("unused")
public final class CommentsMenuItemPatch {
    private static final String TAG = "CommentsMenuItem";

    private static final String MORPHE_FLYOUT_UTILS =
            "app.morphe.extension.youtube.patches.utils.FlyoutUtils";
    private static final String MORPHE_PLAYLIST_ROUTES =
            "app.morphe.extension.youtube.patches.utils.requests.PlaylistRoutes";
    private static final String MORPHE_AUTH_UTILS =
            "app.morphe.extension.shared.innertube.utils.AuthUtils";
    private static final String MORPHE_REQUESTER =
            "app.morphe.extension.shared.requests.Requester";
    private static final String MORPHE_UTILS =
            "app.morphe.extension.shared.Utils";

    /**
     * Icons of the comment button of the app, the first one found is used.
     */
    private static final String[] ICON_NAMES = {
            "yt_outline_message_bubble_right_vd_theme_24",
            "yt_outline_message_bubble_right_black_24",
            "yt_outline_message_bubble_left_vd_theme_24",
    };

    private static final String ITEM_TEXT = "Comments";

    /**
     * Wait for the menu to close before showing the panel.
     */
    private static final long SHOW_PANEL_DELAY_MS = 150;

    private static final int HTTP_OK = 200;

    // Fields of the protobuf messages, the same as in the feed cards of the Morphe YouTube patches.
    private static final int SHOW_ENGAGEMENT_PANEL_ENDPOINT_FIELD = 138681778;
    private static final int SHOW_ENGAGEMENT_PANEL_ENDPOINT_PANEL_ID_FIELD = 1;
    private static final int SHOW_ENGAGEMENT_PANEL_ENDPOINT_PANEL_FIELD = 2;
    private static final int SHOW_ENGAGEMENT_PANEL_ENDPOINT_IDENTIFIER_FIELD = 10;
    private static final int WATCH_NEXT_ENGAGEMENT_PANELS_FIELD = 25;
    private static final int ENGAGEMENT_PANEL_SECTION_LIST_RENDERER_FIELD = 138681066;
    private static final int ENGAGEMENT_PANEL_PANEL_ID_FIELD = 1;
    private static final int ENGAGEMENT_PANEL_HEADER_FIELD = 2;
    private static final int ENGAGEMENT_PANEL_TITLE_HEADER_RENDERER_FIELD = 138681548;
    private static final int ENGAGEMENT_PANEL_TITLE_HEADER_SUBHEADER_FIELD = 19;
    private static final int ENGAGEMENT_PANEL_VISIBILITY_FIELD = 9;
    private static final int ENGAGEMENT_PANEL_VISIBILITY_EXPANDED = 1;
    private static final int ENGAGEMENT_PANEL_IDENTIFIER_FIELD = 18;
    private static final int ENGAGEMENT_PANEL_IDENTIFIER_SURFACE_FIELD = 1;
    private static final int ENGAGEMENT_PANEL_IDENTIFIER_TAG_FIELD = 3;
    /**
     * The panels of this surface are shown over the feed.
     */
    private static final int ENGAGEMENT_PANEL_SURFACE_SHORTS = 4;

    private static final String[] COMMENTS_PANEL_IDS = {"comment-item-section", "engagement-panel-comments-section"};

    private CommentsMenuItemPatch() {
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
                new Handler(Looper.getMainLooper()).postDelayed(() -> openComments(videoId, true), SHOW_PANEL_DELAY_MS);
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
     * Opens a new comments panel of the video, which shows the Top comments. Must be called on the main thread.
     *
     * @param overPage If the panel is shown over the current page, such as a feed. Otherwise it is shown on the
     *                 watch page, whose panel it replaces, with the sort buttons (Top, Timed, Newest).
     */
    static void openComments(String videoId, boolean overPage) {
        final Map<?, ?> authHeaders;
        try {
            // The headers of the account that is signed in now, not when the request runs.
            authHeaders = (Map<?, ?>) morpheClass(MORPHE_AUTH_UTILS).getMethod("getRequestHeader").invoke(null);
        } catch (Exception ex) {
            Log.e(TAG, "Morphe request headers not found", ex);
            showToast("Comments are not available");
            return;
        }

        new Thread(() -> {
            byte[] command = null;
            try {
                command = buildShowCommentsCommand(requestEngagementPanels(videoId, authHeaders), overPage);
            } catch (Exception ex) {
                Log.e(TAG, "Comments request failed for video: " + videoId, ex);
            }

            final byte[] commandToRun = command;
            new Handler(Looper.getMainLooper()).post(() -> {
                if (commandToRun == null) {
                    showToast("Comments are not available for this video");
                } else if (!Morphe.executeCommand(commandToRun)) {
                    showToast("Comments are not available");
                }
            });
        }, "CommentsMenuItem").start();
    }

    /**
     * @return The response of the engagement panels of the video, as the watch page gets them.
     */
    private static byte[] requestEngagementPanels(String videoId, Map<?, ?> authHeaders) throws Exception {
        Class<?> routes = morpheClass(MORPHE_PLAYLIST_ROUTES);
        byte[] body = (byte[]) routes.getMethod("videoBody", String.class).invoke(null, videoId);
        Field routeField = routes.getField("GET_ENGAGEMENT_PANELS");
        Object route = routeField.get(null);
        HttpURLConnection connection = (HttpURLConnection) routes
                .getMethod("getConnection", routeField.getType(), Map.class)
                .invoke(null, route, authHeaders);
        connection.setFixedLengthStreamingMode(body.length);
        connection.getOutputStream().write(body);

        final int responseCode = connection.getResponseCode();
        if (responseCode != HTTP_OK) {
            throw new IllegalStateException("Response code: " + responseCode);
        }
        return (byte[]) morpheClass(MORPHE_REQUESTER).getMethod("parseBytes", HttpURLConnection.class)
                .invoke(null, connection);
    }

    /**
     * @return The command that shows the comments panel of the response over the current page,
     *         or null if the video has no comments panel, such as when its comments are turned off.
     */
    private static byte[] buildShowCommentsCommand(byte[] response, boolean overPage) throws Exception {
        List<Proto.Field> fields = Proto.parse(response);
        if (fields == null) {
            return null;
        }

        for (Proto.Field panel : fields) {
            if (panel.number != WATCH_NEXT_ENGAGEMENT_PANELS_FIELD) continue;
            Proto.Field renderer = Proto.find(Proto.parse(panel.bytes), ENGAGEMENT_PANEL_SECTION_LIST_RENDERER_FIELD);
            List<Proto.Field> rendererFields = renderer == null ? null : Proto.parse(renderer.bytes);
            Proto.Field panelIdField = Proto.find(rendererFields, ENGAGEMENT_PANEL_PANEL_ID_FIELD);
            String panelId = panelIdField == null ? null : panelIdField.text();
            if (panelId == null || !isCommentsPanel(panelId)) continue;

            ByteArrayOutputStream engagementPanel = new ByteArrayOutputStream();
            ByteArrayOutputStream endpoint = new ByteArrayOutputStream();
            Proto.writeBytesField(endpoint, SHOW_ENGAGEMENT_PANEL_ENDPOINT_PANEL_ID_FIELD, Proto.utf8(panelId));

            if (overPage) {
                // The sort chips of the header are an Elements component, whose template comes with the other
                // templates of the watch page, which the response does not have, and would be an empty space.
                removeSubheader(rendererFields);

                // The panel is shown over the page, which hides the panels of other surfaces.
                ByteArrayOutputStream identifier = new ByteArrayOutputStream();
                Proto.writeVarintField(identifier, ENGAGEMENT_PANEL_IDENTIFIER_SURFACE_FIELD, ENGAGEMENT_PANEL_SURFACE_SHORTS);
                Proto.writeBytesField(identifier, ENGAGEMENT_PANEL_IDENTIFIER_TAG_FIELD, Proto.utf8(panelId));

                // The panels of the watch page are hidden until the watch page shows them.
                ByteArrayOutputStream shownRenderer = new ByteArrayOutputStream();
                shownRenderer.write(Proto.write(rendererFields));
                Proto.writeVarintField(shownRenderer, ENGAGEMENT_PANEL_VISIBILITY_FIELD, ENGAGEMENT_PANEL_VISIBILITY_EXPANDED);
                Proto.writeBytesField(shownRenderer, ENGAGEMENT_PANEL_IDENTIFIER_FIELD, identifier.toByteArray());
                Proto.writeBytesField(engagementPanel, ENGAGEMENT_PANEL_SECTION_LIST_RENDERER_FIELD, shownRenderer.toByteArray());
                Proto.writeBytesField(endpoint, SHOW_ENGAGEMENT_PANEL_ENDPOINT_PANEL_FIELD, engagementPanel.toByteArray());
                Proto.writeBytesField(endpoint, SHOW_ENGAGEMENT_PANEL_ENDPOINT_IDENTIFIER_FIELD, identifier.toByteArray());
            } else {
                // On the watch page, the panel keeps the identifier of the watch page from the response,
                // and the templates of its sort chips are loaded.
                ByteArrayOutputStream shownRenderer = new ByteArrayOutputStream();
                shownRenderer.write(Proto.write(rendererFields));
                Proto.writeVarintField(shownRenderer, ENGAGEMENT_PANEL_VISIBILITY_FIELD, ENGAGEMENT_PANEL_VISIBILITY_EXPANDED);
                Proto.writeBytesField(engagementPanel, ENGAGEMENT_PANEL_SECTION_LIST_RENDERER_FIELD, shownRenderer.toByteArray());
                Proto.writeBytesField(endpoint, SHOW_ENGAGEMENT_PANEL_ENDPOINT_PANEL_FIELD, engagementPanel.toByteArray());
            }

            ByteArrayOutputStream command = new ByteArrayOutputStream();
            Proto.writeBytesField(command, SHOW_ENGAGEMENT_PANEL_ENDPOINT_FIELD, endpoint.toByteArray());
            return command.toByteArray();
        }
        return null;
    }

    private static boolean isCommentsPanel(String panelId) {
        for (String id : COMMENTS_PANEL_IDS) {
            if (id.equals(panelId)) return true;
        }
        return false;
    }

    /**
     * Removes the subheader of the title header of the panel, if any.
     */
    private static void removeSubheader(List<Proto.Field> rendererFields) throws Exception {
        Proto.Field header = Proto.find(rendererFields, ENGAGEMENT_PANEL_HEADER_FIELD);
        List<Proto.Field> headerFields = header == null ? null : Proto.parse(header.bytes);
        Proto.Field titleHeader = Proto.find(headerFields, ENGAGEMENT_PANEL_TITLE_HEADER_RENDERER_FIELD);
        List<Proto.Field> titleHeaderFields = titleHeader == null ? null : Proto.parse(titleHeader.bytes);
        if (titleHeaderFields == null
                || !titleHeaderFields.removeIf(f -> f.number == ENGAGEMENT_PANEL_TITLE_HEADER_SUBHEADER_FIELD)) {
            return;
        }
        titleHeader.bytes = Proto.write(titleHeaderFields);
        header.bytes = Proto.write(headerFields);
    }

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
        return Class.forName(name, true, CommentsMenuItemPatch.class.getClassLoader());
    }
}
