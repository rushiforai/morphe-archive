package app.morphe.extension.pinedrama.comment;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.view.View;
import android.view.ViewGroup;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * The keyword filter's reach over comments PineDrama shows translated.
 *
 * <p>The page filter judges the original text when the page loads. A translation lands later,
 * in the same member, so a blocked phrase the original lacked appeared on screen. The filter
 * now judges the translation when the batch completes and the shown text at every bind.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class TranslatedCommentFilterTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String FAMILY = "comment keyword filter";

    /** Stands in for the comment model: the page filter's members plus the translation ones. */
    public static class Comment {
        public final String cid;
        public String text;
        public String translatedText;
        public boolean isTranslated;

        Comment(String cid, String text) {
            this.cid = cid;
            this.text = text;
        }

        public String getCid() { return cid; }
        public String getText() { return text; }
        public String getTranslatedText() { return translatedText; }
        public boolean isTranslated() { return isTranslated; }
    }

    /** A host build whose comment no longer says whether it is showing a translation. */
    public static class CommentWithoutFlag {
        public final String cid = "cid-flagless";
        public String getCid() { return cid; }
        public String getText() { return "the cat"; }
    }

    /** Stands in for PineDrama's TranslationResult, the shape the completion runner carries. */
    public static class Result {
        public final String contentId;
        public final String translatedContent;

        Result(String contentId, String translatedContent) {
            this.contentId = contentId;
            this.translatedContent = translatedContent;
        }
    }

    /** A host build whose result lost the member the filter reads. */
    public static class ResultWithoutContent {
        public final String contentId = "cid-1";
    }

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        Settings.COMMENT_KEYWORD_FILTER.save(true);
        Settings.COMMENT_BLOCKED_KEYWORDS.save("the");
        HookStatus.clear();
        TranslatedCommentFilter.resetForTests();
    }

    @After public void tearDown() {
        Settings.COMMENT_KEYWORD_FILTER.save(false);
        Settings.COMMENT_BLOCKED_KEYWORDS.save("");
        Settings.BLOCK_FROM_COMMENT.resetToDefault();
        Settings.COMMENT_LINKS.resetToDefault();
        Settings.COMMENT_BATCH_TRANSLATION.resetToDefault();
        HookStatus.clear();
        TranslatedCommentFilter.resetForTests();
    }

    @Test public void aTranslatedCommentShowingABlockedPhraseCollapsesItsCell() {
        Comment comment = new Comment("cid-1", "the cat");
        comment.isTranslated = true;
        View cell = cell();

        TranslatedCommentFilter.onCellBound(cell, comment);

        assertCollapsed(cell);
    }

    @Test public void anUntranslatedCommentIsLeftToThePageFilter() {
        // The page filter judged this text when the page loaded; if it is still here, the list
        // could not be changed, and hiding it at bind would be a second feature.
        View cell = cell();

        TranslatedCommentFilter.onCellBound(cell, new Comment("cid-1", "the cat"));

        assertShowing(cell);
    }

    @Test public void aRecycledCellGetsItsSizeBackForACleanComment() {
        Comment blocked = new Comment("cid-1", "the cat");
        blocked.isTranslated = true;
        Comment clean = new Comment("cid-2", "a dog");
        clean.isTranslated = true;
        View cell = cell();

        TranslatedCommentFilter.onCellBound(cell, blocked);
        assertCollapsed(cell);
        TranslatedCommentFilter.onCellBound(cell, clean);

        assertShowing(cell);
    }

    @Test public void theSupplementTranslationIsJudgedByWhatTheCellShows() {
        // The supplement path keeps the original in text and puts the translation beside it.
        Comment comment = new Comment("cid-1", "el gato");
        comment.translatedText = "the cat";
        comment.isTranslated = true;
        View cell = cell();

        TranslatedCommentFilter.onCellBound(cell, comment);

        assertCollapsed(cell);
    }

    @Test public void theSwitchGoingOffGivesACollapsedCellBack() {
        Comment comment = new Comment("cid-1", "the cat");
        comment.isTranslated = true;
        View cell = cell();
        TranslatedCommentFilter.onCellBound(cell, comment);
        assertCollapsed(cell);

        Settings.COMMENT_KEYWORD_FILTER.save(false);
        TranslatedCommentFilter.onCellBound(cell, comment);

        assertShowing(cell);
        assertFalse(TranslatedCommentFilter.active());
    }

    @Test public void aCommentThatCannotSayWhetherItIsTranslatedIsNamed() {
        View cell = cell();

        TranslatedCommentFilter.onCellBound(cell, new CommentWithoutFlag());

        assertShowing(cell);
        List<String> missing = HookStatus.missing(FAMILY);
        assertEquals(missing.toString(), 1, missing.size());
        assertTrue(missing.toString(), missing.get(0).contains("isTranslated"));
    }

    /**
     * The production bind path is Comment tools', and it has to give a collapsed cell back once
     * the filter goes off, however the other comment tools are set, since a pooled cell keeps
     * its zero size until something restores it.
     */
    @Test public void theCommentToolsBindGivesACollapsedCellBackOnceTheFilterIsOff() {
        Settings.BLOCK_FROM_COMMENT.save(false);
        Settings.COMMENT_LINKS.save(false);
        CellComment comment = new CellComment("cid-1", "the cat");
        comment.isTranslated = true;
        View cell = cell();

        CommentTools.registerCommentCell(cell, new CellManager(comment));
        assertCollapsed(cell);

        Settings.COMMENT_KEYWORD_FILTER.save(false);
        CommentTools.registerCommentCell(cell, new CellManager(new CellComment("cid-2", "un perro")));

        assertShowing(cell);
        assertFalse(TranslatedCommentFilter.anyCollapsed());
    }

    /**
     * Comment search binds right after the filter, and with an empty box every comment matches.
     * It used to show the collapsed cell again, zero wide, so the filter hid nothing while
     * search was on. Once the filter lets the comment through, search owns the row again.
     */
    @Test public void commentSearchLeavesACellTheFilterCollapsedAlone() {
        Settings.BLOCK_FROM_COMMENT.save(false);
        Settings.COMMENT_LINKS.save(false);
        Settings.COMMENT_SEARCH.save(true);
        CommentSearch.setQuery("");
        try {
            CellComment comment = new CellComment("cid-1", "the cat");
            comment.isTranslated = true;
            View cell = cell();

            CommentTools.registerCommentCell(cell, new CellManager(comment));
            assertCollapsed(cell);

            CommentSearch.setQuery("cat");
            CommentTools.registerCommentCell(cell, new CellManager(comment));
            assertCollapsed(cell);

            Settings.COMMENT_KEYWORD_FILTER.save(false);
            CommentTools.registerCommentCell(cell, new CellManager(new CellComment("cid-2", "un gato")));
            assertEquals("search showed a row its box doesn't match", View.GONE, cell.getVisibility());

            CommentSearch.setQuery("");
            CommentTools.registerCommentCell(cell, new CellManager(new CellComment("cid-2", "un gato")));
            assertShowing(cell);
            assertFalse(TranslatedCommentFilter.anyCollapsed());
        } finally {
            Settings.COMMENT_SEARCH.resetToDefault();
            CommentSearch.setQuery("");
        }
    }

    /** The comment a bound cell's state holder carries, with the members Comment tools looks for. */
    public static class CellComment extends Comment {
        CellComment(String cid, String text) {
            super(cid, text);
        }

        public Object getUser() { return null; }
    }

    /** A bound cell's state holder, which is where Comment tools finds the comment. */
    public static class CellManager {
        public final Object comment;

        CellManager(Object comment) {
            this.comment = comment;
        }
    }

    /** PineDrama's batch task: the comments it asked about. */
    public static class Task {
        public final List<Object> LIZ;

        Task(List<?> requested) {
            LIZ = new java.util.ArrayList<>(requested);
        }
    }

    /** PineDrama's batch runner, as the completion hook is handed it: results, then the task. */
    public static class Runner {
        public final Object l0;
        public final Task l1;

        Runner(Object results, List<?> requested) {
            l0 = results;
            l1 = new Task(requested);
        }
    }

    private static View cell() {
        View cell = new View(RuntimeEnvironment.getApplication());
        cell.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return cell;
    }

    private static void assertCollapsed(View cell) {
        assertEquals("the cell is still shown", View.GONE, cell.getVisibility());
        assertEquals("the cell still takes its height", 0, cell.getLayoutParams().height);
        assertEquals("the cell still takes its width", 0, cell.getLayoutParams().width);
    }

    private static void assertShowing(View cell) {
        assertEquals("the cell is hidden", View.VISIBLE, cell.getVisibility());
        assertEquals("the cell lost its height", ViewGroup.LayoutParams.WRAP_CONTENT,
                cell.getLayoutParams().height);
        assertEquals("the cell lost its width", ViewGroup.LayoutParams.MATCH_PARENT,
                cell.getLayoutParams().width);
    }
}
