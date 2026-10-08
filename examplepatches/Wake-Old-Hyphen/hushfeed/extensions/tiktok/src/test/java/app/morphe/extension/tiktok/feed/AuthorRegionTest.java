package app.morphe.extension.tiktok.feed;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.graphics.Typeface;
import android.os.Looper;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.Spanned;
import android.text.style.StyleSpan;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

import com.ss.android.ugc.aweme.common.widget.VerticalViewPager;
import com.ss.android.ugc.aweme.detail.ui.DetailActivity;
import com.ss.android.ugc.aweme.main.MainActivity;

import java.lang.reflect.Method;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

/**
 * The feed's author row and a comment row both carry a {@code title} view, so the row is
 * identified by the post time sitting beside the name.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class AuthorRegionTest {
    private static final int NAME_ID = 0x7f0a0001;
    private static final int POST_TIME_ID = 0x7f0a0002;

    /** Stands in for the Aweme the player says is on screen. */
    public static final class Clip {
        public final String aid;
        public final String region;
        public final Author author;

        Clip(String aid, String handle, String nickname, String region) {
            this.aid = aid;
            this.region = region;
            this.author = new Author(handle, nickname);
        }
    }

    public static final class Author {
        public final String uid = "1234";
        public final String uniqueId;
        public final String nickname;

        Author(String uniqueId, String nickname) {
            this.uniqueId = uniqueId;
            this.nickname = nickname;
        }
    }

    /** A row that says how many times its text was written, not just what it says. */
    public static final class CountingTextView extends TextView {
        int writes;

        CountingTextView(Context context) {
            super(context);
        }

        @Override
        public void setText(CharSequence text, BufferType type) {
            super.setText(text, type);
            writes++;
        }
    }

    private static Clip playing(String aid, String handle, String nickname, String region) {
        return new Clip(aid, handle, nickname, region);
    }

    private Context context;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        AuthorRegion.setViewIds(NAME_ID, POST_TIME_ID);
        AuthorRegion.restore();
    }

    /** name + post time in one row, the shape the feed uses. */
    private LinearLayout feedRow(String name) {
        LinearLayout row = new LinearLayout(context);
        TextView title = new TextView(context);
        title.setId(NAME_ID);
        title.setText(name);
        TextView postTime = new TextView(context);
        postTime.setId(POST_TIME_ID);
        postTime.setText("· 4h ago");
        row.addView(title);
        row.addView(postTime);
        return row;
    }

    /** A comment row: same name id, no post time beside it. */
    private LinearLayout commentRow(String name) {
        LinearLayout row = new LinearLayout(context);
        TextView title = new TextView(context);
        title.setId(NAME_ID);
        title.setText(name);
        row.addView(title);
        return row;
    }

    @Test
    public void theCountryIsAppendedOnceAndRemovedAgain() {
        LinearLayout row = feedRow("My path forward");
        TextView name = AuthorRegion.findName(row);
        assertSame(row.getChildAt(0), name);

        AuthorRegion.decorate(name, null, "US");
        assertEquals("My path forward · US", name.getText().toString());

        // Every layout pass runs this, so it must not keep appending.
        AuthorRegion.decorate(name, null, "US");
        AuthorRegion.decorate(name, null, "US");
        assertEquals("My path forward · US", name.getText().toString());

        // Switching the option off, or leaving the feed, puts the name back.
        AuthorRegion.restore();
        assertEquals("My path forward", name.getText().toString());
    }

    /** TikTok keeps the post time GONE unless the publish date shows; the row is still the author's (#75). */
    @Test
    public void aHiddenPostTimeStillMarksTheAuthorRow() {
        LinearLayout row = feedRow("My path forward");
        row.getChildAt(1).setVisibility(View.GONE);
        assertSame(row.getChildAt(0), AuthorRegion.findName(row));

        row.getChildAt(0).setVisibility(View.GONE);
        assertNull(AuthorRegion.findName(row));
    }

    @Test
    public void aCommentRowIsNotTheAuthorRow() {
        assertNull(AuthorRegion.findName(commentRow("Joshbetancourt28")));
    }

    @Test
    public void aVideoWithNoRegionLeavesTheNameAlone() {
        LinearLayout row = feedRow("My path forward");
        TextView name = AuthorRegion.findName(row);

        AuthorRegion.decorate(name, null, null);
        assertEquals("My path forward", name.getText().toString());
    }

    @Test
    public void movingToAnotherVideoDecoratesTheNewNameAndReleasesTheOld() {
        TextView first = AuthorRegion.findName(feedRow("first creator"));
        AuthorRegion.decorate(first, null, "US");
        assertEquals("first creator · US", first.getText().toString());

        // TikTok rebinds the row for the next video before this runs again.
        TextView second = AuthorRegion.findName(feedRow("second creator"));
        AuthorRegion.decorate(second, null, "GB");
        assertEquals("second creator · GB", second.getText().toString());
        assertEquals("first creator", first.getText().toString());
    }

    @Test
    public void aVideoChangeOnTheSameRowReplacesTheCountryInsteadOfStackingIt() {
        // The feed recycles the row: the same TextView is rebound for the next video, and
        // the player can name that video before the row is redecorated.
        LinearLayout row = feedRow("alice");
        TextView name = AuthorRegion.findName(row);

        AuthorRegion.decorate(name, null, "US");
        AuthorRegion.decorate(name, null, "GB");
        AuthorRegion.decorate(name, null, "DE");
        assertEquals("alice · DE", name.getText().toString());

        AuthorRegion.restore();
        assertEquals("alice", name.getText().toString());
    }

    @Test
    public void aRebuiltRowWhoseNameExtendsTheOldOneIsLeftAlone() {
        LinearLayout row = feedRow("Sam");
        TextView name = AuthorRegion.findName(row);
        AuthorRegion.decorate(name, null, "US");
        assertEquals("Sam · US", name.getText().toString());

        // TikTok rebinds the recycled row to a creator whose name starts with the old one.
        name.setText("Sam Smith");
        AuthorRegion.restore();
        assertEquals("Sam Smith", name.getText().toString());
    }

    @Test
    public void theHandleReplacesTheDisplayName() {
        LinearLayout row = feedRow("Sam Smith");
        TextView name = AuthorRegion.findName(row);

        AuthorRegion.decorate(name, "samsmith", null);
        assertEquals("@samsmith", name.getText().toString());

        // Every layout pass runs this, so it must settle.
        AuthorRegion.decorate(name, "samsmith", null);
        assertEquals("@samsmith", name.getText().toString());

        AuthorRegion.restore();
        assertEquals("Sam Smith", name.getText().toString());
    }

    @Test
    public void bothSwitchesTogetherGiveTheHandleAndTheCountry() {
        LinearLayout row = feedRow("Sam Smith");
        TextView name = AuthorRegion.findName(row);

        AuthorRegion.decorate(name, "samsmith", "US");
        assertEquals("@samsmith · US", name.getText().toString());

        AuthorRegion.restore();
        assertEquals("Sam Smith", name.getText().toString());
    }

    @Test
    public void aRecycledRowTakesTheNextCreatorsHandle() {
        // The feed rebinds the same TextView for the next video.
        LinearLayout row = feedRow("alice");
        TextView name = AuthorRegion.findName(row);

        AuthorRegion.decorate(name, "alice_v", "US");
        AuthorRegion.decorate(name, "bob_v", "GB");
        assertEquals("@bob_v · GB", name.getText().toString());

        AuthorRegion.restore();
        assertEquals("alice", name.getText().toString());
    }

    @Test
    public void eachSwitchOnlyEverAsksForItsOwnValue() {
        Clip video = playing("one", "samsmith", "Sam Smith", "GB");

        Settings.SHOW_AUTHOR_HANDLE.save(false);
        Settings.SHOW_AUTHOR_REGION.save(false);
        assertNull(AuthorRegion.decoration(video));

        // The country switch on its own must not start replacing names with handles.
        Settings.SHOW_AUTHOR_REGION.save(true);
        assertArrayEquals(new String[]{null, "GB"}, AuthorRegion.decoration(video));

        Settings.SHOW_AUTHOR_HANDLE.save(true);
        Settings.SHOW_AUTHOR_REGION.save(false);
        assertArrayEquals(new String[]{"samsmith", null}, AuthorRegion.decoration(video));

        Settings.SHOW_AUTHOR_REGION.save(true);
        assertArrayEquals(new String[]{"samsmith", "GB"}, AuthorRegion.decoration(video));
    }

    @Test
    public void aVideoWithNothingToShowAsksForNothing() {
        Settings.SHOW_AUTHOR_HANDLE.save(true);
        Settings.SHOW_AUTHOR_REGION.save(true);

        assertNull(AuthorRegion.decoration(playing("two", null, "Nobody", null)));

        // A handle with no country still gives the handle.
        assertArrayEquals(new String[]{"someone", null},
                AuthorRegion.decoration(playing("three", "someone", "Some One", null)));
    }

    @Test
    public void aSettledRowIsNotWrittenAgainOnEveryLayoutPass() {
        // This runs from a global layout listener, so writing on every pass would ask for
        // another layout, and another.
        LinearLayout row = new LinearLayout(context);
        CountingTextView name = new CountingTextView(context);
        name.setId(NAME_ID);
        name.setText("alice");
        TextView postTime = new TextView(context);
        postTime.setId(POST_TIME_ID);
        row.addView(name);
        row.addView(postTime);

        AuthorRegion.decorate(name, null, "US");
        int afterFirst = name.writes;
        assertEquals("alice · US", name.getText().toString());

        for (int i = 0; i < 5; i++) AuthorRegion.decorate(name, null, "US");
        assertEquals(afterFirst, name.writes);

        AuthorRegion.restore();
    }

    @Test
    public void aStyledNameKeepsItsSpans() {
        LinearLayout row = feedRow("");
        TextView name = AuthorRegion.findName(row);
        SpannableString styled = new SpannableString("alice");
        styled.setSpan(new StyleSpan(Typeface.BOLD), 0, 5, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        name.setText(styled);

        AuthorRegion.decorate(name, null, "US");

        assertEquals("alice · US", name.getText().toString());
        CharSequence decorated = name.getText();
        assertTrue(decorated instanceof Spanned);
        assertEquals(1, ((Spanned) decorated).getSpans(0, 5, StyleSpan.class).length);
    }

    private static final int PAGE_WIDTH = 200;
    private static final int PAGE_HEIGHT = 300;

    /**
     * TikTok's pager with an author row in a cell for each video: the cell at the pager's
     * scroll on screen, the others a page away and clipped, all of them attached.
     */
    private VerticalViewPager feed(Activity activity, String... names) {
        FrameLayout root = new FrameLayout(activity);
        activity.setContentView(root);
        VerticalViewPager pager = new VerticalViewPager(activity);
        root.addView(pager, new FrameLayout.LayoutParams(PAGE_WIDTH, PAGE_HEIGHT));
        for (int i = 0; i < names.length; i++) {
            FrameLayout cell = new FrameLayout(activity);
            FrameLayout.LayoutParams place = new FrameLayout.LayoutParams(PAGE_WIDTH, PAGE_HEIGHT);
            place.topMargin = i * PAGE_HEIGHT;
            pager.addView(cell, place);
            cell.addView(feedRow(names[i]));
        }
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        View decor = root.getRootView();
        decor.measure(View.MeasureSpec.makeMeasureSpec(400, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(800, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, 400, 800);
        return pager;
    }

    private static TextView nameIn(VerticalViewPager pager, int index) {
        return (TextView) ((LinearLayout) ((FrameLayout) pager.getChildAt(index)).getChildAt(0)).getChildAt(0);
    }

    @Test
    public void theRowOnScreenIsDecoratedNotTheFirstOneInTheTree() {
        // #75: after a swipe down the cell above stays attached and comes first in the tree,
        // so the country went on it, off screen, and only showed after swiping back up.
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            VerticalViewPager pager = feed(activity, "first creator", "second creator", "third creator");
            View content = activity.findViewById(android.R.id.content);

            assertSame(nameIn(pager, 0), AuthorRegion.findName(content));

            pager.scrollTo(0, PAGE_HEIGHT);
            TextView onScreen = AuthorRegion.findName(content);
            assertSame(nameIn(pager, 1), onScreen);
            AuthorRegion.decorate(onScreen, null, "AZ");
            assertEquals("second creator · AZ", nameIn(pager, 1).getText().toString());
            assertEquals("first creator", nameIn(pager, 0).getText().toString());

            // And on to the next, which takes the country off the row it leaves.
            pager.scrollTo(0, 2 * PAGE_HEIGHT);
            TextView next = AuthorRegion.findName(content);
            assertSame(nameIn(pager, 2), next);
            AuthorRegion.decorate(next, null, "TR");
            assertEquals("third creator · TR", nameIn(pager, 2).getText().toString());
            assertEquals("second creator", nameIn(pager, 1).getText().toString());

            AuthorRegion.restore();
        }
    }

    @Test
    public void withNoRowOnScreenNothingIsDecorated() {
        // A feed behind another page keeps its cells attached with their last layout.
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            VerticalViewPager pager = feed(activity, "first creator", "second creator");
            pager.setVisibility(View.INVISIBLE);

            assertNull(AuthorRegion.findName(activity.findViewById(android.R.id.content)));
        }
    }

    /** Stands in for VideoItemParams, which hands the player its Aweme. */
    public static final class Params {
        public final Clip aweme;

        Params(Clip aweme) {
            this.aweme = aweme;
        }
    }

    /** Tells CurrentVideoAuthor this clip is the one playing, the way the player hooks do. */
    private static void play(Clip clip) throws Exception {
        Method update = CurrentVideoAuthor.class.getDeclaredMethod("update", Object.class);
        update.setAccessible(true);
        update.invoke(null, new Params(clip));
        Method onPlaying = CurrentVideoAuthor.class.getDeclaredMethod("onPlaying", String.class);
        onPlaying.setAccessible(true);
        onPlaying.invoke(null, clip.aid);
    }

    private static void layOut(View root) {
        root.measure(View.MeasureSpec.makeMeasureSpec(400, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(800, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 400, 800);
    }

    /** #75: a video opened from search plays in a detail pager of its own, and gets the country too. */
    @Test
    public void aVideoOpenedInTheDetailPagerGetsTheCountry() throws Exception {
        Method reset = CurrentVideoAuthor.class.getDeclaredMethod("resetForTests");
        reset.setAccessible(true);
        reset.invoke(null);
        Settings.SHOW_AUTHOR_HANDLE.save(false);
        Settings.SHOW_AUTHOR_REGION.save(true);
        try (ActivityController<MainActivity> feed = Robolectric.buildActivity(MainActivity.class).setup().visible()) {
            Utils.setContext(feed.get());
            AuthorRegion.install(feed.get());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            feed.pause();

            try (ActivityController<DetailActivity> pager = Robolectric.buildActivity(DetailActivity.class).setup().visible()) {
                LinearLayout row = feedRow("aittaac");
                pager.get().setContentView(row);
                play(new Clip("opened", "aittaac", "aittaac", "AZ"));
                Shadows.shadowOf(Looper.getMainLooper()).idle();
                layOut(row.getRootView());
                row.getViewTreeObserver().dispatchOnGlobalLayout();

                assertEquals("aittaac · AZ", ((TextView) row.getChildAt(0)).getText().toString());
                pager.pause().stop();
            }
        } finally {
            AuthorRegion.restore();
            Settings.SHOW_AUTHOR_HANDLE.resetToDefault();
            Settings.SHOW_AUTHOR_REGION.resetToDefault();
            reset.invoke(null);
        }
    }

    /** #75: TikTok cuts a long name with an ellipsis, and the country after it went too. */
    @Test
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aLongNameIsShortenedSoTheCountryStaysWhole() {
        LinearLayout row = longNameRow(LONG_NAME);
        TextView name = (TextView) row.getChildAt(0);

        AuthorRegion.decorate(name, null, "AZ");
        layOut(row);
        assertTrue("the fixture name isn't long enough to be cut", name.getLayout().getEllipsisCount(0) > 0);

        // The next layout pass fits it.
        AuthorRegion.decorate(name, null, "AZ");
        layOut(row);
        String shown = name.getText().toString();
        assertTrue(shown, shown.endsWith(" · AZ"));
        assertTrue(shown, shown.startsWith("Aysel_"));
        assertTrue(shown, shown.contains("…"));
        assertEquals(shown, 0, name.getLayout().getEllipsisCount(0));

        // Settled, so later passes leave it as it is.
        AuthorRegion.decorate(name, null, "AZ");
        assertEquals(shown, name.getText().toString());

        AuthorRegion.restore();
        assertEquals(LONG_NAME, name.getText().toString());
    }

    private static final String LONG_NAME = "Aysel_Salehli_Coach_Yasam_Kocu_Spiritual_Mentor_Official";

    /** A single-line name 160 px wide that TikTok cuts with an ellipsis, beside a hidden post time. */
    private LinearLayout longNameRow(String full) {
        LinearLayout row = new LinearLayout(context);
        TextView name = new TextView(context);
        name.setId(NAME_ID);
        name.setSingleLine(true);
        name.setEllipsize(TextUtils.TruncateAt.END);
        name.setText(full);
        row.addView(name, new LinearLayout.LayoutParams(160, ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView postTime = new TextView(context);
        postTime.setId(POST_TIME_ID);
        postTime.setVisibility(View.GONE);
        row.addView(postTime);
        return row;
    }

    /**
     * A row with a fixed width takes new text with a redraw and no layout pass, so nothing would
     * come back to fit it. It's fitted as it's written.
     */
    @Test
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aFixedWidthRowIsFittedWithoutWaitingForALayoutPass() {
        LinearLayout row = longNameRow(LONG_NAME);
        TextView name = (TextView) row.getChildAt(0);
        layOut(row);

        AuthorRegion.decorate(name, null, "AZ");
        String shown = name.getText().toString();
        assertTrue(shown, shown.endsWith(" · AZ"));
        assertTrue(shown, shown.contains("…"));

        AuthorRegion.restore();
        assertEquals(LONG_NAME, name.getText().toString());
    }

    /** On a LIVE preview or an ad with no author row, the only row left can be the cell beside it. */
    @Test
    public void aLoneRowOffScreenIsNotTheVideosRow() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            VerticalViewPager pager = feed(activity, "neighbour");
            View content = activity.findViewById(android.R.id.content);

            pager.scrollTo(0, PAGE_HEIGHT);
            assertNull(AuthorRegion.findName(content));

            pager.scrollTo(0, 0);
            assertSame(nameIn(pager, 0), AuthorRegion.findName(content));
        }
    }

    /**
     * A detail page that finishes as it resumes (a trampoline, a video that's gone) took the hook
     * off the feed, and the feed coming back still looked like the window the hook was on.
     */
    @Test
    public void aDetailPageClosingAsItOpensLeavesTheFeedHooked() throws Exception {
        Method reset = CurrentVideoAuthor.class.getDeclaredMethod("resetForTests");
        reset.setAccessible(true);
        reset.invoke(null);
        Settings.SHOW_AUTHOR_HANDLE.save(false);
        Settings.SHOW_AUTHOR_REGION.save(true);
        try (ActivityController<MainActivity> feed = Robolectric.buildActivity(MainActivity.class).setup().visible()) {
            LinearLayout row = feedRow("aittaac");
            feed.get().setContentView(row);
            Utils.setContext(feed.get());
            AuthorRegion.install(feed.get());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            feed.pause();

            try (ActivityController<DetailActivity> detail = Robolectric.buildActivity(DetailActivity.class).create().start()) {
                detail.get().finish();
                detail.resume();
                Shadows.shadowOf(Looper.getMainLooper()).idle();
            }
            feed.resume();
            play(new Clip("feed", "aittaac", "aittaac", "AZ"));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            layOut(row.getRootView());
            row.getViewTreeObserver().dispatchOnGlobalLayout();

            assertEquals("aittaac · AZ", ((TextView) row.getChildAt(0)).getText().toString());
        } finally {
            AuthorRegion.restore();
            Settings.SHOW_AUTHOR_HANDLE.resetToDefault();
            Settings.SHOW_AUTHOR_REGION.resetToDefault();
            reset.invoke(null);
        }
    }

    /**
     * Opening the feed's own video from the creator's grid strips the feed row, and coming back
     * neither lays the feed out again nor changes the video, so the country has to be put back
     * when the hook returns.
     */
    @Test
    public void aFeedComingBackFromADetailPageGetsItsCountryBackWithoutALayout() throws Exception {
        Method reset = CurrentVideoAuthor.class.getDeclaredMethod("resetForTests");
        reset.setAccessible(true);
        reset.invoke(null);
        Settings.SHOW_AUTHOR_HANDLE.save(false);
        Settings.SHOW_AUTHOR_REGION.save(true);
        try (ActivityController<MainActivity> feed = Robolectric.buildActivity(MainActivity.class).setup().visible()) {
            LinearLayout row = feedRow("aittaac");
            feed.get().setContentView(row);
            Utils.setContext(feed.get());
            AuthorRegion.install(feed.get());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            play(new Clip("feed", "aittaac", "aittaac", "AZ"));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            layOut(row.getRootView());
            row.getViewTreeObserver().dispatchOnGlobalLayout();
            assertEquals("aittaac · AZ", ((TextView) row.getChildAt(0)).getText().toString());

            feed.pause();
            try (ActivityController<DetailActivity> detail = Robolectric.buildActivity(DetailActivity.class).setup().visible()) {
                detail.get().setContentView(feedRow("aittaac"));
                AuthorRegion.install(detail.get());
                Shadows.shadowOf(Looper.getMainLooper()).idle();
                assertEquals("aittaac", ((TextView) row.getChildAt(0)).getText().toString());
                detail.pause();
                detail.get().finish();
            }
            feed.resume();
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            assertEquals("aittaac · AZ", ((TextView) row.getChildAt(0)).getText().toString());
        } finally {
            AuthorRegion.restore();
            Settings.SHOW_AUTHOR_HANDLE.resetToDefault();
            Settings.SHOW_AUTHOR_REGION.resetToDefault();
            reset.invoke(null);
        }
    }

    /**
     * Back pressed within a frame of opening a video: the detail page's posted install runs after
     * it has finished and the feed has resumed. It must leave the feed's row and hook alone.
     */
    @Test
    public void aDetailInstallLandingAfterTheUserWentBackLeavesTheFeedDecorated() throws Exception {
        Method reset = CurrentVideoAuthor.class.getDeclaredMethod("resetForTests");
        reset.setAccessible(true);
        reset.invoke(null);
        Settings.SHOW_AUTHOR_HANDLE.save(false);
        Settings.SHOW_AUTHOR_REGION.save(true);
        try (ActivityController<MainActivity> feed = Robolectric.buildActivity(MainActivity.class).setup().visible()) {
            LinearLayout row = feedRow("aittaac");
            feed.get().setContentView(row);
            Utils.setContext(feed.get());
            AuthorRegion.install(feed.get());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            play(new Clip("feed", "aittaac", "aittaac", "AZ"));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            layOut(row.getRootView());
            row.getViewTreeObserver().dispatchOnGlobalLayout();
            assertEquals("aittaac · AZ", ((TextView) row.getChildAt(0)).getText().toString());

            feed.pause();
            try (ActivityController<DetailActivity> detail = Robolectric.buildActivity(DetailActivity.class).create().start()) {
                AuthorRegion.install(detail.get());
                detail.get().finish();
                feed.resume();
                Shadows.shadowOf(Looper.getMainLooper()).idle();
            }

            assertEquals("aittaac · AZ", ((TextView) row.getChildAt(0)).getText().toString());
            ((TextView) row.getChildAt(0)).setText("aittaac");
            row.getViewTreeObserver().dispatchOnGlobalLayout();
            assertEquals("the feed's hook went with the detail page",
                    "aittaac · AZ", ((TextView) row.getChildAt(0)).getText().toString());
        } finally {
            AuthorRegion.restore();
            Settings.SHOW_AUTHOR_HANDLE.resetToDefault();
            Settings.SHOW_AUTHOR_REGION.resetToDefault();
            reset.invoke(null);
        }
    }

    /**
     * A detail page started with no feed behind it (a video restored after the process was killed) is hooked from its own onCreate.
     * It lays out while the feed's video is still the current one, and its own video starting is
     * what puts the right country on it.
     */
    @Test
    public void aDetailPageCatchesUpWhenItsOwnVideoStarts() throws Exception {
        Method reset = CurrentVideoAuthor.class.getDeclaredMethod("resetForTests");
        reset.setAccessible(true);
        reset.invoke(null);
        boolean enabled = SettingsStatus.authorRegionEnabled;
        SettingsStatus.authorRegionEnabled = true;
        Settings.SHOW_AUTHOR_HANDLE.save(false);
        Settings.SHOW_AUTHOR_REGION.save(true);
        try (ActivityController<DetailActivity> pager = Robolectric.buildActivity(DetailActivity.class).setup().visible()) {
            LinearLayout row = feedRow("aittaac");
            pager.get().setContentView(row);
            Utils.setContext(pager.get());
            AuthorRegion.install(pager.get());
            play(new Clip("feed", "aittaac", "aittaac", "US"));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            layOut(row.getRootView());
            row.getViewTreeObserver().dispatchOnGlobalLayout();
            TextView name = (TextView) row.getChildAt(0);
            assertEquals("aittaac · US", name.getText().toString());
            // The write's own relayout runs now, so the next video gets no layout pass to ride on.
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("aittaac · US", name.getText().toString());

            play(new Clip("opened", "aittaac", "aittaac", "AZ"));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("aittaac · AZ", name.getText().toString());
        } finally {
            AuthorRegion.restore();
            SettingsStatus.authorRegionEnabled = enabled;
            Settings.SHOW_AUTHOR_HANDLE.resetToDefault();
            Settings.SHOW_AUTHOR_REGION.resetToDefault();
            reset.invoke(null);
        }
    }
}
