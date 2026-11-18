/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ImageSizeLineTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    private static final long OCT_12_2026 = 1_791_806_400_000L;
    private static final int CHEVRON_ID = 0x7f0b1234;
    private static final char TIMES = (char) 0xD7;
    private static final char DOT = (char) 0xB7;
    private static final char ISOLATE_START = (char) 0x2068, ISOLATE_END = (char) 0x2069;

    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.FIELD)
    public @interface Json { String value(); }

    /** Stands in for Pinterest's pin model, with the fields the media lookup reads. */
    static final class Pin {
        @Json("id") String id = "123456789";
        @Json("images") Object images;
        @Json("videos") Object videos;
        @Json("created_at") Object createdAt;
    }

    private static Map<String, Object> image(String size, Object width, Object height) {
        Map<String, Object> image = new HashMap<>();
        image.put("url", "https://i.pinimg.com/" + size + "/aa/bb/cc/aabbcc.jpg");
        image.put("width", width);
        image.put("height", height);
        return image;
    }

    /** A picture pin carrying a small and a large copy, as the app's API sends them. */
    private static Pin picture() {
        Pin pin = new Pin();
        Map<String, Object> images = new HashMap<>();
        images.put("236x", image("236x", 236, 354));
        images.put("736x", image("736x", 736, 1104));
        pin.images = images;
        return pin;
    }

    private static Pin video() {
        Pin pin = picture();
        Map<String, Object> clip = new HashMap<>();
        clip.put("url", "https://v1.pinimg.com/videos/mc/720p/aa/bb/cc/aabbcc.mp4");
        clip.put("width", 720);
        clip.put("height", 1280);
        pin.videos = Collections.singletonMap("video_list", Collections.singletonMap("V_720P", clip));
        return pin;
    }

    private static Context pinterest() {
        Context app = RuntimeEnvironment.getApplication();
        Resources base = app.getResources();
        @SuppressWarnings("deprecation")
        Resources resources = new Resources(base.getAssets(), base.getDisplayMetrics(), base.getConfiguration()) {
            @Override public int getIdentifier(String name, String type, String owner) {
                return PostedDate.TITLE_CHEVRON.equals(name) && "id".equals(type) ? CHEVRON_ID : super.getIdentifier(name, type, owner);
            }
        };
        return new ContextWrapper(app) {
            @Override public Resources getResources() {
                return resources;
            }
        };
    }

    private static LinearLayout module() {
        Context pinterest = pinterest();
        LinearLayout module = new LinearLayout(pinterest);
        LinearLayout row = new LinearLayout(pinterest);
        row.addView(new TextView(pinterest));
        View chevron = new View(pinterest);
        chevron.setId(CHEVRON_ID);
        row.addView(chevron);
        module.addView(row);
        return module;
    }

    private static TextView line(LinearLayout module) {
        return module.findViewWithTag(PostedDate.LINE_TAG);
    }

    private static String shown(LinearLayout module) {
        return line(module).getText().toString().replace(String.valueOf(ISOLATE_START), "").replace(String.valueOf(ISOLATE_END), "");
    }

    private static String size(String dimensions, String megapixels) {
        return dimensions.replace('x', TIMES) + " " + DOT + " " + megapixels + " MP";
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.SHOW_IMAGE_SIZE.resetToDefault();
        Settings.SHOW_POSTED_DATE.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTheModuleStaysAsPinterestBuiltIt() {
        LinearLayout module = module();
        PostedDate.showSize(module, picture());
        assertEquals(1, module.getChildCount());
        assertEquals(LinearLayout.HORIZONTAL, module.getOrientation());
    }

    @Test public void onItShowsTheLargestCopysSizeAndCountsIt() {
        Settings.SHOW_IMAGE_SIZE.save(true);
        LinearLayout module = module();
        PostedDate.showSize(module, picture());
        assertEquals(size("736 x 1104", "0.8"), shown(module));
        assertEquals(View.VISIBLE, line(module).getVisibility());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("image size shown"));
    }

    @Test public void aTinyImageLeavesOutTheMegapixels() {
        Settings.SHOW_IMAGE_SIZE.save(true);
        Pin pin = new Pin();
        pin.images = Collections.singletonMap("75x", image("75x", 75, 75));
        LinearLayout module = module();
        PostedDate.showSize(module, pin);
        assertEquals("75 x 75".replace('x', TIMES), shown(module));
    }

    @Test public void itSitsBesideThePostedDateInEitherOrder() {
        Settings.SHOW_IMAGE_SIZE.save(true);
        Settings.SHOW_POSTED_DATE.save(true);
        Pin pin = picture();
        pin.createdAt = new Date(OCT_12_2026);
        String expected = "Posted Oct 12, 2026 " + DOT + " " + size("736 x 1104", "0.8");

        LinearLayout dateFirst = module();
        PostedDate.show(dateFirst, pin);
        PostedDate.showSize(dateFirst, pin);
        assertEquals(expected, shown(dateFirst));

        LinearLayout sizeFirst = module();
        PostedDate.showSize(sizeFirst, pin);
        PostedDate.show(sizeFirst, pin);
        assertEquals(expected, shown(sizeFirst));
        assertEquals("one line for both", 2, sizeFirst.getChildCount());
    }

    @Test public void itStillShowsWithThePostedDateOff() {
        Settings.SHOW_IMAGE_SIZE.save(true);
        Pin pin = picture();
        pin.createdAt = new Date(OCT_12_2026);
        LinearLayout module = module();
        PostedDate.show(module, pin);
        PostedDate.showSize(module, pin);
        assertEquals(size("736 x 1104", "0.8"), shown(module));
    }

    @Test public void turningItOffLeavesTheDateAlone() {
        Settings.SHOW_IMAGE_SIZE.save(true);
        Settings.SHOW_POSTED_DATE.save(true);
        Pin pin = picture();
        pin.createdAt = new Date(OCT_12_2026);
        LinearLayout module = module();
        PostedDate.show(module, pin);
        PostedDate.showSize(module, pin);
        Settings.SHOW_IMAGE_SIZE.save(false);
        PostedDate.showSize(module, pin);
        assertEquals("Posted Oct 12, 2026", shown(module));
        assertEquals(View.VISIBLE, line(module).getVisibility());
    }

    @Test public void theLineGoesWhenNeitherHasAnythingToShow() {
        Settings.SHOW_IMAGE_SIZE.save(true);
        LinearLayout module = module();
        PostedDate.showSize(module, picture());
        PostedDate.showSize(module, video());
        assertEquals(View.GONE, line(module).getVisibility());
    }

    @Test public void aVideoOrAPinWithoutSizesAddsNoLine() {
        Settings.SHOW_IMAGE_SIZE.save(true);
        Pin sizeless = new Pin();
        sizeless.images = Collections.singletonMap("736x", image("736x", null, null));
        Pin zero = new Pin();
        zero.images = Collections.singletonMap("736x", image("736x", 0, 0));
        for (Object pin : new Object[] {video(), sizeless, zero, new Pin(), "not a pin", null}) {
            LinearLayout module = module();
            PostedDate.showSize(module, pin);
            assertNull(String.valueOf(pin), line(module));
        }
    }

    @Test public void pausedNothingIsAdded() {
        Settings.SHOW_IMAGE_SIZE.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        LinearLayout module = module();
        PostedDate.showSize(module, picture());
        assertNull(line(module));
    }

    @Test public void aModuleWithoutTheTitleRowGetsNoLine() {
        Settings.SHOW_IMAGE_SIZE.save(true);
        LinearLayout module = new LinearLayout(pinterest());
        module.addView(new LinearLayout(module.getContext()));
        PostedDate.showSize(module, picture());
        assertNull(line(module));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("image size skipped: module holds no title row"));
    }
}
