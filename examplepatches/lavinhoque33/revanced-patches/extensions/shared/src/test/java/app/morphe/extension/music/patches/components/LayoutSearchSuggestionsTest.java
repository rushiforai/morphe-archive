/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.music.patches.components;

import static org.junit.Assert.*;

import android.content.pm.PackageInfo;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class LayoutSearchSuggestionsTest {
    private LinearLayout root;
    private EditText query;
    private View suggestions;

    @Before
    public void setup() throws Exception {
        var context = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = context.getPackageName();
        packageInfo.versionName = "9.40.51";
        packageInfo.applicationInfo = context.getApplicationInfo();
        Shadows.shadowOf(context.getPackageManager()).installPackage(packageInfo);

        Utils.setContext(context);
        Settings.HIDE_YOU_MAY_ALSO_LIKE_SECTION.save(true);
        Field searchId = LayoutComponentsFilter.class.getDeclaredField("searchEditTextId");
        searchId.setAccessible(true);
        searchId.setInt(null, 123);

        root = new LinearLayout(context);
        query = new EditText(context);
        query.setId(123);
        suggestions = new View(context);
        root.addView(query);
        root.addView(suggestions);
    }

    @Test
    public void onlyEmptyQueryCanHideSuggestions() {
        assertTrue(LayoutComponentsFilter.hideYouMayAlsoLikeSection(suggestions));
        query.setText("Björk");
        assertFalse(LayoutComponentsFilter.hideYouMayAlsoLikeSection(suggestions));
        query.setText(" ");
        assertFalse(LayoutComponentsFilter.hideYouMayAlsoLikeSection(suggestions));
        query.setText("");
        assertTrue(LayoutComponentsFilter.hideYouMayAlsoLikeSection(suggestions));
    }

    @Test
    public void disabledSettingKeepsEmptyQuerySuggestions() {
        Settings.HIDE_YOU_MAY_ALSO_LIKE_SECTION.save(false);
        assertFalse(LayoutComponentsFilter.hideYouMayAlsoLikeSection(suggestions));
    }

    @Test
    public void unreadableQueryNeverHidesSuggestions() {
        assertFalse(LayoutComponentsFilter.hideYouMayAlsoLikeSection(null));
        root.removeView(query);
        assertFalse(LayoutComponentsFilter.hideYouMayAlsoLikeSection(suggestions));
        View notATextView = new View(root.getContext());
        notATextView.setId(123);
        root.addView(notATextView);
        assertFalse(LayoutComponentsFilter.hideYouMayAlsoLikeSection(suggestions));
    }
}
