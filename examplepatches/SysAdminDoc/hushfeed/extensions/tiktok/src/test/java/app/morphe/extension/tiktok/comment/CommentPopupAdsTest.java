package app.morphe.extension.tiktok.comment;

import static org.junit.Assert.*;

import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** The surprise TikTok's comment surprise struct is built with, which every popup ad path reads. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class CommentPopupAdsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After public void tearDown() {
        PausedProcess.set(false);
        Settings.HIDE_COMMENT_EGGS.resetToDefault();
    }

    @Test public void theSwitchOnDropsAKeywordSurpriseAndOffKeepsIt() {
        Surprise brand = new Surprise(3, "#summerdrop");
        Settings.HIDE_COMMENT_EGGS.save(true);
        assertNull(CommentTools.commentSurprise(brand));
        Settings.HIDE_COMMENT_EGGS.save(false);
        assertSame(brand, CommentTools.commentSurprise(brand));
    }

    /** The review of 6346661c: nulling every surprise took TikTok's own first-comment celebration too. */
    @Test public void tiktoksFirstCommentCelebrationStaysWithTheSwitchOn() {
        Settings.HIDE_COMMENT_EGGS.save(true);
        Surprise firstComment = new Surprise(CommentTools.FIRST_COMMENT_SURPRISE, null);
        assertSame(firstComment, CommentTools.commentSurprise(firstComment));
        Surprise firstCommentNamingAWord = new Surprise(CommentTools.FIRST_COMMENT_SURPRISE, "first");
        assertSame("the first-comment type wins over a keyword",
                firstCommentNamingAWord, CommentTools.commentSurprise(firstCommentNamingAWord));
        Surprise noWord = new Surprise(2, "  ");
        assertSame("nothing a comment typed set it off", noWord, CommentTools.commentSurprise(noWord));
        Surprise noType = new Surprise(null, "#summerdrop");
        assertNull("a keyword with no type is still set off by words", CommentTools.commentSurprise(noType));
    }

    @Test public void noSurpriseStaysNone() {
        Settings.HIDE_COMMENT_EGGS.save(false);
        assertNull(CommentTools.commentSurprise(null));
        Settings.HIDE_COMMENT_EGGS.save(true);
        assertNull(CommentTools.commentSurprise(null));
    }

    @Test public void pausedTheSurpriseIsTikToks() {
        Surprise brand = new Surprise(3, "#summerdrop");
        Settings.HIDE_COMMENT_EGGS.save(true);
        PausedProcess.set(true);
        assertSame(brand, CommentTools.commentSurprise(brand));
    }

    /** TikTok's CommentSurprise, by the two fields the switch reads. */
    private static final class Surprise {
        public final Integer surpriseType;
        public final String keyword;

        Surprise(Integer surpriseType, String keyword) {
            this.surpriseType = surpriseType;
            this.keyword = keyword;
        }
    }
}
