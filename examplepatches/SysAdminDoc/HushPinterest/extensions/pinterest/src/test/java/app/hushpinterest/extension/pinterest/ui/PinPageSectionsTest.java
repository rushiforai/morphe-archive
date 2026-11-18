/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

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

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PinPageSectionsTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    /** Pinterest's component types, which keep these names. */
    public enum Section {
        PIN_CLOSEUP_TITLE, PIN_CLOSEUP_MACHINE_TRANSLATIONS, PIN_CLOSEUP_SOURCE_DESCRIPTION, PIN_CLOSEUP_LINK, PIN_CLOSEUP_BODY
    }

    /** A closeup module as far as the hooks can tell. */
    public static class Module extends LinearLayout {
        private final Section section;

        Module(Section section) {
            super(RuntimeEnvironment.getApplication());
            this.section = section;
        }

        public Section getComponentType() {
            return section;
        }
    }

    public static final class PinCloseupCreatorAttributionView {}

    public static final class AvatarWithTitleAndSubtitleView {}

    public static final class CreatorModule extends Module {
        PinCloseupCreatorAttributionView row;

        CreatorModule() {
            super(Section.PIN_CLOSEUP_LINK);
        }
    }

    public static final class PromotedCreatorModule extends Module {
        AvatarWithTitleAndSubtitleView row;

        PromotedCreatorModule() {
            super(Section.PIN_CLOSEUP_LINK);
        }
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.HIDE_PIN_DESCRIPTION.resetToDefault();
        Settings.HIDE_PIN_AUTHOR.resetToDefault();
        HookStatus.clear();
    }

    /** A title module holding its row and, when asked, the added line. */
    private static Module title(boolean line, int lineVisibility) {
        Module module = new Module(Section.PIN_CLOSEUP_TITLE);
        module.addView(new LinearLayout(module.getContext()));
        if (line) {
            TextView added = new TextView(module.getContext());
            added.setTag(PostedDate.LINE_TAG);
            added.setVisibility(lineVisibility);
            module.addView(added);
        }
        return module;
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    @Test public void offByDefaultEveryModuleKeepsPinterestsAnswer() {
        Module description = new Module(Section.PIN_CLOSEUP_SOURCE_DESCRIPTION);
        CreatorModule creator = new CreatorModule();
        assertEquals(1, PinPageSections.description(description, 1));
        assertEquals(1, PinPageSections.author(creator, 1));
        assertEquals(View.VISIBLE, description.getVisibility());
        assertEquals(View.VISIBLE, creator.getVisibility());
    }

    @Test public void theDescriptionAndItsTranslationGoAndAreCounted() {
        Settings.HIDE_PIN_DESCRIPTION.save(true);
        for (Section section : new Section[] {Section.PIN_CLOSEUP_SOURCE_DESCRIPTION, Section.PIN_CLOSEUP_MACHINE_TRANSLATIONS}) {
            Module module = new Module(section);
            assertEquals(section.name(), 0, PinPageSections.description(module, 1));
            assertEquals(section.name(), View.GONE, module.getVisibility());
        }
        assertTrue(report(), report().contains("pin description hidden"));
    }

    @Test public void aTitleWithNoLineGoesWhole() {
        Settings.HIDE_PIN_DESCRIPTION.save(true);
        Module module = title(false, View.GONE);
        assertEquals(0, PinPageSections.description(module, 1));
        assertEquals(View.GONE, module.getVisibility());
    }

    @Test public void aHiddenLineDoesNotKeepTheTitle() {
        Settings.HIDE_PIN_DESCRIPTION.save(true);
        Module module = title(true, View.GONE);
        assertEquals(0, PinPageSections.description(module, 1));
    }

    @Test public void aVisibleLineStaysWhileTheTitleRowGoes() {
        Settings.HIDE_PIN_DESCRIPTION.save(true);
        Module module = title(true, View.VISIBLE);
        assertEquals("the module has to run its update for the line", 1, PinPageSections.description(module, 1));
        assertEquals(View.VISIBLE, module.getVisibility());
        assertEquals("the title row", View.GONE, module.getChildAt(0).getVisibility());
        assertEquals("the line", View.VISIBLE, module.getChildAt(1).getVisibility());
    }

    @Test public void turningTheSwitchOffBringsBackWhatItHid() {
        Settings.HIDE_PIN_DESCRIPTION.save(true);
        Module kept = title(true, View.VISIBLE);
        Module whole = new Module(Section.PIN_CLOSEUP_SOURCE_DESCRIPTION);
        PinPageSections.description(kept, 1);
        PinPageSections.description(whole, 1);
        Settings.HIDE_PIN_DESCRIPTION.save(false);
        assertEquals(1, PinPageSections.description(kept, 1));
        assertEquals(1, PinPageSections.description(whole, 1));
        assertEquals(View.VISIBLE, kept.getChildAt(0).getVisibility());
        assertEquals(View.VISIBLE, whole.getVisibility());
    }

    @Test public void aModulePinterestAlreadyLeftOutStaysLeftOut() {
        Settings.HIDE_PIN_DESCRIPTION.save(true);
        Settings.HIDE_PIN_AUTHOR.save(true);
        assertEquals(0, PinPageSections.description(new Module(Section.PIN_CLOSEUP_SOURCE_DESCRIPTION), 0));
        assertEquals(0, PinPageSections.author(new CreatorModule(), 0));
    }

    @Test public void otherSectionsNeverAnswerDifferently() {
        Settings.HIDE_PIN_DESCRIPTION.save(true);
        Settings.HIDE_PIN_AUTHOR.save(true);
        Module body = new Module(Section.PIN_CLOSEUP_BODY);
        assertEquals(1, PinPageSections.description(body, 1));
        assertEquals(1, PinPageSections.author(body, 1));
        assertEquals(View.VISIBLE, body.getVisibility());
    }

    @Test public void bothKindsOfCreatorRowGoAndAnAdsLinkLabelStays() {
        Settings.HIDE_PIN_AUTHOR.save(true);
        CreatorModule organic = new CreatorModule();
        PromotedCreatorModule promoted = new PromotedCreatorModule();
        Module adLabel = new Module(Section.PIN_CLOSEUP_LINK);
        assertEquals(0, PinPageSections.author(organic, 1));
        assertEquals(0, PinPageSections.author(promoted, 1));
        assertEquals(View.GONE, organic.getVisibility());
        assertEquals("a link module with no creator row", 1, PinPageSections.author(adLabel, 1));
        assertTrue(report(), report().contains("pin author hidden"));
        Settings.HIDE_PIN_AUTHOR.save(false);
        assertEquals(1, PinPageSections.author(organic, 1));
        assertEquals(View.VISIBLE, organic.getVisibility());
    }

    @Test public void eachSwitchWorksAlone() {
        Settings.HIDE_PIN_AUTHOR.save(true);
        assertEquals("author alone keeps the description", 1,
                PinPageSections.description(new Module(Section.PIN_CLOSEUP_SOURCE_DESCRIPTION), 1));
        Settings.HIDE_PIN_AUTHOR.save(false);
        Settings.HIDE_PIN_DESCRIPTION.save(true);
        assertEquals("description alone keeps the author", 1, PinPageSections.author(new CreatorModule(), 1));
    }

    @Test public void pausedEveryModuleKeepsPinterestsAnswer() {
        Settings.HIDE_PIN_DESCRIPTION.save(true);
        Settings.HIDE_PIN_AUTHOR.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertEquals(1, PinPageSections.description(new Module(Section.PIN_CLOSEUP_SOURCE_DESCRIPTION), 1));
        assertEquals(1, PinPageSections.author(new CreatorModule(), 1));
    }

    @Test public void aViewThatIsNoModuleIsLeftAlone() {
        Settings.HIDE_PIN_DESCRIPTION.save(true);
        Settings.HIDE_PIN_AUTHOR.save(true);
        View plain = new View(RuntimeEnvironment.getApplication());
        assertEquals(1, PinPageSections.description(plain, 1));
        assertEquals(1, PinPageSections.author(plain, 1));
        assertEquals(1, PinPageSections.description(null, 1));
        assertEquals(1, PinPageSections.author(null, 1));
    }
}
