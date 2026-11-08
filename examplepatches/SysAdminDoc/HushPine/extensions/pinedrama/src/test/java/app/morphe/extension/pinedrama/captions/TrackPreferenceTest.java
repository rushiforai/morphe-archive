/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.captions;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.pinedrama.captions.TrackPreference.Subtitle;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.shared.Utils;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Issue #4, the choosing and the reading of the app's objects. Nothing changes while it's off. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class TrackPreferenceTest {
    private static final int STOCK = 77;
    private static final Subtitle ENGLISH_OWN = new Subtitle("en", 1, true);
    private static final Subtitle INDONESIAN = new Subtitle("id", 2, false);
    private static final Subtitle SPANISH = new Subtitle("es-419", 3, false);
    private static final List<Subtitle> TRACKS = List.of(INDONESIAN, ENGLISH_OWN, SPANISH);

    private enum Choice { OVERRIDE_TO_TRANSLATED, OVERRIDE_TO_ORIGINAL, NOT_OVERWRITTEN }

    // Field names match what the feed model's readers look for.
    public static final class Caption {
        final String languageCode;
        final int subId;
        final boolean isOriginalCaption;

        Caption(String languageCode, int subId, boolean isOriginalCaption) {
            this.languageCode = languageCode;
            this.subId = subId;
            this.isOriginalCaption = isOriginalCaption;
        }
    }

    public static final class Model {
        List<Caption> captionList = new ArrayList<>();
        List<String> duplicateLanguages = new ArrayList<>();
    }

    public static final class Video {
        Model captionModel = new Model();

        public Model getCaptionModel() {
            return captionModel;
        }
    }

    public static final class Tts {
        final String languageCode;

        Tts(String languageCode) {
            this.languageCode = languageCode;
        }
    }

    public static final class Audio {
        List<Tts> tts = new ArrayList<>();

        public List<Tts> getTtsInfos() {
            return tts;
        }
    }

    public static final class Translated {
        String languageCode;
        Object video;
    }

    public static final class Item {
        Video video = new Video();
        Audio audio = new Audio();
        Translated translated;
        String aid = "7681586082495925511";

        public String getAid() {
            return aid;
        }

        public Video getVideo() {
            return video;
        }

        public Audio getAudio() {
            return audio;
        }

        public Translated getTranslatedVideo() {
            return translated;
        }
    }

    private static Item itemWithCaptions() {
        Item item = new Item();
        item.video.captionModel.captionList.add(new Caption("id", 2, false));
        item.video.captionModel.captionList.add(new Caption("en", 1, true));
        return item;
    }

    private void clearSettings() {
        Settings.SUBTITLE_PRIORITY.save("");
        Settings.FORCE_SUBTITLE.save(false);
        Settings.FORCE_ORIGINAL_SUBTITLE.save(false);
        Settings.DUB_PRIORITY.save("");
        Settings.FORCE_DUB.save(false);
        Settings.FORCE_ORIGINAL_DUB.save(false);
        TrackPreference.captionSwitch(true);
        TrackPreference.forgetDubs();
    }

    @Before
    public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        clearSettings();
    }

    @After
    public void tearDown() {
        clearSettings();
    }

    private static List<String> list(String value) {
        return TrackPreference.parse(value);
    }

    @Test
    public void parseKeepsTheOrderAndTheWordOriginal() {
        assertEquals(List.of("en", "original", "es"), list(" EN, Original ,\nes-419,en"));
        assertEquals(List.of("pt"), list("pt_BR"));
        assertTrue(list("").isEmpty());
        assertTrue(list(null).isEmpty());
    }

    @Test
    public void priorityProblemNamesTheBadEntryAndAcceptsOriginal() {
        assertNull(TrackPreference.priorityProblem("en, original, es"));
        assertNull(TrackPreference.priorityProblem(""));
        assertNotNull(TrackPreference.priorityProblem("en, orginal"));
    }

    @Test
    public void pickTakesTheFirstThingTheVideoHas() {
        List<String> have = List.of("id", "en");
        assertEquals("id", TrackPreference.pick(list("fr, id, en"), have, null, false));
        assertNull(TrackPreference.pick(list("fr, de"), have, null, false));
    }

    @Test
    public void originalNeedsATrackAndTheVideosOwnLanguageMeansOriginal() {
        List<String> have = List.of("id", "en");
        assertNull(TrackPreference.pick(list("original"), have, null, false));
        assertEquals("id", TrackPreference.pick(list("original, id"), have, null, false));
        assertEquals(TrackPreference.ORIGINAL, TrackPreference.pick(list("original, id"), have, "en", true));
        assertEquals(TrackPreference.ORIGINAL, TrackPreference.pick(list("en"), have, "en", true));
    }

    @Test
    public void priorityAloneSwapsATrackButNeverTurnsOneOn() {
        assertEquals(2, TrackPreference.chooseSubtitle(TRACKS, list("id"), false, false, STOCK));
        assertEquals(TrackPreference.NONE,
                TrackPreference.chooseSubtitle(TRACKS, list("id"), false, false, TrackPreference.NONE));
    }

    @Test
    public void forceTurnsTheFirstListedTrackOn() {
        assertEquals(2, TrackPreference.chooseSubtitle(TRACKS, list("id, en"), true, false, TrackPreference.NONE));
        assertEquals(1, TrackPreference.chooseSubtitle(TRACKS, list("en, id"), true, false, STOCK));
        assertEquals(3, TrackPreference.chooseSubtitle(TRACKS, list("es"), true, false, STOCK));
    }

    @Test
    public void nothingOnTheListFallsBackToPineDramasPick() {
        assertEquals(STOCK, TrackPreference.chooseSubtitle(TRACKS, list("fr"), true, false, STOCK));
        assertEquals(TrackPreference.NONE,
                TrackPreference.chooseSubtitle(TRACKS, list("fr"), true, false, TrackPreference.NONE));
    }

    @Test
    public void forceWithNoListShowsWhatsThere() {
        assertEquals(1, TrackPreference.chooseSubtitle(TRACKS, list(""), true, false, TrackPreference.NONE));
        assertEquals(STOCK, TrackPreference.chooseSubtitle(TRACKS, list(""), true, false, STOCK));
        assertEquals(TrackPreference.NONE,
                TrackPreference.chooseSubtitle(List.of(), list(""), true, false, TrackPreference.NONE));
    }

    @Test
    public void forceOriginalBeatsTheListAndFallsBackWithoutOne() {
        assertEquals(1, TrackPreference.chooseSubtitle(TRACKS, list("id"), true, true, STOCK));
        assertEquals(STOCK, TrackPreference.chooseSubtitle(List.of(INDONESIAN), list("id"), false, true, STOCK));
    }

    @Test
    public void wouldShowFollowsTheForceThatsOn() {
        assertTrue(TrackPreference.wouldShow(TRACKS, list(""), true));
        assertFalse(TrackPreference.wouldShow(List.of(INDONESIAN), list(""), true));
        assertTrue(TrackPreference.wouldShow(TRACKS, list("id"), false));
        assertFalse(TrackPreference.wouldShow(TRACKS, list("fr"), false));
        assertFalse(TrackPreference.wouldShow(List.of(), list(""), false));
    }

    @Test
    public void theOverlayAsksForTheListedTrackInsteadOfTheAppsTwo() {
        Item item = itemWithCaptions();
        assertEquals("nothing set", 1, TrackPreference.overlaySubtitle(item, 1, Choice.NOT_OVERWRITTEN));

        Settings.SUBTITLE_PRIORITY.save("id");
        assertEquals(2, TrackPreference.overlaySubtitle(item, 1, Choice.NOT_OVERWRITTEN));
        assertEquals("the video's own button wins", 1,
                TrackPreference.overlaySubtitle(item, 1, Choice.OVERRIDE_TO_ORIGINAL));
    }

    @Test
    public void theOverlayNamesTheTrackItWasToldToLoad() {
        Item item = itemWithCaptions();
        assertEquals("id", TrackPreference.subtitleLanguage(item, 2));
        assertTrue(TrackPreference.subtitleTranslated(item, 2));
        assertFalse(TrackPreference.subtitleTranslated(item, 1));
        assertNull(TrackPreference.subtitleLanguage(item, 9));
    }

    @Test
    public void aTranslationTheListAskedForIsNotALeftover() {
        Item item = itemWithCaptions();
        assertTrue("nothing set, the app's verdict stands", TrackPreference.staleSubtitle(item, 2, true));

        Settings.SUBTITLE_PRIORITY.save("id");
        assertFalse(TrackPreference.staleSubtitle(item, 2, true));
        assertTrue("any other track still is", TrackPreference.staleSubtitle(item, 1, true));
        assertFalse("nothing to overrule", TrackPreference.staleSubtitle(item, 1, false));
        assertTrue("no track on screen yet", TrackPreference.staleSubtitle(item, null, true));
    }

    @Test
    public void listChoiceReadsTheOriginalThroughItsOwnLanguage() {
        assertTrue(TrackPreference.isListChoice(TRACKS, list("en"), 1));
        assertTrue(TrackPreference.isListChoice(TRACKS, list("original"), 1));
        assertFalse(TrackPreference.isListChoice(TRACKS, list("fr"), TrackPreference.NONE));
    }

    @Test
    public void onlyAChoiceMadeOnTheVideoCountsAsByHand() {
        assertTrue(TrackPreference.chosenByHand(Choice.OVERRIDE_TO_ORIGINAL));
        assertTrue(TrackPreference.chosenByHand(Choice.OVERRIDE_TO_TRANSLATED));
        assertFalse(TrackPreference.chosenByHand(Choice.NOT_OVERWRITTEN));
        assertFalse(TrackPreference.chosenByHand(null));
    }

    @Test
    public void everythingOffAnswersWhatTheAppAlreadyDecided() {
        Item item = itemWithCaptions();
        assertEquals(STOCK, TrackPreference.subtitleId(item, item.video.captionModel, STOCK, null));
        assertTrue(TrackPreference.captionsOn(item, true));
        assertFalse(TrackPreference.captionsOn(item, false));
        assertFalse(TrackPreference.originalStaysShown(item));
        assertEquals("id", TrackPreference.dubTarget(item, "id"));
        assertFalse(TrackPreference.dubForced(item));
        assertEquals("id", TrackPreference.dubLanguage(item, "id", null));
        assertFalse(TrackPreference.missingSubtitle(item));
        assertFalse(TrackPreference.missingDub(item));
    }

    @Test
    public void subtitleIdReadsTheModelAndHandChoiceWins() {
        Item item = itemWithCaptions();
        Settings.SUBTITLE_PRIORITY.save("id");
        Settings.FORCE_SUBTITLE.save(true);
        assertEquals(2, TrackPreference.subtitleId(item, item.video.captionModel, STOCK, Choice.NOT_OVERWRITTEN));
        assertEquals(STOCK, TrackPreference.subtitleId(item, item.video.captionModel, STOCK, Choice.OVERRIDE_TO_ORIGINAL));
    }

    @Test
    public void forceTurnsCaptionsOnUntilSomeoneTurnsThemOff() {
        Item item = itemWithCaptions();
        Settings.SUBTITLE_PRIORITY.save("id");
        assertFalse(TrackPreference.captionsOn(item, false));
        Settings.FORCE_SUBTITLE.save(true);
        assertTrue(TrackPreference.captionsOn(item, false));
        assertFalse(TrackPreference.captionsOn(new Item(), false));
        TrackPreference.captionSwitch(false);
        assertFalse(TrackPreference.captionsOn(item, false));
        TrackPreference.captionSwitch(true);
        assertTrue(TrackPreference.captionsOn(item, false));
    }

    @Test
    public void aListedForeignOriginalIsNotHidden() {
        Item item = itemWithCaptions();
        Settings.SUBTITLE_PRIORITY.save("en");
        assertTrue(TrackPreference.originalStaysShown(item));
        Settings.SUBTITLE_PRIORITY.save("id, en");
        assertFalse(TrackPreference.originalStaysShown(item));
        Settings.FORCE_ORIGINAL_SUBTITLE.save(true);
        assertTrue(TrackPreference.originalStaysShown(item));
    }

    @Test
    public void chooseDubAnswersTheExactCodeThePlayerCompares() {
        Map<String, String> dubs = Map.of("en", "en-US", "pt", "pt_BR");
        assertEquals("pt_BR", TrackPreference.chooseDub(list("pt"), dubs));
        assertEquals("en-US", TrackPreference.chooseDub(list("fr, en"), dubs));
        assertNull(TrackPreference.chooseDub(list("fr"), dubs));
        assertEquals(TrackPreference.ORIGINAL, TrackPreference.chooseDub(list("original, en"), dubs));
    }

    @Test
    public void aDubInTheLanguageTheCaptionsCallOriginalIsStillADub() {
        Map<String, String> dubs = Map.of("id", "id");
        assertEquals("id", TrackPreference.chooseDub(list("id"), dubs));
        assertEquals(TrackPreference.ORIGINAL, TrackPreference.chooseDub(list("original, id"), dubs));
    }

    /**
     * The shape every drama in an Indonesian feed had on the S22: one generated "id" caption
     * marked original and no dub track, while the video speaks Chinese. That caption isn't the
     * audio, so the video has no Indonesian dub to keep it or to force.
     */
    @Test
    public void aCaptionInTheListedLanguageIsNotADub() {
        Item item = new Item();
        item.video.captionModel.captionList.add(new Caption("id", 1, true));
        Settings.DUB_PRIORITY.save("id");
        assertTrue(TrackPreference.missingDub(item));
        assertEquals("the app's own pick stands", "id", TrackPreference.dubTarget(item, "id"));
        Settings.FORCE_DUB.save(true);
        assertFalse("nothing to force", TrackPreference.dubForced(item));
        assertFalse("the label isn't taken off", TrackPreference.dubLabelOff(item, null));

        item.audio.tts.add(new Tts("id"));
        assertFalse(TrackPreference.missingDub(item));
        assertTrue(TrackPreference.dubForced(item));
    }

    @Test
    public void dubTargetFollowsTheListAndEmptyMeansTheOriginal() {
        Item item = new Item();
        item.audio.tts.add(new Tts("en-US"));
        Settings.DUB_PRIORITY.save("en");
        assertEquals("en-US", TrackPreference.dubTarget(item, "id"));
        Settings.DUB_PRIORITY.save("original");
        assertEquals("", TrackPreference.dubTarget(item, "id"));
        Settings.DUB_PRIORITY.save("fr");
        assertEquals("id", TrackPreference.dubTarget(item, "id"));
        Settings.FORCE_ORIGINAL_DUB.save(true);
        assertEquals("", TrackPreference.dubTarget(item, "id"));
    }

    @Test
    public void onlyForceDubOverridesTheAppsDubbingSwitch() {
        Item item = new Item();
        item.audio.tts.add(new Tts("en-US"));
        Settings.DUB_PRIORITY.save("en");
        assertFalse(TrackPreference.dubForced(item));
        Settings.FORCE_DUB.save(true);
        assertTrue(TrackPreference.dubForced(item));
        Settings.DUB_PRIORITY.save("fr");
        assertFalse(TrackPreference.dubForced(item));
        Settings.DUB_PRIORITY.save("en");
        Settings.FORCE_ORIGINAL_DUB.save(true);
        assertFalse(TrackPreference.dubForced(item));
    }

    @Test
    public void settlingAPriorityDubNeverReplacesTheOriginalWithoutAForce() {
        assertEquals("en", TrackPreference.settleDubLanguage("id", "en", "en", false));
        assertEquals("id", TrackPreference.settleDubLanguage("id", "en", "en", true));
        assertEquals("id", TrackPreference.settleDubLanguage("id", "en", "es", false));
        assertEquals("es", TrackPreference.settleDubLanguage(null, "en", "es", true));
    }

    @Test
    public void theVideosOwnAudioNeverTellsThePlayerToSwitch() {
        assertNull(TrackPreference.settleDubLanguage(TrackPreference.ORIGINAL, "en", "es", false));
        assertNull(TrackPreference.settleDubLanguage(TrackPreference.ORIGINAL, null, "es", true));
        // The drama shape: the captions call "id" original and the dub is "id" too.
        assertNull(TrackPreference.settleDubLanguage(TrackPreference.ORIGINAL, "id", "id", true));
    }

    @Test
    public void dubLanguageLetsAHandChoiceWin() {
        Item item = itemWithCaptions();
        Settings.FORCE_ORIGINAL_DUB.save(true);
        assertNull(TrackPreference.dubLanguage(item, "id", null));
        assertEquals("id", TrackPreference.dubLanguage(item, "id", Choice.OVERRIDE_TO_TRANSLATED));
    }

    private static Item dubbed(String language) {
        Item item = itemWithCaptions();
        item.audio.tts.add(new Tts(language));
        return item;
    }

    private static Map<String, Integer> playerTracks() {
        Map<String, Integer> tracks = new HashMap<>();
        tracks.put("id", 4);
        return tracks;
    }

    @Test
    public void aSwitchDroppedBeforeThePlayerHasItsTracksLandsOnTheFirstAudioReport() {
        // Favorites > Posts on a cold start: the switch to "id" comes before the player has its
        // list, so the player starts on track 1 and only its first audio report can fix that.
        Item item = dubbed("id");
        Settings.DUB_PRIORITY.save("id");
        assertEquals("id", TrackPreference.dubLanguage(item, "id", null));
        Map<String, Integer> tracks = playerTracks();
        assertEquals(-1, TrackPreference.dubTrack(item.aid, tracks, 0, 1));
        assertEquals(4, TrackPreference.dubTrack(item.aid, tracks, TrackPreference.AUDIO, 1));
        // The engine's report for the dub, and a later "See original", are both left alone.
        assertEquals(-1, TrackPreference.dubTrack(item.aid, tracks, TrackPreference.AUDIO, 4));
        assertEquals(-1, TrackPreference.dubTrack(item.aid, tracks, TrackPreference.AUDIO, 1));
        // Opening the video again gets a new player with its own list.
        assertEquals(4, TrackPreference.dubTrack(item.aid, playerTracks(), TrackPreference.AUDIO, 1));
    }

    @Test
    public void thePlayerIsLeftAloneWhenNothingAskedForThatDub() {
        Item item = dubbed("id");
        Map<String, Integer> tracks = playerTracks();
        // Off: the switch isn't remembered.
        assertEquals("id", TrackPreference.dubLanguage(item, "id", null));
        assertEquals(-1, TrackPreference.dubTrack(item.aid, tracks, TrackPreference.AUDIO, 1));

        Settings.DUB_PRIORITY.save("id");
        assertEquals("id", TrackPreference.dubLanguage(item, "id", null));
        assertEquals(-1, TrackPreference.dubTrack("7701427349606108447", playerTracks(), TrackPreference.AUDIO, 1));
        assertEquals(-1, TrackPreference.dubTrack(item.aid, null, TrackPreference.AUDIO, 1));
        assertEquals(-1, TrackPreference.dubTrack(item.aid, new HashMap<>(), TrackPreference.AUDIO, 1));
        assertEquals(-1, TrackPreference.dubTrack(item.aid, playerTracks(), TrackPreference.AUDIO, 4));

        // A hand choice on the video wins over the remembered dub.
        assertEquals("id", TrackPreference.dubLanguage(item, "id", Choice.OVERRIDE_TO_ORIGINAL));
        assertEquals(-1, TrackPreference.dubTrack(item.aid, playerTracks(), TrackPreference.AUDIO, 1));

        // So does keeping the video's own audio.
        assertEquals("id", TrackPreference.dubLanguage(item, "id", null));
        Settings.FORCE_ORIGINAL_DUB.save(true);
        assertEquals(-1, TrackPreference.dubTrack(item.aid, playerTracks(), TrackPreference.AUDIO, 1));
    }

    @Test
    public void aDubSettledToTheAppsOwnPickIsNotRemembered() {
        // Nothing on the list for this video: the switch keeps the app's language and the player
        // isn't pushed to it later.
        Item item = dubbed("fr");
        Settings.DUB_PRIORITY.save("id");
        assertEquals("en", TrackPreference.dubLanguage(item, "en", null));
        Map<String, Integer> tracks = playerTracks();
        tracks.put("en", 5);
        assertEquals(-1, TrackPreference.dubTrack(item.aid, tracks, TrackPreference.AUDIO, 1));
    }

    @Test
    public void aSavedPostKeepsItsDubWhenTheDetailCopyListsNone() {
        // Favorites > Posts: the grid's copy lists the dub and the setup plays it, but the switch
        // comes from the detail page's copy, which lists no dubs and only knows the original.
        Settings.DUB_PRIORITY.save("id");
        Item detail = itemWithCaptions();
        assertEquals("en", TrackPreference.dubLanguage(detail, "en", null));

        assertEquals("id", TrackPreference.dubTarget(dubbed("id"), "id"));
        assertEquals("id", TrackPreference.dubLanguage(detail, "en", null));
        assertEquals(4, TrackPreference.dubTrack(detail.aid, playerTracks(), TrackPreference.AUDIO, 1));

        // Another video's copy gets nothing from it.
        Item other = itemWithCaptions();
        other.aid = "7701427349606108447";
        assertEquals("en", TrackPreference.dubLanguage(other, "en", null));
        // A copy that does list dubs settles on its own.
        assertEquals("en", TrackPreference.dubLanguage(dubbed("fr"), "en", null));
    }

    @Test
    public void aSetupThatListsNoDubsStillCountsTheAppsTargetFromTheList() {
        // What the S22 showed: the setup's copy lists no dubs either, and the app targets "id".
        Settings.DUB_PRIORITY.save("id");
        Item detail = itemWithCaptions();
        assertEquals("id", TrackPreference.dubTarget(detail, "id"));
        assertEquals("id", TrackPreference.dubLanguage(detail, "en", null));
        assertEquals(4, TrackPreference.dubTrack(detail.aid, playerTracks(), TrackPreference.AUDIO, 1));
    }

    @Test
    public void anAppTargetOffTheListOrInTheVideosOwnLanguageIsNotKept() {
        Settings.DUB_PRIORITY.save("fr");
        Item detail = itemWithCaptions();
        assertEquals("id", TrackPreference.dubTarget(detail, "id"));
        assertEquals("en", TrackPreference.dubLanguage(detail, "en", null));

        // English is this video's own audio, so an "en" target isn't a dub to keep.
        Settings.DUB_PRIORITY.save("en");
        assertEquals("en", TrackPreference.dubTarget(detail, "en"));
        assertEquals("en", TrackPreference.dubLanguage(detail, "en", null));
        Map<String, Integer> tracks = playerTracks();
        tracks.put("en", 5);
        assertEquals(-1, TrackPreference.dubTrack(detail.aid, tracks, TrackPreference.AUDIO, 4));
    }

    @Test
    public void aDetailCopyWithoutDubsStillYieldsToAHandChoiceAndTheOriginal() {
        Settings.DUB_PRIORITY.save("id");
        Item detail = itemWithCaptions();
        assertEquals("id", TrackPreference.dubTarget(dubbed("id"), "id"));
        assertEquals("en", TrackPreference.dubLanguage(detail, "en", Choice.OVERRIDE_TO_ORIGINAL));
        assertEquals(-1, TrackPreference.dubTrack(detail.aid, playerTracks(), TrackPreference.AUDIO, 1));

        Settings.FORCE_ORIGINAL_DUB.save(true);
        assertNull(TrackPreference.dubLanguage(detail, "en", null));
        assertEquals("", TrackPreference.dubTarget(dubbed("id"), "id"));
        Settings.FORCE_ORIGINAL_DUB.save(false);
        // The setup that kept the original forgot the dub, so the detail copy keeps it too.
        assertEquals("en", TrackPreference.dubLanguage(detail, "en", null));
    }

    @Test
    public void aSetupThatKeepsTheVideosOwnAudioLeavesTheDetailCopyAlone() {
        // The app was going to play the video's own language, and nothing forces a dub.
        Settings.DUB_PRIORITY.save("id");
        assertEquals("id", TrackPreference.dubTarget(dubbed("id"), "en"));
        assertEquals("en", TrackPreference.dubLanguage(itemWithCaptions(), "en", null));
        // Force dub plays it anyway, so the detail copy keeps it.
        Settings.FORCE_DUB.save(true);
        assertEquals("id", TrackPreference.dubTarget(dubbed("id"), "en"));
        assertEquals("id", TrackPreference.dubLanguage(itemWithCaptions(), "en", null));
    }

    @Test
    public void theDubLabelOnlyGoesOffWhereTheSettingsKeepTheVideosOwnAudio() {
        Item item = new Item();
        item.audio.tts.add(new Tts("en-US"));
        assertFalse(TrackPreference.dubLabelOff(item, null));
        Settings.DUB_PRIORITY.save("en");
        assertFalse(TrackPreference.dubLabelOff(item, null));
        Settings.DUB_PRIORITY.save("fr");
        assertFalse(TrackPreference.dubLabelOff(item, null));
        Settings.DUB_PRIORITY.save("original");
        assertTrue(TrackPreference.dubLabelOff(item, null));
        assertTrue(TrackPreference.dubLabelOff(item, Choice.NOT_OVERWRITTEN));
        Settings.DUB_PRIORITY.save("en");
        Settings.FORCE_ORIGINAL_DUB.save(true);
        assertTrue(TrackPreference.dubLabelOff(item, null));
    }

    @Test
    public void aHandChoiceKeepsTheDubLabelTheAppWouldShow() {
        Item item = new Item();
        item.audio.tts.add(new Tts("en-US"));
        Settings.FORCE_ORIGINAL_DUB.save(true);
        assertFalse(TrackPreference.dubLabelOff(item, Choice.OVERRIDE_TO_TRANSLATED));
        assertFalse(TrackPreference.dubLabelOff(item, Choice.OVERRIDE_TO_ORIGINAL));
    }

    @Test
    public void missingSubtitleCountsBurnedInTextAndTheOriginal() {
        Settings.SUBTITLE_PRIORITY.save("es");
        Item item = itemWithCaptions();
        assertTrue(TrackPreference.missingSubtitle(item));
        assertTrue(TrackPreference.missingSubtitle(new Item()));
        item.video.captionModel.duplicateLanguages.add("es");
        assertFalse(TrackPreference.missingSubtitle(item));
        Settings.SUBTITLE_PRIORITY.save("original");
        assertFalse(TrackPreference.missingSubtitle(itemWithCaptions()));
        assertTrue(TrackPreference.missingSubtitle(new Item()));
    }

    @Test
    public void missingDubReadsBothKindsOfDubAndOriginalKeepsEverything() {
        Settings.DUB_PRIORITY.save("es");
        Item none = new Item();
        assertTrue(TrackPreference.missingDub(none));
        Item tts = new Item();
        tts.audio.tts.add(new Tts("es"));
        assertFalse(TrackPreference.missingDub(tts));

        Item translated = new Item();
        translated.translated = new Translated();
        translated.translated.languageCode = "es";
        assertTrue("a translated video with no stream isn't a dub", TrackPreference.missingDub(translated));
        translated.translated.video = new Object();
        assertFalse(TrackPreference.missingDub(translated));

        Settings.DUB_PRIORITY.save("original");
        assertFalse(TrackPreference.missingDub(none));
    }
}
