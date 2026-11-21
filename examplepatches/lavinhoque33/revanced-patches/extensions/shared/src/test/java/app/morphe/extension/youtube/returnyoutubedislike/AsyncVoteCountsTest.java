/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.returnyoutubedislike;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.os.Looper;
import android.text.Layout;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import com.facebook.litho.ComponentHost;
import com.facebook.litho.TextContent;

import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.LooperMode;

import java.lang.ref.Reference;
import java.lang.reflect.Field;
import java.time.Duration;
import java.util.ArrayDeque;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.shared.patches.LithoRelayoutPatch;
import app.morphe.extension.shared.returnyoutubedislike.ReturnYouTubeDislike.Vote;
import app.morphe.extension.shared.returnyoutubedislike.requests.RYDVoteData;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.feed.FeedEngagementCountsPatch;
import app.morphe.extension.youtube.patches.utils.ReturnYouTubeDislikePatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoInformation;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class AsyncVoteCountsTest {
    private static final int ACCESSIBILITY_TAG = 0x7f020011;
    private static final String WATCH_PATH = "video_action_bar.segmented_like_dislike_button.like_count";
    private static final String VIEW_COUNT_PATH = "video_description.rolling_view_count";
    private static final int STOCK_COLOR = 0xff123456;

    private ActivityController<Activity> activity;
    private FrameLayout root;
    private boolean useActivityResources;

    @Before
    @SuppressWarnings("deprecation")
    public void start() {
        var app = RuntimeEnvironment.getApplication();
        var info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.applicationInfo = app.getApplicationInfo();
        info.versionName = "21.45.90";
        shadowOf(app.getPackageManager()).installPackage(info);
        var resources = app.getResources();
        var indexed = new Resources(resources.getAssets(), resources.getDisplayMetrics(), resources.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String type, String pkg) {
                return "id".equals(type) && "elements_accessibility_view_tag_id".equals(name)
                        ? ACCESSIBILITY_TAG : super.getIdentifier(name, type, pkg);
            }
        };
        Utils.setContext(new ContextWrapper(app) {
            @Override
            public Resources getResources() {
                return indexed;
            }
        });
        useActivityResources = ResourceUtils.useActivityContextIfAvailable;
        ResourceUtils.useActivityContextIfAvailable = false;
        Settings.RYD_ENABLED.save(true);
        Settings.RYD_ESTIMATED_LIKE.save(true);
        Settings.RYD_COMPACT_LAYOUT.save(true);
        Settings.RYD_DISLIKE_PERCENTAGE.save(false);
        Settings.RYD_MORPHE_DISLIKE_PILL.save(false);
        Settings.DISABLE_LAYOUT_UPDATES.save(false);
        Settings.RYD_FEED_LIKE_COUNT.save(true);
        Settings.RYD_FEED_LIKE_RATIO.save(true);

        activity = Robolectric.buildActivity(Activity.class).setup().visible();
        Utils.setActivity(activity.get());
        root = new FrameLayout(activity.get());
        activity.get().setContentView(root);
        measureWindow();
        PlayerType.setFromString("WATCH_WHILE_MAXIMIZED");
    }

    @After
    public void stop() throws Exception {
        ReturnYouTubeDislikePatch.onRYDStatusChange();
        PlayerType.setFromString("NONE");
        field(VideoInformation.class, "videoId").set(null, "");
        Utils.setActivity(null);
        activity.close();
        // Let the coalesced Litho task clear its pending flag before Robolectric resets the looper.
        publish();
        ResourceUtils.useActivityContextIfAvailable = useActivityResources;
    }

    @Test
    public void slowRequestUpdatesMountedSegmentedAndRollingTextAndAppliesLocalVote() throws Exception {
        Request request = request("A", 41, 7);
        startWatch("A");
        VoteRow row = mountWatchText();
        assertEquals("41", row.rolling.getText().toString());
        assertEquals("41", row.drawable.text.toString());
        assertEquals(STOCK_COLOR, foreground(row.drawable.text));
        assertEquals("41", ReturnYouTubeDislikePatch.rollingNumberTextForMeasure(row.modelText));

        request.data.setUserVote(Vote.DISLIKE);
        publish();
        assertEquals("41", row.rolling.getText().toString());
        assertEquals("41", row.drawable.text.toString());
        assertEquals(0, row.segmented.relayouts);
        Layout stockLayout = row.drawable.layout;
        assertSame(stockLayout, ReturnYouTubeDislikePatch.reuseSegmentedCountLayout(stockLayout, row.drawable.text));
        assertSame(stockLayout, ReturnYouTubeDislikePatch.reuseSegmentedCountLayout(stockLayout, "unrelated text"));

        request.complete();
        publish();
        assertEquals(8, request.data.getFetchedVotes().getDislikeCount());
        assertDislikes(row, 8);
        assertNull(ReturnYouTubeDislikePatch.reuseSegmentedCountLayout(stockLayout, row.drawable.text));
        assertTrue(row.drawable.layout.getLineWidth(0) > stockLayout.getLineWidth(0));
        assertSame(row.drawable.layout,
                ReturnYouTubeDislikePatch.reuseSegmentedCountLayout(row.drawable.layout, row.drawable.text));
        assertEquals(STOCK_COLOR, foreground(row.drawable.text));
        assertEquals(row.rolling.getText().toString(),
                ReturnYouTubeDislikePatch.rollingNumberTextForMeasure(row.modelText));
        assertEquals(1, row.segmented.relayouts);
        assertEquals(1, row.rollingParent.relayouts);

        request.data.setUserVote(Vote.LIKE_REMOVE);
        publish();
        assertDislikes(row, 7);
    }

    @Test
    public void failedFetchKeepsStockTextAndSeparateLikeWhileCachedSuccessBindsImmediately() throws Exception {
        Request failure = request("A", 0, -1);
        addSeparateButtons("Liked by 42 people");
        startWatch("A");
        VoteRow row = mountWatchText();
        TextView like = actionLabel(true);
        TextView dislike = actionLabel(false);
        assertNotNull(like.getParent());
        assertEquals("41", like.getText().toString());
        assertEquals(View.GONE, dislike.getVisibility());

        failure.complete();
        publish();
        assertEquals("41", row.drawable.text.toString());
        assertEquals("41", row.rolling.getText().toString());
        assertEquals(STOCK_COLOR, foreground(row.drawable.text));
        assertEquals("41", like.getText().toString());
        assertEquals(View.GONE, dislike.getVisibility());
        assertEquals(0, row.segmented.relayouts);

        root.removeAllViews();
        addSeparateButtons("Liked by 84 people");
        Request cached = request("B", 83, 17);
        cached.complete();
        startWatch("B");
        assertEquals("83", actionLabel(true).getText().toString());
        assertEquals("17", actionLabel(false).getText().toString());
        assertEquals(View.VISIBLE, actionLabel(false).getVisibility());
        VoteRow cachedRow = mountWatchText();
        assertDislikes(cachedRow, 17);
    }

    @Test
    public void separateDislikeLabelPublishesToMountedAnchorWithoutPreDrawOrRebind() throws Exception {
        Request request = request("A", 41, 7);
        FrameLayout anchors = addSeparateButtons("Liked by 42 people");
        startWatch("A");
        TextView sameLabel = actionLabel(false);
        assertEquals(View.GONE, sameLabel.getVisibility());

        request.complete();
        publish();
        assertSame(sameLabel, actionLabel(false));
        assertEquals("7", sameLabel.getText().toString());
        assertEquals(View.VISIBLE, sameLabel.getVisibility());

        root.removeView(anchors);
        assertNull(field(ReturnYouTubeDislikePatch.class, "regularActionButtonCountPositionListener").get(null));
        assertNull(sameLabel.getParent());
    }

    @Test
    public void separateRowReusedAcrossAtoBtoARequiresNewNativeBinding() throws Exception {
        FrameLayout anchors = addSeparateButtons("Liked by 42 people");
        Request oldA = request("A", 41, 71);
        startWatch("A");
        Request b = request("B", 41, 72);
        startWatch("B");
        Request currentA = request("A", 84, 73);
        startWatch("A");
        oldA.complete();
        b.complete();
        currentA.complete();
        publish();
        assertNull(actionLabel(false));

        anchors.getChildAt(0).setContentDescription("Liked by 85 people");
        ReturnYouTubeDislikePatch.onLazilyConvertedElementLoaded(List.of(), "video_action_bar.watch");
        assertEquals("84", actionLabel(true).getText().toString());
        assertEquals("73", actionLabel(false).getText().toString());
    }

    @Test
    public void retiredWatchGenerationsAndDetachedRollingTextNeverConsumeOldResults() throws Exception {
        Request firstA = request("A", 41, 71);
        startWatch("A");
        VoteRow retired = mountWatchText();
        retired.rollingParent.removeView(retired.rolling);
        retired.drawable.setCallback(null);

        Request b = request("B", 41, 72);
        startWatch("B");
        Request nextA = request("A", 41, 73); // The old in-flight cache entry was replaced.
        startWatch("A");
        VoteRow current = mountWatchText();
        TextView unrelated = new TextView(activity.get());
        current.rollingParent.addView(unrelated);
        String sameText = new String("41");
        assertSame(sameText, ReturnYouTubeDislikePatch.onRollingNumberLoaded(VIEW_COUNT_PATH, sameText));
        ReturnYouTubeDislikePatch.bindRollingNumber(unrelated, sameText);

        b.complete();
        firstA.complete();
        publish();
        assertEquals("41", current.rolling.getText().toString());
        assertEquals("41", current.drawable.text.toString());
        assertEquals("41", retired.rolling.getText().toString());
        assertEquals(0, retired.segmented.relayouts);
        assertEquals(0, listenerCount(firstA.data));
        assertEquals(0, listenerCount(b.data));

        current.rollingParent.removeView(current.rolling);
        nextA.complete();
        publish();
        assertSegmentedDislikes(current, 73);
        assertEquals("41", current.rolling.getText().toString());
        assertEquals("41", unrelated.getText().toString());
        current.rollingParent.addView(current.rolling);
        assertDislikes(current, 73);
    }

    @Test
    public void visibleFeedCardsPublishIndependentlyAndReadCacheWithoutAnotherLayout() throws Exception {
        Request slow = request("A", 31, -1);
        Request fast = request("B", 42, 4);
        Card a = addCard("A");
        Card b = addCard("B");
        assertNull(badgeText(a));
        assertNull(badgeText(b));
        assertEquals(1, listenerCount(slow.data));
        assertEquals(1, listenerCount(fast.data));

        fast.complete();
        publish();
        assertNull(slow.data.getFetchedVotes());
        assertNull(badgeText(a));
        assertEquals("42", badgeText(b));
        assertFalse(badge(b).getBounds().isEmpty());

        Card cached = addCard("B");
        assertEquals("42", badgeText(cached));
        assertFalse(badge(cached).getBounds().isEmpty());
        root.removeView(a);
        assertEquals(0, listenerCount(slow.data));
        slow.complete();
        publish();
        assertNull(badgeText(a));
        assertEquals("42", badgeText(b));
    }

    @Test
    public void availableFeedResultPublishesWhileAnotherRealProducerIsBlocked() throws Exception {
        var slowStarted = new CountDownLatch(1);
        var releaseSlow = new CountDownLatch(1);
        var slowFinished = new CountDownLatch(1);
        var fastFinished = new CountDownLatch(1);
        var slow = new ReturnYouTubeDislike("A", () -> {
            slowStarted.countDown();
            await(releaseSlow);
            return null;
        }, task -> Utils.runOnBackgroundThread(() -> {
            try {
                task.run();
            } finally {
                slowFinished.countDown();
            }
        }));
        AsyncVoteCountsTest.<String, ReturnYouTubeDislike>map(ReturnYouTubeDislike.class, "fetchCache").put("A", slow);
        try {
            await(slowStarted);
            Card slowCard = addCard("A");
            Request fast = request("B", 64, 6);
            Card fastCard = addCard("B");
            Utils.runOnBackgroundThread(() -> {
                try {
                    fast.complete();
                } finally {
                    fastFinished.countDown();
                }
            });
            await(fastFinished);
            publish();
            assertEquals(1, slowFinished.getCount());
            assertNull(badgeText(slowCard));
            assertEquals("64", badgeText(fastCard));
        } finally {
            releaseSlow.countDown();
            await(slowFinished);
        }
    }

    private static void await(CountDownLatch latch) {
        try {
            assertTrue("Producer did not make progress", latch.await(5, TimeUnit.SECONDS));
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
            throw new AssertionError(ex);
        }
    }

    @Test
    public void recycledFeedCardRejectsOutOfOrderAndSameIdSupersededResults() throws Exception {
        Request oldA = request("A", 31, 6);
        Card card = addCard("A");
        Request b = request("B", 42, 4);
        FeedEngagementCountsPatch.onCardLaidOut(card, "B");
        Request currentA = request("A", 53, 2);
        FeedEngagementCountsPatch.onCardLaidOut(card, "A");
        assertEquals(0, listenerCount(oldA.data));
        assertEquals(0, listenerCount(b.data));

        oldA.complete();
        b.complete();
        publish();
        assertNull(badgeText(card));
        currentA.complete();
        publish();
        assertEquals("53", badgeText(card));

        FeedEngagementCountsPatch.onCardLaidOut(card, null);
        assertEquals(0, listenerCount(currentA.data));
        assertNull(badge(card));
    }

    private Request request(String id, long likes, long dislikes) throws Exception {
        RYDVoteData votes = dislikes < 0 ? null : new RYDVoteData(new JSONObject()
                .put("id", id).put("viewCount", 100).put("likes", likes).put("dislikes", dislikes));
        var tasks = new ArrayDeque<Runnable>();
        var request = new ReturnYouTubeDislike(id, () -> votes, tasks::add);
        AsyncVoteCountsTest.<String, ReturnYouTubeDislike>map(ReturnYouTubeDislike.class, "fetchCache").put(id, request);
        assertEquals(1, tasks.size());
        return new Request(request, tasks.remove());
    }

    private void startWatch(String id) throws Exception {
        field(VideoInformation.class, "videoId").set(null, id);
        AsyncVoteCountsTest.<String, Boolean>map(ReturnYouTubeDislikePatch.class, "playerResponseVideoIds")
                .put(id, false);
        ReturnYouTubeDislikePatch.newVideoLoaded(id);
    }

    private FrameLayout addSeparateButtons(String contentDescription) {
        var anchors = new FrameLayout(activity.get());
        var like = new View(activity.get());
        like.setContentDescription(contentDescription);
        like.setTag(ACCESSIBILITY_TAG, "id.video.like");
        anchors.addView(like, new FrameLayout.LayoutParams(160, 64));
        var dislike = new View(activity.get());
        dislike.setTag(ACCESSIBILITY_TAG, "id.video.dislike");
        var position = new FrameLayout.LayoutParams(160, 64);
        position.leftMargin = 180;
        anchors.addView(dislike, position);
        root.addView(anchors, new FrameLayout.LayoutParams(400, 100));
        measureWindow();
        return anchors;
    }

    private VoteRow mountWatchText() {
        var segmented = new LithoFixture(activity.get());
        var rollingParent = new LithoFixture(activity.get());
        root.addView(segmented, new FrameLayout.LayoutParams(400, 80));
        root.addView(rollingParent, new FrameLayout.LayoutParams(400, 80));
        var rolling = new TextView(activity.get());
        rollingParent.addView(new View(activity.get()));
        rollingParent.addView(rolling);
        var original = new SpannableString("41");
        original.setSpan(new ForegroundColorSpan(STOCK_COLOR), 0, original.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        var drawable = new NativeTextFixture(ReturnYouTubeDislikePatch.onLithoTextLoaded(WATCH_PATH, original));
        drawable.setCallback(segmented);
        segmented.drawable = drawable;
        assertTrue(segmented.isAttachedToWindow());
        assertTrue(segmented.isShown());
        drawable.mount();
        assertTrue("The native mount must register the segmented refresh marker",
                !LithoRelayoutPatch.findShownSpans(LithoRelayoutPatch.RelayoutSpan.class).isEmpty());
        String marked = ReturnYouTubeDislikePatch.onRollingNumberLoaded(WATCH_PATH, "41");
        ReturnYouTubeDislikePatch.bindRollingNumber(rolling, marked);
        return new VoteRow(segmented, drawable, rollingParent, rolling, marked);
    }

    private void measureWindow() {
        View decor = activity.get().getWindow().getDecorView();
        decor.measure(View.MeasureSpec.makeMeasureSpec(480, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(800, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, 480, 800);
    }

    private Card addCard(String id) {
        Card card = new Card(activity.get());
        root.addView(card, new FrameLayout.LayoutParams(360, 250));
        measureWindow();
        FeedEngagementCountsPatch.onCardLaidOut(card, id);
        return card;
    }

    private static void publish() {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(150));
    }

    private static void assertDislikes(VoteRow row, long count) {
        assertTrue(row.rolling.getText().toString(), row.rolling.getText().toString().endsWith(Long.toString(count)));
        assertSegmentedDislikes(row, count);
    }

    private static void assertSegmentedDislikes(VoteRow row, long count) {
        String displayed = row.drawable.text.toString();
        assertTrue(displayed, displayed.endsWith(Long.toString(count)));
    }

    private static int foreground(CharSequence text) {
        return ((Spanned) text).getSpans(0, text.length(), ForegroundColorSpan.class)[0].getForegroundColor();
    }

    private static TextView actionLabel(boolean like) throws Exception {
        String name = like ? "regularLikeActionButtonCountLabel" : "regularDislikeActionButtonCountLabel";
        Reference<?> label = (Reference<?>) field(ReturnYouTubeDislikePatch.class, name).get(null);
        return label == null ? null : (TextView) label.get();
    }

    private static Drawable badge(Card card) throws Exception {
        return AsyncVoteCountsTest.<Card, Drawable>map(FeedEngagementCountsPatch.class, "badges").get(card);
    }

    private static String badgeText(Card card) throws Exception {
        Drawable badge = badge(card);
        return (String) field(badge.getClass(), "countText").get(badge);
    }

    private static int listenerCount(ReturnYouTubeDislike request) throws Exception {
        return ((Set<?>) field(ReturnYouTubeDislike.class, "listeners").get(request)).size();
    }

    private static Field field(Class<?> owner, String name) throws Exception {
        Field field = owner.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    @SuppressWarnings("unchecked")
    private static <K, V> Map<K, V> map(Class<?> owner, String name) throws Exception {
        return (Map<K, V>) field(owner, name).get(null);
    }

    private record Request(ReturnYouTubeDislike data, Runnable response) {
        void complete() {
            response.run();
        }
    }

    private record VoteRow(LithoFixture segmented, NativeTextFixture drawable,
                           LithoFixture rollingParent, TextView rolling, String modelText) {}

    // The stock APK's two patched layout entry points resolve the component's source text, and its
    // TextContent drawable exposes the resulting mounted text. Keep that contract in the fixture.
    private static final class LithoFixture extends FrameLayout implements LithoRelayoutPatch.LithoViewInterface {
        int relayouts;
        NativeTextFixture drawable;

        LithoFixture(Context context) {
            super(context);
        }

        @Override
        public void patch_forceRelayout() {
            relayouts++;
            if (drawable != null) {
                drawable.mount();
            }
        }

        @Override
        public void patch_forceRemount() {
            throw new AssertionError("Publishing counts must not remount unrelated content");
        }
    }

    private static final class NativeTextFixture extends Drawable implements TextContent {
        final CharSequence source;
        Layout layout;
        CharSequence text;

        NativeTextFixture(CharSequence source) {
            this.source = source;
        }

        void mount() {
            CharSequence resolved = ReturnYouTubeDislikePatch.resolveSegmentedCount(source);
            if (ReturnYouTubeDislikePatch.reuseSegmentedCountLayout(layout, resolved) == null) {
                TextPaint paint = new TextPaint();
                paint.setTextSize(16);
                layout = StaticLayout.Builder.obtain(resolved, 0, resolved.length(), paint, 400).build();
            }
            text = layout.getText();
            LithoRelayoutPatch.onLithoTextMounted(this, text);
        }

        @Override public List<CharSequence> getTextItems() { return List.of(text); }
        @Override public void draw(Canvas canvas) {}
        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter filter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class Card extends ComponentHost {
        Card(Context context) {
            super(context);
        }

        @Override public TextContent getTextContent() { return List::of; }

        @Override protected void onLayout(boolean changed, int left, int top, int right, int bottom) {}
    }
}
