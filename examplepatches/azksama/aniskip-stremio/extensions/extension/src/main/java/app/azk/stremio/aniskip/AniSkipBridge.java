package app.azk.stremio.aniskip;

import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.media3.common.MediaItem;
import androidx.media3.common.MediaMetadata;
import androidx.media3.common.Player;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Runtime bridge injected into Stremio's Media3 PlayerView. */
public final class AniSkipBridge {
    private static final String ANILIST_URL = "https://graphql.anilist.co";
    private static final String ANISKIP_URL = "https://api.aniskip.com/v2/skip-times/";
    private static final Pattern SEASON_EPISODE = Pattern.compile("(?i)(?:^|[^a-z0-9])S\\d{1,2}[ ._-]*E(\\d{1,4})(?=$|[^a-z0-9])");
    private static final Pattern SEASON = Pattern.compile("(?i)(?:^|[^a-z0-9])S(\\d{1,2})(?:[ ._-]*E\\d{1,4})?(?=$|[^a-z0-9])");
    private static final Pattern SEASON_WORD = Pattern.compile("(?i)(?:^|[^a-z0-9])(?:season|saison)[ ._-]*(\\d{1,2})(?=$|[^a-z0-9])");
    private static final Pattern EPISODE = Pattern.compile("(?i)(?:\\bepisode|\\bep|[ ._/-]e)[ ._/-]*(\\d{1,4})\\b");
    private static final Pattern STRUCTURED_TITLE = Pattern.compile(
            "(?i)(?:title|name|series|show|anime|mediaTitle|torrent_name|torrentName|filename|file_name|fileName)\\s*[:=]\\s*[\\\"']?([^,}\\]\\\"']+)");
    private static final Map<View, State> STATES = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService NETWORK = Executors.newCachedThreadPool();

    private AniSkipBridge() {
    }

    public static void onPlayerSet(final View playerView, final Player player) {
        onPlayerSetInternal(playerView, player, false);
    }

    /** Same hook with the optional AniSkip diagnostics enabled by the patch option. */
    public static void onPlayerSetDebug(final View playerView, final Player player) {
        onPlayerSetInternal(playerView, player, true);
    }

    private static void onPlayerSetInternal(final View playerView,
                                             final Player player,
                                             final boolean debugEnabled) {
        if (playerView == null || player == null || !(playerView instanceof ViewGroup)) {
            return;
        }

        MAIN.post(new Runnable() {
            @Override
            public void run() {
                State state;
                synchronized (STATES) {
                    state = STATES.get(playerView);
                    if (state == null) {
                        state = new State(playerView);
                        STATES.put(playerView, state);
                    }
                }
                state.setDebugEnabled(debugEnabled);
                state.setPlayer(player);

                if (state.debugEnabled) {
                    state.log("HOOK OK — PlayerView.setPlayer() appelé");
                    if (!state.debugDialogShown) {
                        state.debugDialogShown = true;
                        state.showDebugDialog();
                    }
                }
                state.startPolling();
            }
        });
    }

    private static final class State {
        private final View view;
        private final Button button;
        private final PopupWindow skipPopup;
        private final StringBuilder debugLog = new StringBuilder();
        private final List<Segment> segments = new ArrayList<>();
        private Player player;
        private String loadedKey;
        private String lastMediaSnapshot;
        private boolean loading;
        private boolean polling;
        private boolean debugEnabled;
        private boolean debugDialogShown;

        State(View view) {
            this.view = view;
            this.button = new Button(view.getContext());
            button.setTextColor(0xFFF7F5FA);
            button.setTextSize(11);
            button.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            button.setAllCaps(false);
            button.setGravity(Gravity.CENTER);
            button.setMinHeight(0);
            button.setMinimumHeight(0);
            button.setMinWidth(0);
            button.setMinimumWidth(0);
            button.setPadding(dp(14), dp(5), dp(14), dp(5));
            // Same visual language as the supplied Logout control.
            button.setBackground(roundedBackground(0xFF0D0B10, 0xFF4A4858, dp(96)));
            int popupWidth = dp(160);
            int popupHeight = dp(48);
            button.setLayoutParams(new ViewGroup.LayoutParams(popupWidth, popupHeight));
            this.skipPopup = new PopupWindow(button, popupWidth, popupHeight, true);
            button.setVisibility(View.VISIBLE);
            button.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Segment segment = activeSegment();
                    if (segment != null && player != null) {
                        player.seekTo((long) (segment.endSeconds * 1000.0));
                        hideSkipPopup();
                    }
                }
            });
            skipPopup.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            skipPopup.setTouchable(true);
            skipPopup.setFocusable(true);
            skipPopup.setOutsideTouchable(false);
            skipPopup.setClippingEnabled(false);
            if (Build.VERSION.SDK_INT >= 21) skipPopup.setElevation(dp(32));
            if (Build.VERSION.SDK_INT >= 23) skipPopup.setTouchModal(false);
        }

        void log(String message) {
            if (!debugEnabled) return;
            synchronized (debugLog) {
                debugLog.append(message).append('\n');
                if (debugLog.length() > 14000) {
                    debugLog.delete(0, debugLog.length() - 14000);
                }
            }
        }

        private void showDebugDialog() {
            try {
                final Dialog dialog = new Dialog(view.getContext());
                dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

                LinearLayout root = new LinearLayout(view.getContext());
                root.setOrientation(LinearLayout.VERTICAL);
                root.setBackgroundColor(0xFF101216);

                LinearLayout header = new LinearLayout(view.getContext());
                header.setGravity(Gravity.CENTER_VERTICAL);
                header.setPadding(dp(16), dp(12), dp(10), dp(10));

                TextView heading = new TextView(view.getContext());
                heading.setText("AniSkip DEBUG");
                heading.setTextColor(Color.WHITE);
                heading.setTextSize(18);
                heading.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
                heading.setMaxLines(1);
                header.addView(heading, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

                Button refresh = dialogButton("Actualiser");
                Button copy = dialogButton("Copier");
                Button close = dialogButton("Fermer");
                header.addView(refresh);
                header.addView(copy);
                header.addView(close);
                root.addView(header);

                View divider = new View(view.getContext());
                divider.setBackgroundColor(0xFF343943);
                root.addView(divider, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, dp(1)));

                final ScrollView scroll = new ScrollView(view.getContext());
                scroll.setFillViewport(true);
                final LinearLayout content = new LinearLayout(view.getContext());
                content.setOrientation(LinearLayout.VERTICAL);
                content.setPadding(dp(12), dp(12), dp(12), dp(18));
                scroll.addView(content, new ScrollView.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));
                root.addView(scroll, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, 0, 1.0f));

                refresh.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        renderDebugContent(content);
                    }
                });
                copy.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        ClipboardManager clipboard = (ClipboardManager) view.getContext()
                                .getSystemService(android.content.Context.CLIPBOARD_SERVICE);
                        if (clipboard != null) {
                            clipboard.setPrimaryClip(ClipData.newPlainText(
                                    "AniSkip DEBUG", debugText()));
                            Toast.makeText(view.getContext(), "Debug copié", Toast.LENGTH_SHORT).show();
                        }
                    }
                });
                close.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        dialog.dismiss();
                    }
                });

                renderDebugContent(content);
                dialog.setContentView(root);
                dialog.show();

                Window window = dialog.getWindow();
                if (window != null) {
                    window.setBackgroundDrawable(new ColorDrawable(0xFF101216));
                    window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
                    window.setDimAmount(0.35f);
                    if (Build.VERSION.SDK_INT >= 21) {
                        window.setStatusBarColor(0xFF0A0B0D);
                        window.setNavigationBarColor(0xFF0A0B0D);
                    }
                    window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.MATCH_PARENT);
                }
            } catch (Exception error) {
                log("ERREUR affichage debug: " + error);
            }
        }

        private String debugText() {
            synchronized (debugLog) {
                return debugLog.toString();
            }
        }

        private void renderDebugContent(LinearLayout content) {
            content.removeAllViews();
            String raw = debugText();
            if (raw.trim().length() == 0) {
                addDebugSection(content, "ÉTAT", "Aucune donnée reçue pour le moment.");
                return;
            }

            String sectionTitle = "JOURNAL";
            StringBuilder sectionBody = new StringBuilder();
            String[] lines = raw.split("\\n", -1);
            for (String line : lines) {
                String nextTitle = debugSectionTitle(line);
                if (nextTitle != null && sectionBody.length() > 0) {
                    addDebugSection(content, sectionTitle, sectionBody.toString().trim());
                    sectionBody.setLength(0);
                }
                if (nextTitle != null) sectionTitle = nextTitle;
                if (line.trim().length() > 0) sectionBody.append(line).append('\n');
            }
            if (sectionBody.length() > 0) {
                addDebugSection(content, sectionTitle, sectionBody.toString().trim());
            }
        }

        private void addDebugSection(LinearLayout content, String title, String body) {
            LinearLayout card = new LinearLayout(view.getContext());
            card.setOrientation(LinearLayout.VERTICAL);
            card.setPadding(dp(14), dp(10), dp(14), dp(12));
            card.setBackground(roundedBackground(0xFF1A1E25, 0xFF303743, dp(10)));

            TextView label = new TextView(view.getContext());
            label.setText(title);
            label.setTextColor(0xFF9FB7FF);
            label.setTextSize(11);
            label.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            card.addView(label);

            TextView text = new TextView(view.getContext());
            text.setText(body);
            text.setTextColor(0xFFE8EAF0);
            text.setTextSize(12);
            text.setTypeface(Typeface.MONOSPACE);
            text.setTextIsSelectable(true);
            text.setPadding(0, dp(6), 0, 0);
            card.addView(text, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            params.setMargins(0, 0, 0, dp(10));
            content.addView(card, params);
        }

        private String debugSectionTitle(String line) {
            String value = line == null ? "" : line.trim();
            if (value.equals("MEDIA")) return "MÉDIA DÉTECTÉ";
            if (value.startsWith("REQUEST ")) return "REQUÊTE RÉSEAU";
            if (value.startsWith("RESPONSE ")) return "RÉPONSE RÉSEAU";
            if (value.startsWith("AniList")) return "ANILIST";
            if (value.startsWith("AniSkip")) return "ANISKIP";
            if (value.startsWith("Segment") || value.startsWith("Segments")) return "SEGMENTS";
            if (value.startsWith("ERREUR")) return "ERREUR";
            if (value.startsWith("Player reçu") || value.startsWith("HOOK OK")) return "ÉTAT DU HOOK";
            return null;
        }

        private Button dialogButton(String label) {
            Button button = new Button(view.getContext());
            button.setText(label);
            button.setTextColor(0xFFE8EAF0);
            button.setTextSize(11);
            button.setAllCaps(false);
            button.setMinHeight(0);
            button.setMinimumHeight(0);
            button.setMinWidth(0);
            button.setMinimumWidth(0);
            button.setPadding(dp(8), dp(2), dp(8), dp(2));
            button.setBackground(roundedBackground(0xFF252B35, 0xFF4B5667, dp(8)));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, dp(38));
            params.setMargins(dp(3), 0, 0, 0);
            button.setLayoutParams(params);
            return button;
        }

        private int dp(int value) {
            return (int) (value * view.getResources().getDisplayMetrics().density + 0.5f);
        }

        private GradientDrawable roundedBackground(int fillColor, int strokeColor, int radius) {
            GradientDrawable drawable = new GradientDrawable();
            drawable.setColor(fillColor);
            drawable.setCornerRadius(radius);
            drawable.setStroke(dp(1), strokeColor);
            return drawable;
        }

        void setDebugEnabled(boolean enabled) {
            debugEnabled = enabled;
            if (!enabled) {
                debugDialogShown = false;
                synchronized (debugLog) {
                    debugLog.setLength(0);
                }
            }
        }

        void setPlayer(Player next) {
            if (player != next) {
                player = next;
                loadedKey = null;
                lastMediaSnapshot = null;
                debugDialogShown = false;
                segments.clear();
                hideSkipPopup();
                log("Player reçu: " + next.getClass().getName());
            }
        }

        private void showSkipPopup() {
            if (skipPopup.isShowing()) return;
            try {
                button.setVisibility(View.VISIBLE);
                skipPopup.showAtLocation(view, Gravity.END | Gravity.CENTER_VERTICAL, -dp(18), 0);
                log("Popup Skip affiché: " + button.getText());
            } catch (Exception error) {
                log("ERREUR affichage bouton Skip: " + error);
            }
        }

        private void hideSkipPopup() {
            if (skipPopup.isShowing()) skipPopup.dismiss();
            button.setVisibility(View.GONE);
        }

        void startPolling() {
            if (polling) return;
            polling = true;
            MAIN.post(new Runnable() {
                @Override
                public void run() {
                    refresh();
                    MAIN.postDelayed(this, 500L);
                }
            });
        }

        private void refresh() {
            if (player == null) return;
            MediaInfo info = mediaInfoFor(player, view);
            if (!info.snapshot.equals(lastMediaSnapshot)) {
                lastMediaSnapshot = info.snapshot;
                log("MEDIA\n" + info.debug);
                if (!info.ready()) {
                    log("AniSkip en attente: titre ou épisode encore introuvable");
                }
            }
            if (info.ready() && !info.key.equals(loadedKey) && !loading) {
                loadedKey = info.key;
                loading = true;
                final String title = info.title;
                final int season = info.season;
                final int episode = info.episode;
                final long episodeLength = player.getDuration() > 0L
                        ? Math.round(player.getDuration() / 1000.0)
                        : 0L;
                NETWORK.execute(new Runnable() {
                    @Override
                    public void run() {
                        List<Segment> found = fetchSegments(title, season, episode, episodeLength,
                                new DebugLogger() {
                            @Override
                            public void log(String message) {
                                State.this.log(message);
                            }
                        });
                        MAIN.post(new Runnable() {
                            @Override
                            public void run() {
                                segments.clear();
                                segments.addAll(found);
                                loading = false;
                                log("Segments retenus: " + segments.size());
                            }
                        });
                    }
                });
            }

            Segment segment = activeSegment();
            if (segment == null) {
                hideSkipPopup();
            } else {
                button.setText("Skip " + segment.label);
                showSkipPopup();
            }
        }

        private Segment activeSegment() {
            if (player == null) return null;
            double position = player.getCurrentPosition() / 1000.0;
            for (Segment segment : segments) {
                if (position >= segment.startSeconds && position < segment.endSeconds - 0.25) {
                    return segment;
                }
            }
            return null;
        }
    }

    private static final class Segment {
        final double startSeconds;
        final double endSeconds;
        final String label;

        Segment(double startSeconds, double endSeconds, String label) {
            this.startSeconds = startSeconds;
            this.endSeconds = endSeconds;
            this.label = label;
        }
    }

    private static final class MediaInfo {
        final String title;
        final int season;
        final int episode;
        final String key;
        final String snapshot;
        final String debug;

        MediaInfo(String title, int season, int episode, String key, String snapshot, String debug) {
            this.title = title;
            this.season = season;
            this.episode = episode;
            this.key = key;
            this.snapshot = snapshot;
            this.debug = debug;
        }

        boolean ready() {
            return title.length() > 0 && episode > 0;
        }
    }

    private static MediaInfo mediaInfoFor(Player player, View playerView) {
        MediaItem item = player.getCurrentMediaItem();
        MediaMetadata playerMetadata = player.getMediaMetadata();
        MediaMetadata itemMetadata = item == null ? null : item.mediaMetadata;
        MediaItem.LocalConfiguration local = item == null ? null : item.localConfiguration;
        MediaItem.RequestMetadata request = item == null ? null : item.requestMetadata;

        List<String> titleCandidates = new ArrayList<>();
        List<String> episodeCandidates = new ArrayList<>();

        addMetadataCandidates(playerMetadata, titleCandidates, episodeCandidates);
        addMetadataCandidates(itemMetadata, titleCandidates, episodeCandidates);

        if (item != null) {
            addTitleCandidate(titleCandidates, item.mediaId);
            addEpisodeCandidate(episodeCandidates, item.mediaId);
            try {
                addUriCandidates(Uri.parse(item.mediaId), titleCandidates, episodeCandidates);
            } catch (Exception ignored) {
                // The media id is not necessarily a URI.
            }
        }
        if (local != null) {
            addUriCandidates(local.uri, titleCandidates, episodeCandidates);
            addObjectCandidates(local.tag, titleCandidates, episodeCandidates);
        }
        if (request != null) {
            addUriCandidates(request.mediaUri, titleCandidates, episodeCandidates);
            addTitleCandidate(titleCandidates, request.searchQuery);
            addEpisodeCandidate(episodeCandidates, request.searchQuery);
            addBundleCandidates(request.extras, titleCandidates, episodeCandidates);
        }

        if (playerView != null) {
            addTitleCandidate(titleCandidates, text(playerView.getContentDescription()));
            addObjectCandidates(playerView.getTag(), titleCandidates, episodeCandidates);
            View parent = playerView.getParent() instanceof View
                    ? (View) playerView.getParent() : null;
            if (parent != null) {
                addTitleCandidate(titleCandidates, text(parent.getContentDescription()));
                addObjectCandidates(parent.getTag(), titleCandidates, episodeCandidates);
            }
        }

        StringBuilder reflective = new StringBuilder();
        List<String> reflectedTitles = new ArrayList<>();
        List<String> reflectedEpisodes = new ArrayList<>();
        Set<Object> visited = Collections.newSetFromMap(new IdentityHashMap<Object, Boolean>());
        collectReflectiveCandidates(player, reflectedTitles, reflectedEpisodes, reflective, 0, visited);
        collectReflectiveCandidates(item, reflectedTitles, reflectedEpisodes, reflective, 0, visited);
        titleCandidates.addAll(reflectedTitles);
        episodeCandidates.addAll(reflectedEpisodes);

        String title = firstTitle(titleCandidates);
        int episode = firstEpisode(episodeCandidates);
        if (episode == 0) {
            episode = fallbackTrackNumber(playerMetadata, itemMetadata);
        }
        String id = item == null ? "" : safe(item.mediaId);
        String uri = local == null || local.uri == null ? "" : safe(local.uri.toString());
        int season = seasonFromText(uri);
        String seasonSource = season > 0 ? "URI décodée / nom de fichier" : "";
        if (season == 0) {
            season = seasonFromText(id);
            if (season > 0) seasonSource = "mediaId";
        }
        String identity = id.length() > 0 ? id : uri;
        String key = title + "|S" + season + "E" + episode + "|" + identity;
        String snapshot = key + "|" + describeMetadata(playerMetadata) + "|" +
                describeMetadata(itemMetadata) + "|" + uri + "|" + describeObject(local == null ? null : local.tag);

        StringBuilder debug = new StringBuilder();
        debug.append("Titre: ").append(title.length() == 0 ? "<introuvable>" : title).append('\n');
        debug.append("Saison: ").append(season > 0 ? season : "<introuvable>").append('\n');
        if (seasonSource.length() > 0) {
            debug.append("Source saison: ").append(seasonSource).append('\n');
        }
        debug.append("Episode: ").append(episode > 0 ? episode : "<introuvable>").append('\n');
        debug.append("Clé: ").append(key).append('\n');
        appendMediaDebug(debug, item, playerMetadata, itemMetadata, local, request, playerView);
        if (reflective.length() > 0) {
            debug.append("Réflexion Stremio:\n").append(clip(reflective.toString()));
        }
        return new MediaInfo(title, season, episode, key, snapshot, debug.toString());
    }

    private static void addMetadataCandidates(MediaMetadata metadata,
                                              List<String> titles,
                                              List<String> episodes) {
        if (metadata == null) return;
        addTitleCandidate(titles, text(metadata.title));
        addTitleCandidate(titles, text(metadata.displayTitle));
        addTitleCandidate(titles, text(metadata.albumTitle));
        addTitleCandidate(titles, text(metadata.albumArtist));
        addTitleCandidate(titles, text(metadata.artist));
        addStructuredTitleCandidate(titles, text(metadata.description));
        addStructuredTitleCandidate(titles, text(metadata.subtitle));
        addBundleCandidates(metadata.extras, titles, episodes);
    }

    private static void addBundleCandidates(Bundle bundle,
                                             List<String> titles,
                                             List<String> episodes) {
        if (bundle == null) return;
        for (String key : bundle.keySet()) {
            Object value;
            try {
                value = bundle.get(key);
            } catch (Exception ignored) {
                continue;
            }
            String lower = key == null ? "" : key.toLowerCase(Locale.US);
            if (isTitleKey(lower)) addTitleCandidate(titles, describeObject(value));
            if (isEpisodeKey(lower)) addEpisodeCandidate(episodes, describeObject(value));
            if (value instanceof Bundle) addBundleCandidates((Bundle) value, titles, episodes);
        }
    }

    private static void addObjectCandidates(Object value,
                                             List<String> titles,
                                             List<String> episodes) {
        if (value == null) return;
        if (value instanceof Bundle) {
            addBundleCandidates((Bundle) value, titles, episodes);
        }
        String raw = describeObject(value);
        addStructuredTitleCandidate(titles, raw);
        addEpisodeCandidate(episodes, raw);
    }

    private static void addUriCandidates(Uri uri,
                                         List<String> titles,
                                         List<String> episodes) {
        if (uri == null) return;
        String[] queryKeys = new String[]{
                "title", "name", "series", "show", "anime", "mediaTitle",
                "torrent_name", "torrentName", "filename", "file_name", "fileName"
        };
        for (String key : queryKeys) addTitleCandidate(titles, uri.getQueryParameter(key));
        String[] episodeKeys = new String[]{
                "episode", "episodeNumber", "ep", "number", "episode_index", "episodeIndex",
                "torrent_name", "torrentName", "filename", "file_name", "fileName"
        };
        for (String key : episodeKeys) addEpisodeCandidate(episodes, uri.getQueryParameter(key));

        List<String> path = uri.getPathSegments();
        for (int i = 0; i < path.size(); i++) {
            String segment = decode(path.get(i));
            int episode = episodeFromText(segment);
            if (episode > 0) {
                addEpisodeCandidate(episodes, segment);
                if (i > 0) addTitleCandidate(titles, path.get(i - 1));
            }
        }
    }

    private static void addTitleCandidate(List<String> candidates, String value) {
        if (value != null && value.trim().length() > 0) candidates.add(value.trim());
    }

    private static void addEpisodeCandidate(List<String> candidates, String value) {
        if (value != null && value.trim().length() > 0) candidates.add(value.trim());
    }

    private static void addStructuredTitleCandidate(List<String> candidates, String value) {
        String title = structuredTitle(value);
        if (title.length() > 0) candidates.add(title);
    }

    private static String firstTitle(List<String> candidates) {
        for (String candidate : candidates) {
            String structured = structuredTitle(candidate);
            String cleaned = cleanTitle(structured.length() > 0 ? structured : candidate);
            if (isUsableTitle(cleaned)) return cleaned;
        }
        return "";
    }

    private static String structuredTitle(String value) {
        String raw = safe(value);
        if (raw.length() == 0) return "";
        try {
            if (raw.startsWith("{") && raw.endsWith("}")) {
                JSONObject object = new JSONObject(raw);
                String[] keys = new String[]{
                        "title", "name", "series", "show", "anime", "mediaTitle",
                        "torrent_name", "torrentName", "filename", "file_name", "fileName"
                };
                for (String key : keys) {
                    String result = object.optString(key, "");
                    if (result.length() > 0) return result;
                }
                for (String key : new String[]{"meta", "media", "item", "metadata"}) {
                    JSONObject nested = object.optJSONObject(key);
                    String result = structuredTitle(nested == null ? "" : nested.toString());
                    if (result.length() > 0) return result;
                }
            }
        } catch (Exception ignored) {
            // Try the key=value/data-class form below.
        }
        Matcher matcher = STRUCTURED_TITLE.matcher(raw);
        return matcher.find() ? safe(matcher.group(1)) : "";
    }

    private static String cleanTitle(String value) {
        String result = decode(value);
        result = result.replaceAll("(?i)^(?:\\[[^\\]]+\\]\\s*)+", "");
        result = result.replaceAll("(?i)\\.(?:mkv|mp4|webm|m3u8)$", "");
        result = result.replaceAll("(?i)\\s*\\[[^\\]]*(?:\\d{3,4}p|webrip|web-dl|bluray|h264|x264|aac|sub|dub)[^\\]]*\\]\\s*$", "");
        result = result.replaceAll("(?i)(?:[ ._-]+)(?:S\\d{1,2}[ ._-]*E\\d{1,4}|episode[ ._-]*\\d{1,4}|ep[ ._-]*\\d{1,4}).*$", "");
        result = result.replaceAll("(?i)(?:[ ._-]+)(?:episode|ep)[ ._-]*\\d{1,4}.*$", "");
        result = result.replaceAll("[._-]+", " ").trim();
        return result.replaceAll("\\s{2,}", " ").trim();
    }

    private static boolean isUsableTitle(String value) {
        if (value == null || value.length() < 2 || value.length() > 160) return false;
        if (value.matches("(?i)^(episode|ep|e|stream|video|media|watch|play|source|cdn|hls|dash|file|download|unknown)[ ._-]*\\d*$")) return false;
        if (value.matches("\\d{1,4}") || value.matches("[0-9a-fA-F]{20,}")) return false;
        if (!value.matches(".*\\p{L}.*")) return false;
        if (value.contains("://") || value.contains("/") || value.contains("\\\\")) return false;
        return true;
    }

    private static int firstEpisode(List<String> candidates) {
        for (String candidate : candidates) {
            int episode = episodeFromText(candidate);
            if (episode > 0) return episode;
        }
        return 0;
    }

    private static int fallbackTrackNumber(MediaMetadata first, MediaMetadata second) {
        Integer firstTrack = first == null ? null : first.trackNumber;
        if (firstTrack != null && firstTrack > 0) return firstTrack;
        Integer secondTrack = second == null ? null : second.trackNumber;
        return secondTrack == null ? 0 : Math.max(secondTrack, 0);
    }

    private static int episodeFromText(String value) {
        String raw = decode(value);
        if (raw.length() == 0) return 0;
        try {
            if (raw.startsWith("{") && raw.endsWith("}")) {
                JSONObject object = new JSONObject(raw);
                for (String key : new String[]{
                        "episode", "episodeNumber", "ep", "number", "episode_index", "episodeIndex"
                }) {
                    int result = object.optInt(key, 0);
                    if (result > 0) return result;
                }
            }
        } catch (Exception ignored) {
            // Continue with textual patterns.
        }
        Matcher matcher = SEASON_EPISODE.matcher(raw);
        boolean found = matcher.find();
        if (!found) {
            matcher = EPISODE.matcher(raw);
            found = matcher.find();
        }
        if (found) {
            try {
                return Integer.parseInt(matcher.group(1));
            } catch (NumberFormatException ignored) {
                return 0;
            }
        }
        return raw.matches("\\d{1,4}") ? parseInt(raw) : 0;
    }

    private static int parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ignored) {
            return 0;
        }
    }

    private static void collectReflectiveCandidates(Object value,
                                                    List<String> titles,
                                                    List<String> episodes,
                                                    StringBuilder debug,
                                                    int depth,
                                                    Set<Object> visited) {
        if (value == null || depth > 2 || visited.contains(value)) return;
        Class<?> type = value.getClass();
        if (type.isPrimitive() || type == String.class || type.isEnum()) return;
        visited.add(value);
        if (value instanceof Bundle) {
            addBundleCandidates((Bundle) value, titles, episodes);
            return;
        }
        Field[] fields;
        try {
            fields = type.getDeclaredFields();
        } catch (Throwable ignored) {
            return;
        }
        for (Field field : fields) {
            String name = field.getName();
            String lower = name.toLowerCase(Locale.US);
            if (!isInterestingField(lower)) continue;
            try {
                field.setAccessible(true);
                Object fieldValue = field.get(value);
                if (fieldValue == null) continue;
                String printable = describeObject(fieldValue);
                if (isTitleKey(lower)) addTitleCandidate(titles, printable);
                if (isEpisodeKey(lower)) addEpisodeCandidate(episodes, printable);
                if (debug.length() < 5000) {
                    debug.append(name).append('=').append(clip(printable)).append('\n');
                }
                if (depth < 2 && (lower.contains("media") || lower.contains("meta") ||
                        lower.contains("item") || lower.contains("stream") || lower.contains("tag") ||
                        lower.contains("request") || lower.contains("config") || lower.contains("player") ||
                        lower.contains("delegate") || lower.contains("backend") || lower.contains("engine") ||
                        lower.contains("state") || lower.contains("current") || lower.contains("impl"))) {
                    collectReflectiveCandidates(fieldValue, titles, episodes, debug,
                            depth + 1, visited);
                }
            } catch (Throwable ignored) {
                // Some framework fields cannot be accessed; continue with the others.
            }
        }
    }

    private static boolean isInterestingField(String name) {
        return isTitleKey(name) || isEpisodeKey(name) || name.contains("media") ||
                name.contains("meta") || name.contains("item") || name.contains("stream") ||
                name.contains("request") || name.contains("config") || name.contains("tag") ||
                name.contains("player") || name.contains("delegate") || name.contains("backend") ||
                name.contains("engine") || name.contains("state") || name.contains("current") ||
                name.contains("impl") || name.equals("url") || name.equals("uri");
    }

    private static boolean isTitleKey(String name) {
        return name.contains("title") || name.equals("name") || name.contains("series") ||
                name.contains("show") || name.contains("anime") || name.contains("torrentname") ||
                name.contains("filename");
    }

    private static boolean isEpisodeKey(String name) {
        return name.contains("episode") || name.equals("ep") || name.contains("episodenumber") ||
                name.contains("tracknumber") || name.equals("number") || name.contains("seasonepisode");
    }

    private static void appendMediaDebug(StringBuilder debug,
                                         MediaItem item,
                                         MediaMetadata playerMetadata,
                                         MediaMetadata itemMetadata,
                                         MediaItem.LocalConfiguration local,
                                         MediaItem.RequestMetadata request,
                                         View playerView) {
        debug.append("Player metadata: ").append(describeMetadata(playerMetadata)).append('\n');
        debug.append("Item metadata: ").append(describeMetadata(itemMetadata)).append('\n');
        if (item != null) {
            debug.append("mediaId: ").append(safe(item.mediaId)).append('\n');
        }
        if (local != null) {
            debug.append("URI: ").append(local.uri == null ? "" : local.uri).append('\n');
            debug.append("mimeType: ").append(safe(local.mimeType)).append('\n');
            debug.append("customCacheKey: ").append(safe(local.customCacheKey)).append('\n');
            debug.append("tag: ").append(clip(describeObject(local.tag))).append('\n');
        }
        if (request != null) {
            debug.append("request.mediaUri: ").append(request.mediaUri == null ? "" : request.mediaUri).append('\n');
            debug.append("request.searchQuery: ").append(safe(request.searchQuery)).append('\n');
            debug.append("request.extras: ").append(clip(bundleToText(request.extras))).append('\n');
        }
        if (playerView != null) {
            debug.append("view.contentDescription: ").append(text(playerView.getContentDescription())).append('\n');
            debug.append("view.tag: ").append(clip(describeObject(playerView.getTag()))).append('\n');
        }
    }

    private static String describeMetadata(MediaMetadata metadata) {
        if (metadata == null) return "<null>";
        return "title=" + clip(text(metadata.title)) +
                ", displayTitle=" + clip(text(metadata.displayTitle)) +
                ", albumTitle=" + clip(text(metadata.albumTitle)) +
                ", artist=" + clip(text(metadata.artist)) +
                ", subtitle=" + clip(text(metadata.subtitle)) +
                ", description=" + clip(text(metadata.description)) +
                ", trackNumber=" + metadata.trackNumber +
                ", extras=" + clip(bundleToText(metadata.extras));
    }

    private static String describeObject(Object value) {
        if (value == null) return "<null>";
        if (value instanceof Bundle) return bundleToText((Bundle) value);
        try {
            return String.valueOf(value);
        } catch (Throwable error) {
            return "<" + value.getClass().getName() + ">";
        }
    }

    private static String bundleToText(Bundle bundle) {
        if (bundle == null) return "<null>";
        StringBuilder result = new StringBuilder("{");
        for (String key : bundle.keySet()) {
            if (result.length() > 1) result.append(", ");
            Object value;
            try {
                value = bundle.get(key);
            } catch (Exception error) {
                value = "<erreur>";
            }
            result.append(key).append('=').append(describeObject(value));
            if (result.length() > 4000) {
                result.append("…");
                break;
            }
        }
        return result.append('}').toString();
    }

    private interface DebugLogger {
        void log(String message);
    }

    private static List<Segment> fetchSegments(String title, int season, int episode, long episodeLength,
                                              DebugLogger logger) {
        List<Segment> segments = new ArrayList<>();
        if (title.length() == 0 || episode < 1) {
            logger.log("AniSkip ignoré: titre ou épisode introuvable");
            return segments;
        }
        try {
            int malId = resolveMalId(title, season, logger);
            if (malId <= 0) {
                logger.log("AniList: aucun idMal trouvé");
                return segments;
            }
            logger.log("AniList: idMal = " + malId);
            String endpoint = ANISKIP_URL + malId + "/" + episode +
                    "?types=op&types=ed&types=mixed-op&types=mixed-ed&types=recap" +
                    "&episodeLength=" + Math.max(0L, episodeLength);
            JSONObject response = new JSONObject(request(
                    "GET",
                    endpoint,
                    null,
                    logger
            ));
            JSONArray results = response.optJSONArray("results");
            if (results == null) {
                logger.log("AniSkip: champ results absent ou réponse non exploitable");
                return segments;
            }
            for (int i = 0; i < results.length(); i++) {
                JSONObject result = results.optJSONObject(i);
                if (result == null) continue;
                JSONObject interval = result.optJSONObject("interval");
                if (interval == null) continue;
                double start = interval.optDouble("startTime", -1.0);
                double end = interval.optDouble("endTime", -1.0);
                if (start < 0.0 || end <= start) continue;
                String type = result.optString("skipType", "").toLowerCase(Locale.US);
                String label = "op".equals(type) ? "OP" : "ed".equals(type) ? "ED" :
                        "recap".equals(type) ? "recap" : "skip";
                segments.add(new Segment(start, end, label));
                logger.log("Segment: " + label + " " + start + "s -> " + end + "s");
            }
        } catch (Exception error) {
            logger.log("ERREUR AniSkip: " + error.getClass().getSimpleName() + ": " + safe(error.getMessage()));
        }
        return segments;
    }

    private static int resolveMalId(String title, int season, DebugLogger logger) throws Exception {
        List<String> searches = new ArrayList<>();
        if (season > 1) {
            searches.add(title + " " + ordinalSeason(season) + " Season");
            searches.add(title + " Season " + season);
        }
        searches.add(title);
        for (String search : searches) {
            logger.log("AniList: recherche = " + search);
            JSONObject variables = new JSONObject().put("search", search);
            JSONObject body = new JSONObject()
                    .put("query", "query ($search: String) { Media(search: $search, type: ANIME) { idMal } }")
                    .put("variables", variables);
            JSONObject response = new JSONObject(request("POST", ANILIST_URL, body.toString(), logger));
            JSONObject data = response.optJSONObject("data");
            JSONObject media = data == null ? null : data.optJSONObject("Media");
            int malId = media == null ? 0 : media.optInt("idMal", 0);
            if (malId > 0) return malId;
        }
        return 0;
    }

    private static String ordinalSeason(int season) {
        if (season % 100 >= 11 && season % 100 <= 13) return season + "th";
        switch (season % 10) {
            case 1: return season + "st";
            case 2: return season + "nd";
            case 3: return season + "rd";
            default: return season + "th";
        }
    }

    private static int seasonFromText(String value) {
        // URI.toString() contains %20 around the filename. Decode before using
        // token boundaries, otherwise the final encoded space ends in a digit
        // and S04E04 is not recognized as a separate token.
        String raw = decode(value);
        Matcher matcher = SEASON.matcher(raw);
        if (matcher.find()) return parseInt(matcher.group(1));
        matcher = SEASON_WORD.matcher(raw);
        if (matcher.find()) return parseInt(matcher.group(1));
        return 0;
    }

    private static String request(String method, String endpoint, String body, DebugLogger logger) throws Exception {
        logger.log("REQUEST " + method + " " + endpoint +
                (body == null ? "" : "\nBody: " + clip(body)));
        HttpURLConnection connection = (HttpURLConnection) new URL(endpoint).openConnection();
        connection.setRequestMethod(method);
        connection.setConnectTimeout(8000);
        connection.setReadTimeout(8000);
        connection.setRequestProperty("Accept", "application/json");
        if (body != null) {
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            OutputStream output = connection.getOutputStream();
            output.write(body.getBytes(StandardCharsets.UTF_8));
            output.close();
        }
        int responseCode = connection.getResponseCode();
        InputStream input = responseCode >= 400
                ? connection.getErrorStream() : connection.getInputStream();
        if (input == null) {
            logger.log("RESPONSE " + responseCode + ": <vide>");
            return "{}";
        }
        BufferedReader reader = new BufferedReader(new InputStreamReader(input, StandardCharsets.UTF_8));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) response.append(line);
        reader.close();
        connection.disconnect();
        logger.log("RESPONSE " + responseCode + "\n" + clip(response.toString()));
        return response.toString();
    }

    private static String clip(String value) {
        if (value == null) return "";
        return value.length() <= 6000 ? value : value.substring(0, 6000) + "…[tronqué]";
    }

    private static String decode(String value) {
        String raw = safe(value);
        if (raw.length() == 0) return "";
        try {
            return URLDecoder.decode(raw, StandardCharsets.UTF_8.name());
        } catch (Exception ignored) {
            return raw;
        }
    }

    private static String text(CharSequence value) {
        return value == null ? "" : value.toString().trim();
    }

    private static String safe(String value) {
        return value == null ? "" : value.trim();
    }
}
