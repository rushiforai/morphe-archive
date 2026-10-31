package app.bitchord.telegram;

import org.json.JSONObject;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;

public final class TrackNamesTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static JSONObject row(String id, String title, String artist, int duration) throws Exception {
        return new JSONObject()
                .put("id", id)
                .put("chat", Long.parseLong(id.substring(0, id.indexOf('_'))))
                .put("title", title)
                .put("artist", artist)
                .put("duration", duration);
    }

    interface Action {
        void run() throws Exception;
    }

    static void throwsIo(Action action, String message) throws Exception {
        try {
            action.run();
        } catch (java.io.IOException e) {
            checks++;
            return;
        }
        throw new AssertionError(message);
    }

    public static void main(String[] args) throws Exception {
        // Matching rules
        check(
                TrackNames.words("Ine  More-Light!").equals(Arrays.asList("ine", "more", "light")),
                "Words ignore case and punctuation");
        check(TrackNames.words("Beyoncé").equals(Arrays.asList("beyonce")), "Words ignore accents");
        check(TrackNames.nearMiss("One More Light", "Ine More Light"), "One typo is a near miss");
        check(TrackNames.nearMiss("Sorry For Now", "Sorry For Know"), "One added letter");
        check(!TrackNames.nearMiss("One More Light", "One More Light"), "Same title is not a miss");
        check(!TrackNames.nearMiss("one more light", "ONE MORE LIGHT!"), "Case only is not a miss");
        check(!TrackNames.nearMiss("Numb", "Numb Live"), "Extra word means another version");
        check(!TrackNames.nearMiss("In The End", "On The End"), "Two-letter words must match");
        check(!TrackNames.nearMiss("Heavy", "Hearts"), "Too many changes");
        check(!TrackNames.nearMiss("Halfway Right", "Halfway Night Out"), "Word counts differ");
        check(
                !TrackNames.nearMiss("Talking To Myself", "Walking To Myrself"),
                "One per ten letters");
        check(!TrackNames.nearMiss("", "Anything"), "Blank title");
        check(TrackNames.sharesArtist("Linkin Park", "LINKIN PARK"), "Artist case");
        check(
                TrackNames.sharesArtist("Metal Scar Radio, BLACK 0", "Metal Scar Radio"),
                "Artist contained in credit list");
        check(!TrackNames.sharesArtist("Linkin Park", ""), "Unknown artist never shares");
        check(TrackNames.distance("kitten", "sitting") == 3, "Edit distance");
        check(
                TrackNames.clean(" A\u0000 B\n\tC ").equals("A B C"),
                "Control characters and spacing removed");
        check(TrackNames.clean("x".repeat(300)).length() == TrackNames.MAX_TEXT, "Length capped");
        check(
                TrackNames.primaryArtist("Linkin Park feat. Jay-Z").equals("Linkin Park")
                        && TrackNames.primaryArtist("A, B & C").equals("A")
                        && TrackNames.primaryArtist("Solo").equals("Solo"),
                "Primary artist");

        // Suggestions
        TrackNames names = new TrackNames(null);
        List<JSONObject> chat =
                Arrays.asList(
                        row("10_1", "Ine More Light", "Linkin Park", 263),
                        row("10_2", "Heavy", "Linkin Park", 171),
                        row("10_3", "One More Lite", "Someone Else", 263),
                        row("10_4", "One Mire Light", "Linkin Park", 400));
        check(
                names.consider("One More Light", "Linkin Park", 254, chat) == 1,
                "Only the same artist, close length and near-miss title is suggested");
        check(names.suggestions().get(0).getString("id").equals("10_1"), "Suggested file");
        check(
                names.suggestions().get(0).getString("fileTitle").equals("Ine More Light"),
                "Original title kept");
        check(names.consider("One More Light", "Linkin Park", 254, chat) == 0, "No duplicates");
        names.dismiss("10_1");
        check(names.suggestions().isEmpty(), "Dismissed");
        check(
                names.consider("One More Light", "Linkin Park", 254, chat) == 0,
                "A dismissed suggestion does not come back");
        check(
                names.consider("Heavy", "Linkin Park", 171, chat) == 0,
                "Correct names are not suggested");
        check(names.consider("", "Linkin Park", 171, chat) == 0, "Blank title ignored");
        check(
                new TrackNames(null).consider("One More Light", "Linkin Park", 0, chat) == 2,
                "Without a known length, every near miss by the artist counts");

        // Corrections
        names.correct(row("10_2", "Heavy", "Linkin Park", 171), "Heavy", "Linkin Park");
        check(names.corrections().isEmpty(), "Saving the original name stores nothing");
        TrackNames fresh = new TrackNames(null);
        fresh.consider("One More Light", "Linkin Park", 254, chat);
        fresh.accept("10_1");
        check(fresh.suggestions().isEmpty(), "Accepted suggestion leaves the list");
        JSONObject fixed = fresh.apply(row("10_1", "Ine More Light", "Linkin Park", 263));
        check(fixed.getString("title").equals("One More Light"), "Correction applied");
        check(fixed.getString("fileTitle").equals("Ine More Light"), "Telegram name kept");
        check(fixed.getInt("duration") == 263, "Other fields unchanged");
        JSONObject other = row("10_2", "Heavy", "Linkin Park", 171);
        check(fresh.apply(other) == other, "Uncorrected rows pass through");
        throwsIo(() -> fresh.correct(row("10_2", "Heavy", "", 1), "  ", ""), "Empty title");
        throwsIo(() -> fresh.correct(new JSONObject().put("id", "bad"), "X", ""), "Invalid id");

        // Search results
        Map<String, JSONObject> remote = new HashMap<>();
        remote.put("10_1", row("10_1", "Ine More Light", "Linkin Park", 263));
        List<String> looked = new ArrayList<>();
        TrackNames.Lookup lookup =
                id -> {
                    looked.add(id);
                    return remote.get(id);
                };
        List<JSONObject> merged =
                fresh.merge(Collections.emptyList(), "One More Light Linkin Park", lookup);
        check(
                merged.size() == 1 && merged.get(0).getString("title").equals("One More Light"),
                "A corrected track is found by its new name");
        check(looked.equals(Arrays.asList("10_1")), "Fetched by id when Telegram didn't find it");
        looked.clear();
        merged =
                fresh.merge(
                        Arrays.asList(row("10_1", "Ine More Light", "Linkin Park", 263), other),
                        "light",
                        lookup);
        check(merged.size() == 2 && looked.isEmpty(), "No extra lookup or duplicate when found");
        check(
                merged.get(0).getString("title").equals("One More Light") && merged.get(1) == other,
                "Corrected match first, others unchanged");
        check(
                fresh.merge(Collections.emptyList(), "Linkin Park Heavy", lookup).isEmpty(),
                "Every query word must match the corrected name");
        check(
                fresh.merge(Collections.emptyList(), "", lookup).isEmpty(),
                "Empty query adds nothing");
        remote.clear();
        check(
                fresh.merge(Collections.emptyList(), "One More Light", lookup).isEmpty(),
                "A deleted or inaccessible message is skipped");
        fresh.remove("10_1");
        check(fresh.corrections().isEmpty(), "Removed");

        // Plays from other sources
        TrackNames history = new TrackNames(null);
        int before = history.revision();
        history.played("H1LdQntDnFY", "One More Light", "Linkin Park", 254);
        history.played("aaaaaaaaaaa", "One More Light (Live)", "Linkin Park", 300);
        history.played("bbbbbbbbbbb", "One More Light", "Someone Else", 254);
        history.played("ccccccccccc", "ONE more light!", "LINKIN PARK, Mike Shinoda", 254);
        history.played("ddddddddddd", "", "Linkin Park", 254);
        history.played("bad\nid", "One More Light", "Linkin Park", 254);
        check(history.revision() == before, "Recording plays doesn't refresh the settings page");
        check(
                history.playedAs("One More Light", "Linkin Park")
                        .equals(Arrays.asList("H1LdQntDnFY", "ccccccccccc")),
                "Same title words and a shared artist; versions and other artists excluded");
        check(history.playedAs("", "Linkin Park").isEmpty(), "Blank title matches nothing");
        history.played("H1LdQntDnFY", "One More Light", "Linkin Park", 254);
        check(
                history.playedAs("One More Light", "Linkin Park").size() == 2,
                "Playing again doesn't duplicate");
        for (int i = 0; i < TrackNames.MAX_PLAYS + 5; i++)
            history.played("id" + i, "Song " + i, "Artist", 100);
        check(history.playedAs("Song 0", "Artist").isEmpty(), "Only the most recent plays kept");
        check(
                history.playedAs("Song " + (TrackNames.MAX_PLAYS + 4), "Artist").size() == 1,
                "Newest play kept");
        history.consider("Song 1", "Artist", 100, Collections.emptyList());
        int changed = history.revision();
        history.correct(row("10_9", "Sng 7", "Artist", 100), "Song 7", "Artist");
        check(history.revision() > changed, "A correction refreshes the settings page");

        // Saved on disk
        File folder = Files.createTempDirectory("track-names").toFile();
        File file = new File(folder, "track-names.json");
        TrackNames saved = new TrackNames(file);
        saved.correct(
                row("10_1", "Ine More Light", "Linkin Park", 263), "One More Light", "Linkin Park");
        saved.consider("Heavvy", "Linkin Park", 171, chat);
        check(file.isFile(), "Written to disk");
        TrackNames reloaded = new TrackNames(file);
        check(
                reloaded.corrections().size() == 1
                        && reloaded.corrections()
                                .get(0)
                                .getString("title")
                                .equals("One More Light"),
                "Corrections survive a restart");
        check(reloaded.suggestions().size() == 1, "Suggestions survive a restart");
        saved.played("H1LdQntDnFY", "One More Light", "Linkin Park", 254);
        check(
                new TrackNames(file).playedAs("One More Light", "Linkin Park").size() == 1,
                "Recent plays survive a restart");
        TrackNames signedOut = new TrackNames(file);
        signedOut.clear();
        TrackNames afterSignOut = new TrackNames(file);
        check(
                afterSignOut.corrections().isEmpty()
                        && afterSignOut.playedAs("One More Light", "Linkin Park").isEmpty(),
                "Corrections and recent plays cleared on sign-out");
        Files.write(file.toPath(), "{not json".getBytes(StandardCharsets.UTF_8));
        check(new TrackNames(file).corrections().isEmpty(), "A damaged file starts empty");
        System.out.println(
                "PASS: " + checks + " track-name correction, suggestion and search checks.");
    }
}
