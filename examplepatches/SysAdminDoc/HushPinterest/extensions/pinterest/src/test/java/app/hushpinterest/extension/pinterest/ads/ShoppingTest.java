/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import static org.junit.Assert.*;
import java.lang.annotation.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import app.hushpinterest.extension.pinterest.settings.*;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ShoppingTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();
    @Retention(RetentionPolicy.RUNTIME) @Target(ElementType.FIELD)
    @interface Json { String value(); }
    enum Kind { SHOPPING_SPOTLIGHT, BOARD_SHOP_THE_LOOK, RELATED_RECIPES_COLLAGE }
    static final class Model {
        @Json("is_shoppable") Boolean shoppable;
        @Json("is_sponsored") Boolean sponsored;
        @Json("is_eligible_for_related_products") Boolean eligible;
        @Json("featured_board_metadata") Object featured;
        @Json("story_type") Object story;
    }
    @Before public void installed() {
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_SHOPPING));
        Settings.HIDE_SHOPPING.resetToDefault();
    }
    @After public void reset() {
        Settings.HIDE_SHOPPING.resetToDefault();
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        ModelFields.clearForTests();
    }
    @Test public void commercialFlagsAndBothStoryRepresentationsAreRecognized() {
        Model model = new Model();
        model.shoppable = true;
        assertTrue(Shopping.isShopping(model));
        model.shoppable = false;
        model.sponsored = true;
        assertTrue(Shopping.isShopping(model));
        model.sponsored = false;
        model.featured = new Object();
        assertTrue(Shopping.isShopping(model));
        model.featured = null;
        model.story = Kind.SHOPPING_SPOTLIGHT;
        assertTrue(Shopping.isShopping(model));
        model.story = "board_shop_the_look";
        assertTrue(Shopping.isShopping(model));
        model.story = Kind.RELATED_RECIPES_COLLAGE;
        model.eligible = true;
        assertFalse(Shopping.isShopping(model));
        assertFalse(Shopping.isShopping(null));
        assertFalse(Shopping.isShopping(new Object()));
    }
    @Test public void itStartsOffFiltersImmutablyWhenEnabledAndPauseRestoresTheList() {
        Model plain = new Model();
        Model product = new Model();
        product.shoppable = true;
        List<Model> page = Collections.unmodifiableList(Arrays.asList(plain, product));
        assertSame(page, FeedFilter.filter(page));
        Settings.HIDE_SHOPPING.save(true);
        assertEquals(Collections.singletonList(plain), FeedFilter.filter(page));
        assertEquals(2, page.size());
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertSame(page, FeedFilter.filter(page));
    }
    @Test public void aShoppingSwitchCannotActWithoutItsInstalledCapability() {
        Model product = new Model();
        product.shoppable = true;
        Settings.HIDE_SHOPPING.save(true);
        PatchFamilyForTests.capabilities(Collections.emptySet());
        List<Model> page = Collections.singletonList(product);
        assertSame(page, FeedFilter.filter(page));
    }
}
