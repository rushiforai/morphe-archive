package app.morphe.extension.tiktok.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.app.Activity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;

import org.junit.Before;
import org.junit.Test;
import org.robolectric.Robolectric;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * The caption and music line come back when their switch goes off, unlike the prompts,
 * which only need hiding until the next video.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class VideoOverlayHiderTest {
    /** Stands in for the clear display event TikTok posts. */
    public static final class ClearEvent {
        public boolean LIZ;
        public int LIZIZ;

        ClearEvent(boolean clear, int type) {
            LIZ = clear;
            LIZIZ = type;
        }
    }

    private Context context;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
    }

    @Test
    public void turningTheSwitchOffPutsTheViewBack() {
        View caption = new View(context);

        VideoOverlayHider.setHidden(caption, true);
        assertEquals(View.GONE, caption.getVisibility());

        // Runs on every layout pass, so it has to stay put.
        VideoOverlayHider.setHidden(caption, true);
        assertEquals(View.GONE, caption.getVisibility());

        VideoOverlayHider.setHidden(caption, false);
        assertEquals(View.VISIBLE, caption.getVisibility());
    }

    @Test
    public void aViewTikTokHidItselfIsNotForcedBackOn() {
        View hiddenByTikTok = new View(context);
        hiddenByTikTok.setVisibility(View.GONE);

        // The switch was never on for this view, so nothing here hid it.
        VideoOverlayHider.setHidden(hiddenByTikTok, false);
        assertEquals(View.GONE, hiddenByTikTok.getVisibility());
    }

    @Test
    public void aMissingViewIsHarmless() {
        VideoOverlayHider.setHidden(null, true);
        VideoOverlayHider.setHidden(null, false);
    }

    @Test
    public void anInvisibleViewComesBackInvisible() {
        // TikTok keeps the music disc invisible on a photo post to hold its space.
        View disc = new View(context);
        disc.setVisibility(View.INVISIBLE);

        VideoOverlayHider.setHidden(disc, true);
        assertEquals(View.GONE, disc.getVisibility());
        VideoOverlayHider.setHidden(disc, false);
        assertEquals(View.INVISIBLE, disc.getVisibility());
    }

    @Test
    public void feedFurnitureOutsideAFeedCellIsLeftAlone() {
        // The profile's Favorites page is a LinearLayout carrying id/f7u, the survey card's
        // id, and Hide feed surveys took the whole tab with it. Furniture is only hidden
        // under a feed cell root now.
        // Ids apart from every other fixture in this class: the id cache is static, and a
        // view matching two targets is hidden by one and put back by the other.
        int surveyId = 0x7f0a0a11;
        int cellId = 0x7f0a0a12;
        int captionId = 0x7f0a0a13;
        VideoOverlayHider.resolveForTests("47.0.3:f7u", surveyId);
        VideoOverlayHider.resolveForTests("desc", captionId);
        VideoOverlayHider.resolveForTests("view_rootview", cellId);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            LinearLayout root = new LinearLayout(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(cellId);
            View survey = new View(activity);
            survey.setId(surveyId);
            View caption = new View(activity);
            caption.setId(captionId);
            cell.addView(survey);
            cell.addView(caption);
            FrameLayout profile = new FrameLayout(activity);
            LinearLayout favoritesPage = new LinearLayout(activity);
            favoritesPage.setId(surveyId);
            profile.addView(favoritesPage);
            root.addView(cell);
            root.addView(profile);
            activity.setContentView(root);

            Settings.HIDE_FEED_SURVEYS.save(true);
            Settings.HIDE_FEED_CAPTION.save(true);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, survey.getVisibility());
            assertEquals(View.GONE, caption.getVisibility());
            assertEquals("the Favorites page shares the survey card's id and has to stay",
                    View.VISIBLE, favoritesPage.getVisibility());
        } finally {
            Settings.HIDE_FEED_SURVEYS.save(false);
            Settings.HIDE_FEED_CAPTION.save(false);
            VideoOverlayHider.resolveForTests("view_rootview", 0);
        }
    }

    /**
     * Caption above comments puts the whole caption at the top of the comments, so the caption
     * over the video goes too, without Hide the caption on, and comes back when it goes off.
     * Asked for from the S25 on 2026-09-25: with the caption in the comments it showed twice.
     */
    @Test
    public void captionAboveCommentsTakesTheCaptionOffTheVideo() {
        int cellId = 0x7f0a0a51;
        int captionId = 0x7f0a0a52;
        VideoOverlayHider.resolveForTests("desc", captionId);
        VideoOverlayHider.resolveForTests("view_rootview", cellId);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            LinearLayout root = new LinearLayout(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(cellId);
            View caption = new View(activity);
            caption.setId(captionId);
            cell.addView(caption);
            root.addView(cell);
            activity.setContentView(root);

            Settings.HIDE_FEED_CAPTION.save(false);
            Settings.CAPTION_ABOVE_COMMENTS.save(true);
            VideoOverlayHider.applyTo(activity);
            assertEquals("the caption stayed over the video", View.GONE, caption.getVisibility());

            Settings.CAPTION_ABOVE_COMMENTS.save(false);
            VideoOverlayHider.applyTo(activity);
            assertEquals("the caption did not come back", View.VISIBLE, caption.getVisibility());
        } finally {
            Settings.CAPTION_ABOVE_COMMENTS.save(false);
            Settings.HIDE_FEED_CAPTION.save(false);
            VideoOverlayHider.resolveForTests("view_rootview", 0);
        }
    }

    @Test
    public void theChosenButtonSizeGrowsTheGlyphAndSurvivesTikToksOwnAnimation() {
        // The rail on the S22 is a column of 180 by 169 slots with a 126 px icon frame and the
        // count in the rest, and the frame clips its children. So the size goes on the glyph
        // inside the button, grown from its bottom edge, with the frames above it unclipped,
        // and never beyond a quarter, which is all the column has room for. TikTok animates
        // scale on these glyphs itself and writes 1 back when it is done, so the size has to
        // hold through a reset and stop holding once Normal is chosen again. The music row
        // spans the width and is left alone. Before 2026-09-17 none of this reached a phone:
        // the cell root the walk scoped to was a sibling of the rail, so it found nothing.
        String[] names = {"47.0.3:i98", "47.0.3:g6r", "47.0.3:ep7", "47.0.3:i7r", "47.0.3:pnp", "47.0.3:w_2"};
        int cellId = 0x7f0a0a31;
        int actionBarId = 0x7f0a0a32;
        VideoOverlayHider.resolveForTests("view_rootview", cellId);
        VideoOverlayHider.resolveForTests("47.0.3:liy", actionBarId);
        for (int i = 0; i < names.length; i++) {
            VideoOverlayHider.resolveForTests(names[i], 0x7f0a0a40 + i);
        }
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(cellId);
            FrameLayout column = new FrameLayout(activity);
            column.setId(actionBarId);
            cell.addView(column);
            View[] buttons = new View[names.length];
            View[] glyphs = new View[names.length];
            for (int i = 0; i < names.length; i++) {
                FrameLayout button = new FrameLayout(activity);
                button.setId(0x7f0a0a40 + i);
                // A glyph-sized leaf (40 px at density 1 sits inside the 22 to 52 dp window) and
                // a count row too wide to be one. The last two glyphs have no size yet, the way an
                // unlaid-out cell arrives.
                View glyph = new View(activity);
                boolean sized = i < 4;
                button.addView(glyph, new FrameLayout.LayoutParams(sized ? 40 : 0, sized ? 40 : 0));
                View count = new View(activity);
                button.addView(count, new FrameLayout.LayoutParams(120, 12));
                column.addView(button, new FrameLayout.LayoutParams(120, 80));
                buttons[i] = button;
                glyphs[i] = glyph;
            }
            activity.setContentView(cell);
            View content = activity.findViewById(android.R.id.content);
            content.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.EXACTLY));
            content.layout(0, 0, 1080, 1920);

            Settings.TOUCH_TARGET_SCALE.save("1.25");
            VideoOverlayHider.applyTo(activity);
            for (int i = 0; i < 4; i++) {
                assertEquals(names[i] + " glyph", 1.25f, glyphs[i].getScaleX(), 0f);
                assertEquals(names[i] + " glyph", 1.25f, glyphs[i].getScaleY(), 0f);
                assertEquals("the button itself is never scaled", 1f, buttons[i].getScaleX(), 0f);
            }
            assertEquals("the music row is left alone", 1f, glyphs[4].getScaleX(), 0f);
            assertEquals("a glyph with no size yet cannot be told from padding", 1f, glyphs[5].getScaleX(), 0f);
            assertEquals("a sized glyph grows from its bottom centre", 20f, glyphs[1].getPivotX(), 0f);
            assertEquals(40f, glyphs[1].getPivotY(), 0f);
            assertFalse("the frame around a grown glyph must stop clipping it",
                    ((FrameLayout) buttons[1]).getClipChildren());
            assertTrue("the column itself keeps clipping", column.getClipChildren());

            // The cell lays out, the glyph has a size, and the next pass takes it.
            glyphs[5].setLayoutParams(new FrameLayout.LayoutParams(40, 40));
            content.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.EXACTLY));
            content.layout(0, 0, 1080, 1920);
            VideoOverlayHider.applyTo(activity);
            assertEquals("a glyph laid out after the first pass is scaled on the next", 1.25f, glyphs[5].getScaleX(), 0f);

            // A stored size from the days the row offered more is read as the most that fits.
            Settings.TOUCH_TARGET_SCALE.save("2");
            VideoOverlayHider.applyTo(activity);
            assertEquals(1.25f, glyphs[1].getScaleX(), 0f);

            // TikTok's animation ends and writes 1 back; the next frame corrects it.
            glyphs[1].setScaleX(1f);
            glyphs[1].setScaleY(1f);
            glyphs[3].setScaleX(1.1f);
            content.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals("the reset was not corrected before the frame", 1.25f, glyphs[1].getScaleX(), 0f);
            assertEquals(1.25f, glyphs[1].getScaleY(), 0f);
            assertEquals(1.25f, glyphs[3].getScaleX(), 0f);

            // Back to Normal: the walk writes 1, and the frame pass leaves the glyphs alone.
            Settings.TOUCH_TARGET_SCALE.save("1");
            VideoOverlayHider.applyTo(activity);
            for (View glyph : glyphs) {
                assertEquals(1f, glyph.getScaleX(), 0f);
            }
            glyphs[1].setScaleX(1.3f);
            content.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals("Normal must not keep rewriting TikTok's own scale", 1.3f, glyphs[1].getScaleX(), 0f);
        } finally {
            Settings.TOUCH_TARGET_SCALE.resetToDefault();
            VideoOverlayHider.resolveForTests("view_rootview", 0);
            VideoOverlayHider.resolveForTests("47.0.3:liy", 0);
            for (String name : names) {
                VideoOverlayHider.resolveForTests(name, 0);
            }
        }
    }

    @Test
    public void withoutACellRootTheWalkTakesTheWholeWindowAsBefore() {
        // A build that renames the cell root must not turn every hide switch off; the walk
        // falls back to the whole window and the hook status names the miss.
        int surveyId = 0x7f0a0a21;
        VideoOverlayHider.resolveForTests("47.0.3:f7u", surveyId);
        VideoOverlayHider.resolveForTests("view_rootview", 0);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            LinearLayout root = new LinearLayout(activity);
            View survey = new View(activity);
            survey.setId(surveyId);
            root.addView(survey);
            activity.setContentView(root);

            Settings.HIDE_FEED_SURVEYS.save(true);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, survey.getVisibility());
        } finally {
            Settings.HIDE_FEED_SURVEYS.save(false);
        }
    }

    @Test
    public void theSurveyIsFoundByItsFortySevenNameAndTheOldNameHidesNothing() {
        // Every layout the feed cell's survey stubs inflate has the root f7u on 47.0.3, which
        // 46.2.3 called ezp. On 47.0.3 ezp is a label in the paid series panel instead, so a
        // view under a cell that carries it is not a survey.
        int cellId = 0x7f0a0a51;
        int surveyId = 0x7f0a0a52;
        int oldNameId = 0x7f0a0a53;
        VideoOverlayHider.resolveForTests("view_rootview", cellId);
        VideoOverlayHider.resolveForTests("47.0.3:f7u", surveyId);
        VideoOverlayHider.resolveForTests("ezp", oldNameId);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(cellId);
            TextView label = new TextView(activity);
            label.setId(oldNameId);
            cell.addView(label);
            activity.setContentView(cell);

            // An ordinary post: no survey, so nothing under the current name to prefer.
            Settings.HIDE_FEED_SURVEYS.save(true);
            VideoOverlayHider.applyTo(activity);
            assertEquals("a 46.2.3 name hid a 47.0.3 view", View.VISIBLE, label.getVisibility());

            View survey = new View(activity);
            survey.setId(surveyId);
            cell.addView(survey);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, survey.getVisibility());
            assertEquals(View.VISIBLE, label.getVisibility());
        } finally {
            Settings.HIDE_FEED_SURVEYS.save(false);
            VideoOverlayHider.resolveForTests("view_rootview", 0);
            VideoOverlayHider.resolveForTests("47.0.3:f7u", 0);
            VideoOverlayHider.resolveForTests("ezp", 0);
        }
    }

    @Test
    public void visualSearchHidesItsFortySevenLayerAndPillAndNothingTheOldNamesNameNow() {
        // SearchVisualSearchContainerComponentV2 loads fo on 47.0.3 where it loaded fb, and the
        // VTag processors inflate a pill whose root is d4 where it was cn. On 47.0.3 fb is a row
        // of the visual search camera page and cn a row of the floating card in search results.
        int layerId = 0x7e0a0a61;
        int pillId = 0x7e0a0a62;
        int cameraRowId = 0x7e0a0a63;
        int floatingCardRowId = 0x7e0a0a64;
        VideoOverlayHider.resolveSearchModuleForTests("fo", layerId);
        VideoOverlayHider.resolveSearchModuleForTests("d4", pillId);
        VideoOverlayHider.resolveSearchModuleForTests("fb", cameraRowId);
        VideoOverlayHider.resolveSearchModuleForTests("cn", floatingCardRowId);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout root = new FrameLayout(activity);
            LinearLayout cameraRow = new LinearLayout(activity);
            cameraRow.setId(cameraRowId);
            LinearLayout floatingCardRow = new LinearLayout(activity);
            floatingCardRow.setId(floatingCardRowId);
            root.addView(cameraRow);
            root.addView(floatingCardRow);
            activity.setContentView(root);

            // No prompt on screen, so there is nothing under the current names to prefer.
            Settings.HIDE_VISUAL_SEARCH.save(true);
            VideoOverlayHider.applyTo(activity);
            assertEquals("a 46.2.3 name hid the camera page's row", View.VISIBLE, cameraRow.getVisibility());
            assertEquals("a 46.2.3 name hid the floating card's row",
                    View.VISIBLE, floatingCardRow.getVisibility());

            FrameLayout layer = new FrameLayout(activity);
            layer.setId(layerId);
            LinearLayout pill = new LinearLayout(activity);
            pill.setId(pillId);
            root.addView(layer);
            root.addView(pill);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, layer.getVisibility());
            assertEquals(View.GONE, pill.getVisibility());
            assertEquals(View.VISIBLE, cameraRow.getVisibility());
            assertEquals(View.VISIBLE, floatingCardRow.getVisibility());
        } finally {
            Settings.HIDE_VISUAL_SEARCH.save(false);
            for (String name : new String[]{"fo", "d4", "fb", "cn"}) {
                VideoOverlayHider.resolveSearchModuleForTests(name, 0);
            }
        }
    }

    @Test
    public void anOrdinaryPostWithoutASurveyDoesNotReportTheBuildBroken() {
        int cellId = 0x7f0a0a22;
        int surveyId = 0x7f0a0a23;
        VideoOverlayHider.resolveForTests("view_rootview", cellId);
        VideoOverlayHider.resolveForTests("47.0.3:f7u", surveyId);
        HookStatus.clear();
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(cellId);
            activity.setContentView(cell);

            Settings.HIDE_FEED_SURVEYS.save(true);
            VideoOverlayHider.applyTo(activity);

            assertTrue("a survey is optional content, not a required build anchor: "
                            + HookStatus.missing("overlay"),
                    HookStatus.missing("overlay").stream().noneMatch(line -> line.contains("47.0.3:f7u")));
        } finally {
            Settings.HIDE_FEED_SURVEYS.save(false);
            VideoOverlayHider.resolveForTests("view_rootview", 0);
            VideoOverlayHider.resolveForTests("47.0.3:f7u", 0);
            HookStatus.clear();
        }
    }

    @Test
    public void aPassHidesEveryCellsCaptionAndColumnAndPutsThemBack() {
        // The feed keeps the previous and next cells inflated beside the one on screen,
        // each with its own caption and action column under the same ids.
        int captionId = 0x7f0a0001;
        int columnId = 0x7f0a0002;
        VideoOverlayHider.resolveForTests("desc", captionId);
        VideoOverlayHider.resolveForTests("47.0.3:liy", columnId);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            LinearLayout root = new LinearLayout(activity);
            View[] captions = new View[3];
            View[] columns = new View[3];
            for (int i = 0; i < 3; i++) {
                FrameLayout cell = new FrameLayout(activity);
                captions[i] = new View(activity);
                captions[i].setId(captionId);
                columns[i] = new View(activity);
                columns[i].setId(columnId);
                cell.addView(new View(activity));
                cell.addView(captions[i]);
                cell.addView(columns[i]);
                root.addView(cell);
            }
            activity.setContentView(root);

            Settings.HIDE_FEED_CAPTION.save(true);
            Settings.HIDE_FEED_ACTION_BAR.save(false);
            VideoOverlayHider.applyTo(activity);
            for (int i = 0; i < 3; i++) {
                assertEquals("caption " + i, View.GONE, captions[i].getVisibility());
                assertEquals("column " + i, View.VISIBLE, columns[i].getVisibility());
            }

            Settings.HIDE_FEED_CAPTION.save(false);
            Settings.HIDE_FEED_ACTION_BAR.save(true);
            VideoOverlayHider.applyTo(activity);
            for (int i = 0; i < 3; i++) {
                assertEquals("caption " + i, View.VISIBLE, captions[i].getVisibility());
                assertEquals("column " + i, View.GONE, columns[i].getVisibility());
            }

            Settings.HIDE_FEED_ACTION_BAR.save(false);
            VideoOverlayHider.applyTo(activity);
            for (int i = 0; i < 3; i++) {
                assertEquals("column " + i, View.VISIBLE, columns[i].getVisibility());
            }
        } finally {
            Settings.HIDE_FEED_CAPTION.save(false);
            Settings.HIDE_FEED_ACTION_BAR.save(false);
        }
        assertEquals(0, VideoOverlayHider.viewsWithId(new View(context), 0).size());
        assertEquals(0, VideoOverlayHider.viewsWithId(null, captionId).size());
    }

    @Test
    public void olderBuildNamesAreNeverTriedEvenInACellWithoutTheCurrentOnes() {
        // TikTok hands its short names out again on every build, and on 47.0.3 each 46.x name
        // here is some other view. They used to be tried whenever the current name found
        // nothing, so a cell without a like button lost whatever 47.0.3 calls fws.
        int cellId = 0x7f0a0500;
        int currentColumnId = 0x7f0a0501;
        int oldColumnId = 0x7f0a0502;
        int currentLikeId = 0x7f0a0503;
        int oldLikeId = 0x7f0a0504;
        int currentCountRowId = 0x7f0a0505;
        int oldCountRowId = 0x7f0a0506;
        int currentCountTextId = 0x7f0a0507;
        int oldCountTextId = 0x7f0a0508;
        VideoOverlayHider.resolveForTests("view_rootview", cellId);
        VideoOverlayHider.resolveForTests("47.0.3:liy", currentColumnId);
        VideoOverlayHider.resolveForTests("kzj", oldColumnId);
        VideoOverlayHider.resolveForTests("47.0.3:g6r", currentLikeId);
        VideoOverlayHider.resolveForTests("fws", oldLikeId);
        VideoOverlayHider.resolveForTests("47.0.3:g6t", currentCountRowId);
        VideoOverlayHider.resolveForTests("fwu", oldCountRowId);
        VideoOverlayHider.resolveForTests("47.0.3:g6s", currentCountTextId);
        VideoOverlayHider.resolveForTests("fwt", oldCountTextId);

        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(cellId);
            // Views under the 46.x names, inside the cell, standing in for whatever 47.0.3
            // gives those names.
            View oldColumn = new View(activity);
            oldColumn.setId(oldColumnId);
            View oldLike = new View(activity);
            oldLike.setId(oldLikeId);
            LinearLayout oldCountRow = new LinearLayout(activity);
            oldCountRow.setId(oldCountRowId);
            TextView oldCountText = new TextView(activity);
            oldCountText.setId(oldCountTextId);
            oldCountRow.addView(oldCountText);
            cell.addView(oldColumn);
            cell.addView(oldLike);
            cell.addView(oldCountRow);
            activity.setContentView(cell);

            // Nothing under a current name yet, the case the fallback used to answer.
            Settings.HIDE_FEED_ACTION_BAR.save(true);
            Settings.HIDE_RAIL_LIKE.save(true);
            Settings.HIDE_RAIL_COUNTS.save(true);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, oldColumn.getVisibility());
            assertEquals(View.VISIBLE, oldLike.getVisibility());
            assertEquals(View.VISIBLE, oldCountRow.getVisibility());
            assertEquals(View.VISIBLE, oldCountText.getVisibility());

            View currentColumn = new View(activity);
            currentColumn.setId(currentColumnId);
            View currentLike = new View(activity);
            currentLike.setId(currentLikeId);
            LinearLayout currentCountRow = new LinearLayout(activity);
            currentCountRow.setId(currentCountRowId);
            TextView currentCountText = new TextView(activity);
            currentCountText.setId(currentCountTextId);
            currentCountRow.addView(currentCountText);
            cell.addView(currentColumn);
            cell.addView(currentLike);
            cell.addView(currentCountRow);
            VideoOverlayHider.applyTo(activity);

            assertEquals(View.GONE, currentColumn.getVisibility());
            assertEquals(View.GONE, currentLike.getVisibility());
            assertEquals(View.GONE, currentCountRow.getVisibility());
            assertEquals(View.GONE, currentCountText.getVisibility());
            assertEquals(View.VISIBLE, oldColumn.getVisibility());
            assertEquals(View.VISIBLE, oldLike.getVisibility());
            assertEquals(View.VISIBLE, oldCountRow.getVisibility());
            assertEquals(View.VISIBLE, oldCountText.getVisibility());

            Settings.HIDE_FEED_ACTION_BAR.save(false);
            Settings.HIDE_RAIL_LIKE.save(false);
            Settings.HIDE_RAIL_COUNTS.save(false);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, currentColumn.getVisibility());
            assertEquals(View.VISIBLE, currentLike.getVisibility());
            assertEquals(View.VISIBLE, currentCountRow.getVisibility());
            assertEquals(View.VISIBLE, currentCountText.getVisibility());
        } finally {
            Settings.HIDE_FEED_ACTION_BAR.save(false);
            Settings.HIDE_RAIL_LIKE.save(false);
            Settings.HIDE_RAIL_COUNTS.save(false);
            String[] names = {"view_rootview", "47.0.3:liy", "kzj", "47.0.3:g6r", "fws",
                    "47.0.3:g6t", "fwu", "47.0.3:g6s", "fwt"};
            for (String name : names) VideoOverlayHider.resolveForTests(name, 0);
        }
    }

    @Test
    public void aPeekInsideTheGraceWindowIsNotHiddenAgain() {
        // On Android 11 and up a swipe from the top shows the bar transiently and the
        // insets report it visible, so the layout pass must not answer with another hide.
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            View decor = activity.getWindow().getDecorView();
            assertTrue(VideoOverlayHider.rehideAllowed(decor, android.os.SystemClock.uptimeMillis()));

            VideoOverlayHider.setStatusBarHidden(activity, true);
            // Robolectric's clock moves a few milliseconds during the hide, so the two
            // probes sit well inside and just past the window rather than on its edge.
            long hiddenAt = android.os.SystemClock.uptimeMillis();
            assertFalse(VideoOverlayHider.rehideAllowed(decor, hiddenAt + VideoOverlayHider.STATUS_BAR_PEEK_MS / 2));
            assertTrue(VideoOverlayHider.rehideAllowed(decor, hiddenAt + VideoOverlayHider.STATUS_BAR_PEEK_MS));

            VideoOverlayHider.setStatusBarHidden(activity, false);
            assertTrue(VideoOverlayHider.rehideAllowed(decor, hiddenAt + 1));
        }
    }

    @Test
    public void eachRailButtonHasItsOwnSwitchInEveryCell() {
        // The column keeps its six buttons under fixed ids, and the feed keeps the cells on
        // either side inflated with the same ones.
        String[] names = {"47.0.3:i98", "47.0.3:g6r", "47.0.3:ep7", "47.0.3:i7r", "47.0.3:pnp", "47.0.3:w_2"};
        int[] ids = new int[names.length];
        for (int i = 0; i < names.length; i++) {
            ids[i] = 0x7f0a0100 + i;
            VideoOverlayHider.resolveForTests(names[i], ids[i]);
        }
        var switches = new app.morphe.extension.shared.settings.BooleanSetting[]{
                Settings.HIDE_RAIL_FOLLOW, Settings.HIDE_RAIL_LIKE, Settings.HIDE_RAIL_COMMENTS,
                Settings.HIDE_RAIL_FAVOURITE, Settings.HIDE_RAIL_MUSIC, Settings.HIDE_RAIL_SHARE,
        };

        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            LinearLayout root = new LinearLayout(activity);
            View[][] buttons = new View[2][names.length];
            for (int cell = 0; cell < 2; cell++) {
                LinearLayout column = new LinearLayout(activity);
                for (int i = 0; i < names.length; i++) {
                    buttons[cell][i] = new View(activity);
                    buttons[cell][i].setId(ids[i]);
                    column.addView(buttons[cell][i]);
                }
                root.addView(column);
            }
            activity.setContentView(root);

            for (var setting : switches) setting.save(false);

            for (int target = 0; target < names.length; target++) {
                switches[target].save(true);
                VideoOverlayHider.applyTo(activity);
                for (int cell = 0; cell < 2; cell++) {
                    for (int i = 0; i < names.length; i++) {
                        assertEquals(names[i] + " in cell " + cell,
                                i == target ? View.GONE : View.VISIBLE,
                                buttons[cell][i].getVisibility());
                    }
                }
                switches[target].save(false);
            }

            // Everything off puts every button back.
            VideoOverlayHider.applyTo(activity);
            for (int cell = 0; cell < 2; cell++) {
                for (int i = 0; i < names.length; i++) {
                    assertEquals(names[i], View.VISIBLE, buttons[cell][i].getVisibility());
                }
            }
        }
    }

    /**
     * A hidden button takes its own count with it.
     *
     * <p>"Hide like button" hid the heart and left "282" standing under an empty space, half
     * under the avatar (S22, 2026-09-15), which read as the switch doing nothing and was
     * reported as exactly that. The other counts are not touched: they belong to buttons
     * that are still there.
     */
    @Test
    public void aHiddenButtonTakesItsOwnCountWithIt() {
        String[] rowNames = {"47.0.3:g6t", "47.0.3:ej_", "47.0.3:i6r", "47.0.3:w6_"};
        String[] textNames = {"47.0.3:g6s", "47.0.3:ej9", "47.0.3:i6q", "47.0.3:w69"};
        String[] buttonNames = {"47.0.3:g6r", "47.0.3:ep7", "47.0.3:i7r", "47.0.3:w_2"};
        for (int i = 0; i < rowNames.length; i++) {
            VideoOverlayHider.resolveForTests(rowNames[i], 0x7f0a0300 + i);
            VideoOverlayHider.resolveForTests(textNames[i], 0x7f0a0310 + i);
            VideoOverlayHider.resolveForTests(buttonNames[i], 0x7f0a0320 + i);
        }
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            LinearLayout root = new LinearLayout(activity);
            View[] buttons = new View[buttonNames.length];
            LinearLayout[] rows = new LinearLayout[rowNames.length];
            TextView[] counts = new TextView[textNames.length];
            for (int i = 0; i < rowNames.length; i++) {
                buttons[i] = new View(activity);
                buttons[i].setId(0x7f0a0320 + i);
                root.addView(buttons[i]);
                rows[i] = new LinearLayout(activity);
                rows[i].setId(0x7f0a0300 + i);
                counts[i] = new TextView(activity);
                counts[i].setId(0x7f0a0310 + i);
                counts[i].setText(Integer.toString(200 + i));
                rows[i].addView(counts[i]);
                root.addView(rows[i]);
            }
            activity.setContentView(root);

            Settings.HIDE_RAIL_COUNTS.save(false);
            Settings.HIDE_RAIL_LIKE.save(true);
            VideoOverlayHider.applyTo(activity);
            assertEquals("the like button stayed", View.GONE, buttons[0].getVisibility());
            assertEquals("the like count stood under an empty space", View.GONE, rows[0].getVisibility());
            assertEquals("the like count's text stood on its own", View.GONE, counts[0].getVisibility());
            for (int i = 1; i < rowNames.length; i++) {
                assertEquals(buttonNames[i] + " went with the like button", View.VISIBLE, buttons[i].getVisibility());
                assertEquals(rowNames[i] + " went with the like count", View.VISIBLE, rows[i].getVisibility());
                assertEquals(textNames[i], View.VISIBLE, counts[i].getVisibility());
            }

            Settings.HIDE_RAIL_LIKE.save(false);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, buttons[0].getVisibility());
            assertEquals("the like count did not come back with its button", View.VISIBLE, rows[0].getVisibility());
            assertEquals(View.VISIBLE, counts[0].getVisibility());

            // The far end of the map as well: share is the sixth button and the fourth count.
            Settings.HIDE_RAIL_SHARE.save(true);
            VideoOverlayHider.applyTo(activity);
            assertEquals("the share count stood under an empty space", View.GONE, rows[3].getVisibility());
            assertEquals(View.GONE, counts[3].getVisibility());
            assertEquals("the like count went with the share button", View.VISIBLE, rows[0].getVisibility());
        } finally {
            Settings.HIDE_RAIL_LIKE.save(false);
            Settings.HIDE_RAIL_SHARE.save(false);
            Settings.HIDE_RAIL_COUNTS.save(false);
        }
    }

    @Test
    public void countRowsAndTheirInnerTextAnchorsGoWithoutTheButtons() {
        String[] rowNames = {"47.0.3:g6t", "47.0.3:ej_", "47.0.3:i6r", "47.0.3:w6_"};
        String[] textNames = {"47.0.3:g6s", "47.0.3:ej9", "47.0.3:i6q", "47.0.3:w69"};
        String[] buttonNames = {"47.0.3:g6r", "47.0.3:ep7", "47.0.3:i7r", "47.0.3:w_2"};
        int[] rowIds = new int[rowNames.length];
        int[] textIds = new int[textNames.length];
        int[] buttonIds = new int[buttonNames.length];
        for (int i = 0; i < rowNames.length; i++) {
            rowIds[i] = 0x7f0a0200 + i;
            textIds[i] = 0x7f0a0210 + i;
            buttonIds[i] = 0x7f0a0220 + i;
            VideoOverlayHider.resolveForTests(rowNames[i], rowIds[i]);
            VideoOverlayHider.resolveForTests(textNames[i], textIds[i]);
            VideoOverlayHider.resolveForTests(buttonNames[i], buttonIds[i]);
        }

        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            LinearLayout root = new LinearLayout(activity);
            View[] buttons = new View[buttonNames.length];
            View[] knownRows = new View[rowNames.length];
            LinearLayout[] changedRows = new LinearLayout[rowNames.length];
            TextView[] changedRowCounts = new TextView[textNames.length];
            for (int i = 0; i < rowNames.length; i++) {
                buttons[i] = new View(activity);
                buttons[i].setId(buttonIds[i]);
                buttons[i].setClickable(true);
                root.addView(buttons[i]);

                // TikTok 46.2.3 uses the first ID on the count row. Some feed layouts
                // replace that wrapper, but retain the second ID on the numeric TextView.
                knownRows[i] = new LinearLayout(activity);
                knownRows[i].setId(rowIds[i]);
                knownRows[i].setClickable(false);
                knownRows[i].setContentDescription("known count row " + i);
                root.addView(knownRows[i]);

                changedRows[i] = new LinearLayout(activity);
                changedRows[i].setId(0x7f0a0230 + i);
                changedRowCounts[i] = new TextView(activity);
                changedRowCounts[i].setId(textIds[i]);
                changedRowCounts[i].setText(Integer.toString(100 + i));
                changedRows[i].addView(changedRowCounts[i]);
                root.addView(changedRows[i]);
            }
            activity.setContentView(root);

            Settings.HIDE_RAIL_LIKE.save(false);
            Settings.HIDE_RAIL_COUNTS.save(true);
            VideoOverlayHider.applyTo(activity);
            for (int i = 0; i < rowNames.length; i++) {
                assertEquals(rowNames[i], View.GONE, knownRows[i].getVisibility());
                assertEquals(textNames[i], View.GONE, changedRowCounts[i].getVisibility());
                assertEquals("an unknown row stays", View.VISIBLE, changedRows[i].getVisibility());
                assertEquals(buttonNames[i], View.VISIBLE, buttons[i].getVisibility());
                assertTrue(buttonNames[i] + " remains clickable", buttons[i].isClickable());
            }

            // A newly bound feed cell must be covered on the next layout pass too.
            root.removeView(changedRows[0]);
            LinearLayout reboundRow = new LinearLayout(activity);
            TextView reboundCount = new TextView(activity);
            reboundCount.setId(textIds[0]);
            reboundCount.setText("999");
            reboundRow.addView(reboundCount);
            root.addView(reboundRow);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, reboundCount.getVisibility());

            Settings.HIDE_RAIL_COUNTS.save(false);
            VideoOverlayHider.applyTo(activity);
            for (int i = 0; i < rowNames.length; i++) {
                assertEquals(rowNames[i], View.VISIBLE, knownRows[i].getVisibility());
                if (i != 0) {
                    assertEquals(textNames[i], View.VISIBLE, changedRowCounts[i].getVisibility());
                }
            }
            assertEquals("the rebound count comes back", View.VISIBLE, reboundCount.getVisibility());
        } finally {
            Settings.HIDE_RAIL_COUNTS.save(false);
        }
    }

    @Test
    public void clearDisplayKeepsTheTabStripAwayUntilItEnds() {
        int tabStripId = 0x7f0a0011;
        VideoOverlayHider.resolveForTests("47.0.3:uvy", tabStripId);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            LinearLayout root = new LinearLayout(activity);
            View tabStrip = new View(activity);
            tabStrip.setId(tabStripId);
            root.addView(tabStrip);
            activity.setContentView(root);

            // The hider follows the live clear display state, not the stored setting: the
            // automatic path never writes that one. AutomaticClearDisplayTest covers the
            // automatic transition itself.
            Settings.CLEAR_DISPLAY.save(false);
            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(true, 1));

            // The two disagree on purpose: the live state says the controls are hidden, the
            // stored setting says nothing. Reading the setting here would leave the strip up.
            Settings.CLEAR_DISPLAY.save(false);

            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, tabStrip.getVisibility());

            // TikTok puts the strip back on the first swipe; the next layout pass takes it
            // away again, which is the whole point of the mode.
            tabStrip.setVisibility(View.VISIBLE);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, tabStrip.getVisibility());

            // The tap that leaves clear display brings it back.
            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(false, 1));
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, tabStrip.getVisibility());
        }
    }

    /**
     * The automatic path can turn Clear display on before the bottom tabs are laid out after a
     * cold start, and TikTok then leaves them over the first video (#84). They sit outside the
     * cells, go while the mode is on, and come back when it ends. An opened video has no such bar.
     */
    @Test
    public void clearDisplayTakesTheBottomTabsAwayOnTheMainFeedOnly() {
        int tabsId = 0x7f0a0b20;
        int cellId = 0x7f0a0b21;
        VideoOverlayHider.resolveForTests("47.0.3:omy", tabsId);
        VideoOverlayHider.resolveForTests("view_rootview", cellId);
        try (var main = Robolectric.buildActivity(Activity.class).setup();
             var detail = Robolectric.buildActivity(
                     com.ss.android.ugc.aweme.detail.ui.DetailActivity.class).setup()) {
            Utils.setContext(main.get());
            FrameLayout root = new FrameLayout(main.get());
            FrameLayout cell = new FrameLayout(main.get());
            cell.setId(cellId);
            root.addView(cell);
            View tabs = new View(main.get());
            tabs.setId(tabsId);
            root.addView(tabs);
            main.get().setContentView(root);
            View detailTabs = new View(detail.get());
            detailTabs.setId(tabsId);
            detail.get().setContentView(detailTabs);

            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(true, 1));
            VideoOverlayHider.applyTo(main.get());
            assertEquals(View.GONE, tabs.getVisibility());
            VideoOverlayHider.applyTo(detail.get());
            assertEquals(View.VISIBLE, detailTabs.getVisibility());

            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(false, 1));
            VideoOverlayHider.applyTo(main.get());
            assertEquals(View.VISIBLE, tabs.getVisibility());
        } finally {
            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(false, 1));
        }
    }

    @Test
    public void clearDisplayHidesFollowingStoriesOutsideTheCellsAndRestoresNativeVisibility() {
        int storyId = 0x7f0a0b10;
        int cellId = 0x7f0a0b11;
        VideoOverlayHider.resolveForTests("47.0.3:wq0", storyId);
        VideoOverlayHider.resolveForTests("view_rootview", cellId);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout root = new FrameLayout(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(cellId);
            root.addView(cell);
            FrameLayout stories = new FrameLayout(activity);
            stories.setId(storyId);
            stories.setAlpha(0.6f);
            stories.setClickable(true);
            root.addView(stories);
            activity.setContentView(root);

            for (int visibility : new int[]{View.VISIBLE, View.INVISIBLE, View.GONE}) {
                stories.setVisibility(visibility);
                app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                        .rememberClearDisplayEvent(new ClearEvent(true, 1));
                Settings.CLEAR_DISPLAY.save(false);
                VideoOverlayHider.applyTo(activity);
                assertEquals(View.GONE, stories.getVisibility());
                if (visibility == View.VISIBLE) {
                    stories.setVisibility(View.VISIBLE);
                    VideoOverlayHider.applyTo(activity);
                    assertEquals(View.GONE, stories.getVisibility());
                }
                app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                        .rememberClearDisplayEvent(new ClearEvent(false, 1));
                VideoOverlayHider.applyTo(activity);
                assertEquals(visibility, stories.getVisibility());
                assertEquals(0.6f, stories.getAlpha(), 0f);
                assertTrue(stories.isClickable());
            }
        } finally {
            VideoOverlayHider.resolveForTests("view_rootview", 0);
        }
    }

    @Test
    public void nativeClearExitRestoresFollowingStoriesWithoutAnotherLayout() {
        int storyId = 0x7f0a0b10;
        VideoOverlayHider.resolveForTests("47.0.3:wq0", storyId);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout root = new FrameLayout(activity);
            View stories = new View(activity);
            stories.setId(storyId);
            root.addView(stories);
            activity.setContentView(root);
            VideoOverlayHider.install(activity);
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();

            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(true, 0));
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, stories.getVisibility());
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();

            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(false, 2));
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertEquals(View.VISIBLE, stories.getVisibility());
        }
    }

    @Test
    public void aStoryViewerCoveringTheMainActivityRestoresTheStoryCount() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout root = new FrameLayout(activity);
            View stories = new View(activity);
            stories.setId(0x7f0a0b10);
            root.addView(stories);
            View viewer = new View(activity);
            viewer.setId(0x7f0a0b13);
            viewer.setVisibility(View.GONE);
            root.addView(viewer, new FrameLayout.LayoutParams(400, 600));
            activity.setContentView(root);
            VideoOverlayHider.resolveForTests("47.0.3:wq0", stories.getId());
            app.morphe.extension.tiktok.blockauthor.FeedVisibility.resolveForTests(
                    activity.getPackageName(), "vp_story_collection", viewer.getId());
            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(true, 1));

            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, stories.getVisibility());
            viewer.setVisibility(View.VISIBLE);
            assertTrue(app.morphe.extension.tiktok.blockauthor.FeedVisibility.isStoryVisible(activity));
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, stories.getVisibility());
            assertEquals(View.VISIBLE, viewer.getVisibility());

            viewer.setVisibility(View.GONE);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, stories.getVisibility());
            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(false, 1));
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, stories.getVisibility());
        }
    }

    @Test
    public void pauseRestoresTheClearDisplayChromeAndDetailPagesKeepTheirStoryControls() {
        int storyId = 0x7f0a0b10;
        int tabStripId = 0x7f0a0b12;
        VideoOverlayHider.resolveForTests("47.0.3:wq0", storyId);
        VideoOverlayHider.resolveForTests("47.0.3:uvy", tabStripId);
        try (var main = Robolectric.buildActivity(Activity.class).setup();
             var detail = Robolectric.buildActivity(
                     com.ss.android.ugc.aweme.detail.ui.DetailActivity.class).setup()) {
            Utils.setContext(main.get());
            FrameLayout root = new FrameLayout(main.get());
            View stories = new View(main.get());
            stories.setId(storyId);
            root.addView(stories);
            View tabs = new View(main.get());
            tabs.setId(tabStripId);
            root.addView(tabs);
            main.get().setContentView(root);
            View detailStories = new View(detail.get());
            detailStories.setId(storyId);
            detail.get().setContentView(detailStories);
            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(true, 1));

            VideoOverlayHider.applyTo(main.get());
            app.morphe.extension.shared.settings.PausedProcess.set(true);
            VideoOverlayHider.applyTo(main.get());
            assertEquals(View.VISIBLE, stories.getVisibility());
            assertEquals(View.VISIBLE, tabs.getVisibility());
            app.morphe.extension.shared.settings.PausedProcess.set(false);
            VideoOverlayHider.applyTo(detail.get());
            assertEquals(View.VISIBLE, detailStories.getVisibility());
        } finally {
            app.morphe.extension.shared.settings.PausedProcess.set(false);
        }
    }

    /**
     * A video opened from a creator's grid plays in TikTok's detail pager, a second activity with
     * the same cell and the same right column ids (#47). The hides follow it there as it comes to
     * the front, the status bar included (#50).
     */
    @Test
    public void theHidesFollowAVideoOpenedFromAProfile() {
        int likeId = 0x7f0a0200;
        int cellId = 0x7f0a0201;
        VideoOverlayHider.resolveForTests("47.0.3:g6r", likeId);
        VideoOverlayHider.resolveForTests("view_rootview", cellId);
        Settings.HIDE_RAIL_LIKE.save(true);
        Settings.HIDE_STATUS_BAR.save(true);
        try (var main = Robolectric.buildActivity(Activity.class).setup();
             var detailController = Robolectric.buildActivity(
                     com.ss.android.ugc.aweme.detail.ui.DetailActivity.class).create().start()) {
            VideoOverlayHider.install(main.get());
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();

            Activity detail = detailController.get();
            FrameLayout cell = new FrameLayout(detail);
            cell.setId(cellId);
            View like = new View(detail);
            like.setId(likeId);
            cell.addView(like);
            detail.setContentView(cell);
            detailController.resume();

            detail.findViewById(android.R.id.content).getViewTreeObserver().dispatchOnGlobalLayout();

            assertEquals(View.GONE, like.getVisibility());
            assertNotEquals(0, detail.getWindow().getDecorView().getSystemUiVisibility()
                    & View.SYSTEM_UI_FLAG_FULLSCREEN);

            Settings.HIDE_RAIL_LIKE.save(false);
            Settings.HIDE_STATUS_BAR.save(false);
            detail.findViewById(android.R.id.content).getViewTreeObserver().dispatchOnGlobalLayout();
            assertEquals(View.VISIBLE, like.getVisibility());
            assertEquals(0, detail.getWindow().getDecorView().getSystemUiVisibility()
                    & View.SYSTEM_UI_FLAG_FULLSCREEN);
        } finally {
            Settings.HIDE_RAIL_LIKE.save(false);
            Settings.HIDE_STATUS_BAR.save(false);
        }
    }

    @Test
    public void theStatusBarComesBackOnlyIfThisClassHidIt() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            View decor = activity.getWindow().getDecorView();
            int fullscreen = View.SYSTEM_UI_FLAG_FULLSCREEN;

            VideoOverlayHider.setStatusBarHidden(activity, true);
            assertNotEquals(0, decor.getSystemUiVisibility() & fullscreen);
            // Every layout pass re-runs this; it must not toggle or stack.
            VideoOverlayHider.setStatusBarHidden(activity, true);
            assertNotEquals(0, decor.getSystemUiVisibility() & fullscreen);

            VideoOverlayHider.setStatusBarHidden(activity, false);
            assertEquals(0, decor.getSystemUiVisibility() & fullscreen);

            // TikTok hid the bar itself on some page. Turning the switch off leaves that alone.
            decor.setSystemUiVisibility(fullscreen);
            VideoOverlayHider.setStatusBarHidden(activity, true);
            VideoOverlayHider.setStatusBarHidden(activity, false);
            assertNotEquals(0, decor.getSystemUiVisibility() & fullscreen);
        }
    }

    /**
     * The main feed and a video opened from a profile are two windows (#50). Each one's bar is
     * given back only where this class hid it, and each has its own peek window.
     */
    @Test
    public void eachWindowGivesBackOnlyTheStatusBarItHid() {
        try (var main = Robolectric.buildActivity(Activity.class).setup();
             var detail = Robolectric.buildActivity(Activity.class).setup()) {
            View mainDecor = main.get().getWindow().getDecorView();
            View detailDecor = detail.get().getWindow().getDecorView();
            int fullscreen = View.SYSTEM_UI_FLAG_FULLSCREEN;

            VideoOverlayHider.setStatusBarHidden(main.get(), true);
            long now = android.os.SystemClock.uptimeMillis();
            assertFalse(VideoOverlayHider.rehideAllowed(mainDecor, now));
            assertTrue("The other window has no hide of its own",
                    VideoOverlayHider.rehideAllowed(detailDecor, now));

            // Nothing was hidden in the detail window, so giving back there leaves the feed alone.
            VideoOverlayHider.setStatusBarHidden(detail.get(), false);
            assertNotEquals(0, mainDecor.getSystemUiVisibility() & fullscreen);

            VideoOverlayHider.setStatusBarHidden(detail.get(), true);
            VideoOverlayHider.setStatusBarHidden(main.get(), false);
            assertEquals(0, mainDecor.getSystemUiVisibility() & fullscreen);
            assertNotEquals("Giving back the feed's bar leaves the detail page's away",
                    0, detailDecor.getSystemUiVisibility() & fullscreen);

            VideoOverlayHider.setStatusBarHidden(detail.get(), false);
            assertEquals(0, detailDecor.getSystemUiVisibility() & fullscreen);
        }
    }

    private static final int BAR_ID = 0x7f0a0210;
    private static final int STRIP_ID = 0x7f0a0211;
    private static final int COLUMN_ID = 0x7f0a0212;
    private static final int CELL_ID = 0x7f0a0201;

    private static void resolveCommentBarIds() {
        VideoOverlayHider.resolveForTests("47.0.3:qo4", BAR_ID);
        VideoOverlayHider.resolveForTests("47.0.3:cn8", STRIP_ID);
        VideoOverlayHider.resolveForTests("viewpager_container", COLUMN_ID);
        // With the cell root known, furniture is looked for inside cells only; the bar and its
        // strip sit outside every cell, under the pager, as on the phone.
        VideoOverlayHider.resolveForTests("view_rootview", CELL_ID);
    }

    /** The pager column as TikTok inflates it: a cell over the strip that keeps its height. */
    private static LinearLayout pagerColumn(Context context, View strip) {
        LinearLayout column = new LinearLayout(context);
        column.setId(COLUMN_ID);
        column.setOrientation(LinearLayout.VERTICAL);
        FrameLayout cell = new FrameLayout(context);
        cell.setId(CELL_ID);
        column.addView(cell, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));
        strip.setId(STRIP_ID);
        column.addView(strip, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 138));
        return column;
    }

    private static void layOut(Activity activity) {
        activity.findViewById(android.R.id.content).getViewTreeObserver().dispatchOnGlobalLayout();
    }

    /**
     * A video opened from a profile has an Add comment bar laid over a strip that holds its
     * height under the pager (#50). The switch takes both away there and gives them back when
     * it goes off. The main feed inflates the same column with the same ids and has the tabs
     * in that place, so it's left alone. The strip's id also names a Space in twenty other
     * layouts; one of those in the detail window stays put.
     */
    @Test
    public void theCommentBarLeavesAVideoOpenedFromAProfile() {
        resolveCommentBarIds();
        Settings.HIDE_DETAIL_COMMENT_BAR.save(true);
        try (var main = Robolectric.buildActivity(Activity.class).setup();
             var detailController = Robolectric.buildActivity(
                     com.ss.android.ugc.aweme.detail.ui.DetailActivity.class).create().start()) {
            View feedStrip = new View(main.get());
            main.get().setContentView(pagerColumn(main.get(), feedStrip));
            VideoOverlayHider.install(main.get());
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            layOut(main.get());
            assertEquals(View.VISIBLE, feedStrip.getVisibility());

            Activity detail = detailController.get();
            View strip = new View(detail);
            FrameLayout root = new FrameLayout(detail);
            root.addView(pagerColumn(detail, strip));
            View bar = new View(detail);
            bar.setId(BAR_ID);
            root.addView(bar);
            FrameLayout otherPage = new FrameLayout(detail);
            // A Space makes itself INVISIBLE as it's built; GONE would be this class's doing.
            android.widget.Space spacer = new android.widget.Space(detail);
            int spacerVisibility = spacer.getVisibility();
            spacer.setId(STRIP_ID);
            otherPage.addView(spacer);
            root.addView(otherPage);
            detail.setContentView(root);
            detailController.resume();

            layOut(detail);
            assertEquals(View.GONE, bar.getVisibility());
            assertEquals(View.GONE, strip.getVisibility());
            assertEquals("a Space sharing the strip's id was taken",
                    spacerVisibility, spacer.getVisibility());

            Settings.HIDE_DETAIL_COMMENT_BAR.save(false);
            layOut(detail);
            assertEquals(View.VISIBLE, bar.getVisibility());
            assertEquals(View.VISIBLE, strip.getVisibility());
        } finally {
            Settings.HIDE_DETAIL_COMMENT_BAR.save(false);
        }
    }

    /**
     * TikTok leaves the Add comment bar up in Clear display on a photo or video opened from
     * search or a profile (#84). It goes with the other controls, with Hide the comment bar on
     * opened videos off, and comes back on Restore display.
     */
    @Test
    public void clearDisplayTakesTheCommentBarOffAnOpenedVideo() {
        resolveCommentBarIds();
        Settings.HIDE_DETAIL_COMMENT_BAR.save(false);
        try (var detailController = Robolectric.buildActivity(
                com.ss.android.ugc.aweme.detail.ui.DetailActivity.class).create().start()) {
            Activity detail = detailController.get();
            View strip = new View(detail);
            FrameLayout root = new FrameLayout(detail);
            root.addView(pagerColumn(detail, strip));
            View bar = new View(detail);
            bar.setId(BAR_ID);
            root.addView(bar);
            detail.setContentView(root);
            detailController.resume();

            VideoOverlayHider.applyTo(detail);
            assertEquals(View.VISIBLE, bar.getVisibility());
            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(true, 1));
            VideoOverlayHider.applyTo(detail);
            assertEquals("the comment bar stayed in Clear display", View.GONE, bar.getVisibility());
            assertEquals(View.GONE, strip.getVisibility());

            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(false, 1));
            VideoOverlayHider.applyTo(detail);
            assertEquals("Restore display left the comment bar hidden", View.VISIBLE, bar.getVisibility());
            assertEquals(View.VISIBLE, strip.getVisibility());
        } finally {
            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(false, 1));
            Settings.CLEAR_DISPLAY.save(false);
        }
    }

    /**
     * On 47.1.4 a photo opened from search plays in the main activity (DetailSafRootFragment),
     * not the detail pager, with the same comment bar. Clear display takes it off there too, and
     * the main feed's own strip, which has no bar over it, is left alone (#84).
     */
    @Test
    public void clearDisplayTakesTheCommentBarOffAPhotoOpenedInTheMainActivity() {
        resolveCommentBarIds();
        Settings.HIDE_DETAIL_COMMENT_BAR.save(false);
        try (var mainController = Robolectric.buildActivity(
                com.ss.android.ugc.aweme.main.MainActivity.class).create().start()) {
            Activity main = mainController.get();
            View strip = new View(main);
            FrameLayout root = new FrameLayout(main);
            root.addView(pagerColumn(main, strip));
            View bar = new View(main);
            bar.setId(BAR_ID);
            root.addView(bar);
            main.setContentView(root);
            mainController.resume();

            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(true, 1));
            VideoOverlayHider.applyTo(main);
            assertEquals("the photo's comment bar stayed in Clear display", View.GONE, bar.getVisibility());
            assertEquals(View.GONE, strip.getVisibility());

            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(false, 1));
            VideoOverlayHider.applyTo(main);
            assertEquals(View.VISIBLE, bar.getVisibility());
            assertEquals(View.VISIBLE, strip.getVisibility());

            // The feed itself: the strip with no bar over it stays in Clear display.
            root.removeView(bar);
            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(true, 1));
            VideoOverlayHider.applyTo(main);
            assertEquals("the feed's strip went without a comment bar", View.VISIBLE, strip.getVisibility());
        } finally {
            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(false, 1));
            Settings.CLEAR_DISPLAY.save(false);
        }
    }

    /**
     * Clear display only fades the anchor row under the caption, and a tap on the faded row still
     * opened its search (#84). It goes invisible, keeping its space so the caption doesn't move,
     * and comes back when Clear display ends. A row TikTok had put away stays as it was.
     */
    @Test
    public void clearDisplayTakesTheAnchorRowOutOfReach() {
        int cellId = 0x7f0a0c71;
        int anchorId = 0x7f0a0c72;
        VideoOverlayHider.resolveForTests("view_rootview", cellId);
        VideoOverlayHider.resolveForTests("47.0.3:bql", anchorId);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            LinearLayout root = new LinearLayout(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(cellId);
            View anchor = new View(activity);
            anchor.setId(anchorId);
            cell.addView(anchor);
            FrameLayout emptyCell = new FrameLayout(activity);
            emptyCell.setId(cellId);
            View putAway = new View(activity);
            putAway.setId(anchorId);
            putAway.setVisibility(View.GONE);
            emptyCell.addView(putAway);
            root.addView(cell);
            root.addView(emptyCell);
            activity.setContentView(root);

            VideoOverlayHider.applyTo(activity);
            assertEquals("the anchor went with Clear display off", View.VISIBLE, anchor.getVisibility());

            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(true, 1));
            VideoOverlayHider.applyTo(activity);
            assertEquals("the faded anchor still takes taps", View.INVISIBLE, anchor.getVisibility());
            assertEquals(View.GONE, putAway.getVisibility());

            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(false, 1));
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, anchor.getVisibility());
            assertEquals(View.GONE, putAway.getVisibility());
        } finally {
            app.morphe.extension.tiktok.cleardisplay.RememberClearDisplayPatch
                    .rememberClearDisplayEvent(new ClearEvent(false, 1));
            Settings.CLEAR_DISPLAY.save(false);
            VideoOverlayHider.resolveForTests("view_rootview", 0);
        }
    }

    /**
     * The bar and the strip go together. With the bar missing, a collapsed strip would grow the
     * pager under nothing, or under a bar a build renamed, which then covers the caption. With
     * the strip missing, hiding the bar alone leaves the black strip.
     */
    @Test
    public void halfTheCommentBarIsNeverHidden() {
        resolveCommentBarIds();
        Settings.HIDE_DETAIL_COMMENT_BAR.save(true);
        try (var noBar = Robolectric.buildActivity(
                     com.ss.android.ugc.aweme.detail.ui.DetailActivity.class).create().start();
             var noStrip = Robolectric.buildActivity(
                     com.ss.android.ugc.aweme.detail.ui.DetailActivity.class).create().start()) {
            View strip = new View(noBar.get());
            noBar.get().setContentView(pagerColumn(noBar.get(), strip));
            noBar.resume();
            VideoOverlayHider.applyTo(noBar.get());
            assertEquals(View.VISIBLE, strip.getVisibility());

            FrameLayout root = new FrameLayout(noStrip.get());
            View bar = new View(noStrip.get());
            bar.setId(BAR_ID);
            root.addView(bar);
            noStrip.get().setContentView(root);
            noStrip.resume();
            VideoOverlayHider.applyTo(noStrip.get());
            assertEquals(View.VISIBLE, bar.getVisibility());

            // The strip turns up later in the same window: now both go.
            View lateStrip = new View(noStrip.get());
            root.addView(pagerColumn(noStrip.get(), lateStrip));
            VideoOverlayHider.applyTo(noStrip.get());
            assertEquals(View.GONE, bar.getVisibility());
            assertEquals(View.GONE, lateStrip.getVisibility());
        } finally {
            Settings.HIDE_DETAIL_COMMENT_BAR.save(false);
        }
    }

    /**
     * The phones take the Android 11 and later branch, which hides through each window's own
     * insets controller. That branch keeps one record per window too (#50).
     */
    @Test
    @Config(sdk = 34)
    public void eachWindowKeepsItsOwnStatusBarOnAndroid11AndUp() {
        try (var main = Robolectric.buildActivity(Activity.class).setup();
             var detail = Robolectric.buildActivity(Activity.class).setup()) {
            View mainDecor = main.get().getWindow().getDecorView();
            View detailDecor = detail.get().getWindow().getDecorView();
            int bySwipe = android.view.WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE;

            VideoOverlayHider.setStatusBarHidden(detail.get(), true);
            long now = android.os.SystemClock.uptimeMillis();
            assertFalse(VideoOverlayHider.rehideAllowed(detailDecor, now));
            assertTrue(VideoOverlayHider.rehideAllowed(mainDecor, now));
            assertEquals(bySwipe, detailDecor.getWindowInsetsController().getSystemBarsBehavior());
            assertNotEquals("the feed's window was asked to hide its bar",
                    bySwipe, mainDecor.getWindowInsetsController().getSystemBarsBehavior());

            // Nothing was hidden in the feed's window, so giving back there leaves this one.
            VideoOverlayHider.setStatusBarHidden(main.get(), false);
            assertFalse(VideoOverlayHider.rehideAllowed(detailDecor, now));

            VideoOverlayHider.setStatusBarHidden(detail.get(), false);
            assertTrue(VideoOverlayHider.rehideAllowed(detailDecor, now));
        }
    }

    /**
     * Clear display has its own bar at the bottom: a close button and a pause and speed pill
     * over a progress bar (#97). They go only while TikTok shows that bar, because the progress
     * bar shares its id with the one TikTok draws outside Clear display, and they come back the
     * moment TikTok takes the bar down, under Pause, or with the switch off.
     */
    @Test
    public void theClearDisplayControlsGoOnlyWhileTikTokShowsThem() {
        int exitId = 0x7f0a0c01;
        int playbackId = 0x7f0a0c02;
        int seekBarId = 0x7f0a0c03;
        VideoOverlayHider.resolveForTests("47.0.3:e9j", exitId);
        VideoOverlayHider.resolveForTests("47.0.3:l6h", playbackId);
        VideoOverlayHider.resolveForTests("video_seek_bar", seekBarId);
        Settings.HIDE_CLEAR_DISPLAY_CONTROLS.save(true);
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout root = new FrameLayout(activity);
            FrameLayout clearBar = new FrameLayout(activity);
            View exit = new View(activity);
            exit.setId(exitId);
            clearBar.addView(exit);
            LinearLayout playback = new LinearLayout(activity);
            playback.setId(playbackId);
            clearBar.addView(playback);
            root.addView(clearBar);
            View seekBar = new View(activity);
            seekBar.setId(seekBarId);
            root.addView(seekBar);
            activity.setContentView(root);

            clearBar.setVisibility(View.GONE);
            VideoOverlayHider.applyTo(activity);
            assertEquals("the progress bar outside Clear display was taken",
                    View.VISIBLE, seekBar.getVisibility());

            clearBar.setVisibility(View.VISIBLE);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, exit.getVisibility());
            assertEquals(View.GONE, playback.getVisibility());
            assertEquals("the progress bar left the screen and can't be dragged",
                    View.VISIBLE, seekBar.getVisibility());
            assertEquals(0f, seekBar.getAlpha(), 0f);

            // Restore display: TikTok takes its bar down and everything is TikTok's again.
            clearBar.setVisibility(View.GONE);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, exit.getVisibility());
            assertEquals(View.VISIBLE, playback.getVisibility());
            assertEquals(View.VISIBLE, seekBar.getVisibility());
            assertEquals(1f, seekBar.getAlpha(), 0f);

            clearBar.setVisibility(View.VISIBLE);
            VideoOverlayHider.applyTo(activity);
            assertEquals("the progress bar left the screen and can't be dragged",
                    View.VISIBLE, seekBar.getVisibility());
            assertEquals(0f, seekBar.getAlpha(), 0f);
            app.morphe.extension.shared.settings.PausedProcess.set(true);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, exit.getVisibility());
            assertEquals(View.VISIBLE, seekBar.getVisibility());
            assertEquals(1f, seekBar.getAlpha(), 0f);
            app.morphe.extension.shared.settings.PausedProcess.set(false);

            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, playback.getVisibility());
            Settings.HIDE_CLEAR_DISPLAY_CONTROLS.save(false);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, exit.getVisibility());
            assertEquals(View.VISIBLE, playback.getVisibility());
            assertEquals(View.VISIBLE, seekBar.getVisibility());
            assertEquals(1f, seekBar.getAlpha(), 0f);
        } finally {
            app.morphe.extension.shared.settings.PausedProcess.set(false);
            Settings.HIDE_CLEAR_DISPLAY_CONTROLS.save(false);
        }
    }

    /**
     * A photo post in Clear display has only a close button at the bottom right, inside the
     * cell, and TikTok takes it and its parent away as Clear display ends. It goes with the other
     * controls, and when it's put back after TikTok's exit it stays inside the hidden parent,
     * where it can't be seen or tapped.
     */
    @Test
    public void aPhotoPostsClearDisplayCloseButtonGoesToo() {
        int photoExitId = 0x7f0a0c04;
        VideoOverlayHider.resolveForTests("47.0.3:uxv", photoExitId);
        VideoOverlayHider.resolveForTests("view_rootview", CELL_ID);
        Settings.HIDE_CLEAR_DISPLAY_CONTROLS.save(true);
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout root = new FrameLayout(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(CELL_ID);
            FrameLayout exitArea = new FrameLayout(activity);
            RelativeLayout photoExit = new RelativeLayout(activity);
            photoExit.setId(photoExitId);
            exitArea.addView(photoExit);
            cell.addView(exitArea);
            root.addView(cell);
            activity.setContentView(root);

            exitArea.setVisibility(View.GONE);
            photoExit.setVisibility(View.GONE);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, photoExit.getVisibility());

            exitArea.setVisibility(View.VISIBLE);
            photoExit.setVisibility(View.VISIBLE);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, photoExit.getVisibility());

            // Restore display: TikTok hides both. Ours comes back inside a parent that stays gone.
            exitArea.setVisibility(View.GONE);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, photoExit.getVisibility());
            assertFalse(photoExit.isShown());

            exitArea.setVisibility(View.VISIBLE);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, photoExit.getVisibility());
            Settings.HIDE_CLEAR_DISPLAY_CONTROLS.save(false);
            VideoOverlayHider.applyTo(activity);
            assertTrue(photoExit.isShown());
        } finally {
            Settings.HIDE_CLEAR_DISPLAY_CONTROLS.save(false);
            VideoOverlayHider.resolveForTests("view_rootview", 0);
        }
    }

    /**
     * A window in the default cutout mode is kept below the punch hole while its status bar is
     * hidden, which left a black strip over opened videos on Android 14 and older (#97). The
     * window draws behind the cutout while this class has the bar away and gets its own mode
     * back after. A mode TikTok picked is left as it is.
     */
    @Test
    @Config(sdk = 34)
    public void aHiddenStatusBarLetsTheVideoUnderTheCutout() {
        int defaultMode = android.view.WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_DEFAULT;
        int shortEdges = android.view.WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
        int never = android.view.WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_NEVER;
        try (var main = Robolectric.buildActivity(Activity.class).setup();
             var detail = Robolectric.buildActivity(Activity.class).setup()) {
            android.view.Window window = detail.get().getWindow();
            assertEquals(defaultMode, window.getAttributes().layoutInDisplayCutoutMode);

            VideoOverlayHider.setStatusBarHidden(detail.get(), true);
            assertEquals(shortEdges, window.getAttributes().layoutInDisplayCutoutMode);
            VideoOverlayHider.setStatusBarHidden(detail.get(), true);
            assertEquals(shortEdges, window.getAttributes().layoutInDisplayCutoutMode);
            assertEquals("the other window was changed", defaultMode,
                    main.get().getWindow().getAttributes().layoutInDisplayCutoutMode);

            // A page change puts the default back while the bar is still away.
            android.view.WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.layoutInDisplayCutoutMode = defaultMode;
            window.setAttributes(attributes);
            VideoOverlayHider.setStatusBarHidden(detail.get(), true);
            assertEquals(shortEdges, window.getAttributes().layoutInDisplayCutoutMode);

            VideoOverlayHider.setStatusBarHidden(detail.get(), false);
            assertEquals(defaultMode, window.getAttributes().layoutInDisplayCutoutMode);

            attributes = window.getAttributes();
            attributes.layoutInDisplayCutoutMode = never;
            window.setAttributes(attributes);
            VideoOverlayHider.setStatusBarHidden(detail.get(), true);
            assertEquals(never, window.getAttributes().layoutInDisplayCutoutMode);
            VideoOverlayHider.setStatusBarHidden(detail.get(), false);
            assertEquals(never, window.getAttributes().layoutInDisplayCutoutMode);
        }
    }

    /**
     * On a tall screen TikTok keeps a blank as tall as the status bar above the video. With the
     * bar hidden that blank was a black strip over every video (#97), so it goes with the bar and
     * comes back, invisible as TikTok left it, when the switch is off.
     */
    @Test
    public void theBlankAboveTheVideoGoesWithTheStatusBar() {
        int spacerId = 0x7f0a0c11;
        VideoOverlayHider.resolveForTests("47.0.3:duc", spacerId);
        VideoOverlayHider.resolveForTests("view_rootview", CELL_ID);
        Settings.HIDE_STATUS_BAR.save(true);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout root = new FrameLayout(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(CELL_ID);
            LinearLayout area = new LinearLayout(activity);
            area.setOrientation(LinearLayout.VERTICAL);
            View spacer = new View(activity);
            spacer.setId(spacerId);
            spacer.setVisibility(View.INVISIBLE);
            area.addView(spacer, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 136));
            area.addView(new View(activity), new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));
            cell.addView(area);
            root.addView(cell);
            activity.setContentView(root);

            VideoOverlayHider.applyTo(activity);
            assertEquals(View.GONE, spacer.getVisibility());

            Settings.HIDE_STATUS_BAR.save(false);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.INVISIBLE, spacer.getVisibility());
        } finally {
            Settings.HIDE_STATUS_BAR.save(false);
            VideoOverlayHider.resolveForTests("view_rootview", 0);
        }
    }

    /** Android 15 already draws TikTok's default-mode windows behind the cutout. */
    @Test
    @Config(sdk = 35)
    public void theCutoutModeIsLeftAloneOnAndroid15AndUp() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            android.view.Window window = controller.get().getWindow();
            int before = window.getAttributes().layoutInDisplayCutoutMode;
            VideoOverlayHider.setStatusBarHidden(controller.get(), true);
            assertEquals(before, window.getAttributes().layoutInDisplayCutoutMode);
            VideoOverlayHider.setStatusBarHidden(controller.get(), false);
            assertEquals(before, window.getAttributes().layoutInDisplayCutoutMode);
        }
    }

    /**
     * Fade the video controls (#84): the column holding the rail, caption and music row and the
     * tab strip go to the chosen opacity and keep taking taps, 100 leaves everything stock, 0
     * hides the column the way Clear display does, and Pause or a repatch without the overlay
     * patch answers the stock look.
     */
    private static final int FADE_CELL_ID = 0x7f0a0d01;
    private static final int FADE_COLUMN_ID = 0x7f0a0d02;
    private static final int FADE_TABS_ID = 0x7f0a0d03;

    private static void resolveFadeIds() {
        VideoOverlayHider.resolveForTests("view_rootview", FADE_CELL_ID);
        VideoOverlayHider.resolveForTests("47.0.3:liy", FADE_COLUMN_ID);
        VideoOverlayHider.resolveForTests("47.0.3:uvy", FADE_TABS_ID);
    }

    private static void clearFadeIds() {
        VideoOverlayHider.resolveForTests("view_rootview", 0);
        VideoOverlayHider.resolveForTests("47.0.3:liy", 0);
        VideoOverlayHider.resolveForTests("47.0.3:uvy", 0);
    }

    @Test
    public void fadingTheControlsKeepsThemTouchableAndSetsTheirOpacity() {
        resolveFadeIds();
        boolean overlays = app.morphe.extension.tiktok.settings.SettingsStatus.videoOverlaysEnabled;
        app.morphe.extension.tiktok.settings.SettingsStatus.videoOverlaysEnabled = true;
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout root = new FrameLayout(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(FADE_CELL_ID);
            FrameLayout column = new FrameLayout(activity);
            column.setId(FADE_COLUMN_ID);
            column.setClickable(true);
            cell.addView(column);
            View tabs = new View(activity);
            tabs.setId(FADE_TABS_ID);
            root.addView(cell);
            root.addView(tabs);
            activity.setContentView(root);

            Settings.FADE_CONTROLS_OPACITY.save(100);
            VideoOverlayHider.applyTo(activity);
            assertEquals("100 is stock", 1f, column.getAlpha(), 0f);
            assertEquals(1f, tabs.getAlpha(), 0f);

            Settings.FADE_CONTROLS_OPACITY.save(50);
            VideoOverlayHider.applyTo(activity);
            assertEquals(0.5f, column.getAlpha(), 0f);
            assertEquals(0.5f, tabs.getAlpha(), 0f);
            assertEquals("a faded column still takes taps", View.VISIBLE, column.getVisibility());
            assertTrue(column.isClickable());
            assertEquals(View.VISIBLE, tabs.getVisibility());

            Settings.FADE_CONTROLS_OPACITY.save(0);
            VideoOverlayHider.applyTo(activity);
            assertEquals("0 hides the column the way Clear display does",
                    View.GONE, column.getVisibility());
            assertEquals("the tabs never fade below the floor",
                    VideoOverlayHider.NAVIGATION_FADE_FLOOR / 100f, tabs.getAlpha(), 0.0001f);
            assertEquals(View.VISIBLE, tabs.getVisibility());

            Settings.FADE_CONTROLS_OPACITY.save(100);
            VideoOverlayHider.applyTo(activity);
            assertEquals(View.VISIBLE, column.getVisibility());
            assertEquals("back to 100 puts the opacity back", 1f, column.getAlpha(), 0f);
            assertEquals(1f, tabs.getAlpha(), 0f);
        } finally {
            Settings.FADE_CONTROLS_OPACITY.save(100);
            app.morphe.extension.tiktok.settings.SettingsStatus.videoOverlaysEnabled = overlays;
            clearFadeIds();
        }
    }

    @Test
    public void theFadeFollowsRecycledViewsAndTikToksOwnAlphaWrites() {
        resolveFadeIds();
        boolean overlays = app.morphe.extension.tiktok.settings.SettingsStatus.videoOverlaysEnabled;
        app.morphe.extension.tiktok.settings.SettingsStatus.videoOverlaysEnabled = true;
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout root = new FrameLayout(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(FADE_CELL_ID);
            View column = new View(activity);
            column.setId(FADE_COLUMN_ID);
            cell.addView(column);
            root.addView(cell);
            activity.setContentView(root);

            Settings.FADE_CONTROLS_OPACITY.save(50);
            VideoOverlayHider.applyTo(activity);
            assertEquals(0.5f, column.getAlpha(), 0f);

            // An animation ends by writing 1 back; the next pass fades it again.
            column.setAlpha(1f);
            VideoOverlayHider.applyTo(activity);
            assertEquals(0.5f, column.getAlpha(), 0f);

            // The feed re-binds a cell: a new column under the same id is faded on the next pass.
            cell.removeView(column);
            View rebound = new View(activity);
            rebound.setId(FADE_COLUMN_ID);
            cell.addView(rebound);
            VideoOverlayHider.applyTo(activity);
            assertEquals(0.5f, rebound.getAlpha(), 0f);

            // A new level is taken from the opacity the view had before, not compounded.
            Settings.FADE_CONTROLS_OPACITY.save(25);
            VideoOverlayHider.applyTo(activity);
            assertEquals(0.25f, rebound.getAlpha(), 0f);
        } finally {
            Settings.FADE_CONTROLS_OPACITY.save(100);
            app.morphe.extension.tiktok.settings.SettingsStatus.videoOverlaysEnabled = overlays;
            clearFadeIds();
        }
    }

    @Test
    public void thePauseAndARepatchWithoutTheOverlayPatchLeaveTheControlsAlone() {
        resolveFadeIds();
        boolean overlays = app.morphe.extension.tiktok.settings.SettingsStatus.videoOverlaysEnabled;
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            FrameLayout root = new FrameLayout(activity);
            FrameLayout cell = new FrameLayout(activity);
            cell.setId(FADE_CELL_ID);
            View column = new View(activity);
            column.setId(FADE_COLUMN_ID);
            cell.addView(column);
            root.addView(cell);
            activity.setContentView(root);

            Settings.FADE_CONTROLS_OPACITY.save(50);

            // A saved value does nothing when the patch that installs the hooks is not there.
            app.morphe.extension.tiktok.settings.SettingsStatus.videoOverlaysEnabled = false;
            VideoOverlayHider.applyTo(activity);
            assertEquals(1f, column.getAlpha(), 0f);

            app.morphe.extension.tiktok.settings.SettingsStatus.videoOverlaysEnabled = true;
            VideoOverlayHider.applyTo(activity);
            assertEquals(0.5f, column.getAlpha(), 0f);

            // Pause gives the stock look back, and keeps it while paused.
            app.morphe.extension.shared.settings.PausedProcess.set(true);
            VideoOverlayHider.applyTo(activity);
            assertEquals(1f, column.getAlpha(), 0f);
            VideoOverlayHider.applyTo(activity);
            assertEquals(1f, column.getAlpha(), 0f);
            assertEquals(View.VISIBLE, column.getVisibility());

            app.morphe.extension.shared.settings.PausedProcess.set(false);
            VideoOverlayHider.applyTo(activity);
            assertEquals(0.5f, column.getAlpha(), 0f);
        } finally {
            app.morphe.extension.shared.settings.PausedProcess.set(false);
            Settings.FADE_CONTROLS_OPACITY.save(100);
            app.morphe.extension.tiktok.settings.SettingsStatus.videoOverlaysEnabled = overlays;
            clearFadeIds();
        }
    }
}
