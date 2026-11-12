package app.spicetify.extension.spotify.localserver;

import android.app.Activity;
import android.graphics.Color;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import app.spicetify.extension.spotify.settings.SpicetifySettingsScreen;
import java.io.IOException;

public final class DevelopmentActivity extends Activity {
    private final Handler handler = new Handler(Looper.getMainLooper());
    private LinearLayout tracks;
    private TextView scanStatus;
    private TextView playback;
    private Button seek;
    private MediaPlayer player;
    private boolean prepared;
    private final Runnable position = new Runnable() {
        @Override public void run() {
            if (player == null || !prepared) return;
            String next = "Playing: " + player.getCurrentPosition() / 1000 + " / " + player.getDuration() / 1000 + " seconds";
            if (!TextUtils.equals(playback.getText(), next)) playback.setText(next);
            handler.postDelayed(this, 500);
        }
    };

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        setTitle("Spicetify Development");
        ScrollView scroll = new ScrollView(this);
        scroll.setFitsSystemWindows(true);
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int padding = Math.round(20 * getResources().getDisplayMetrics().density);
        content.setPadding(padding, padding, padding, padding);
        scroll.addView(content);
        content.addView(label("Runs the production patch settings and server code in a separate app. "
                + "Preferences and server credentials belong to this app. Spotify navigation, sharing, and Home hooks require testing in Spotify."));
        content.addView(button("Open patch settings", () -> SpicetifySettingsScreen.open(this)));
        content.addView(button("Refresh tracks", this::refreshTracks));
        scanStatus = label("");
        content.addView(scanStatus);
        playback = label("Stopped");
        content.addView(playback);
        seek = button("Seek forward 5 seconds", () -> {
            if (player != null && prepared) player.seekTo(Math.min(player.getDuration(), player.getCurrentPosition() + 5000));
        });
        seek.setEnabled(false);
        content.addView(seek);
        content.addView(button("Stop playback", () -> { stopPlayback(); playback.setText("Stopped"); }));
        tracks = new LinearLayout(this);
        tracks.setOrientation(LinearLayout.VERTICAL);
        content.addView(tracks);
        setContentView(scroll);
    }

    @Override protected void onResume() {
        super.onResume();
        refreshTracks();
    }

    private void refreshTracks() {
        scanStatus.setText(ServerIndex.status());
        tracks.removeAllViews();
        var indexed = ServerIndex.tracks();
        if (indexed.isEmpty()) {
            tracks.addView(label("No tracks. Open patch settings, configure a server, and save and scan. Then return here and refresh tracks."));
        } else {
            tracks.addView(label("Server tracks: " + indexed.size() + ". Showing up to 50. Playback stops when you leave this screen."));
            for (int i = 0; i < Math.min(50, indexed.size()); i++) {
                RemoteTrack track = indexed.get(i);
                tracks.addView(button("Play " + track.displayTitle(), () -> play(track)));
            }
        }
    }

    private void play(RemoteTrack track) {
        stopPlayback();
        MediaPlayer candidate = new MediaPlayer();
        player = candidate;
        playback.setText("Loading " + track.displayTitle());
        candidate.setOnPreparedListener(ready -> {
            if (player != ready) return;
            prepared = true;
            seek.setEnabled(true);
            ready.start();
            handler.post(position);
        });
        candidate.setOnCompletionListener(finished -> {
            if (player != finished) return;
            stopPlayback();
            playback.setText("Finished");
        });
        candidate.setOnErrorListener((failed, what, extra) -> {
            if (player == failed) { stopPlayback(); playback.setText("Playback failed. Check the server and refresh tracks."); }
            return true;
        });
        try {
            candidate.setDataSource(this, ServerFileProvider.uriFor(track));
            candidate.prepareAsync();
        } catch (IOException | RuntimeException error) {
            stopPlayback();
            playback.setText("Cannot open this track. Check the server and refresh tracks.");
        }
    }

    private void stopPlayback() {
        handler.removeCallbacks(position);
        prepared = false;
        seek.setEnabled(false);
        if (player != null) { player.release(); player = null; }
    }

    @Override protected void onStop() {
        stopPlayback();
        playback.setText("Stopped");
        super.onStop();
    }

    private TextView label(String value) {
        TextView text = new TextView(this);
        text.setText(value);
        text.setTextColor(Color.WHITE);
        text.setTextSize(16);
        text.setPadding(0, 12, 0, 12);
        return text;
    }

    private Button button(String title, Runnable action) {
        Button button = new Button(this);
        button.setText(title);
        button.setAllCaps(false);
        button.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        button.setOnClickListener(view -> action.run());
        return button;
    }
}
