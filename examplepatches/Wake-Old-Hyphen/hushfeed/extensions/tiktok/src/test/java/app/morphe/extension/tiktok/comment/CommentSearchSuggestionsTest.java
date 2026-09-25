package app.morphe.extension.tiktok.comment;

import static org.junit.Assert.*;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import java.util.Map;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class CommentSearchSuggestionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Test public void bannerHidingDoesNotFollowEitherOtherSearchSwitch() throws Exception {
        Map<Setting<?>, Object> original = Map.of(
                Settings.HIDE_COMMENT_SEARCH_SUGGESTIONS, Settings.HIDE_COMMENT_SEARCH_SUGGESTIONS.get(),
                Settings.HIDE_SEARCH_SUGGESTIONS, Settings.HIDE_SEARCH_SUGGESTIONS.get(),
                Settings.COMMENT_SEARCH, Settings.COMMENT_SEARCH.get());
        try {
            for (boolean hide : new boolean[]{false, true}) {
                for (boolean search : new boolean[]{false, true}) {
                    for (boolean mainSuggestions : new boolean[]{false, true}) {
                        Setting.saveAll(Map.of(Settings.HIDE_COMMENT_SEARCH_SUGGESTIONS, hide,
                                Settings.COMMENT_SEARCH, search,
                                Settings.HIDE_SEARCH_SUGGESTIONS, mainSuggestions));
                        assertEquals(hide, CommentTools.shouldHideCommentSearchSuggestions());
                        assertEquals(search, Settings.COMMENT_SEARCH.get());
                        assertEquals(mainSuggestions, Settings.HIDE_SEARCH_SUGGESTIONS.get());
                    }
                }
            }
        } finally {
            Setting.saveAll(original);
        }
    }

    @Test public void cachedNativeHeadersRequireAnExplicitRestartNote() {
        assertTrue(Settings.HIDE_COMMENT_SEARCH_SUGGESTIONS.rebootApp);
        assertEquals(Boolean.FALSE, Settings.HIDE_COMMENT_SEARCH_SUGGESTIONS.defaultValue);
    }
}
