package app.noam.extension.spotify.settings;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

import app.noam.extension.spotify.Utils;
import app.noam.extension.spotify.localserver.LocalServerHook;
import app.noam.extension.spotify.localserver.RemoteTrack;
import app.noam.extension.spotify.localserver.ServerConfig;
import app.noam.extension.spotify.localserver.ServerFileProvider;
import app.noam.extension.spotify.home.HomePins;
import app.noam.extension.spotify.localserver.ServerIndex;

/**
 * The Morphe settings screen.
 *
 * The UI is built in code on purpose: the patched APK gets no new layouts or ids, so nothing here
 * depends on Spotify's resources or on ids that shift between releases.
 */
public final class MorpheSettingsActivity extends Activity {

    private static final int BACKGROUND = Color.parseColor("#121212");
    private static final int SURFACE = Color.parseColor("#1E1E1E");
    private static final int ACCENT = Color.parseColor("#1DB954");
    private static final int TEXT = Color.parseColor("#FFFFFF");
    private static final int TEXT_DIM = Color.parseColor("#B3B3B3");

    private EditText urlField;
    private EditText usernameField;
    private EditText passwordField;
    private EditText folderField;
    private Switch enabledSwitch;
    private Switch streamSwitch;
    private Switch lyricsSwitch;
    private EditText pinsField;
    private TextView status;

    public static Integer titleResourceId() {
        return Utils.stringId("morphe_settings_title");
    }

    public static Integer descriptionResourceId() {
        return Utils.stringId("morphe_settings_description");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Utils.setContext(this);

        ScrollView scrollView = new ScrollView(this);
        scrollView.setBackgroundColor(BACKGROUND);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(20);
        root.setPadding(padding, padding, padding, padding);
        scrollView.addView(root, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        root.addView(heading("Morphe"));
        root.addView(caption("Patched with Morphe. Settings added by patches appear here."));

        root.addView(sectionTitle("Local files from a server"));
        root.addView(caption(
                "Point Spotify at a Nextcloud or WebDAV folder. Its tracks appear under Local Files "
                        + "and are streamed from the server as they play."));

        enabledSwitch = addSwitch(root, "Use a server folder", ServerConfig.isEnabled());
        urlField = addField(root, "Server address",
                "https://cloud.example.com", ServerConfig.getString(ServerConfig.KEY_URL, ""), false);
        usernameField = addField(root, "Username",
                "username", ServerConfig.getString(ServerConfig.KEY_USERNAME, ""), false);
        passwordField = addField(root, "App password",
                "app password", ServerConfig.getString(ServerConfig.KEY_PASSWORD, ""), true);
        folderField = addField(root, "Folder",
                "/Music", ServerConfig.getString(ServerConfig.KEY_FOLDER, "/Music"), false);

        streamSwitch = addSwitch(root, "Stream instead of downloading", ServerConfig.isStreaming());
        root.addView(caption("When off, a track is downloaded to the cache the first time it plays."));

        root.addView(button("Save and scan folder", view -> saveAndScan()));
        root.addView(button("Clear downloaded cache", view -> clearCache()));

        status = caption(describeIndex());
        root.addView(status);

        root.addView(sectionTitle("Pinned on Home"));
        root.addView(caption(
                "One playlist name per line. Matching shortcuts are kept at the front of the grid "
                        + "on Home. Held on this device, so it does not depend on the server."));
        pinsField = addField(root, "Pinned playlists", "Oldschool shi\nYeezus",
                ServerConfig.getString(HomePins.KEY_PINS, ""), false);
        pinsField.setSingleLine(false);
        pinsField.setMinLines(3);
        root.addView(button("Save pinned playlists", view -> {
            HomePins.setPinned(pinsField.getText().toString());
            status.setText("Pinned playlists saved. Pull down on Home to refresh.");
        }));

        root.addView(sectionTitle("Lyrics"));
        root.addView(caption(
                "Draws the full screen lyrics larger, with more space between lines and a gradient "
                        + "behind them, closer to how the desktop player looks."));
        lyricsSwitch = addSwitch(root, "Beautiful lyrics",
                ServerConfig.getBoolean(ServerConfig.KEY_BEAUTIFUL_LYRICS, false));
        lyricsSwitch.setOnCheckedChangeListener((view, checked) ->
                ServerConfig.putBoolean(ServerConfig.KEY_BEAUTIFUL_LYRICS, checked));


        setContentView(scrollView);
        setTitle("Morphe");
    }

    private void saveAndScan() {
        ServerConfig.putBoolean(ServerConfig.KEY_ENABLED, enabledSwitch.isChecked());
        ServerConfig.putBoolean(ServerConfig.KEY_STREAM, streamSwitch.isChecked());
        ServerConfig.putString(ServerConfig.KEY_URL, urlField.getText().toString().trim());
        ServerConfig.putString(ServerConfig.KEY_USERNAME, usernameField.getText().toString().trim());
        ServerConfig.putString(ServerConfig.KEY_PASSWORD, passwordField.getText().toString());
        ServerConfig.putString(ServerConfig.KEY_FOLDER, folderField.getText().toString().trim());

        if (!ServerConfig.isConfigured()) {
            status.setText("Enter the server address first.");
            return;
        }

        status.setText("Scanning…");
        new Thread(() -> {
            String message;
            try {
                List<RemoteTrack> tracks = ServerIndex.refresh((done, total) ->
                        runOnUiThread(() -> status.setText("Reading tags… " + done + " of " + total)));
                message = tracks.isEmpty()
                        ? "No audio files found in that folder."
                        : "Found " + tracks.size() + " tracks. They will appear under Local Files.";
                LocalServerHook.requestRescan();
            } catch (Exception ex) {
                Utils.logError("Scan failed", ex);
                message = "Could not reach the server: " + ex.getMessage();
            }
            String result = message;
            runOnUiThread(() -> status.setText(result));
        }, "morphe-scan").start();
    }

    private void clearCache() {
        java.io.File directory = ServerFileProvider.cacheDirectory(this);
        int removed = 0;
        java.io.File[] files = directory.listFiles();
        if (files != null) {
            for (java.io.File file : files) {
                if (file.delete()) removed++;
            }
        }
        Toast.makeText(this, "Removed " + removed + " cached files", Toast.LENGTH_SHORT).show();
    }

    private String describeIndex() {
        int count = ServerIndex.get().size();
        return count == 0
                ? "No tracks indexed yet."
                : count + " tracks indexed.";
    }

    // region UI helpers

    private int dp(int value) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics());
    }

    private TextView heading(String text) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextColor(TEXT);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 28);
        view.setPadding(0, 0, 0, dp(4));
        return view;
    }

    private TextView sectionTitle(String text) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextColor(ACCENT);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        view.setPadding(0, dp(24), 0, dp(4));
        return view;
    }

    private TextView caption(String text) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextColor(TEXT_DIM);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        view.setPadding(0, dp(2), 0, dp(8));
        return view;
    }

    private EditText addField(LinearLayout parent, String label, String hint, String value, boolean isPassword) {
        parent.addView(caption(label));

        EditText field = new EditText(this);
        field.setText(value);
        field.setHint(hint);
        field.setTextColor(TEXT);
        field.setHintTextColor(TEXT_DIM);
        field.setBackgroundColor(SURFACE);
        field.setPadding(dp(12), dp(12), dp(12), dp(12));
        field.setSingleLine(true);
        field.setInputType(isPassword
                ? InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD
                : InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.bottomMargin = dp(8);
        parent.addView(field, params);
        return field;
    }

    private Switch addSwitch(LinearLayout parent, String label, boolean checked) {
        Switch view = new Switch(this);
        view.setText(label);
        view.setTextColor(TEXT);
        view.setChecked(checked);
        view.setPadding(0, dp(12), 0, dp(12));
        parent.addView(view);
        return view;
    }

    private Button button(String label, View.OnClickListener listener) {
        Button view = new Button(this);
        view.setText(label);
        view.setAllCaps(false);
        view.setTextColor(Color.BLACK);
        view.setBackgroundColor(ACCENT);
        view.setGravity(Gravity.CENTER);
        view.setOnClickListener(listener);

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(12);
        view.setLayoutParams(params);
        return view;
    }

    // endregion
}
