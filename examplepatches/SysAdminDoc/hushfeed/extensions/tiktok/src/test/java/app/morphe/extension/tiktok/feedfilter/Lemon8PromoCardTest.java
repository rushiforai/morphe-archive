/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.feedfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The Lemon8 install promo card is an inserted card with CardInsertInfo card type 9, and none
 * of TikTok's ad flags. The Lynx Lemon8 card is a type 105 insert drawn by Lynx (impl type 2)
 * with card type 40, 105 or 114. Both leave with Remove feed ads, and a friend recommendation
 * card or any other insert stays.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class Lemon8PromoCardTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final AdsFilter filter = new AdsFilter();
    private boolean adsBefore;

    public static class Insert extends Aweme {
        Object cardInsertInfo;
        int awemeType;

        @Override public int getAwemeType() { return awemeType; }
        @Override public boolean isAd() { return false; }
        @Override public boolean isSoftAd() { return false; }
        @Override public boolean isWithPromotionalMusic() { return false; }
        @Override public com.ss.android.ugc.aweme.feed.model.AwemeRawAd getAwemeRawAd() { return null; }
        public Object getCardInsertInfo() { return cardInsertInfo; }
        public Object getAnchorsExtras() { return null; }
        public Object getContentModel() { return null; }
    }

    /** TikTok's CardInsertInfo, by its card type and how the card is drawn. */
    public static final class CardInsert {
        final int cardType;
        final int cardImplType;
        CardInsert(int cardType, int cardImplType) {
            this.cardType = cardType;
            this.cardImplType = cardImplType;
        }
        public int getCardType() { return cardType; }
        public int getCardImplType() { return cardImplType; }
    }

    @Before public void setUp() {
        adsBefore = Settings.REMOVE_ADS.get();
        FeedFilterCounters.clear();
    }

    @After public void tearDown() {
        PausedProcess.set(false);
        Settings.REMOVE_ADS.save(adsBefore);
        FeedFilterCounters.clear();
    }

    private static Insert insert(Integer type) {
        Insert item = new Insert();
        item.cardInsertInfo = type == null ? null : new CardInsert(type, 0);
        return item;
    }

    private static Insert lynxInsert(int awemeType, int cardType, int implType) {
        Insert item = new Insert();
        item.awemeType = awemeType;
        item.cardInsertInfo = new CardInsert(cardType, implType);
        return item;
    }

    @Test public void lynxLemon8CardIsDropped() {
        Settings.REMOVE_ADS.save(true);
        assertTrue("the daily dose card seen in For You", filter.getFiltered(lynxInsert(105, 40, 2)));
        assertTrue("a cached response's other type", filter.getFiltered(lynxInsert(105, 114, 2)));
        assertTrue("a live response's type", filter.getFiltered(lynxInsert(105, 105, 2)));
    }

    @Test public void lynxCardTypesStayOutsideALynxInsert() {
        Settings.REMOVE_ADS.save(true);
        assertFalse("a native card of the same type", filter.getFiltered(lynxInsert(105, 40, 1)));
        assertFalse("a video carrying the type", filter.getFiltered(lynxInsert(0, 40, 2)));
        assertFalse("another Lynx insert", filter.getFiltered(lynxInsert(105, 92, 2)));
    }

    @Test public void lemon8CardInsertIsDropped() {
        Settings.REMOVE_ADS.save(true);
        assertTrue(filter.getEnabled());
        assertTrue(filter.getFiltered(insert(AdsFilter.LEMON8_CARD_TYPE)));
        assertEquals(9, AdsFilter.LEMON8_CARD_TYPE);
    }

    @Test public void friendRecommendationAndOrdinaryInsertsStay() {
        Settings.REMOVE_ADS.save(true);
        assertFalse("a friend recommendation card", filter.getFiltered(insert(0)));
        assertFalse("another card type", filter.getFiltered(insert(92)));
        assertFalse("a video with no card info", filter.getFiltered(insert(null)));
    }

    @Test public void switchOffKeepsTheCardAndSkipsTheRequestGuard() {
        Settings.REMOVE_ADS.save(false);
        assertFalse(filter.getEnabled());
        assertFalse(CardFilters.shouldSkipLemon8PromoRequest());
    }

    @Test public void pausedHushfeedKeepsTheCard() {
        Settings.REMOVE_ADS.save(true);
        assertTrue(CardFilters.shouldSkipLemon8PromoRequest());
        PausedProcess.set(true);
        assertFalse(filter.getEnabled());
        assertFalse(CardFilters.shouldSkipLemon8PromoRequest());
    }

    @Test public void theRequestGuardFollowsRemoveFeedAds() {
        Settings.REMOVE_ADS.save(true);
        assertTrue(CardFilters.shouldSkipLemon8PromoRequest());
    }
}
