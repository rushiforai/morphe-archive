package app.spicetify.extension.spotify.settings;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Switch;
import android.widget.TextView;
import app.spicetify.extension.spotify.localserver.JellyfinClient;
import app.spicetify.extension.spotify.localserver.JellyfinConnection;
import app.spicetify.extension.spotify.localserver.ServerConfig;
import app.spicetify.extension.spotify.localserver.ServerIndex;
import java.io.IOException;
import java.net.URI;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;

final class ServerFilesSettings extends LinearLayout {
    private static final int QUICK_CONNECT_WAIT_MINUTES = 9;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private ExecutorService requests = Executors.newSingleThreadExecutor();
    private Future<?> pending;
    private volatile int generation;
    private volatile boolean attached;
    private final TextView status;
    private String validationError;
    private String operationStatus;
    private boolean syncingEnabled;
    private Switch enabled;
    private RadioButton webDavChoice;
    private RadioButton jellyfinChoice;
    private LinearLayout webDavFields;
    private LinearLayout jellyfinFields;
    private LinearLayout librariesView;
    private LinearLayout connectedView;
    private LinearLayout signInView;
    private LinearLayout codeView;
    private TextView code;
    private TextView savedSummary;
    private TextView savedDetails;
    private Button rescan;
    private Button signInAgain;
    private Button openInJellyfin;
    private Button quickConnect;
    private EditText webDavUrl, webDavUser, webDavPassword;
    private EditText jellyfinUrl, jellyfinUser, jellyfinPassword;
    private final Runnable refresh = new Runnable() {
        @Override public void run() {
            showStatus();
            handler.postDelayed(this, 1000);
        }
    };

    ServerFilesSettings(Context activity) {
        super(activity);
        setOrientation(VERTICAL);
        if (Build.VERSION.SDK_INT >= 26) setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS);
        if (Build.VERSION.SDK_INT < 26) {
            status = label(this, "Server files requires Android 8 or later.", 14);
            return;
        }

        ServerConfig.Snapshot saved = ServerConfig.snapshot();
        label(this, "Stream music from a WebDAV folder or a Jellyfin server. Scanned tracks appear in Local Files, so turn on Local audio files in Spotify's Apps and devices settings. Turning this off stops requests and clears the track list.", 14);
        enabled = new Switch(activity);
        enabled.setText("Use server files");
        SpotifyStyle.style(enabled);
        enabled.setTextColor(Color.WHITE);
        enabled.setTextSize(17);
        enabled.setTypeface(SpotifyStyle.font(activity, SpotifyStyle.Font.REGULAR));
        enabled.setMinHeight(dp(56));
        enabled.setChecked(saved.enabled);
        addView(enabled);

        label(this, "Provider", 18);
        RadioGroup providers = new RadioGroup(activity);
        providers.setOrientation(HORIZONTAL);
        webDavChoice = radio(providers, "WebDAV");
        jellyfinChoice = radio(providers, "Jellyfin");
        addView(providers);

        webDavFields = group();
        label(webDavFields, "Use an HTTPS WebDAV folder. You can omit https://. Save applies folder changes and starts a scan.", 14);
        webDavUrl = input(webDavFields, "WebDAV folder URL", saved.rootUrl(), "https://server.example/music/", InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        webDavUser = input(webDavFields, "Username", saved.username(), null, InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD);
        webDavPassword = input(webDavFields, "Password or app password", "", saved.hasPassword() ? "Saved password" : "Password", InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        webDavPassword.setSaveEnabled(false);
        label(webDavFields, "Leave blank to keep the saved password for this folder and username. Use an app password when supported.", 14);
        Button saveWebDav = button(webDavFields, saved.enabled ? "Save and scan" : "Save", true);
        saveWebDav.setOnClickListener(view -> saveWebDav());

        jellyfinFields = group();
        JellyfinConnection savedJellyfin = saved.jellyfinConnection();
        connectedView = new LinearLayout(activity);
        connectedView.setOrientation(VERTICAL);
        jellyfinFields.addView(connectedView);
        savedSummary = SpotifyStyle.text(activity, "", 16, Color.WHITE, SpotifyStyle.Font.BOLD);
        savedSummary.setPadding(0, dp(8), 0, 0);
        connectedView.addView(savedSummary);
        savedDetails = label(connectedView, "", 14);
        savedDetails.setPadding(0, dp(4), 0, dp(4));
        rescan = button(connectedView, "Rescan library");
        rescan.setOnClickListener(view -> {
            ServerConfig.Snapshot current = ServerConfig.snapshot();
            if (current.provider() == ServerConfig.Provider.JELLYFIN && current.enabled) {
                validationError = null;
                operationStatus = null;
                ServerIndex.scanAsync();
                showStatus();
            } else showError("Turn on server files to scan the saved library.");
        });
        button(connectedView, "Change music library").setOnClickListener(view -> loadSavedLibraries());
        signInAgain = button(connectedView, "Sign in again");
        signInAgain.setOnClickListener(view -> {
            signInView.setVisibility(VISIBLE);
            signInAgain.setVisibility(GONE);
        });

        signInView = new LinearLayout(activity);
        signInView.setOrientation(VERTICAL);
        jellyfinFields.addView(signInView);
        label(signInView, "Sign in to an HTTPS Jellyfin server, then choose a music library. You can omit https://.", 14);
        jellyfinUrl = input(signInView, "Jellyfin server URL", savedJellyfin == null ? "" : savedJellyfin.root.toASCIIString(), "https://jellyfin.example/", InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        quickConnect = button(signInView, "Use Quick Connect", true);
        quickConnect.setOnClickListener(view -> startQuickConnect());
        codeView = new LinearLayout(activity);
        codeView.setOrientation(VERTICAL);
        codeView.setVisibility(GONE);
        signInView.addView(codeView);
        codeView.addView(SpotifyStyle.text(activity, "Your code", 14, SpotifyStyle.SUBDUED, SpotifyStyle.Font.BOLD), paddedTop(16));
        code = SpotifyStyle.text(activity, "", 36, Color.WHITE, SpotifyStyle.Font.TITLE);
        code.setLetterSpacing(0.2f);
        code.setTextIsSelectable(true);
        code.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        codeView.addView(code);
        label(codeView, "Approve it in Jellyfin under your profile > Quick Connect. If you are signed in to Jellyfin on this phone, open it directly. This screen waits up to " + QUICK_CONNECT_WAIT_MINUTES + " minutes.", 14);
        openInJellyfin = button(codeView, "Open in Jellyfin", true);

        label(signInView, "Or sign in with your password", 18);
        jellyfinUser = input(signInView, "Jellyfin username", savedJellyfin == null ? "" : savedJellyfin.userName, null, InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD);
        jellyfinPassword = input(signInView, "Jellyfin password", "", "Password", InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        jellyfinPassword.setSaveEnabled(false);
        button(signInView, "Sign in with password").setOnClickListener(view -> startPasswordSignIn());
        librariesView = new LinearLayout(activity);
        librariesView.setOrientation(VERTICAL);
        jellyfinFields.addView(librariesView);
        showSavedSummary(savedJellyfin);

        watch(jellyfinUrl);
        watch(jellyfinUser);
        watch(jellyfinPassword);
        label(this, "Library", 18);
        status = label(this, ServerIndex.status(), 14);
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        Button browse = button(this, "Browse server music");
        browse.setOnClickListener(view -> ServerMusicActivity.open(getContext()));
        providers.setOnCheckedChangeListener((group, checkedId) -> {
            cancelSignIn();
            validationError = null;
            webDavFields.setVisibility(checkedId == webDavChoice.getId() ? VISIBLE : GONE);
            jellyfinFields.setVisibility(checkedId == jellyfinChoice.getId() ? VISIBLE : GONE);
            showStatus();
        });
        providers.check(saved.provider() == ServerConfig.Provider.JELLYFIN ? jellyfinChoice.getId() : webDavChoice.getId());
        enabled.setOnCheckedChangeListener((button, checked) -> {
            if (syncingEnabled) return;
            saveWebDav.setText(checked ? "Save and scan" : "Save");
            if (!checked) {
                cancelSignIn();
                ServerConfig.enabled(false);
                validationError = null;
            } else if (jellyfinChoice.isChecked() && ServerConfig.snapshot().provider() == ServerConfig.Provider.JELLYFIN) {
                if (!signInPending()) {
                    validationError = null;
                    operationStatus = null;
                    ServerConfig.enabled(true);
                    ServerIndex.scanAsync();
                }
            }
            showStatus();
        });

        button(this, "Forget server").setOnClickListener(view -> new SpotifySheet(activity, "Forget this server?",
                "Remove its saved credentials and tracks from Spotify. Files on the server stay unchanged.")
                .primary("Forget", () -> {
                    cancelSignIn();
                    ServerConfig.forget();
                    validationError = null;
                    enabled.setChecked(false);
                    webDavUrl.setText("");
                    webDavUser.setText("");
                    webDavPassword.setText("");
                    webDavPassword.setHint("Password");
                    jellyfinUrl.setText("");
                    jellyfinUser.setText("");
                    jellyfinPassword.setText("");
                    showSavedSummary(null);
                    webDavChoice.setChecked(true);
                    showStatus();
                    return true;
                })
                .secondary("Cancel")
                .show());
    }

    private void showSavedSummary(JellyfinConnection connection) {
        if (connectedView == null) return;
        connectedView.setVisibility(connection == null ? GONE : VISIBLE);
        signInView.setVisibility(connection == null ? VISIBLE : GONE);
        signInAgain.setVisibility(VISIBLE);
        if (connection == null) return;
        String host = connection.root.getHost() == null ? connection.root.toString() : connection.root.getHost();
        savedSummary.setText("Connected to " + host);
        savedDetails.setText("Signed in as " + connection.userName + "\nMusic library: " + connection.libraryName);
    }

    private void saveWebDav() {
        try {
            String secret = webDavPassword.getText().length() == 0 ? null : webDavPassword.getText().toString();
            ServerConfig.configure(enabled.isChecked(), webDavUrl.getText().toString(), webDavUser.getText().toString(), secret);
            validationError = null;
            webDavPassword.setText("");
            webDavPassword.setHint(ServerConfig.snapshot().hasPassword() ? "Saved password" : "Password");
            jellyfinUrl.setText("");
            jellyfinUser.setText("");
            jellyfinPassword.setText("");
            showSavedSummary(null);
            if (enabled.isChecked()) ServerIndex.scanAsync();
            showStatus();
        } catch (IllegalArgumentException error) { showError(error.getMessage()); }
    }

    private void startQuickConnect() {
        int attempt = beginSignIn();
        ServerConfig.Snapshot expected = ServerConfig.snapshot();
        JellyfinClient client;
        try { client = new JellyfinClient(jellyfinUrl.getText().toString(), ServerConfig.deviceId(), () -> live(attempt, expected)); }
        catch (IllegalArgumentException error) { showError(error.getMessage()); return; }
        operationStatus = "Requesting a Jellyfin sign-in code…";
        showStatus();
        pending = requests.submit(() -> {
            try {
                JellyfinClient.Challenge challenge = client.initiateQuickConnect();
                post(attempt, expected, () -> {
                    showCode(client.root(), challenge.code);
                    operationStatus = "Waiting for approval in Jellyfin…";
                    showStatus();
                });
                long deadline = System.nanoTime() + TimeUnit.MINUTES.toNanos(QUICK_CONNECT_WAIT_MINUTES);
                while (live(attempt, expected)) {
                    long remaining = deadline - System.nanoTime();
                    if (remaining <= 0) break;
                    Thread.sleep(Math.min(5000, Math.max(1, TimeUnit.NANOSECONDS.toMillis(remaining))));
                    if (!live(attempt, expected)) return;
                    if (System.nanoTime() >= deadline) break;
                    if (client.isQuickConnectApproved(challenge)) {
                        JellyfinClient.Account account = client.authenticateQuickConnect(challenge);
                        offerLibraries(attempt, expected, account::select, client.libraries(account));
                        return;
                    }
                }
                post(attempt, expected, () -> showError("The Jellyfin code expired. Start Quick Connect again."));
            } catch (InterruptedException ignored) { Thread.currentThread().interrupt(); }
              catch (IOException | IllegalArgumentException error) { post(attempt, expected, () -> showError(error.getMessage())); }
        });
    }

    private void startPasswordSignIn() {
        String username = jellyfinUser.getText().toString();
        String password = jellyfinPassword.getText().toString();
        jellyfinPassword.setText("");
        int attempt = beginSignIn();
        ServerConfig.Snapshot expected = ServerConfig.snapshot();
        JellyfinClient client;
        try { client = new JellyfinClient(jellyfinUrl.getText().toString(), ServerConfig.deviceId(), () -> live(attempt, expected)); }
        catch (IllegalArgumentException error) { showError(error.getMessage()); return; }
        operationStatus = "Signing in to Jellyfin…";
        showStatus();
        pending = requests.submit(() -> {
            try {
                JellyfinClient.Account account = client.authenticateByName(username, password);
                offerLibraries(attempt, expected, account::select, client.libraries(account));
            } catch (IOException | IllegalArgumentException error) { post(attempt, expected, () -> showError(error.getMessage())); }
        });
    }

    private void loadSavedLibraries() {
        ServerConfig.Snapshot expected = ServerConfig.snapshot();
        JellyfinConnection connection = expected.jellyfinConnection();
        if (connection == null) { showError("Sign in to Jellyfin first."); return; }
        try {
            JellyfinClient draft = new JellyfinClient(jellyfinUrl.getText().toString(), ServerConfig.deviceId(), () -> true);
            if (!connection.root.equals(draft.root())) {
                showError("This URL is a different server. Sign in to it first.");
                return;
            }
        } catch (IllegalArgumentException error) { showError(error.getMessage()); return; }
        int attempt = beginSignIn();
        operationStatus = "Loading Jellyfin music libraries…";
        showStatus();
        pending = requests.submit(() -> {
            try { offerLibraries(attempt, expected, connection::select, connection.libraries(() -> live(attempt, expected))); }
            catch (IOException | IllegalArgumentException error) { post(attempt, expected, () -> showError(error.getMessage())); }
        });
    }

    private void offerLibraries(int attempt, ServerConfig.Snapshot expected, Function<JellyfinClient.MusicLibrary, JellyfinConnection> select, List<JellyfinClient.MusicLibrary> libraries) {
        post(attempt, expected, () -> showLibraries(attempt, expected, select, libraries));
    }

    private void showLibraries(int attempt, ServerConfig.Snapshot expected, Function<JellyfinClient.MusicLibrary, JellyfinConnection> select, List<JellyfinClient.MusicLibrary> libraries) {
        hideCode();
        librariesView.removeAllViews();
        if (libraries.isEmpty()) {
            showError("This Jellyfin account has no music libraries. Add one in Jellyfin, then try again.");
            return;
        }
        operationStatus = "Choose a music library to add to Local Files.";
        label(librariesView, "Music library", 14);
        RadioGroup choices = new RadioGroup(getContext());
        choices.setOrientation(VERTICAL);
        for (JellyfinClient.MusicLibrary library : libraries) radio(choices, library.name);
        librariesView.addView(choices);
        button(librariesView, "Save library and scan", true).setOnClickListener(view -> {
            int chosen = choices.getCheckedRadioButtonId();
            if (chosen == -1) { showError("Choose a music library first."); return; }
            int index = choices.indexOfChild(choices.findViewById(chosen));
            JellyfinClient.MusicLibrary library = libraries.get(index);
            if (!live(attempt, expected)) { showError("Server settings changed. Sign in again."); return; }
            try {
                JellyfinConnection connection = select.apply(library);
                if (!ServerConfig.configureJellyfinIfCurrent(expected, true, connection)) {
                    showError("Server settings changed. Sign in again."); return;
                }
                cancelSignIn();
                syncingEnabled = true;
                enabled.setChecked(true);
                syncingEnabled = false;
                webDavUrl.setText("");
                webDavUser.setText("");
                webDavPassword.setText("");
                webDavPassword.setHint("Password");
                showSavedSummary(connection);
                ServerIndex.scanAsync();
                showStatus();
            } catch (IllegalArgumentException error) { showError(error.getMessage()); }
        });
        showStatus();
    }

    private void showCode(URI root, String value) {
        code.setText(value);
        String base = root.toASCIIString();
        Uri link = Uri.parse(base + (base.endsWith("/") ? "" : "/") + "web/#/quickconnect?txtQuickConnectCode=" + Uri.encode(value));
        openInJellyfin.setOnClickListener(view -> {
            try { getContext().startActivity(new Intent(Intent.ACTION_VIEW, link)); }
            catch (ActivityNotFoundException error) { showError("No browser is available to open Jellyfin. Approve the code on another device."); }
        });
        codeView.setVisibility(VISIBLE);
        quickConnect.setText("Get a new code");
        SpotifyStyle.style(quickConnect, false);
    }
    private void hideCode() {
        code.setText("");
        codeView.setVisibility(GONE);
        quickConnect.setText("Use Quick Connect");
        SpotifyStyle.style(quickConnect, true);
    }

    private int beginSignIn() {
        cancelSignIn();
        validationError = null;
        return generation;
    }
    private boolean signInPending() {
        return (pending != null && !pending.isDone()) || code.getText().length() > 0 || librariesView.getChildCount() > 0;
    }
    private void cancelSignIn() {
        generation++;
        if (pending != null) pending.cancel(true);
        pending = null;
        operationStatus = null;
        if (code != null) hideCode();
        if (librariesView != null) librariesView.removeAllViews();
    }
    private boolean live(int attempt, ServerConfig.Snapshot expected) {
        return attached && generation == attempt && expected == ServerConfig.snapshot() && !Thread.currentThread().isInterrupted();
    }
    private void post(int attempt, ServerConfig.Snapshot expected, Runnable action) {
        handler.post(() -> { if (live(attempt, expected)) action.run(); });
    }
    private void watch(EditText input) {
        input.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) {
                cancelSignIn();
                validationError = null;
                showStatus();
            }
            @Override public void afterTextChanged(Editable text) {}
        });
    }
    private void showError(String message) {
        ServerConfig.Snapshot saved = ServerConfig.snapshot();
        if (jellyfinChoice.isChecked() && saved.provider() == ServerConfig.Provider.JELLYFIN && saved.enabled != enabled.isChecked()) {
            syncingEnabled = true;
            enabled.setChecked(saved.enabled);
            syncingEnabled = false;
        }
        validationError = message == null || message.isEmpty() ? "Jellyfin could not complete the request." : message;
        operationStatus = null;
        hideCode();
        showStatus();
    }
    private void showStatus() {
        String next = validationError != null ? validationError : operationStatus != null ? operationStatus : ServerIndex.status();
        if (!TextUtils.equals(status.getText(), next)) status.setText(next);
    }

    private LinearLayout group() {
        LinearLayout group = new LinearLayout(getContext());
        group.setOrientation(VERTICAL);
        addView(group);
        return group;
    }
    private RadioButton radio(RadioGroup group, String title) {
        RadioButton choice = new RadioButton(getContext());
        choice.setId(View.generateViewId());
        choice.setText(title);
        SpotifyStyle.style(choice);
        group.addView(choice);
        return choice;
    }
    private Button button(LinearLayout group, String title) {
        return button(group, title, false);
    }
    private Button button(LinearLayout group, String title, boolean primary) {
        Button button = new Button(getContext());
        button.setText(title);
        SpotifyStyle.style(button, primary);
        group.addView(button, SpotifyStyle.buttonParams(getContext()));
        return button;
    }
    private TextView label(LinearLayout group, String value, int size) {
        if (size == 18) return SpotifyStyle.sectionTitle(group, value, true);
        TextView text = SpotifyStyle.body(getContext(), value);
        group.addView(text);
        return text;
    }
    private EditText input(LinearLayout group, String name, String value, String hint, int type) {
        TextView label = SpotifyStyle.text(getContext(), name, 14, Color.WHITE, SpotifyStyle.Font.BOLD);
        label.setPadding(0, dp(16), 0, dp(8));
        group.addView(label);
        EditText input = new EditText(getContext());
        input.setId(View.generateViewId());
        label.setLabelFor(input.getId());
        input.setInputType(type);
        input.setSingleLine(true);
        input.setText(value);
        input.setHint(hint);
        SpotifyStyle.style(input);
        input.setTypeface(SpotifyStyle.font(getContext(), SpotifyStyle.Font.REGULAR));
        group.addView(input, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        return input;
    }
    private LayoutParams paddedTop(int top) {
        LayoutParams params = new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(top);
        return params;
    }
    private int dp(int value) { return Math.round(value * getResources().getDisplayMetrics().density); }

    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        attached = true;
        if (requests.isShutdown()) requests = Executors.newSingleThreadExecutor();
        if (Build.VERSION.SDK_INT >= 26) handler.post(refresh);
    }
    @Override protected void onDetachedFromWindow() {
        attached = false;
        cancelSignIn();
        requests.shutdownNow();
        handler.removeCallbacks(refresh);
        super.onDetachedFromWindow();
    }
}
