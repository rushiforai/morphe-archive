package app.morphe.extension.tiktok.live;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import com.bytedance.android.live.design.resource.theme.LiveThemeAwareDialogFragment;
import com.bytedance.android.live.design.resource.theme.LiveThemeAwareFragment;
import com.bytedance.android.live.design.view.sheet.LiveSheetFragment;
import com.bytedance.android.live.rank.impl.list.RankListDialog;
import com.bytedance.android.live.rank.impl.list.view.PopularityRankingEducationDialog;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.util.ReflectionHelpers;
import org.robolectric.util.ReflectionHelpers.ClassParameter;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * #159: a LIVE panel's views inflate through its own (dark) LIVE overlay, applied with force,
 * only while Dark LIVE panels is on and its context is in dark mode, and only for themed dialogs
 * and sheet pages. The daily ranking, its guide and every fragment under them inflate through the
 * light overlay TikTok's own answer gives the ranking, also with force, the ranking's plain list
 * fragments included, and over a room the switch darkened that overlay goes over the room's theme
 * as it was before the dark app theme, which the ranking's tab strip reads its colors through
 * too, and the rows LIVE's list binders make for a list there come from the list's own light
 * context, as does the info icon a list's bottom row tints. Everything else gets TikTok's
 * inflater back untouched.
 * Under the same conditions a LIVE room takes TikTok's dark app theme with force over its own light
 * one, so TikTok's generic sheets over a room open dark too, and the profile card's bio view takes
 * the link color, since its link is drawn in the view's own text color, and the card's labels
 * take their chip color as it shows over the light card their text and icon were picked for. The
 * card's event box, a white shape under text in the card theme's colors, takes a see-through light
 * fill once its text came out light, on its own copy of the shape.
 */
@RunWith(RobolectricTestRunner.class)
public class LivePanelThemeTest {
    private static final int OVERLAY = android.R.style.Theme_Light;

    /** A room's own fragment: it has an overlay too, but it isn't a panel. */
    public static final class RoomFragment {
        public int getThemeOverlay(Context context) {
            return OVERLAY;
        }
    }

    /** A dialog that extends the themed base, as LiveShareDialog does through LiveDialogFragment. */
    public static final class ShareDialog extends LiveThemeAwareDialogFragment {
    }

    private Context dark;
    private Context light;

    @Before public void setUp() {
        Context app = RuntimeEnvironment.getApplication();
        Utils.setContext(app);
        SettingsStatus.liveControlsEnabled = true;
        Configuration night = new Configuration(app.getResources().getConfiguration());
        night.uiMode = Configuration.UI_MODE_NIGHT_YES | Configuration.UI_MODE_TYPE_NORMAL;
        dark = new ContextThemeWrapper(app.createConfigurationContext(night), android.R.style.Theme_Black);
        Configuration day = new Configuration(night);
        day.uiMode = Configuration.UI_MODE_NIGHT_NO | Configuration.UI_MODE_TYPE_NORMAL;
        light = new ContextThemeWrapper(app.createConfigurationContext(day), android.R.style.Theme_Black);
    }

    @After public void tearDown() {
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        Settings.DARK_LIVE_PANELS.save(Settings.DARK_LIVE_PANELS.defaultValue);
        LivePanelTheme.stockSeen = false;
        // A Spark page asked with no activity looks for any darkened room, so none carries over.
        ReflectionHelpers.<Map<?, ?>>getStaticField(LivePanelTheme.class, "LIGHT_ROOMS").clear();
    }

    private static int textColor(Context context) {
        TypedValue value = new TypedValue();
        assertTrue(context.getTheme().resolveAttribute(android.R.attr.textColorPrimary, value, true));
        return value.resourceId != 0 ? value.resourceId : value.data;
    }

    private static ShareDialog dialog() {
        ShareDialog dialog = new ShareDialog();
        dialog.overlay = OVERLAY;
        return dialog;
    }

    @Test public void aPanelInflatesThroughItsOverlayWithForceInDarkModeWithTheSwitch() {
        LayoutInflater tiktok = LayoutInflater.from(dark);
        assertSame("the switch starts off", tiktok, LivePanelTheme.darkLivePanel(dialog(), tiktok));

        Settings.DARK_LIVE_PANELS.save(true);
        LayoutInflater wrapped = LivePanelTheme.darkLivePanel(dialog(), tiktok);
        assertNotSame(tiktok, wrapped);
        // The overlay wins over the context's own theme, the way TikTok's light wrap does.
        assertEquals(textColor(new ContextThemeWrapper(dark, OVERLAY)), textColor(wrapped.getContext()));
        assertTrue(textColor(dark) != textColor(wrapped.getContext()));

        LiveSheetFragment sheet = new LiveSheetFragment();
        sheet.overlay = OVERLAY;
        assertNotSame("a sheet page is a panel", tiktok, LivePanelTheme.darkLivePanel(sheet, tiktok));
    }

    @Test public void lightModeRoomFragmentsPauseAndMissingPiecesKeepTikToksInflater() {
        Settings.DARK_LIVE_PANELS.save(true);
        LayoutInflater day = LayoutInflater.from(light);
        assertSame("light mode", day, LivePanelTheme.darkLivePanel(dialog(), day));

        LayoutInflater tiktok = LayoutInflater.from(dark);
        assertSame("a room's own fragment", tiktok, LivePanelTheme.darkLivePanel(new RoomFragment(), tiktok));
        assertSame("no panel", tiktok, LivePanelTheme.darkLivePanel(null, tiktok));
        assertSame(null, LivePanelTheme.darkLivePanel(dialog(), null));
        ShareDialog none = new ShareDialog();
        assertSame("no overlay", tiktok, LivePanelTheme.darkLivePanel(none, tiktok));

        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        assertSame("paused", tiktok, LivePanelTheme.darkLivePanel(dialog(), tiktok));
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        assertSame("without the patch", tiktok, LivePanelTheme.darkLivePanel(dialog(), tiktok));
    }

    /** A LIVE room with a light theme of its own, the way LivePlayActivity builds one. */
    private static Activity room() {
        Activity room = Robolectric.buildActivity(Activity.class).create().get();
        room.setTheme(android.R.style.Theme_Light);
        return room;
    }

    @Test public void aRoomTakesTikToksDarkAppThemeInDarkModeWithTheSwitch() {
        RuntimeEnvironment.setQualifiers("+night");
        Activity room = room();
        int stock = textColor(room);
        LivePanelTheme.darkLiveRoom(room, android.R.style.Theme_Black);
        assertEquals("the switch starts off", stock, textColor(room));

        Settings.DARK_LIVE_PANELS.save(true);
        LivePanelTheme.darkLiveRoom(room, android.R.style.Theme_Black);
        // Applied with force, so it wins over the room's own light theme.
        assertEquals(textColor(new ContextThemeWrapper(RuntimeEnvironment.getApplication(), android.R.style.Theme_Black)), textColor(room));
        assertTrue(stock != textColor(room));
    }

    @Test public void lightModeAPauseAndNoKnownThemeLeaveTheRoomAlone() {
        Settings.DARK_LIVE_PANELS.save(true);
        RuntimeEnvironment.setQualifiers("+notnight");
        Activity day = room();
        int stock = textColor(day);
        LivePanelTheme.darkLiveRoom(day, android.R.style.Theme_Black);
        assertEquals("light mode", stock, textColor(day));

        RuntimeEnvironment.setQualifiers("+night");
        Activity night = room();
        stock = textColor(night);
        LivePanelTheme.darkLiveRoom(night);
        assertEquals("without the patch the dark app theme is unknown", stock, textColor(night));
        LivePanelTheme.darkLiveRoom(night, 0);
        assertEquals("no theme", stock, textColor(night));
        LivePanelTheme.darkLiveRoom(null);
        LivePanelTheme.darkLiveRoom(null, android.R.style.Theme_Black);

        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        LivePanelTheme.darkLiveRoom(night, android.R.style.Theme_Black);
        assertEquals("paused", stock, textColor(night));
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        LivePanelTheme.darkLiveRoom(night, android.R.style.Theme_Black);
        assertEquals("without the patch", stock, textColor(night));
    }

    /** A page fragment, the way the daily ranking's RankPageFragment sits in its view pager. */
    public static final class RankPage extends LiveThemeAwareFragment {
    }

    /** A plain androidx fragment under a page, the way the ranking's GiftListFragment holds its rows. */
    public static final class GiftList {
        Object parent;
        int asked;

        public Object getParentFragment() {
            asked++;
            return parent;
        }
    }

    private static final int DARK_OVERLAY = android.R.style.Theme_Black_NoTitleBar;

    /** The room the ranking opens over: in dark mode too, but not the inflater's own context. */
    private Context room;

    private <T extends LiveThemeAwareDialogFragment> T stock(T panel) {
        panel.overlay = DARK_OVERLAY;
        panel.lightOverlay = OVERLAY;
        if (room == null) {
            room = new ContextThemeWrapper(dark, android.R.style.Theme_Black);
        }
        panel.context = room;
        return panel;
    }

    private static RankPage page(Object parent) {
        RankPage page = new RankPage();
        page.parent = parent;
        return page;
    }

    @Test public void theDailyRankingKeepsTikToksLightLiveTheme() {
        LayoutInflater tiktok = LayoutInflater.from(dark);
        assertSame("the switch starts off", tiktok, LivePanelTheme.darkLivePanel(stock(new RankListDialog()), tiktok));

        Settings.DARK_LIVE_PANELS.save(true);
        int lightText = textColor(new ContextThemeWrapper(dark, OVERLAY));
        RankListDialog daily = stock(new RankListDialog());
        LayoutInflater ranking = LivePanelTheme.darkLivePanel(daily, tiktok);
        // TikTok's own answer picks the light overlay, which wins over the room's dark theme.
        assertNotSame(tiktok, ranking);
        assertEquals(lightText, textColor(ranking.getContext()));
        assertTrue(textColor(dark) != textColor(ranking.getContext()));
        assertSame("asked with the ranking's own context", room, daily.asked);
        assertTrue("the provider hook answers again afterwards", LiveControls.darkLivePanels(dark));
        assertEquals("its first-time guide", lightText,
            textColor(LivePanelTheme.darkLivePanel(stock(new PopularityRankingEducationDialog()), tiktok).getContext()));
        assertEquals("a ranking subclass", lightText,
            textColor(LivePanelTheme.darkLivePanel(stock(new HourlyRanking()), tiktok).getContext()));

        // Its pages take their inflater from the room, so they're found by their parent fragment,
        // and the ranking is what's asked.
        RankListDialog parent = stock(new RankListDialog());
        assertEquals("a ranking page", lightText,
            textColor(LivePanelTheme.darkLivePanel(page(parent), tiktok).getContext()));
        assertSame("the page asks its ranking", room, parent.asked);
        assertSame("a page under an ordinary panel", tiktok, LivePanelTheme.darkLivePanel(page(dialog()), tiktok));
        assertSame("a page on its own", tiktok, LivePanelTheme.darkLivePanel(page(null), tiktok));

        // A dialog opened from a ranking page is an ordinary panel and keeps its own overlay.
        ShareDialog share = dialog();
        share.overlay = DARK_OVERLAY;
        share.parent = page(stock(new RankListDialog()));
        assertEquals("a dialog over the ranking's pages keeps its dark overlay, not the ranking's light one",
            textColor(new ContextThemeWrapper(dark, DARK_OVERLAY)), textColor(LivePanelTheme.darkLivePanel(share, tiktok).getContext()));

        RankListDialog detached = stock(new RankListDialog());
        detached.context = null;
        assertEquals("no context of its own", lightText, textColor(LivePanelTheme.darkLivePanel(detached, tiktok).getContext()));
        assertSame("asks with the inflater's", dark, detached.asked);
        RankListDialog none = new RankListDialog();
        none.context = room;
        assertSame("no overlay", tiktok, LivePanelTheme.darkLivePanel(none, tiktok));
        RankListDialog outside = stock(new RankListDialog());
        outside.lightOverlay = DARK_OVERLAY;
        assertSame("TikTok answering dark itself keeps its inflater", tiktok, LivePanelTheme.darkLivePanel(outside, tiktok));
        LayoutInflater day = LayoutInflater.from(light);
        assertSame("light mode", day, LivePanelTheme.darkLivePanel(stock(new RankListDialog()), day));

        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        assertSame("paused", tiktok, LivePanelTheme.darkLivePanel(stock(new RankListDialog()), tiktok));
        assertSame("a page, paused", tiktok, LivePanelTheme.darkLivePanel(page(stock(new RankListDialog())), tiktok));
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        assertSame("without the patch", tiktok, LivePanelTheme.darkLivePanel(stock(new RankListDialog()), tiktok));
    }

    @Test public void aPlainFragmentUnderTheRankingTakesItsLightTheme() {
        LayoutInflater tiktok = LayoutInflater.from(dark);
        GiftList list = new GiftList();
        list.parent = page(stock(new RankListDialog()));
        assertSame("the switch starts off", tiktok, LivePanelTheme.darkLivePage(list, tiktok));

        Settings.DARK_LIVE_PANELS.save(true);
        // Every fragment in the app passes here, so none looks at its parents before a ranking inflated.
        LivePanelTheme.stockSeen = false;
        assertSame("before any ranking", tiktok, LivePanelTheme.darkLivePage(list, tiktok));
        assertEquals("no walk before any ranking", 0, list.asked);
        assertNotSame(tiktok, LivePanelTheme.darkLivePanel(stock(new RankListDialog()), tiktok));
        assertTrue("a ranking inflated", LivePanelTheme.stockSeen);
        // A plain fragment takes the room's inflater, so it's found by its parents too.
        LayoutInflater rows = LivePanelTheme.darkLivePage(list, tiktok);
        assertEquals(1, list.asked);
        assertNotSame(tiktok, rows);
        assertEquals(textColor(new ContextThemeWrapper(dark, OVERLAY)), textColor(rows.getContext()));
        GiftList direct = new GiftList();
        direct.parent = stock(new RankListDialog());
        assertNotSame("right under the ranking", tiktok, LivePanelTheme.darkLivePage(direct, tiktok));

        // LIVE's themed fragments and dialogs have their own hook, so this one leaves them alone.
        assertSame("a ranking page", tiktok, LivePanelTheme.darkLivePage(page(stock(new RankListDialog())), tiktok));
        assertSame("the ranking", tiktok, LivePanelTheme.darkLivePage(stock(new RankListDialog()), tiktok));
        assertSame("an ordinary panel", tiktok, LivePanelTheme.darkLivePage(dialog(), tiktok));

        GiftList elsewhere = new GiftList();
        assertSame("a fragment under no panel", tiktok, LivePanelTheme.darkLivePage(elsewhere, tiktok));
        elsewhere.parent = dialog();
        assertSame("a fragment under an ordinary panel", tiktok, LivePanelTheme.darkLivePage(elsewhere, tiktok));
        assertSame("a fragment without parents", tiktok, LivePanelTheme.darkLivePage(new RoomFragment(), tiktok));
        assertSame("no fragment", tiktok, LivePanelTheme.darkLivePage(null, tiktok));
        assertSame(null, LivePanelTheme.darkLivePage(list, null));
        LayoutInflater day = LayoutInflater.from(light);
        assertSame("light mode", day, LivePanelTheme.darkLivePage(list, day));

        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        assertSame("paused", tiktok, LivePanelTheme.darkLivePage(list, tiktok));
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        assertSame("without the patch", tiktok, LivePanelTheme.darkLivePage(list, tiktok));
    }

    /** Sets only the window animations, the way TikTok's light LIVE overlay leaves most of a theme alone. */
    private static final int PARTIAL_OVERLAY = android.R.style.Animation_Dialog;

    private static boolean hasOverlay(Context context) {
        return context.getTheme().resolveAttribute(android.R.attr.windowEnterAnimation, new TypedValue(), true);
    }

    @Test public void theRankingOverADarkenedRoomStartsFromTheRoomsLightTheme() {
        RuntimeEnvironment.setQualifiers("+night");
        Settings.DARK_LIVE_PANELS.save(true);
        Activity live = room();
        int roomText = textColor(live);
        assertTrue("the room has no window animation of its own", !hasOverlay(live));
        LivePanelTheme.darkLiveRoom(live, android.R.style.Theme_Black);
        assertTrue("the room went dark", roomText != textColor(live));
        // The room's setTheme can run again on the same activity; the copy from before the first pass stays.
        LivePanelTheme.darkLiveRoom(live, android.R.style.Theme_Black);

        RankListDialog daily = stock(new RankListDialog());
        daily.lightOverlay = PARTIAL_OVERLAY;
        daily.context = live;
        Context ranking = LivePanelTheme.darkLivePanel(daily, LayoutInflater.from(live)).getContext();
        assertTrue("the light overlay is on", hasOverlay(ranking));
        assertEquals("what the overlay leaves alone keeps the room's light value", roomText, textColor(ranking));
        assertTrue("the room itself stays dark", roomText != textColor(live));
        GiftList list = new GiftList();
        list.parent = page(daily);
        Context rows = LivePanelTheme.darkLivePage(list, LayoutInflater.from(live)).getContext();
        assertTrue(hasOverlay(rows));
        assertEquals("a list under the ranking too", roomText, textColor(rows));
        Context wrapped = LivePanelTheme.darkLivePanel(daily, LayoutInflater.from(new ContextThemeWrapper(live, OVERLAY))).getContext();
        assertEquals("found through a wrapped room context", roomText, textColor(wrapped));

        // An ordinary panel keeps the darkened room under its own overlay.
        ShareDialog share = dialog();
        share.overlay = PARTIAL_OVERLAY;
        assertEquals(textColor(live), textColor(LivePanelTheme.darkLivePanel(share, LayoutInflater.from(live)).getContext()));

        // A room the switch never darkened has nothing kept, so the overlay goes over its own theme.
        Activity other = room();
        assertSame(null, LivePanelTheme.lightRoom(other));
        assertSame(null, LivePanelTheme.lightRoom(RuntimeEnvironment.getApplication()));
        assertSame(null, LivePanelTheme.lightRoom(null));
        daily.context = other;
        Context plain = LivePanelTheme.darkLivePanel(daily, LayoutInflater.from(other)).getContext();
        assertTrue(hasOverlay(plain));
        assertEquals(textColor(other), textColor(plain));
    }

    /** Spark's SchemaBundle, the page schema's parsed query. */
    public static final class SchemaBundle {
        final Map<String, String> queries = new HashMap<>();
        String url;

        public Map<String, String> getAllQueries() {
            return queries;
        }

        public String getUrl() {
            return url;
        }
    }

    /** Spark's SparkContext, one page's schema. */
    public static final class SparkPage {
        public SchemaBundle schemaBundle;
        public String fullUrl;
    }

    /** The audience ranking popup's schema, as the emulator's heap held it (2026-10-23), cut down. */
    private static String rankingUrl(String buyers, String type) {
        return "sslocal://lynxview_popup?room_id=1&url=https%3A%2F%2Fexample%2Faudience_rank.js&width=360"
                + "&can_show_top_buyers_rank=" + buyers + "&entrance_rank_type=" + type + "&show_anchor_header=0";
    }

    private static SparkPage ranking(boolean buyers) {
        SparkPage page = new SparkPage();
        page.schemaBundle = new SchemaBundle();
        page.schemaBundle.queries.put("can_show_top_buyers_rank", buyers ? "1" : "0");
        page.fullUrl = rankingUrl(buyers ? "1" : "0", buyers ? "top_buyers" : "top_viewers");
        return page;
    }

    @Test public void onlyTheShopRankingOverADarkenedRoomKeepsSparksLightTheme() {
        RuntimeEnvironment.setQualifiers("+night");
        Activity live = room();
        SparkPage buyers = ranking(true);
        assertTrue("the switch starts off", !LivePanelTheme.sparkKeepsStock(buyers, live));
        Settings.DARK_LIVE_PANELS.save(true);
        assertTrue("a room the switch never darkened", !LivePanelTheme.sparkKeepsStock(buyers, live));
        LivePanelTheme.darkLiveRoom(live, android.R.style.Theme_Black);

        assertTrue("the shop ranking", LivePanelTheme.sparkKeepsStock(buyers, live));
        assertTrue("found through a popup's own wrapper",
                LivePanelTheme.sparkKeepsStock(buyers, new ContextThemeWrapper(live, OVERLAY)));
        assertTrue("asked with no activity, the darkened room", LivePanelTheme.sparkKeepsStock(buyers, null));
        assertTrue("asked with no activity, the darkened room", LivePanelTheme.sparkKeepsStock(buyers, dark));
        assertTrue("the plain viewer ranking reads dark", !LivePanelTheme.sparkKeepsStock(ranking(false), live));
        assertTrue("another Spark page reads dark", !LivePanelTheme.sparkKeepsStock(new SparkPage(), live));
        assertTrue("no page", !LivePanelTheme.sparkKeepsStock(null, live));
        assertTrue("another room the switch never darkened", !LivePanelTheme.sparkKeepsStock(buyers, room()));

        // The schema's parsed query wins; the page's URLs answer when it has none.
        SparkPage parsed = ranking(false);
        parsed.fullUrl = rankingUrl("1", "top_buyers");
        assertTrue("the parsed query says viewers", !LivePanelTheme.sparkKeepsStock(parsed, live));
        SparkPage url = ranking(true);
        url.schemaBundle.queries.clear();
        assertTrue("the page's full URL", LivePanelTheme.sparkKeepsStock(url, live));
        url.fullUrl = null;
        url.schemaBundle.url = rankingUrl("1", "top_buyers");
        assertTrue("the schema's URL", LivePanelTheme.sparkKeepsStock(url, live));
        url.schemaBundle.url = rankingUrl("10", "top_buyers");
        assertTrue("only the whole value", !LivePanelTheme.sparkKeepsStock(url, live));

        Settings.DARK_LIVE_PANELS.save(false);
        assertTrue("the switch off", !LivePanelTheme.sparkKeepsStock(buyers, live));
        Settings.DARK_LIVE_PANELS.save(true);
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        assertTrue("paused", !LivePanelTheme.sparkKeepsStock(buyers, live));
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        assertTrue("without the patch", !LivePanelTheme.sparkKeepsStock(buyers, live));
    }

    @Test public void theRankingsTabsReadTheirColorsThroughItsLightTheme() {
        RuntimeEnvironment.setQualifiers("+night");
        Activity live = room();
        int roomText = textColor(live);
        RankListDialog daily = stock(new RankListDialog());
        daily.lightOverlay = PARTIAL_OVERLAY;
        daily.context = live;
        RankPage page = page(daily);

        Settings.DARK_LIVE_PANELS.save(true);
        LivePanelTheme.darkLiveRoom(live, android.R.style.Theme_Black);
        assertTrue("the room went dark", roomText != textColor(live));
        assertSame("before any ranking inflated", live, LivePanelTheme.stockContext(page, live));
        LivePanelTheme.darkLivePanel(daily, LayoutInflater.from(live));
        Settings.DARK_LIVE_PANELS.save(false);
        assertSame("the switch off", live, LivePanelTheme.stockContext(page, live));
        Settings.DARK_LIVE_PANELS.save(true);
        // The tab strip hands over the page's getContext(), the room; before the page has a view
        // its tabs get the ranking's light overlay over the room's light theme.
        Context tabs = LivePanelTheme.stockContext(page, live);
        assertTrue("the light overlay is on", hasOverlay(tabs));
        assertEquals("the tabs' colors resolve to the room's light values", roomText, textColor(tabs));
        assertTrue("the room itself stays dark", roomText != textColor(live));
        // Once it has one, the context its views inflated with.
        Context inflated = LivePanelTheme.darkLivePanel(page, LayoutInflater.from(live)).getContext();
        page.view = new View(inflated);
        assertSame(inflated, LivePanelTheme.stockContext(page, live));

        // Outside a room TikTok's own answer is already dark: no light overlay to put back, so even
        // a page with a view keeps the context it handed over.
        RankListDialog outside = stock(new RankListDialog());
        outside.lightOverlay = DARK_OVERLAY;
        RankPage outsidePage = page(outside);
        outsidePage.view = new View(new ContextThemeWrapper(live, OVERLAY));
        assertSame("TikTok answering dark itself", live, LivePanelTheme.stockContext(outsidePage, live));

        RankPage elsewhere = page(dialog());
        elsewhere.view = new View(live);
        assertSame("a page under an ordinary panel", live, LivePanelTheme.stockContext(elsewhere, live));
        assertSame("a page on its own", live, LivePanelTheme.stockContext(page(null), live));
        assertSame("no page", live, LivePanelTheme.stockContext(null, live));
        assertSame("no context", null, LivePanelTheme.stockContext(page, null));
        assertSame("light mode", light, LivePanelTheme.stockContext(page, light));

        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        assertSame("paused", live, LivePanelTheme.stockContext(page, live));
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        assertSame("without the patch", live, LivePanelTheme.stockContext(page, live));
    }

    @Test public void aListUnderTheRankingMakesItsRowsThroughItsLightTheme() {
        RuntimeEnvironment.setQualifiers("+night");
        Activity live = room();
        int roomText = textColor(live);
        RankListDialog daily = stock(new RankListDialog());
        daily.lightOverlay = PARTIAL_OVERLAY;
        daily.context = live;
        GiftList list = new GiftList();
        list.parent = page(daily);
        int layout = android.R.layout.simple_list_item_1;

        Settings.DARK_LIVE_PANELS.save(true);
        LivePanelTheme.darkLiveRoom(live, android.R.style.Theme_Black);
        assertNull("before any ranking inflated", LivePanelTheme.stockRow(new FrameLayout(live), layout, Boolean.FALSE));
        LivePanelTheme.darkLivePanel(daily, LayoutInflater.from(live));
        // The list's own view inflated through its fragment's light inflater, so it carries that context.
        Context rows = LivePanelTheme.darkLivePage(list, LayoutInflater.from(live)).getContext();
        ViewGroup recycler = new FrameLayout(rows);
        View row = LivePanelTheme.stockRow(recycler, layout, Boolean.FALSE);
        assertSame("inflated through the list's own context", rows, row.getContext());
        assertEquals("the row's colors resolve to the room's light values", roomText, textColor(row.getContext()));
        assertTrue("the room itself stays dark", roomText != textColor(live));
        assertNull("left for the binder's holder call to place", row.getParent());
        assertNotNull("a list context a view wrapped in its own theme",
            LivePanelTheme.stockRow(new FrameLayout(new ContextThemeWrapper(rows, OVERLAY)), layout, Boolean.FALSE));
        assertNotNull("no attach flag", LivePanelTheme.stockRow(recycler, layout, null));
        // A room the switch never darkened keeps no light theme, so its ranking takes the overlay alone, still stock.
        Activity plainRoom = room();
        RankListDialog plain = stock(new RankListDialog());
        plain.lightOverlay = PARTIAL_OVERLAY;
        plain.context = plainRoom;
        GiftList plainList = new GiftList();
        plainList.parent = page(plain);
        LivePanelTheme.darkLivePanel(plain, LayoutInflater.from(plainRoom));
        Context plainRows = LivePanelTheme.darkLivePage(plainList, LayoutInflater.from(plainRoom)).getContext();
        assertNotNull("a ranking over a room the switch never darkened",
            LivePanelTheme.stockRow(new FrameLayout(plainRows), layout, Boolean.FALSE));

        // Every other row is TikTok's.
        assertNull("a row TikTok attaches as it inflates", LivePanelTheme.stockRow(recycler, layout, Boolean.TRUE));
        assertNull("a list in the room", LivePanelTheme.stockRow(new FrameLayout(live), layout, Boolean.FALSE));
        ShareDialog share = dialog();
        share.overlay = PARTIAL_OVERLAY;
        Context panel = LivePanelTheme.darkLivePanel(share, LayoutInflater.from(live)).getContext();
        assertNull("a list in an ordinary panel", LivePanelTheme.stockRow(new FrameLayout(panel), layout, Boolean.FALSE));
        assertNull("no list", LivePanelTheme.stockRow(null, layout, Boolean.FALSE));
        assertNull("no layout", LivePanelTheme.stockRow(recycler, 0, Boolean.FALSE));
        assertNull("a layout that doesn't inflate", LivePanelTheme.stockRow(recycler, -1, Boolean.FALSE));
        assertNull("light mode", LivePanelTheme.stockRow(new FrameLayout(new LivePanelTheme.StockContext(light, OVERLAY)), layout, Boolean.FALSE));
        Settings.DARK_LIVE_PANELS.save(false);
        assertNull("the switch off", LivePanelTheme.stockRow(recycler, layout, Boolean.FALSE));
        Settings.DARK_LIVE_PANELS.save(true);

        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        assertNull("paused", LivePanelTheme.stockRow(recycler, layout, Boolean.FALSE));
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        assertNull("without the patch", LivePanelTheme.stockRow(recycler, layout, Boolean.FALSE));
    }

    @Test public void aListsBottomRowTintsItsInfoIconThroughTheRowsLightTheme() {
        RuntimeEnvironment.setQualifiers("+night");
        Activity live = room();
        int roomText = textColor(live);
        RankListDialog daily = stock(new RankListDialog());
        daily.lightOverlay = PARTIAL_OVERLAY;
        daily.context = live;
        GiftList list = new GiftList();
        list.parent = page(daily);

        Settings.DARK_LIVE_PANELS.save(true);
        LivePanelTheme.darkLiveRoom(live, android.R.style.Theme_Black);
        TextView early = new TextView(new LivePanelTheme.StockContext(live, OVERLAY));
        assertSame("before any ranking inflated", live, LivePanelTheme.stockViewContext(early, live));
        LivePanelTheme.darkLivePanel(daily, LayoutInflater.from(live));
        // The bar's text inflated with the list's own view, through its fragment's light inflater.
        Context bar = LivePanelTheme.darkLivePage(list, LayoutInflater.from(live)).getContext();
        TextView gap = new TextView(bar);
        Context icon = LivePanelTheme.stockViewContext(gap, live);
        assertSame("the row's own context", gap.getContext(), icon);
        assertEquals("the icon's tint resolves to the room's light value", roomText, textColor(icon));
        assertTrue("the room itself stays dark", roomText != textColor(live));
        TextView wrapped = new TextView(new ContextThemeWrapper(bar, OVERLAY));
        assertSame("a row a view wrapped in its own theme", wrapped.getContext(), LivePanelTheme.stockViewContext(wrapped, live));

        // Every other row keeps the context it handed over.
        assertSame("a row in the room", live, LivePanelTheme.stockViewContext(new TextView(live), live));
        ShareDialog share = dialog();
        share.overlay = PARTIAL_OVERLAY;
        Context panel = LivePanelTheme.darkLivePanel(share, LayoutInflater.from(live)).getContext();
        assertSame("a row in an ordinary panel", live, LivePanelTheme.stockViewContext(new TextView(panel), live));
        assertSame("no row", live, LivePanelTheme.stockViewContext(null, live));
        ReflectionHelpers.setStaticField(LivePanelTheme.class, "viewContextFailureLogged", false);
        assertSame("a row text that isn't a view", live, LivePanelTheme.stockViewContext("99+", live));
        assertTrue("turned away, not caught", !(boolean) ReflectionHelpers.getStaticField(LivePanelTheme.class, "viewContextFailureLogged"));
        assertNull("no context", LivePanelTheme.stockViewContext(gap, null));
        assertSame("light mode", light, LivePanelTheme.stockViewContext(new TextView(new LivePanelTheme.StockContext(light, OVERLAY)), light));
        Settings.DARK_LIVE_PANELS.save(false);
        assertSame("the switch off", live, LivePanelTheme.stockViewContext(gap, live));
        Settings.DARK_LIVE_PANELS.save(true);

        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        assertSame("paused", live, LivePanelTheme.stockViewContext(gap, live));
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        assertSame("without the patch", live, LivePanelTheme.stockViewContext(gap, live));
    }

    @Test public void aBiosViewTakesTheLinkColorInDarkModeWithTheSwitch() {
        int link = 0xe6ffffff;
        TextView bio = new TextView(dark);
        bio.setTextColor(Color.BLACK);
        LivePanelTheme.bioLinkColor(link, bio);
        assertEquals("the switch starts off", Color.BLACK, bio.getCurrentTextColor());

        Settings.DARK_LIVE_PANELS.save(true);
        LivePanelTheme.bioLinkColor(link, bio);
        assertEquals(link, bio.getCurrentTextColor());

        TextView lightBio = new TextView(light);
        lightBio.setTextColor(Color.BLACK);
        LivePanelTheme.bioLinkColor(link, lightBio);
        assertEquals("light mode", Color.BLACK, lightBio.getCurrentTextColor());
        LivePanelTheme.bioLinkColor(link, "bio");
        LivePanelTheme.bioLinkColor(link, null);

        TextView paused = new TextView(dark);
        paused.setTextColor(Color.BLACK);
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        LivePanelTheme.bioLinkColor(link, paused);
        assertEquals("paused", Color.BLACK, paused.getCurrentTextColor());
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        LivePanelTheme.bioLinkColor(link, paused);
        assertEquals("without the patch", Color.BLACK, paused.getCurrentTextColor());
    }

    /** ProfileCardLabel's shape and simple name: the background the extension colors. */
    static final class ProfileCardLabel {
        private LabelBackground background;

        ProfileCardLabel(LabelBackground background) {
            this.background = background;
        }
    }

    /** Some other model with the same shape, which the extension leaves alone. */
    static final class Sticker {
        private LabelBackground background;

        Sticker(LabelBackground background) {
            this.background = background;
        }
    }

    /** LabelBackground's shape, made by the extension through its no-argument constructor. */
    static final class LabelBackground {
        private String colorCode;
        private Object image;

        private LabelBackground() {
        }

        static LabelBackground of(String colorCode) {
            LabelBackground background = new LabelBackground();
            background.colorCode = colorCode;
            return background;
        }
    }

    /** A label whose background is static, which a write would set for every label at once. */
    static final class SharedLabel {
        static LabelBackground background;
    }

    /** A background whose color is static. */
    static final class SharedColor {
        static String colorCode = "#0A161823";
    }

    static final class SharedColorLabel {
        private final SharedColor background = new SharedColor();
    }

    @Test public void aLabelsStaticFieldsAreLeftAlone() throws Exception {
        LivePanelTheme.lightLabel(new SharedLabel());
        assertNull("a static background was made", SharedLabel.background);
        LivePanelTheme.lightLabel(new SharedColorLabel());
        assertEquals("a static color was written", "#0A161823", SharedColor.colorCode);
    }

    @Test public void aCardsLabelsTakeTheirColorAsItShowsOverTheLightCardInDarkModeWithTheSwitch() {
        View strip = new View(dark);
        ProfileCardLabel faint = new ProfileCardLabel(LabelBackground.of("#0A161823"));
        LivePanelTheme.cardLabels(Arrays.asList(faint), strip);
        assertEquals("the switch starts off", "#0A161823", faint.background.colorCode);

        Settings.DARK_LIVE_PANELS.save(true);
        ProfileCardLabel opaque = new ProfileCardLabel(LabelBackground.of("#2A2A2A"));
        ProfileCardLabel none = new ProfileCardLabel(LabelBackground.of(null));
        ProfileCardLabel empty = new ProfileCardLabel(LabelBackground.of(""));
        ProfileCardLabel unreadable = new ProfileCardLabel(LabelBackground.of("nope"));
        ProfileCardLabel pictured = new ProfileCardLabel(LabelBackground.of("#0A161823"));
        pictured.background.image = new Object();
        ProfileCardLabel bare = new ProfileCardLabel(null);
        Sticker sticker = new Sticker(LabelBackground.of("#0A161823"));
        LivePanelTheme.cardLabels(Arrays.asList(faint, null, opaque, none, empty, unreadable, pictured, bare, sticker), strip);
        assertEquals("over white", "#FFF5F5F6", faint.background.colorCode);
        assertEquals("#FF2A2A2A", opaque.background.colorCode);
        assertEquals("TikTok's default over white", "#FFF1F1F2", none.background.colorCode);
        assertEquals("#FFF1F1F2", empty.background.colorCode);
        assertEquals("#FFF1F1F2", unreadable.background.colorCode);
        assertEquals("an image stays", "#0A161823", pictured.background.colorCode);
        assertEquals("a label without one gets one", "#FFF1F1F2", bare.background.colorCode);
        assertEquals("not a card label", "#0A161823", sticker.background.colorCode);
        LivePanelTheme.cardLabels(Arrays.asList(faint), strip);
        assertEquals("twice is the same", "#FFF5F5F6", faint.background.colorCode);

        ProfileCardLabel lightLabel = new ProfileCardLabel(LabelBackground.of("#0A161823"));
        LivePanelTheme.cardLabels(Arrays.asList(lightLabel), new View(light));
        assertEquals("light mode", "#0A161823", lightLabel.background.colorCode);
        LivePanelTheme.cardLabels(Arrays.asList(lightLabel), "strip");
        LivePanelTheme.cardLabels(Arrays.asList(lightLabel), null);
        LivePanelTheme.cardLabels(lightLabel, strip);
        LivePanelTheme.cardLabels(null, strip);
        LivePanelTheme.cardLabels(Arrays.asList("label", 7), strip);
        assertEquals("#0A161823", lightLabel.background.colorCode);

        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        LivePanelTheme.cardLabels(Arrays.asList(lightLabel), strip);
        assertEquals("paused", "#0A161823", lightLabel.background.colorCode);
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        LivePanelTheme.cardLabels(Arrays.asList(lightLabel), strip);
        assertEquals("without the patch", "#0A161823", lightLabel.background.colorCode);
    }

    /** The event module's box: a shape drawn from the given state around a title in the given color. */
    private static ViewGroup eventBox(Context context, int textColor, Drawable.ConstantState shape) {
        FrameLayout box = new FrameLayout(context);
        box.setBackground(shape.newDrawable());
        TextView title = new TextView(context);
        title.setTextColor(textColor);
        box.addView(title);
        return box;
    }

    private static int fill(View box) {
        return ((GradientDrawable) box.getBackground()).getColor().getDefaultColor();
    }

    @Test public void aCardsEventBoxTakesALightFillWhenItsTextCameOutLightInDarkModeWithTheSwitch() {
        GradientDrawable white = new GradientDrawable();
        white.setColor(Color.WHITE);
        white.setCornerRadius(16f);
        Drawable.ConstantState shape = white.getConstantState();
        ViewGroup box = eventBox(dark, 0xFFF6F6F6, shape);
        LivePanelTheme.eventBox(box);
        assertEquals("the switch starts off", Color.WHITE, fill(box));

        Settings.DARK_LIVE_PANELS.save(true);
        ViewGroup other = eventBox(dark, Color.BLACK, shape);
        LivePanelTheme.eventBox(box);
        assertEquals(0x29FFFFFF, fill(box));
        assertEquals("the corners stay", 16f, ((GradientDrawable) box.getBackground()).getCornerRadius(), 0f);
        assertEquals("the shared shape stays white", Color.WHITE, fill(other));
        LivePanelTheme.eventBox(box);
        assertEquals("twice is the same", 0x29FFFFFF, fill(box));
        LivePanelTheme.eventBox(other);
        assertEquals("dark text keeps its white", Color.WHITE, fill(other));

        ViewGroup nested = new FrameLayout(dark);
        nested.setBackground(shape.newDrawable());
        nested.addView(eventBox(dark, Color.WHITE, shape));
        LivePanelTheme.eventBox(nested);
        assertEquals("text a level down", 0x29FFFFFF, fill(nested));

        ViewGroup lightBox = eventBox(light, Color.WHITE, shape);
        LivePanelTheme.eventBox(lightBox);
        assertEquals("light mode", Color.WHITE, fill(lightBox));
        ViewGroup plain = new FrameLayout(dark);
        plain.setBackgroundColor(Color.WHITE);
        TextView plainTitle = new TextView(dark);
        plainTitle.setTextColor(Color.WHITE);
        plain.addView(plainTitle);
        LivePanelTheme.eventBox(plain);
        assertEquals("not a shape", Color.WHITE, ((ColorDrawable) plain.getBackground()).getColor());
        LivePanelTheme.eventBox(new TextView(dark));
        LivePanelTheme.eventBox("box");
        LivePanelTheme.eventBox(null);

        ViewGroup paused = eventBox(dark, Color.WHITE, shape);
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        LivePanelTheme.eventBox(paused);
        assertEquals("paused", Color.WHITE, fill(paused));
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        LivePanelTheme.eventBox(paused);
        assertEquals("without the patch", Color.WHITE, fill(paused));
    }

    @Test public void aCardsBadgeTileGoesOverAWhiteCopyOfItsShapeInDarkModeWithTheSwitch() {
        // The low levels' tile on 47.4.3: a pale lavender at about a fifth of full strength.
        GradientDrawable tint = new GradientDrawable();
        tint.setColor(0x30CCD1F0);
        tint.setCornerRadius(16f);
        tint.setStroke(1, Color.RED);
        View tile = new View(dark);
        LivePanelTheme.badgeTile(tile, tint);
        assertSame("the switch starts off", tint, tile.getBackground());

        Settings.DARK_LIVE_PANELS.save(true);
        LivePanelTheme.badgeTile(tile, tint);
        LayerDrawable layers = (LayerDrawable) tile.getBackground();
        assertEquals(2, layers.getNumberOfLayers());
        assertEquals("the shape's padding counts once", LayerDrawable.PADDING_MODE_STACK, layers.getPaddingMode());
        GradientDrawable base = (GradientDrawable) layers.getDrawable(0);
        assertEquals(Color.WHITE, base.getColor().getDefaultColor());
        assertEquals("the corners stay", 16f, base.getCornerRadius(), 0f);
        assertSame("the server's shape draws over it", tint, layers.getDrawable(1));
        assertEquals("the tile's own shape keeps its fill", 0x30CCD1F0, tint.getColor().getDefaultColor());

        View lightTile = new View(light);
        LivePanelTheme.badgeTile(lightTile, tint);
        assertSame("light mode", tint, lightTile.getBackground());
        ColorDrawable plain = new ColorDrawable(Color.RED);
        LivePanelTheme.badgeTile(tile, plain);
        assertSame("not a shape", plain, tile.getBackground());
        LivePanelTheme.badgeTile(tile, null);
        assertNull("no background", tile.getBackground());
        GradientDrawable stateless = new GradientDrawable() {
            @Override public ConstantState getConstantState() {
                return null;
            }
        };
        LivePanelTheme.badgeTile(tile, stateless);
        assertSame("a shape with no state to copy", stateless, tile.getBackground());
        GradientDrawable broken = new GradientDrawable() {
            @Override public ConstantState getConstantState() {
                throw new IllegalStateException("copy");
            }
        };
        LivePanelTheme.badgeTile(tile, broken);
        assertSame("a failed copy still sets the tile's own", broken, tile.getBackground());

        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, true));
        LivePanelTheme.badgeTile(tile, tint);
        assertSame("paused", tint, tile.getBackground());
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess", ClassParameter.from(boolean.class, false));
        SettingsStatus.liveControlsEnabled = false;
        LivePanelTheme.badgeTile(tile, tint);
        assertSame("without the patch", tint, tile.getBackground());
    }

    @Test public void panelsAreFoundByTikToksClassNames() {
        assertEquals(LiveThemeAwareDialogFragment.class.getName(), LivePanelTheme.THEMED_DIALOG);
        assertEquals(LiveSheetFragment.class.getName(), LivePanelTheme.SHEET);
        assertEquals(LiveThemeAwareFragment.class.getName(), LivePanelTheme.THEMED_FRAGMENT);
        assertEquals(RankListDialog.class.getName(), LivePanelTheme.RANK_LIST);
        assertEquals(PopularityRankingEducationDialog.class.getName(), LivePanelTheme.RANK_GUIDE);
        assertTrue(LivePanelTheme.isPanel(ShareDialog.class));
        assertTrue(!LivePanelTheme.isPanel(RoomFragment.class));
        assertTrue(!LivePanelTheme.isPanel(RankListDialog.class));
        assertTrue(!LivePanelTheme.isPanel(PopularityRankingEducationDialog.class));
        assertTrue("a ranking subclass stays stock too", !LivePanelTheme.isPanel(HourlyRanking.class));
        assertTrue("a sheet page is a panel, not a themed page", LivePanelTheme.isPanel(LiveSheetFragment.class));
        assertTrue("a themed page isn't a panel", !LivePanelTheme.isPanel(RankPage.class));
        RankListDialog ranking = new RankListDialog();
        assertSame(ranking, LivePanelTheme.stockPanel(ranking));
        HourlyRanking hourly = new HourlyRanking();
        assertSame(hourly, LivePanelTheme.stockPanel(hourly));
        assertSame("a page finds its ranking", ranking, LivePanelTheme.stockPanel(page(ranking)));
        assertSame(null, LivePanelTheme.stockPanel(dialog()));
        assertSame(null, LivePanelTheme.stockPanel(new RoomFragment()));
        ShareDialog share = dialog();
        share.parent = ranking;
        assertSame("an ordinary panel over the ranking ends the walk", null, LivePanelTheme.stockPanel(share));
        RankPage loop = page(null);
        loop.parent = loop;
        assertSame("a parent loop ends", null, LivePanelTheme.stockPanel(loop));
    }

    /** A ranking built on the daily one, the way TikTok splits its list dialogs into variants. */
    static class HourlyRanking extends RankListDialog { }
}
