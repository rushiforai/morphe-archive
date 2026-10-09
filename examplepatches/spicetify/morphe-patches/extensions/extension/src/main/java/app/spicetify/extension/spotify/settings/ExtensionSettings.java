package app.spicetify.extension.spotify.settings;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.text.InputType;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import app.spicetify.extension.spotify.extensions.Extensions;
import app.spicetify.extension.spotify.extensions.HidePodcasts;
import app.spicetify.extension.spotify.extensions.PlayerBridge;
import app.spicetify.extension.spotify.extensions.RandomSong;
import app.spicetify.extension.spotify.extensions.ShufflePlus;
import app.spicetify.extension.spotify.extensions.TrashBin;
import org.json.JSONException;

/**
 * The extensions on Spicetify settings' root page: each one that is on, with its latest status, and
 * the Marketplace to turn them on. Tapping one opens its sheet: its switch, and its own controls.
 */
final class ExtensionSettings {
    private ExtensionSettings() {}

    static void build(SpicetifySettingsScreen screen, LinearLayout content) {
        int side = SpotifyStyle.dp(screen, 16);
        SpotifyStyle.sectionTitle(content, "Extensions", true).setPadding(side, SpotifyStyle.dp(screen, 24), side, SpotifyStyle.dp(screen, 8));
        String problem = PlayerBridge.problemLine();
        if (problem != null) {
            TextView line = SpotifyStyle.body(screen, problem);
            line.setPadding(side, SpotifyStyle.dp(screen, 8), side, 0);
            content.addView(line);
        }
        for (String id : Extensions.enabled(screen)) {
            SpotifyStyle.actionRow(content, Extensions.title(id), Extensions.latestStatus(id), view -> open(screen, id));
        }
        SpotifyStyle.actionRow(content, "Spicetify Marketplace", "Turn extensions on in its Extensions tab",
                view -> screen.openPage(SpicetifySettingsScreen.PAGE_EXTENSIONS));
    }

    /** Extension {@code id}'s sheet. Closing it brings the root page up to date. */
    static void open(SpicetifySettingsScreen screen, String id) {
        LinearLayout rows = SpotifyStyle.column(screen);
        boolean on = Extensions.isOn(screen, id);
        // Rows that only work while the extension is on show only while its switch is.
        LinearLayout whileOn = SpotifyStyle.column(screen);
        whileOn.setVisibility(on ? View.VISIBLE : View.GONE);
        SpotifyStyle.toggleRow(rows, Extensions.title(id), on ? Extensions.latestStatus(id) : "Off", on, (button, checked) -> {
            Extensions.setOn(screen, id, checked);
            whileOn.setVisibility(checked ? View.VISIBLE : View.GONE);
        });
        if (Extensions.TRASH_BIN.equals(id)) {
            LinearLayout controls = SpotifyStyle.column(screen);
            trashBin(screen, controls, null);
            rows.addView(controls);
        }
        if (Extensions.RANDOM_SONG.equals(id)) {
            SpotifyStyle.actionRow(rows, "A song from Spotify", "Search all of Spotify for one and play it",
                    view -> RandomSong.playFromSpotify(screen));
            SpotifyStyle.actionRow(rows, "A song from your library", "Pick one from Liked Songs, your playlists and your albums",
                    view -> RandomSong.playFromLibrary(screen));
        }
        if (Extensions.SHUFFLE_PLUS.equals(id)) {
            SpotifyStyle.actionRow(whileOn, "Shuffle+ what's playing", "Play every song of the list that's playing in a new order",
                    view -> ShufflePlus.shuffleWhatsPlaying(screen));
        }
        if (Extensions.HIDE_PODCASTS.equals(id)) {
            SpotifyStyle.toggleRow(rows, "Also hide audiobooks",
                    "Hide audiobooks on Home and in Search, and the Books and Authors filters in Your Library.",
                    HidePodcasts.audiobooksHidden(screen), (button, hidden) -> HidePodcasts.setAudiobooksHidden(screen, hidden));
        }
        rows.addView(whileOn);
        SpotifySheet sheet = new SpotifySheet(screen, Extensions.title(id), Extensions.description(id));
        sheet.view(rows).secondary("Close");
        sheet.setOnDismissListener(closed -> screen.refresh());
        sheet.show();
    }

    /** Trash Bin's Export, Import and Clear. After an export, {@code exported} says what was copied. */
    private static void trashBin(SpicetifySettingsScreen screen, LinearLayout controls, String exported) {
        controls.removeAllViews();
        String trash = count(TrashBin.songCount(screen), "song") + " and " + count(TrashBin.artistCount(screen), "artist");
        SpotifyStyle.actionRow(controls, "Export", exported != null ? exported
                : "Copy the " + trash + " in the trash, in the desktop extension's format", view -> {
            ClipboardManager clipboard = (ClipboardManager) screen.getSystemService(Context.CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText("Trash Bin", TrashBin.exportJson()));
            trashBin(screen, controls, "Copied the " + trash + " to the clipboard");
        });
        SpotifyStyle.actionRow(controls, "Import", "Add the songs and artists of a list exported here or on desktop",
                view -> importTrash(screen, controls));
        SpotifyStyle.actionRow(controls, "Clear", "Take the " + trash + " out of the trash",
                view -> new SpotifySheet(screen, "Clear the trash?", "The " + trash + " will play again.")
                        .primary("Clear", () -> {
                            TrashBin.clear(screen);
                            trashBin(screen, controls, null);
                            return true;
                        })
                        .secondary("Cancel")
                        .show());
    }

    private static void importTrash(SpicetifySettingsScreen screen, LinearLayout controls) {
        EditText list = new EditText(screen);
        list.setHint("Paste an exported list");
        list.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        SpotifyStyle.style(list);
        list.setMaxLines(6);
        new SpotifySheet(screen, "Import a trash list", "Its songs and artists join the ones in the trash.")
                .view(list)
                .primary("Import", () -> {
                    try {
                        TrashBin.importJson(screen, list.getText().toString());
                    } catch (JSONException | StackOverflowError notAList) {
                        // StackOverflowError: a paste nested deeper than the parser's stack.
                        // Android shows an error's message only on a focused field.
                        list.requestFocus();
                        list.setError("That isn't an exported trash list.");
                        return false;
                    }
                    trashBin(screen, controls, null);
                    return true;
                })
                .secondary("Cancel")
                .show();
    }

    private static String count(int number, String noun) {
        return number + " " + noun + (number == 1 ? "" : "s");
    }
}
