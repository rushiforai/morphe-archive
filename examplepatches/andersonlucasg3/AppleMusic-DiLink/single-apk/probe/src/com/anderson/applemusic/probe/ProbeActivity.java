package com.anderson.applemusic.probe;

import android.app.Activity;
import android.content.ComponentName;
import android.graphics.Color;
import android.media.MediaDescription;
import android.media.MediaMetadata;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Spike activity: no app resources, no R.*, no Compose — a plain Views UI so it can be
 * dropped into the Apple Music engine APK as an extra dex without touching resources.
 *
 * It binds the framework MediaBrowser to the engine's MediaPlaybackService, subscribes to
 * the Android Auto browse root ({@code __AUTO_ROOT__}), lists the root children and plays
 * the first playable item found one level down via {@code playFromMediaId}.
 */
@SuppressWarnings("deprecation")
public class ProbeActivity extends Activity {

    private static final String TAG = "SingleApkProbe";
    private static final String PKG = "com.apple.android.music";
    private static final String SERVICE = PKG + ".player.MediaPlaybackService";
    private static final String AUTO_ROOT = "__AUTO_ROOT__";

    private final Handler main = new Handler(Looper.getMainLooper());
    private final List<MediaBrowser.MediaItem> items = new ArrayList<MediaBrowser.MediaItem>();
    private final List<String> rows = new ArrayList<String>();

    private ArrayAdapter<String> adapter;
    private TextView status;
    private MediaBrowser browser;
    private MediaController controller;
    private boolean played;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        Log.i(TAG, "onCreate pkg=" + getPackageName() + " pid=" + android.os.Process.myPid());

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Color.rgb(16, 16, 16));

        status = new TextView(this);
        status.setTextColor(Color.WHITE);
        status.setTextSize(16f);
        status.setPadding(48, 32, 48, 24);
        status.setText("single-apk probe\nconectando ao MediaPlaybackService...");
        root.addView(status, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, rows);
        ListView list = new ListView(this);
        list.setAdapter(adapter);
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                if (position >= 0 && position < items.size()) {
                    handleItem(items.get(position));
                }
            }
        });
        root.addView(list, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        setContentView(root);

        browser = new MediaBrowser(this, new ComponentName(PKG, SERVICE), connectionCallback, null);
        browser.connect();
    }

    private final MediaBrowser.ConnectionCallback connectionCallback = new MediaBrowser.ConnectionCallback() {
        @Override
        public void onConnected() {
            Log.i(TAG, "MediaBrowser connected, root=" + browser.getRoot());
            attachController();
            subscribe(AUTO_ROOT);
        }

        @Override
        public void onConnectionFailed() {
            Log.e(TAG, "MediaBrowser connection FAILED");
            setStatus("MediaBrowser FALHOU: serviço " + SERVICE + " inacessível");
        }

        @Override
        public void onConnectionSuspended() {
            Log.w(TAG, "MediaBrowser connection suspended");
        }
    };

    private final MediaBrowser.SubscriptionCallback subscriptionCallback =
            new MediaBrowser.SubscriptionCallback() {
                @Override
                public void onChildrenLoaded(String parentId, List<MediaBrowser.MediaItem> children) {
                    onChildren(parentId, children);
                }

                // Media3 (the engine's media service) delivers children through the
                // Bundle overload; the 2-arg one is not called in that case.
                @Override
                public void onChildrenLoaded(String parentId, List<MediaBrowser.MediaItem> children,
                        Bundle options) {
                    onChildren(parentId, children);
                }

                @Override
                public void onError(String parentId) {
                    Log.e(TAG, "subscribe error parent=" + parentId);
                }

                @Override
                public void onError(String parentId, Bundle options) {
                    Log.e(TAG, "subscribe error parent=" + parentId);
                }
            };

    private void subscribe(String parentId) {
        Log.i(TAG, "subscribe " + parentId);
        browser.subscribe(parentId, new Bundle(), subscriptionCallback);
    }

    private void onChildren(String parentId, List<MediaBrowser.MediaItem> children) {
        StringBuilder sb = new StringBuilder();
        for (MediaBrowser.MediaItem child : children) {
            MediaDescription d = child.getDescription();
            String title = d != null && d.getTitle() != null ? d.getTitle().toString() : "?";
            sb.append(title).append(child.isBrowsable() ? " [browsable]" : "")
                    .append(child.isPlayable() ? " [playable]" : "").append("; ");
        }
        Log.i(TAG, "children parent=" + parentId + " count=" + children.size() + " -> " + sb);

        if (AUTO_ROOT.equals(parentId)) {
            rows.clear();
            items.clear();
            rows.add("__AUTO_ROOT__: " + children.size() + " filhos");
            for (MediaBrowser.MediaItem child : children) {
                MediaDescription d = child.getDescription();
                String title = d != null && d.getTitle() != null ? d.getTitle().toString() : "?";
                rows.add("[" + (child.isBrowsable() ? "B" : "-") + (child.isPlayable() ? "P" : "-")
                        + "] " + title);
                items.add(child);
            }
            adapter.notifyDataSetChanged();
            setStatus("conectado: __AUTO_ROOT__ = " + children.size() + " filhos");

            // Descend one level to find something playable (the root children are browse nodes).
            for (MediaBrowser.MediaItem child : children) {
                if (child.isBrowsable()) {
                    subscribe(child.getMediaId());
                }
            }
            return;
        }

        if (!played) {
            for (MediaBrowser.MediaItem child : children) {
                if (child.isPlayable()) {
                    played = true;
                    play(child);
                    return;
                }
            }
        }
    }

    private void handleItem(MediaBrowser.MediaItem item) {
        if (item.isPlayable()) {
            play(item);
        } else if (item.isBrowsable()) {
            played = true;
            subscribe(item.getMediaId());
        }
    }

    private void play(MediaBrowser.MediaItem item) {
        MediaDescription d = item.getDescription();
        String title = d != null && d.getTitle() != null ? d.getTitle().toString() : "?";
        Log.i(TAG, "playFromMediaId id=" + item.getMediaId() + " title=" + title);
        setStatus("playFromMediaId: " + title);
        if (controller == null) {
            Log.e(TAG, "no MediaController for playFromMediaId");
            return;
        }
        controller.getTransportControls().playFromMediaId(item.getMediaId(), null);
    }

    private void attachController() {
        MediaController created = new MediaController(this, browser.getSessionToken());
        created.registerCallback(new MediaController.Callback() {
            @Override
            public void onPlaybackStateChanged(PlaybackState state) {
                Log.i(TAG, "playbackState=" + (state != null ? state.getState() : -1));
                refreshStatusLine();
            }

            @Override
            public void onMetadataChanged(MediaMetadata metadata) {
                Log.i(TAG, "metadata title=" + metadata.getString(MediaMetadata.METADATA_KEY_TITLE)
                        + " artist=" + metadata.getString(MediaMetadata.METADATA_KEY_ARTIST));
                refreshStatusLine();
            }
        }, main);
        controller = created;
        refreshStatusLine();
    }

    private void refreshStatusLine() {
        if (controller == null) {
            return;
        }
        MediaMetadata md = controller.getMetadata();
        PlaybackState st = controller.getPlaybackState();
        String title = md != null ? md.getString(MediaMetadata.METADATA_KEY_TITLE) : null;
        String artist = md != null ? md.getString(MediaMetadata.METADATA_KEY_ARTIST) : null;
        int state = st != null ? st.getState() : -1;
        String line = "sessão: state=" + state + (title != null ? "  " + title : "")
                + (artist != null ? " / " + artist : "");
        Log.i(TAG, line);
        status.setText("single-apk probe\n" + line);
    }

    private void setStatus(final String text) {
        Log.i(TAG, "status: " + text.replace('\n', ' '));
        main.post(new Runnable() {
            @Override
            public void run() {
                status.setText("single-apk probe\n" + text);
            }
        });
    }

    @Override
    protected void onDestroy() {
        Log.i(TAG, "onDestroy");
        if (controller != null) {
            controller = null;
        }
        if (browser != null) {
            browser.disconnect();
            browser = null;
        }
        super.onDestroy();
    }
}
