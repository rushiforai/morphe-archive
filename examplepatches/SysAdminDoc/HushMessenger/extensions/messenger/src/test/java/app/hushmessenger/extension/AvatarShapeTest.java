package app.hushmessenger.extension;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.RectF;
import android.graphics.Region;
import android.view.View;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

/** Square profile pictures (#89): circles become squares, or rounded squares, until the next restart changes it. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class AvatarShapeTest {
    private static final float[] RADII = {1, 2, 3, 4, 5, 6, 7, 8};

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.avatarShape = -1;
        CrashGuard.resetForTests();
    }

    @After public void forget() {
        Settings.avatarShape = -1;
    }

    @Test public void offLeavesEveryCircleAlone() {
        assertTrue(Settings.avatarCircle(true));
        assertEquals(12f, Settings.avatarRadius(true, 12f), 0f);
        assertSame(RADII, Settings.avatarVitoRadii(true, RADII));
        assertSame(RADII, Settings.avatarRadii(RADII, true));
        assertNull(Settings.avatarRadii(null, true));
        assertEquals(0, Settings.lastActive(Settings.AVATAR_SHAPE));
    }

    @Test public void squareDropsTheCircleAndEveryCorner() {
        Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, true).commit();
        assertFalse(Settings.avatarCircle(true));
        assertEquals(0f, Settings.avatarRadius(true, 12f), 0f);
        assertNull("Vito's radii win over the radius, so they go", Settings.avatarVitoRadii(true, RADII));
        assertArrayEquals(new float[8], Settings.avatarRadii(null, true), 0f);
        assertArrayEquals(new float[8], Settings.avatarRadii(RADII, true), 0f);
        assertTrue(Settings.lastActive(Settings.AVATAR_SHAPE) > 0);
    }

    @Test public void roundedGivesEveryFormerCircleTheSameCorners() {
        Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, true).putBoolean(Settings.AVATAR_ROUNDED, true).commit();
        float corner = Settings.AVATAR_CORNER_DP * android.content.res.Resources.getSystem().getDisplayMetrics().density;
        assertTrue(corner > 0);
        assertFalse(Settings.avatarCircle(true));
        assertEquals(corner, Settings.avatarRadius(true, 0f), 0f);
        assertNull(Settings.avatarVitoRadii(true, RADII));
        float[] corners = Settings.avatarRadii(null, true);
        assertEquals(8, corners.length);
        for (float each : corners) assertEquals(corner, each, 0f);
    }

    @Test public void picturesThatWerentCirclesKeepTheirOwnShape() {
        Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, true).putBoolean(Settings.AVATAR_ROUNDED, true).commit();
        assertFalse(Settings.avatarCircle(false));
        assertEquals(12f, Settings.avatarRadius(false, 12f), 0f);
        assertSame(RADII, Settings.avatarVitoRadii(false, RADII));
        assertSame(RADII, Settings.avatarRadii(RADII, false));
    }

    @Test public void roundTheCornersAloneChangesNothing() {
        Settings.preferences.edit().putBoolean(Settings.AVATAR_ROUNDED, true).commit();
        assertTrue(Settings.avatarCircle(true));
        assertEquals(12f, Settings.avatarRadius(true, 12f), 0f);
    }

    @Test public void pauseSafeModeAndAMissingControlKeepCircles() {
        for (String state : new String[] {"paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.avatarShape = -1;
            Settings.preferences.edit().clear().putBoolean(Settings.AVATAR_SHAPE, true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            assertTrue(state, Settings.avatarCircle(true));
            assertEquals(state, 0, Settings.lastActive(Settings.AVATAR_SHAPE));
        }
    }

    // Vito makes its circle presets once, so the first answer holds for the run and a change waits for a restart.
    @Test public void theFirstAnswerHoldsUntilARestart() {
        assertNull("Nothing is held before Messenger asks", Settings.heldUntilRestart(Settings.AVATAR_SHAPE));
        Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, true).commit();
        assertFalse(Settings.avatarCircle(true));
        assertNull("The held answer matches the switch", Settings.heldUntilRestart(Settings.AVATAR_SHAPE));

        Settings.preferences.edit().putBoolean(Settings.AVATAR_ROUNDED, true).commit();
        assertEquals("Still square this run", 0f, Settings.avatarRadius(true, 12f), 0f);
        assertEquals("Rounded takes effect after a restart", Boolean.FALSE, Settings.heldUntilRestart(Settings.AVATAR_SHAPE));

        Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, false).commit();
        assertFalse("Squares stay until a restart", Settings.avatarCircle(true));
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart(Settings.AVATAR_SHAPE));

        Settings.avatarShape = -1;
        assertTrue("A restart asks again", Settings.avatarCircle(true));
        assertNull(Settings.heldUntilRestart(Settings.AVATAR_SHAPE));
        Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, true).commit();
        assertEquals("Turning it on mid-run waits too", Boolean.FALSE, Settings.heldUntilRestart(Settings.AVATAR_SHAPE));
    }

    /** Remembers which shape each call drew, so the user tile's placeholder can be checked without pixels. */
    private static final class Recorder extends Canvas {
        final List<String> drawn = new ArrayList<>();
        @Override public void drawOval(RectF oval, Paint paint) { drawn.add("oval"); }
        @Override public void drawRect(RectF rect, Paint paint) { drawn.add("rect"); }
        @Override public void drawRoundRect(RectF rect, float rx, float ry, Paint paint) { drawn.add("round " + rx + " " + ry); }
        @Override public void drawArc(RectF oval, float start, float sweep, boolean center, Paint paint) { drawn.add("arc " + start + " " + sweep); }
        @Override public void drawPath(Path path, Paint paint) { drawn.add("path " + Math.round(new PathMeasure(path, false).getLength())); }
    }

    /** Where a path starts and ends, and how long it runs, to the nearest pixel. */
    private static String run(Path path) {
        PathMeasure measure = new PathMeasure(path, false);
        float length = 0;
        float[] start = new float[2], end = new float[2];
        measure.getPosTan(0, start, null);
        do {
            length += measure.getLength();
            measure.getPosTan(measure.getLength(), end, null);
        } while (measure.nextContour());
        return Math.round(start[0]) + "," + Math.round(start[1]) + " to " + Math.round(end[0]) + "," + Math.round(end[1]) + " over " + Math.round(length);
    }

    /** How far a path runs over all its pieces. Skia measures quarter circles a little short of 2 pi r over 4. */
    private static float length(Path path) {
        PathMeasure measure = new PathMeasure(path, false);
        float length = 0;
        do length += measure.getLength(); while (measure.nextContour());
        return length;
    }

    // #116: the story ring is an arc around the circle, so square pictures still had round rings.
    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aStoryRingFollowsTheSquareAndTheOverscrollArcStaysRound() {
        RectF box = new RectF(0, 0, 100, 100);
        Object ring = new Object(), overscroll = new Object();
        Settings.storyRingMade(ring);
        Settings.storyRingMade(null);
        Recorder canvas = new Recorder();

        Settings.storyRingArc(canvas, box, 270, 360, false, new Paint(), ring);
        assertEquals("Off keeps Messenger's arc", List.of("arc 270.0 360.0"), canvas.drawn);
        assertEquals(0, Settings.lastActive(Settings.AVATAR_SHAPE));

        Settings.avatarShape = -1;
        Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, true).commit();
        canvas.drawn.clear();
        Settings.storyRingArc(canvas, box, 270, 360, false, new Paint(), ring);
        Settings.storyRingArc(canvas, box, 270, 90, false, new Paint(), ring);
        Settings.storyRingArc(canvas, box, 270, 360, false, new Paint(), overscroll);
        Settings.storyRingArc(canvas, box, 270, 360, false, new Paint(), null);
        Settings.storyRingArc(canvas, box, 270, 90, true, new Paint(), ring);
        assertEquals(List.of("path 400", "path 100", "arc 270.0 360.0", "arc 270.0 360.0", "arc 270.0 90.0"), canvas.drawn);
        assertTrue(Settings.lastActive(Settings.AVATAR_SHAPE) > 0);

        // Clockwise from the top middle, like the arc it replaces, and on round past it.
        assertEquals("50,0 to 100,50 over 100", run(Settings.ringPath(box, 270, 90, 0)));
        assertEquals("0,50 to 100,50 over 200", run(Settings.ringPath(box, 180, 180, 0)));
        assertEquals("Backwards is the same stretch", "0,50 to 50,0 over 100", run(Settings.ringPath(box, 270, -90, 0)));
        assertEquals("50,0 to 50,0 over 400", run(Settings.ringPath(box, -90, 360, 0)));
        // Four 80 pixel sides and four quarter circles of 10.
        Path rounded = Settings.ringPath(box, 270, 400, 10);
        assertTrue(run(rounded), run(rounded).startsWith("50,0 to 50,0 over "));
        assertEquals(320 + 20 * Math.PI, length(rounded), 1);

        Settings.avatarShape = -1;
        Settings.preferences.edit().putBoolean(Settings.AVATAR_ROUNDED, true).commit();
        Settings.storyRingArc(canvas, box, 270, 360, false, new Paint(), ring);
        float corner = Settings.avatarCornerPx();
        String last = canvas.drawn.get(canvas.drawn.size() - 1);
        assertTrue(last, last.startsWith("path "));
        assertEquals(4 * (100 - 2 * corner) + 2 * Math.PI * corner, Integer.parseInt(last.substring(5)), 1);
    }

    // #118: Hide stories and notes drops the ring around each picture too, with or without square pictures.
    @Test public void hideStoriesLeavesOutTheRingButNotTheOverscrollArc() {
        assertTrue(Settings.installed.contains("stories"));
        RectF box = new RectF(0, 0, 100, 100);
        Object ring = new Object(), overscroll = new Object();
        Settings.storyRingMade(ring);
        Settings.preferences.edit().putBoolean("stories", true).commit();
        Recorder canvas = new Recorder();
        Settings.storyRingArc(canvas, box, 270, 360, false, new Paint(), ring);
        Settings.storyRingArc(canvas, box, 270, 360, false, new Paint(), overscroll);
        Settings.storyRingArc(canvas, box, 270, 360, false, new Paint(), null);
        Settings.storyRingArc(canvas, box, 270, 90, true, new Paint(), ring);
        assertEquals(List.of("arc 270.0 360.0", "arc 270.0 360.0", "arc 270.0 90.0"), canvas.drawn);
        assertTrue(Settings.lastActive("stories") > 0);

        Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, true).commit();
        canvas.drawn.clear();
        Settings.storyRingArc(canvas, box, 270, 360, false, new Paint(), ring);
        assertEquals("Square pictures still lose it", List.of(), canvas.drawn);

        Settings.preferences.edit().putBoolean("paused", true).commit();
        Settings.avatarShape = -1;
        Settings.storyRingArc(canvas, box, 270, 360, false, new Paint(), ring);
        assertEquals("Pause brings Messenger's ring back", List.of("arc 270.0 360.0"), canvas.drawn);
    }

    private static boolean covers(Path path, int x, int y) {
        Region region = new Region();
        region.setPath(path, new Region(0, 0, 200, 200));
        return region.contains(x, y);
    }

    // 584.1's user tile (inbox rows, the story tray, chat headers) clips through a path and fills an oval behind the initials.
    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void theUserTileGetsASquareClipAndASquarePlaceholder() {
        Path oval = new Path();
        oval.addOval(new RectF(0, 0, 100, 100), Path.Direction.CW);
        RectF bounds = new RectF(0, 0, 100, 100);
        Recorder canvas = new Recorder();

        assertSame("Off leaves the clip alone", oval, Settings.avatarPath(oval));
        Settings.avatarOval(canvas, bounds, new Paint());
        assertNull(Settings.avatarPath(null));

        Settings.avatarShape = -1;
        Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, true).commit();
        Path square = Settings.avatarPath(oval);
        assertNotSame(oval, square);
        assertFalse("The oval leaves its corners out", covers(oval, 2, 2));
        assertTrue("The square fills them", covers(square, 2, 2));
        assertFalse(covers(square, 101, 50));
        Settings.avatarOval(canvas, bounds, new Paint());

        Settings.avatarShape = -1;
        Settings.preferences.edit().putBoolean(Settings.AVATAR_ROUNDED, true).commit();
        float corner = Settings.avatarCornerPx();
        Path rounded = Settings.avatarPath(oval);
        assertFalse("A rounded corner is still cut", covers(rounded, 0, 0));
        assertTrue("Past the corner it's square", covers(rounded, (int) Math.ceil(corner) + 1, 1));
        assertTrue(covers(rounded, 1, (int) Math.ceil(corner) + 1));
        Settings.avatarOval(canvas, bounds, new Paint());

        assertEquals(List.of("oval", "rect", "round " + corner + " " + corner), canvas.drawn);
    }

    // Online people's story tiles cut the dot out of the oval, and the curves around the cut measure far past the tile.
    // Two half-circle cubics put their control points a third of the radius outside, like the device's path.
    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aTileWithItsDotCutOutKeepsTheSameSquare() {
        float reach = 50f * 4 / 3;
        Path badged = new Path();
        badged.moveTo(20, 70);
        badged.cubicTo(20, 70 - reach, 120, 70 - reach, 120, 70);
        badged.cubicTo(120, 70 + reach, 20, 70 + reach, 20, 70);
        badged.close();
        Path dot = new Path();
        dot.addCircle(110, 110, 18, Path.Direction.CW);
        badged.op(dot, Path.Op.DIFFERENCE);
        assertFalse(badged.isConvex());
        RectF measured = new RectF();
        badged.computeBounds(measured, true);
        assertTrue("Control points overshoot: " + measured, measured.right > 121 || measured.bottom > 121);
        assertEquals(new RectF(20, 20, 120, 120), Settings.coveredBounds(badged));

        // A dent makes it concave, and the bottom curve reaches 150 while its control point sits at 180.
        Path bulge = new Path();
        bulge.moveTo(20, 20);
        bulge.lineTo(70, 50);
        bulge.lineTo(120, 20);
        bulge.lineTo(120, 120);
        bulge.quadTo(70, 180, 20, 120);
        bulge.close();
        RectF loose = new RectF();
        bulge.computeBounds(loose, true);
        assertEquals("Control points overshoot", 180f, loose.bottom, 0.01f);
        assertEquals(new RectF(20, 20, 120, 150), Settings.coveredBounds(bulge));

        Settings.avatarShape = -1;
        Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, true).commit();
        Path square = Settings.avatarPath(badged);
        assertTrue(covers(square, 21, 21));
        assertTrue("The dot's corner is filled", covers(square, 118, 118));
        assertFalse("Nothing past the tile", covers(square, 121, 70));
        assertFalse(covers(square, 70, 121));
        assertFalse(covers(square, 19, 70));
    }

    @Test public void theRowSaysToRestartAndTheRestartRowShowsUp() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals(Settings.AVATAR_SHAPE)) spec = control;
        assertNotNull(spec);
        assertEquals("Square profile pictures", spec[1]);
        assertEquals("theme", spec[3]);
        assertTrue(spec[2].contains("Restart Messenger to see the change."));
        assertTrue(Settings.installed.contains(Settings.AVATAR_SHAPE));
        assertEquals(Settings.AVATAR_SHAPE, Settings.SUB_SWITCHES.get(Settings.AVATAR_ROUNDED));

        // Messenger already drew circles this run.
        Settings.avatarShape = Settings.AVATAR_CIRCLE;
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals(View.GONE, root.findViewWithTag("restart_row").getVisibility());
            root.findViewWithTag(Settings.AVATAR_SHAPE).performClick();
            assertTrue(Settings.preferences.getBoolean(Settings.AVATAR_SHAPE, false));
            assertTrue(root.findViewWithTag("restart_row").isShown());
            assertEquals("1 change waits for a restart", ((TextView) root.findViewWithTag("restart_waiting")).getText().toString());
            root.findViewWithTag(Settings.AVATAR_SHAPE).performClick();
            assertEquals(View.GONE, root.findViewWithTag("restart_row").getVisibility());
        }
    }

    @Test public void roundTheCornersSitsUnderTheSwitchAndSearchFindsIt() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Switch rounded = root.findViewWithTag(Settings.AVATAR_ROUNDED);
            assertNotNull(rounded);
            assertFalse(rounded.isChecked());
            View shape = root.findViewWithTag(Settings.AVATAR_SHAPE);
            View wrapper = (View) ((View) shape.getParent()).getParent();
            assertSame("Inside the Square profile pictures block", wrapper, ((View) rounded.getParent()).getParent());
            assertFalse(SettingsActivity.EXPERIMENTAL.contains(Settings.AVATAR_SHAPE));

            rounded.performClick();
            assertTrue(Settings.preferences.getBoolean(Settings.AVATAR_ROUNDED, false));
            assertFalse("Turning it on leaves Square profile pictures alone", Settings.preferences.getBoolean(Settings.AVATAR_SHAPE, false));

            // "sharp" is only in the inside switch's own words.
            ((EditText) root.findViewWithTag("find_control")).setText("sharp");
            assertEquals(View.VISIBLE, wrapper.getVisibility());
            assertTrue(rounded.isShown());
        }
    }

    @Test public void aBackupCarriesRoundTheCornersOnlyWithTheSwitch() {
        Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, true).putBoolean(Settings.AVATAR_ROUNDED, true).commit();
        String backup = ChoiceCodec.encode(Settings.preferences, Set.of(Settings.AVATAR_SHAPE));
        assertEquals(Map.of("paused", false, Settings.AVATAR_SHAPE, true, Settings.AVATAR_ROUNDED, true), ChoiceCodec.parse(backup));
        assertFalse(ChoiceCodec.encode(Settings.preferences, Set.of("stories")).contains(Settings.AVATAR_ROUNDED));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Settings.preferences.edit().putBoolean(Settings.AVATAR_SHAPE, false).putBoolean(Settings.AVATAR_ROUNDED, false).commit();
            RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class).setPrimaryClip(ClipData.newPlainText("choices", backup));
            root.findViewWithTag("import_choices").performClick();
            assertTrue(Settings.preferences.getBoolean(Settings.AVATAR_ROUNDED, false));
            assertTrue(((Switch) root.findViewWithTag(Settings.AVATAR_ROUNDED)).isChecked());
        }
    }
}
