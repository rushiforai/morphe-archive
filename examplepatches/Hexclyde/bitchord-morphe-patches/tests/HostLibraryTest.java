package app.bitchord.telegram;

import com.music.bitchord.data.model.QueueTier;
import com.music.bitchord.data.model.Song;
import com.music.bitchord.data.spotify.LocalPlaylist;
import com.music.bitchord.data.spotify.LocalPlaylistStore;
import com.music.bitchord.download.Downloads;

import org.json.JSONObject;

import java.util.*;

public final class HostLibraryTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static JSONObject row(String id, String title, String format, long size, int seconds, int bits)
            throws Exception {
        return new JSONObject()
                .put("id", id)
                .put("title", title)
                .put("artist", "Nina Simone")
                .put("format", format)
                .put("size", size)
                .put("duration", seconds)
                .put("bits", bits);
    }

    public static void main(String[] args) throws Exception {
        List<JSONObject> rows =
                List.of(
                        row("-100_5", "Be My Husband", "flac", 60_000_000, 204, 24),
                        row("-100_6", "End of the Line", "mp3", 7_100_000, 178, 0),
                        row("-100_7", "Untimed", "ogg", 0, 0, 0));
        List<Object> songs = HostLibrary.songs(rows, null);
        Song flac = (Song) songs.get(0), mp3 = (Song) songs.get(1), plain = (Song) songs.get(2);
        check(flac.videoId.equals("src:telegram-native::-100_5"), "Unofficial Telegram track key");
        check(flac.title.equals("Be My Husband") && flac.artist.equals("Nina Simone"), "Names");
        check("3:24".equals(flac.durationText), "Length as BitChord writes it");
        check(flac.queueTier == QueueTier.CONTEXT, "Queued as part of a playlist");
        check("LOSSLESS".equals(flac.sourceQuality) && flac.sourceHiRes, "24-bit FLAC is hi-res");
        check("HIGH".equals(mp3.sourceQuality) && !mp3.sourceHiRes, "320 kbps MP3 is high");
        check(plain.sourceQuality == null && plain.durationText == null, "Unknowns left out");
        check(flac.thumbnailUrl == null, "No covers without the cover store");

        String first = HostLibrary.savePlaylist("Jazz Vault", songs, null);
        HostLibrary.savePlaylist("Other", songs.subList(0, 1), null);
        check(LocalPlaylistStore.current().size() == 2, "Two playlists");
        String second = HostLibrary.savePlaylist("Jazz Vault", songs.subList(0, 2), first);
        List<LocalPlaylist> now = LocalPlaylistStore.current();
        check(!second.equals(first), "A new id each save");
        check(now.size() == 2, "Saving again replaces the chat's playlist: " + now.size());
        check(now.get(0).id().equals(second) && now.get(0).songs.size() == 2, "Newest first");
        check(now.get(1).title.equals("Other"), "Other playlists are kept");
        HostLibrary.savePlaylist("Jazz Vault", songs, "gone");
        check(LocalPlaylistStore.current().size() == 3, "A playlist deleted in BitChord is fine");

        HostLibrary.download(null, songs.subList(0, 2), "Jazz Vault");
        check(
                Downloads.queued.equals(
                        List.of(
                                "Jazz Vault: src:telegram-native::-100_5",
                                "Jazz Vault: src:telegram-native::-100_6")),
                "Queued in BitChord's downloads: " + Downloads.queued);

        check(HostLibrary.tier("HI_RES_LOSSLESS").equals("LOSSLESS"), "Hi-res tier");
        check(HostLibrary.tier("") == null, "Unknown quality");
        check("61:01".equals(HostLibrary.durationText(3661)), "Long tracks in minutes");
        System.out.println("PASS: " + checks + " BitChord playlist and download checks.");
    }
}
