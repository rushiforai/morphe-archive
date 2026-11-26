/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */
package app.morphe.extension.youtube.patches;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.facebook.litho.ComponentHost;
import com.facebook.litho.TextContent;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.util.ReflectionHelpers;

import java.util.List;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.FeedVideoActionsPatch.VideoCard;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34, qualifiers = "mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class WatchLaterBadgePlacementTest {
    private Host root;
    private View menu;
    private VideoCard card;

    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        var info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.applicationInfo = app.getApplicationInfo();
        info.applicationInfo.flags |= ApplicationInfo.FLAG_SUPPORTS_RTL;
        info.versionName = "21.45.90";
        shadowOf(app.getPackageManager()).installPackage(info);
        Utils.setContext(app);
        Settings.RYD_ENABLED.save(false);

        root = new Host(app);
        root.layout(0, 0, 400, 600);
        menu = new View(app);
        menu.setContentDescription("Menu for First video");
        mount(root, menu, 350, 500, 390, 540);
        card = new VideoCard();
    }

    @Test
    public void usesTheInsetImageRatherThanTheOuterDurationHostEvenWithRydOff() {
        Host durationHost = new Host(root.getContext(), "8:58");
        mount(root, durationHost, 0, 0, 400, 225);
        mount(durationHost, new ImageView(root.getContext()), 12, 6, 388, 218);

        card.bind(root, menu, true);

        Rect drawn = assertDrawnAt(346, 16, 380, 50);
        assertTrue(card.isBadgeHit(root, drawn.centerX(), drawn.centerY()));
        assertTrue(card.isBadgeHit(root, drawn.right + 8, drawn.centerY()));
        assertFalse(card.isBadgeHit(root, drawn.right + 9, drawn.centerY()));
        assertFalse(card.isBadgeHit(root, drawn.centerX(), drawn.top - 9));
    }

    @Test
    public void retainsAMountedFrameAcrossClippingButNotAcrossRecyclingOfTheSameMenuView() {
        ImageView image = new ImageView(root.getContext());
        mount(root, image, 12, 6, 388, 218);
        card.bind(root, menu, true);
        Rect drawn = assertDrawnAt(346, 16, 380, 50);

        root.removeView(image);
        mount(root, new Host(root.getContext(), "Text above the thumbnail"), 0, 0, 200, 20);
        card.bind(root, menu, true);
        assertDrawnAt(346, 16, 380, 50);
        assertTrue(card.isBadgeHit(root, drawn.centerX(), drawn.centerY()));

        menu.setContentDescription("Menu for Second video");
        card.bind(root, menu, true);
        assertTrue(renderedBounds().isEmpty());
        assertFalse(card.isBadgeHit(root, drawn.centerX(), drawn.centerY()));

        mount(root, image, 8, 12, 390, 227);
        card.bind(root, menu, true);
        Rect remounted = assertDrawnAt(348, 22, 382, 56);
        assertTrue(card.isBadgeHit(root, remounted.centerX(), remounted.centerY()));
    }

    @Test
    public void retainsTheFullBleedGeometryAndMirrorsAnInsetFrameInRtl() {
        ImageView image = new ImageView(root.getContext());
        mount(root, image, 0, 0, 400, 225);
        card.bind(root, menu, true);
        assertDrawnAt(358, 10, 392, 44);

        root.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
        image.layout(12, 6, 388, 218);
        card.bind(root, menu, true);

        Rect drawn = assertDrawnAt(20, 16, 54, 50);
        assertTrue(card.isBadgeHit(root, drawn.centerX(), drawn.centerY()));
        assertFalse(card.isBadgeHit(root, 375, drawn.centerY()));
    }

    private Rect assertDrawnAt(int left, int top, int right, int bottom) {
        Rect drawn = renderedBounds();
        assertEquals(new Rect(left, top, right, bottom), drawn);
        return drawn;
    }

    private Rect renderedBounds() {
        View overlay = ReflectionHelpers.getField(root.getOverlay(), "mOverlayViewGroup");
        Bitmap bitmap = Bitmap.createBitmap(root.getWidth(), root.getHeight(), Bitmap.Config.ARGB_8888);
        try {
            overlay.draw(new Canvas(bitmap));
            Rect bounds = new Rect();
            for (int y = 0; y < bitmap.getHeight(); y++) {
                for (int x = 0; x < bitmap.getWidth(); x++) {
                    if (Color.alpha(bitmap.getPixel(x, y)) != 0) {
                        bounds.union(x, y, x + 1, y + 1);
                    }
                }
            }
            return bounds;
        } finally {
            bitmap.recycle();
        }
    }

    private static void mount(Host parent, View child, int left, int top, int right, int bottom) {
        parent.addView(child, new ViewGroup.LayoutParams(right - left, bottom - top));
        child.layout(left, top, right, bottom);
    }

    private static final class Host extends ComponentHost {
        private final List<CharSequence> text;

        Host(Context context, CharSequence... text) {
            super(context);
            this.text = List.of(text);
        }

        @Override
        public TextContent getTextContent() {
            return () -> text;
        }

        @Override
        protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        }
    }
}
