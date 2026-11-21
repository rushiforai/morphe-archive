/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.youtube.patches.utils;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.util.ReflectionHelpers.ClassParameter.from;
import static org.robolectric.util.ReflectionHelpers.callConstructor;
import static org.robolectric.util.ReflectionHelpers.callStaticMethod;
import static org.robolectric.util.ReflectionHelpers.setStaticField;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Rect;
import android.text.TextPaint;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import org.junit.After;
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

import java.util.concurrent.Executor;
import java.util.function.Supplier;

import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.returnyoutubedislike.ReturnYouTubeDislike;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.utils.ThemeUtils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class WatchVoteLabelPlacementTest {
    private static final int FRAMES = 30;
    private static final Class<ReturnYouTubeDislikePatch> PATCH = ReturnYouTubeDislikePatch.class;
    private static final int ACCESSIBILITY_TAG = 0x7f0a0001;
    private ActivityController<Activity> activity;
    private CountingHost host;
    private FrameLayout row;
    private View likeButton;
    private View dislikeButton;
    private CountingLabel likeLabel;
    private CountingLabel dislikeLabel;

    @Before
    @SuppressWarnings("deprecation")
    public void setUp() {
        Context context = RuntimeEnvironment.getApplication();
        var info = new PackageInfo();
        info.packageName = context.getPackageName();
        info.applicationInfo = context.getApplicationInfo();
        info.applicationInfo.flags |= ApplicationInfo.FLAG_SUPPORTS_RTL;
        info.versionName = "21.45.90";
        Shadows.shadowOf(context.getPackageManager()).installPackage(info);
        Resources resources = context.getResources();
        Resources taggedResources = new Resources(
                resources.getAssets(), resources.getDisplayMetrics(), resources.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String type, String packageName) {
                return "elements_accessibility_view_tag_id".equals(name) && "id".equals(type)
                        ? ACCESSIBILITY_TAG
                        : super.getIdentifier(name, type, packageName);
            }
        };
        Utils.setContext(new ContextWrapper(context) {
            @Override
            public Resources getResources() {
                return taggedResources;
            }
        });
        RuntimeEnvironment.setFontScale(1f);
        Settings.RYD_ENABLED.save(true);
        Settings.DISABLE_LAYOUT_UPDATES.save(false);
        ThemeUtils.updateLightDarkModeStatus(1);
        PlayerType.setFromString(PlayerType.WATCH_WHILE_MAXIMIZED.name());
        activity = Robolectric.buildActivity(Activity.class).setup().visible();
        host = new CountingHost(context);
        row = new FrameLayout(context);
        likeButton = new View(context);
        dislikeButton = new View(context);
        likeButton.setTag(ACCESSIBILITY_TAG, "id.video.like");
        dislikeButton.setTag(ACCESSIBILITY_TAG, "id.video.dislike");
        likeLabel = new CountingLabel(context);
        dislikeLabel = new CountingLabel(context);

        activity.get().setContentView(host);
        activity.get().getWindow().getDecorView().layout(0, 0, 480, 640);
        host.layout(0, 0, 480, 300);
        host.addView(row);
        row.layout(0, 0, 400, 200);
        row.addView(likeButton);
        row.addView(dislikeButton);
        likeButton.layout(44, 70, 108, 114);
        dislikeButton.layout(190, 70, 254, 114);
        assertTrue(likeButton.isAttachedToWindow());
        assertTrue(dislikeButton.getLocalVisibleRect(new Rect()));

        seedCounts("fixture-000", "123K", "3.4K");

        host.getOverlay().add(likeLabel);
        host.getOverlay().add(dislikeLabel);
        bindAnchors();
        draw();
        assertEquals("123K", likeLabel.getText().toString());
        assertEquals("3.4K", dislikeLabel.getText().toString());
        assertEquals(View.VISIBLE, likeLabel.getVisibility());
        assertEquals(View.VISIBLE, dislikeLabel.getVisibility());
        assertEquals(76, centerX(likeLabel));
        assertEquals(222, centerX(dislikeLabel));
    }

    @After
    public void tearDown() {
        ReturnYouTubeDislikePatch.onRYDStatusChange();
        RuntimeEnvironment.setFontScale(1f);
        PlayerType.setFromString(PlayerType.NONE.name());
        if (activity != null) {
            activity.close();
        }
    }

    @Test
    public void measuresIdleAndMovingPlacement() {
        Rect initialLike = bounds(likeLabel);
        Rect initialDislike = bounds(dislikeLabel);
        Counts beforeIdle = counts();
        for (int frame = 0; frame < FRAMES; frame++) {
            draw();
            assertEquals(initialLike, bounds(likeLabel));
            assertEquals(initialDislike, bounds(dislikeLabel));
        }
        Counts idle = counts().minus(beforeIdle);
        report("idle", FRAMES, idle);
        assertEquals(new Counts(0, 0, 0, 0, 0), idle);

        Counts beforeMotion = counts();
        for (int frame = 1; frame <= FRAMES; frame++) {
            row.offsetLeftAndRight(1);
            draw();
            assertEquals(initialLike.left + frame, likeLabel.getLeft());
            assertEquals(initialDislike.left + frame, dislikeLabel.getLeft());
            assertEquals(initialLike.top, likeLabel.getTop());
            assertEquals(initialDislike.top, dislikeLabel.getTop());
        }
        Counts moving = counts().minus(beforeMotion);
        report("moving", FRAMES, moving);
        assertEquals(new Counts(0, 0, 0, 2 * FRAMES, 0), moving);

        Counts beforeChange = counts();
        setCounts("98765", "43210");
        draw();
        Counts changed = counts().minus(beforeChange);
        report("changed-text", 1, changed);
        assertEquals("98765", likeLabel.getText().toString());
        assertEquals("43210", dislikeLabel.getText().toString());
        assertTrue(changed.baselineReads() >= 2);
        assertTrue(changed.onMeasureCalls() >= 2);
        assertTrue(changed.hostInvalidations() >= 1);
    }

    @Test
    public void refitsFromFullTextWhenSlotsNarrowAndWiden() {
        String fullLikeCount = "1234567890123456";
        setCounts(fullLikeCount, "3.4K");
        draw();
        float wideTextSize = likeLabel.getTextSize();
        assertEquals(fullLikeCount, likeLabel.getText().toString());

        dislikeButton.layout(81, 70, 145, 114);
        draw();
        assertTrue(likeLabel.getText().toString().endsWith("…"));
        assertTrue(likeLabel.getTextSize() < wideTextSize);
        assertEquals(likeLabel.getTextSize(), dislikeLabel.getTextSize(), 0f);

        dislikeButton.layout(190, 70, 254, 114);
        draw();
        assertEquals(fullLikeCount, likeLabel.getText().toString());
        assertEquals(wideTextSize, likeLabel.getTextSize(), 0f);
    }

    @Test
    public void followsThemeFontScaleAndMirroredAnchors() {
        assertEquals(Color.BLACK, likeLabel.getCurrentTextColor());
        Counts beforeTheme = counts();
        ThemeUtils.updateLightDarkModeStatus(2);
        draw();
        assertEquals(Color.WHITE, likeLabel.getCurrentTextColor());
        assertEquals(Color.WHITE, dislikeLabel.getCurrentTextColor());
        assertEquals(new Counts(0, 0, 0, 0, 1), counts().minus(beforeTheme));

        float originalSize = likeLabel.getTextSize();
        RuntimeEnvironment.setFontScale(1.6f);
        draw();
        assertTrue(likeLabel.getTextSize() > originalSize);
        assertEquals(likeLabel.getTextSize(), dislikeLabel.getTextSize(), 0f);

        likeLabel.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
        dislikeLabel.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
        likeButton.layout(190, 70, 254, 114);
        dislikeButton.layout(44, 70, 108, 114);
        setCounts("١٢٣ ألف", "٣٫٤ ألف");
        draw();
        assertEquals("١٢٣ ألف", likeLabel.getText().toString());
        assertEquals("٣٫٤ ألف", dislikeLabel.getText().toString());
        assertEquals(222, centerX(likeLabel));
        assertEquals(76, centerX(dislikeLabel));

        row.setTranslationX(15);
        draw();
        assertEquals(237, centerX(likeLabel));
        assertEquals(91, centerX(dislikeLabel));
    }

    @Test
    public void rediscoversReboundAnchorsAndRestoresVisibility() {
        assertEquals(ACCESSIBILITY_TAG, ResourceUtils.getIdIdentifier("elements_accessibility_view_tag_id"));
        likeButton.setVisibility(View.INVISIBLE);
        draw();
        assertEquals(View.GONE, likeLabel.getVisibility());
        assertEquals(View.GONE, dislikeLabel.getVisibility());

        row.removeView(likeButton);
        likeButton = new View(row.getContext());
        likeButton.setTag(ACCESSIBILITY_TAG, "id.video.like");
        row.addView(likeButton);
        likeButton.layout(60, 70, 124, 114);
        // The production pre-draw listener, not the fixture binder, must find the replacement.
        draw();
        assertEquals(View.VISIBLE, likeLabel.getVisibility());
        assertEquals(View.VISIBLE, dislikeLabel.getVisibility());
        assertEquals(92, centerX(likeLabel));

        setCounts("", "3.4K");
        draw();
        assertEquals(View.GONE, likeLabel.getVisibility());
        assertEquals(View.VISIBLE, dislikeLabel.getVisibility());
        setCounts("321K", "3.4K");
        draw();
        assertEquals(View.VISIBLE, likeLabel.getVisibility());
        assertEquals("321K", likeLabel.getText().toString());
    }

    @Test
    public void restoresPlacementAfterExternalLabelLayout() {
        Rect original = bounds(likeLabel);
        likeLabel.layout(original.left + 20, original.top, original.right + 20, original.bottom);
        draw();
        assertEquals(original, bounds(likeLabel));

        int beforeMeasure = likeLabel.onMeasureCalls;
        likeLabel.requestLayout();
        assertTrue(likeLabel.isLayoutRequested());
        draw();
        assertFalse(likeLabel.isLayoutRequested());
        assertTrue(likeLabel.onMeasureCalls > beforeMeasure);
        assertEquals(original, bounds(likeLabel));
    }

    @Test
    public void videoSwitchRemovesOldLabelsBeforeNextCachedCounts() {
        ReturnYouTubeDislikePatch.newVideoLoaded("fixture-001");
        assertNull(likeLabel.getParent());
        assertNull(dislikeLabel.getParent());

        seedCounts("fixture-001", "1.2K", "89");
        likeLabel = new CountingLabel(row.getContext());
        dislikeLabel = new CountingLabel(row.getContext());
        host.getOverlay().add(likeLabel);
        host.getOverlay().add(dislikeLabel);
        bindAnchors();
        draw();
        assertEquals("1.2K", likeLabel.getText().toString());
        assertEquals("89", dislikeLabel.getText().toString());
        assertEquals(76, centerX(likeLabel));
        assertEquals(222, centerX(dislikeLabel));
    }

    private static void seedCounts(String videoId, String likes, String dislikes) {
        // This fixture tests placement with known formatted counts, not the network producer.
        var data = callConstructor(ReturnYouTubeDislike.class, from(String.class, videoId),
                from(Supplier.class, () -> null), from(Executor.class, Runnable::run));
        setStaticField(PATCH, "currentWatch", new ReturnYouTubeDislikePatch.WatchBinding(data));
        setCounts(likes, dislikes);
    }

    private void bindAnchors() {
        callStaticMethod(PATCH, "setRegularActionButtonCountAnchors",
                from(ViewGroup.class, host), from(View.class, likeButton), from(View.class, dislikeButton),
                from(TextView.class, likeLabel), from(TextView.class, dislikeLabel));
    }

    private static void setCounts(CharSequence likes, CharSequence dislikes) {
        setStaticField(PATCH, "regularLikeActionButtonCountText", likes);
        setStaticField(PATCH, "regularDislikeActionButtonCountText", dislikes);
    }

    private void draw() {
        // Dispatch the real production listener, without counting another test activity traversal.
        assertFalse(host.getViewTreeObserver().dispatchOnPreDraw());
    }

    private static Rect bounds(View view) {
        return new Rect(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
    }

    private static int centerX(View view) {
        return view.getLeft() + view.getWidth() / 2;
    }

    private Counts counts() {
        return new Counts(likeLabel.paintReads + dislikeLabel.paintReads,
                likeLabel.baselineReads + dislikeLabel.baselineReads,
                likeLabel.onMeasureCalls + dislikeLabel.onMeasureCalls,
                likeLabel.layoutCalls + dislikeLabel.layoutCalls, host.invalidations);
    }

    private static void report(String phase, int frames, Counts counts) {
        System.out.println("WATCH_VOTE_LABELS " + phase + " frames=" + frames + " " + counts);
    }

    // One baseline read marks one completed placement measurement pass (two View.measure calls in c99b9d1ee).
    // onMeasureCalls counts actual Android measurement callbacks independently of its measure cache.
    private record Counts(int paintReads, int baselineReads, int onMeasureCalls, int layoutCalls,
                          int hostInvalidations) {
        Counts minus(Counts previous) {
            return new Counts(paintReads - previous.paintReads, baselineReads - previous.baselineReads,
                    onMeasureCalls - previous.onMeasureCalls, layoutCalls - previous.layoutCalls,
                    hostInvalidations - previous.hostInvalidations);
        }
    }

    private static final class CountingLabel extends TextView {
        int paintReads;
        int baselineReads;
        int onMeasureCalls;
        int layoutCalls;

        CountingLabel(Context context) {
            super(context);
            setGravity(android.view.Gravity.CENTER);
            setIncludeFontPadding(false);
            setSingleLine(true);
            setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
        }

        @Override
        public TextPaint getPaint() {
            paintReads++;
            return super.getPaint();
        }

        @Override
        public int getBaseline() {
            baselineReads++;
            return super.getBaseline();
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            onMeasureCalls++;
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }

        @Override
        public void layout(int left, int top, int right, int bottom) {
            layoutCalls++;
            super.layout(left, top, right, bottom);
        }
    }

    private static final class CountingHost extends FrameLayout {
        int invalidations;

        CountingHost(Context context) {
            super(context);
        }

        @Override
        public void invalidate() {
            invalidations++;
            super.invalidate();
        }
    }
}
