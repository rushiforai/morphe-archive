package app.originisland.extension;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.media.MediaDescription;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.KeyEvent;

import java.util.ArrayList;
import java.util.List;

/**
 * The app as it is installed under its own package, for a copy of it that is installed
 * under another package to show in the music card.
 *
 * A copy has downloads of its own and cannot read those of the app, so it asks the app for
 * them through its media browser service, and has the app play what is tapped. Both have to
 * be patched, since the app only answers a client it knows otherwise.
 */
final class RegularApp {

    interface Callback {
        /**
         * Called on the main thread.
         *
         * @param downloads The downloads of the app, or null if it could not be asked.
         */
        void onLoaded(List<MediaDescription> downloads);
    }

    private interface Connected {
        void onConnected(MediaBrowser browser);
    }

    private static final String TAG = "OriginIslandMusicCard";

    private static final String PACKAGE = "com.google.android.apps.youtube.music";
    private static final String BROWSER_SERVICE =
            "com.google.android.apps.youtube.music.mediabrowser.MusicBrowserService";

    /**
     * Start of the media ids of what the app plays, and not the copy.
     */
    private static final String MEDIA_ID_PREFIX = "origin_island_regular_app:";

    /**
     * The card stops waiting for a list after a few seconds.
     */
    private static final long TIMEOUT_MS = 5_000;
    private static final long DISCONNECT_AFTER_PLAY_DELAY_MS = 3_000;

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    private RegularApp() {
    }

    /**
     * @return If this is a copy of the app, and the app is installed and patched as well.
     */
    static boolean isAvailable(Context context) {
        return !PACKAGE.equals(context.getPackageName()) && isPatchedApp(context, PACKAGE);
    }

    /**
     * @return If the package is the app or a copy of it, with this patch applied.
     */
    static boolean isPatchedApp(Context context, String packageName) {
        try {
            Intent intent = new Intent(MusicCardProtocol.MUSIC_CARD_SERVICE_ACTION).setPackage(packageName);
            for (ResolveInfo service : context.getPackageManager().queryIntentServices(intent, 0)) {
                if (BROWSER_SERVICE.equals(service.serviceInfo.name)) {
                    return true;
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "isPatchedApp failure", ex);
        }

        return false;
    }

    static boolean isMediaIdOfApp(String mediaId) {
        return mediaId != null && mediaId.startsWith(MEDIA_ID_PREFIX);
    }

    /**
     * Must be called on the main thread.
     */
    static void loadDownloads(Context context, Callback callback) {
        boolean[] finished = {false};
        MediaBrowser[] connection = {null};

        Runnable[] finish = {null};
        List<MediaDescription> downloads = new ArrayList<>();
        boolean[] loaded = {false};
        finish[0] = () -> {
            if (finished[0]) {
                return;
            }
            finished[0] = true;
            mainHandler.removeCallbacks(finish[0]);
            if (connection[0] != null) {
                connection[0].disconnect();
            }

            Log.i(TAG, "Downloads of the app: " + (loaded[0] ? downloads.size() + " loaded" : "not loaded"));
            callback.onLoaded(loaded[0] ? downloads : null);
        };
        mainHandler.postDelayed(finish[0], TIMEOUT_MS);

        connect(context, browser -> {
            connection[0] = browser;
            if (finished[0]) {
                browser.disconnect();
                return;
            }

            browser.subscribe(MusicCardProtocol.LIST_LOCAL, new MediaBrowser.SubscriptionCallback() {
                @Override
                public void onChildrenLoaded(String parentId, List<MediaBrowser.MediaItem> children) {
                    try {
                        for (MediaBrowser.MediaItem child : children) {
                            if (MusicCardProtocol.EMPTY_LIST_MEDIA_ID.equals(child.getMediaId())) {
                                continue;
                            }

                            MediaDescription description = child.getDescription();
                            downloads.add(new MediaDescription.Builder()
                                    .setMediaId(MEDIA_ID_PREFIX + child.getMediaId())
                                    .setTitle(description.getTitle())
                                    .setSubtitle(description.getSubtitle())
                                    .build());
                        }
                        loaded[0] = true;
                    } catch (Exception ex) {
                        Log.e(TAG, "onChildrenLoaded failure", ex);
                    }
                    finish[0].run();
                }

                @Override
                public void onError(String parentId) {
                    finish[0].run();
                }
            });
        }, finish[0]);
    }

    /**
     * Has the app play one of its downloads. Must be called on the main thread.
     */
    static void play(Context context, String mediaId) {
        String appMediaId = mediaId.substring(MEDIA_ID_PREFIX.length());

        connect(context, browser -> {
            Bundle extras = new Bundle();
            extras.putString(MusicCardProtocol.KEY_LIST, MusicCardProtocol.LIST_LOCAL);
            new MediaController(context, browser.getSessionToken())
                    .getTransportControls()
                    .playFromMediaId(appMediaId, extras);

            Log.i(TAG, "Asked the app to play " + appMediaId);
            mainHandler.postDelayed(browser::disconnect, DISCONNECT_AFTER_PLAY_DELAY_MS);
        }, () -> Log.i(TAG, "Could not ask the app to play"));
    }

    /**
     * Has the app resume what it last played. Must be called on the main thread.
     *
     * @param failed Called on the main thread if the app could not be asked.
     */
    static void resume(Context context, Runnable failed) {
        connect(context, browser -> {
            MediaController controller = new MediaController(context, browser.getSessionToken());
            // The app resumes what it last played for the play button of a headset.
            controller.dispatchMediaButtonEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_PLAY));
            controller.dispatchMediaButtonEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_PLAY));

            Log.i(TAG, "Asked the app to resume");
            mainHandler.postDelayed(browser::disconnect, DISCONNECT_AFTER_PLAY_DELAY_MS);
        }, failed);
    }

    private static void connect(Context context, Connected connected, Runnable failed) {
        try {
            MediaBrowser[] browser = {null};
            // The app tells the package of a client from its context, and the one of the application
            // of a copy can be made to tell the package of the app for its sign-in.
            Context clientContext = context instanceof android.app.Service ? context : context.getApplicationContext();
            browser[0] = new MediaBrowser(clientContext, new ComponentName(PACKAGE, BROWSER_SERVICE),
                    new MediaBrowser.ConnectionCallback() {
                        @Override
                        public void onConnected() {
                            try {
                                connected.onConnected(browser[0]);
                            } catch (Exception ex) {
                                Log.e(TAG, "onConnected failure", ex);
                                failed.run();
                            }
                        }

                        @Override
                        public void onConnectionFailed() {
                            Log.i(TAG, "The app refused the connection");
                            failed.run();
                        }
                    }, null);
            browser[0].connect();
        } catch (Exception ex) {
            Log.e(TAG, "connect failure", ex);
            failed.run();
        }
    }
}
