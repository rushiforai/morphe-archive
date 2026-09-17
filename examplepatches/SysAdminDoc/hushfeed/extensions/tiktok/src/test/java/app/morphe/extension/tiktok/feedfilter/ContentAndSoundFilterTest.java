package app.morphe.extension.tiktok.feedfilter;

import static org.junit.Assert.*;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import java.util.List;
import java.util.Locale;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class ContentAndSoundFilterTest {
    // Built in setup(), not in a field initializer: a field initializer runs before the first
    // @Before, so naming a Setting here loads the settings classes with no context behind them.
    // SharedPrefCategory then throws, and an ExceptionInInitializerError is permanent for the
    // whole fork, so every later class that touches a setting fails too. This class used to get
    // away with it only when some other class happened to run first and leave a context set.
    private IFilter[] markers;
    private BooleanSetting[] switches;

    @Before public void setup() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        markers = new IFilter[]{new ContentMarkerFilters.AiGeneratedFilter(),
                new ContentMarkerFilters.PaidPartnershipFilter(), new ContentMarkerFilters.SeriesFilter(),
                new ContentMarkerFilters.PlaylistFilter(), new ContentMarkerFilters.VerifiedFilter()};
        switches = new BooleanSetting[]{Settings.HIDE_AI_GENERATED, Settings.HIDE_PAID_PARTNERSHIP,
                Settings.HIDE_SERIES, Settings.HIDE_PLAYLIST_VIDEOS, Settings.HIDE_VERIFIED};
        for (BooleanSetting setting : switches) setting.save(false);
        Settings.HIDE_BLOCKED_SOUNDS.save(false);
        Settings.BLOCKED_SOUND_IDS.save("");
        Settings.BLOCKED_SOUND_NAMES.save("");
    }

    @Test public void eachMarkerHasAnIndependentSwitchAndMissingDataDoesNotMatch() {
        for (int selected = 0; selected < switches.length; selected++) {
            for (int i = 0; i < switches.length; i++) switches[i].save(i == selected);
            for (int i = 0; i < markers.length; i++) {
                assertEquals(i == selected, markers[i].getEnabled());
                assertFalse(markers[i].getFiltered(null));
                assertFalse(markers[i].getFiltered(new Aweme()));
                assertFalse(markers[i].getFiltered(new Item()));
            }
        }
    }

    @Test public void aiLabelsAndModerationMarkersMatchWithoutRejectingUnmarkedStructs() {
        Item item = new Item();
        item.aigcInfo = new Label(0);
        assertFalse(markers[0].getFiltered(item));
        item.aigcInfo = new Label(1);
        assertTrue(markers[0].getFiltered(item));
        item.aigcInfo = null;
        item.moderationAigcInfo = new Moderation(0, 0);
        assertFalse("a moderation struct with every field at zero is not an AI label",
                markers[0].getFiltered(item));
        item.moderationAigcInfo = new Moderation(2, 0);
        assertTrue(markers[0].getFiltered(item));
        item.moderationAigcInfo = new Moderation(0, 1);
        assertTrue(markers[0].getFiltered(item));
    }

    @Test public void partnershipRequiresAccountsOrAnActualCommerceSignal() {
        Item item = new Item();
        item.brandContentAccounts = List.of();
        item.commerceVideoAuthInfo = new Commerce(false);
        item.commercialVideoInfo = "  ";
        assertFalse(markers[1].getFiltered(item));
        item.brandContentAccounts = List.of("brand");
        assertTrue(markers[1].getFiltered(item));
        item.brandContentAccounts = List.of();
        item.commerceVideoAuthInfo = new Commerce(true);
        assertTrue(markers[1].getFiltered(item));
        item.commerceVideoAuthInfo = new Commerce(false);
        item.commercialVideoInfo = "paid partnership";
        assertTrue(markers[1].getFiltered(item));
    }

    @Test public void seriesAndPlaylistDoNotShareTheirSignals() {
        Item item = new Item();
        item.isPaidContent = true;
        assertTrue(markers[2].getFiltered(item));
        assertFalse(markers[3].getFiltered(item));
        item.isPaidContent = false;
        item.mPaidContentInfo = new PaidContent(4471L, "Night Shift", "1", false);
        assertTrue(markers[2].getFiltered(item));
        item.mPaidContentInfo = null;
        item.mixInfo = new Mix("mix-1", null);
        assertFalse(markers[2].getFiltered(item));
        assertTrue(markers[3].getFiltered(item));
    }

    /**
     * Issue #5: with Hide series on, nine of ten videos in a For You batch were removed as
     * SeriesFilter and the feed never loaded. TikTok hangs a PaidContentInfo on ordinary
     * recommended videos with its fields at defaults, so the struct being there meant nothing.
     * The same shape was in the playlist and AI filters.
     */
    @Test public void anEmptyStructIsNotAMarkerOnAnyOfTheThreeFiltersThatUsedPresence() {
        Item ordinary = new Item();
        ordinary.mPaidContentInfo = new PaidContent();
        ordinary.mixInfo = new Mix(null, null);
        ordinary.moderationAigcInfo = new Moderation(0, 0);
        assertFalse("an empty paid content struct removed the whole feed in issue #5",
                markers[2].getFiltered(ordinary));
        assertFalse("an empty mix struct is not a playlist", markers[3].getFiltered(ordinary));
        assertFalse("an empty moderation struct is not an AI label", markers[0].getFiltered(ordinary));

        // Blank is the same as absent: the strings TikTok sends are empty, not null.
        ordinary.mPaidContentInfo = new PaidContent(0L, "  ", " ", false);
        ordinary.mixInfo = new Mix("", "   ");
        assertFalse(markers[2].getFiltered(ordinary));
        assertFalse(markers[3].getFiltered(ordinary));

        // Each real signal on its own still matches.
        Item series = new Item();
        series.mPaidContentInfo = new PaidContent(9182736L, null, null, false);
        assertTrue("a paid collection id is a series", markers[2].getFiltered(series));
        series.mPaidContentInfo = new PaidContent(0L, "Night Shift", null, false);
        assertTrue("a collection name is a series", markers[2].getFiltered(series));
        series.mPaidContentInfo = new PaidContent(0L, null, "3", false);
        assertTrue("an episode number is a series", markers[2].getFiltered(series));
        series.mPaidContentInfo = new PaidContent(0L, null, null, true);
        assertTrue("a collection intro is a series", markers[2].getFiltered(series));

        Item playlist = new Item();
        playlist.mixInfo = new Mix(null, "Part 3 of my trip");
        assertTrue("a named mix is a playlist", markers[3].getFiltered(playlist));
    }

    @Test public void verifiedAccountsMatchNumericCustomAndEnterpriseMarkers() {
        Item item = new Item();
        Author author = new Author();
        item.author = author;
        assertFalse(markers[4].getFiltered(item));
        author.verificationType = 1;
        assertTrue(markers[4].getFiltered(item));
        author.verificationType = 0;
        author.customVerify = " creator ";
        assertTrue(markers[4].getFiltered(item));
        author.customVerify = " ";
        author.enterpriseVerifyReason = "business";
        assertTrue(markers[4].getFiltered(item));
        author.enterpriseVerifyReason = " ";
        assertFalse(markers[4].getFiltered(item));
    }

    @Test public void soundIdsAreExactAndNamesUseLocaleIndependentPhrases() {
        SoundFilter filter = new SoundFilter();
        Item item = new Item();
        Music music = new Music();
        item.music = music;
        Settings.HIDE_BLOCKED_SOUNDS.save(true);
        assertFalse(filter.getEnabled());
        Settings.BLOCKED_SOUND_IDS.save("123, 456");
        assertTrue(filter.getEnabled());
        music.mid = "1234";
        assertFalse(filter.getFiltered(item));
        music.mid = " 123 ";
        assertTrue(filter.getFiltered(item));
        music.mid = null;
        music.id = 456;
        assertTrue(filter.getFiltered(item));
        music.id = 0;
        music.title = "Original SOUND by somebody";
        Settings.BLOCKED_SOUND_NAMES.save(",, original sound, , unrelated");
        Locale previous = Locale.getDefault();
        try {
            Locale.setDefault(Locale.forLanguageTag("tr-TR"));
            assertTrue(filter.getFiltered(item));
        } finally { Locale.setDefault(previous); }
        music.title = "something else";
        assertFalse(filter.getFiltered(item));
        Settings.HIDE_BLOCKED_SOUNDS.save(false);
        assertFalse(filter.getEnabled());
        assertFalse(filter.getFiltered(null));
        assertFalse(filter.getFiltered(new Aweme()));
    }

    @Test public void getterAndFieldMusicShapesAgreeAndEditsTakeEffectOnNextRead() {
        SoundFilter filter = new SoundFilter();
        Aweme getterItem = new Aweme() { public Object getMusic() { return new Object() {
            public String getMusicId() { return "789"; }
            public String getMusicName() { return "Song"; }
        }; } };
        Settings.BLOCKED_SOUND_IDS.save("789");
        assertTrue(filter.getFiltered(getterItem));
        Settings.BLOCKED_SOUND_IDS.save("78");
        assertFalse(filter.getFiltered(getterItem));
        Settings.BLOCKED_SOUND_NAMES.save("SONG");
        assertTrue(filter.getFiltered(getterItem));
        Settings.BLOCKED_SOUND_NAMES.save(" ");
        assertFalse(filter.getFiltered(getterItem));
    }

    @Test public void soundIdentityUsesGetterThenFieldFallbacksAndExactEntries() {
        GetterMusic getter = new GetterMusic();
        assertEquals("789", SoundIdentity.idOf(getter));
        assertEquals("Song", SoundIdentity.nameOf(getter));
        assertEquals("Artist", SoundIdentity.authorOf(getter));

        Music fields = new Music();
        fields.id = 456;
        fields.title = "Field title";
        assertEquals("456", SoundIdentity.idOf(fields));
        assertEquals("Field title", SoundIdentity.nameOf(fields));
        assertEquals(List.of("one", "two"), SoundIdentity.entries(" one, ,two,, "));
        assertTrue(SoundIdentity.containsEntry("one,TWO", "two"));
        assertEquals("one,two", SoundIdentity.withEntry("one", "two"));
        assertEquals("one", SoundIdentity.withoutEntry("one,TWO", "two"));
    }

    private static final class Item extends Aweme {
        public Object aigcInfo, moderationAigcInfo, brandContentAccounts, commerceVideoAuthInfo;
        public String commercialVideoInfo;
        public boolean isPaidContent;
        public Object mPaidContentInfo, mixInfo, author, music;
    }
    private static final class Label {
        private final int value;
        Label(int value) { this.value = value; }
        public int getAIGCLabelType() { return value; }
    }
    private static final class Commerce {
        private final boolean value;
        Commerce(boolean value) { this.value = value; }
        public boolean isCommerce() { return value; }
    }
    /** TikTok's PaidContentInfo: attached to ordinary videos with everything at its default. */
    private static final class PaidContent {
        long paidCollectionId;
        String collectionName;
        String episodeNumber;
        boolean isPaidCollectionIntro;

        PaidContent() {
        }

        PaidContent(long paidCollectionId, String collectionName, String episodeNumber, boolean intro) {
            this.paidCollectionId = paidCollectionId;
            this.collectionName = collectionName;
            this.episodeNumber = episodeNumber;
            this.isPaidCollectionIntro = intro;
        }
    }

    /** TikTok's MixStruct, which is only a playlist when it has an identity. */
    private static final class Mix {
        String mixId;
        String mixName;

        Mix(String mixId, String mixName) {
            this.mixId = mixId;
            this.mixName = mixName;
        }
    }

    /** TikTok's ModerationAigcInfo, whose label types are zero on an unlabelled video. */
    private static final class Moderation {
        int moderationAigcLabelType;
        int moderationUserLabelStatus;

        Moderation(int labelType, int userLabelStatus) {
            this.moderationAigcLabelType = labelType;
            this.moderationUserLabelStatus = userLabelStatus;
        }
    }

    private static final class Author {
        public int verificationType;
        public String customVerify, enterpriseVerifyReason;
    }
    private static final class Music {
        public String mid, title;
        public long id;
    }
    private static final class GetterMusic {
        public String getMusicId() { return "789"; }
        public String getMusicName() { return "Song"; }
        public String getAuthorName() { return "Artist"; }
    }
}
