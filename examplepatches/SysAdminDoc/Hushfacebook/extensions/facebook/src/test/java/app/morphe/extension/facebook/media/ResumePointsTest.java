/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * The saved points stay within their bounds: at most {@link ResumePoints#MAX_POINTS}, the least
 * recently saved going first, none older than {@link ResumePoints#KEEP_MS}, and a value that
 * doesn't read as a point is dropped from the file rather than kept or trusted.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ResumePointsTest {
    private static final long NOW = 1_800_000_000_000L;
    private SharedPreferences file;

    @Before
    public void start() {
        file = RuntimeEnvironment.getApplication().getSharedPreferences(ResumePoints.FILE, Context.MODE_PRIVATE);
        file.edit().clear().commit();
    }

    @Test
    public void aPointIsKeptReplacedAndForgotten() {
        ResumePoints points = new ResumePoints(file);
        assertNull(points.get("1", NOW));
        points.put("1", 90_000, NOW);
        points.put("1", 95_000, NOW + 1);
        ResumePoints.Point point = points.get("1", NOW + 2);
        assertNotNull(point);
        assertEquals(95_000, point.positionMs);
        assertEquals(1, points.size(NOW));
        assertTrue(points.remove("1", NOW));
        assertFalse("a second remove found it", points.remove("1", NOW));
        assertNull(points.get("1", NOW));
        assertTrue(file.getAll().isEmpty());
    }

    @Test
    public void theOldestGoesFirstPastTheLimit() {
        ResumePoints points = new ResumePoints(file);
        for (int index = 0; index <= ResumePoints.MAX_POINTS; index++) {
            points.put("id" + index, 60_000 + index, NOW + index);
        }
        assertEquals(ResumePoints.MAX_POINTS, points.size(NOW));
        assertNull("the oldest stayed", points.get("id0", NOW + 1_000));
        assertNotNull(points.get("id1", NOW + 1_000));
        assertEquals(ResumePoints.MAX_POINTS, file.getAll().size());

        // Saving an old one again makes it the newest, so the next to go is the one after it.
        points.put("id1", 70_000, NOW + 2_000);
        points.put("new", 70_000, NOW + 2_001);
        assertNotNull(points.get("id1", NOW + 3_000));
        assertNull(points.get("id2", NOW + 3_000));
    }

    @Test
    public void aPointPastItsAgeIsDropped() {
        ResumePoints points = new ResumePoints(file);
        points.put("1", 90_000, NOW);
        assertNotNull(points.get("1", NOW + ResumePoints.KEEP_MS));
        assertNull(points.get("1", NOW + ResumePoints.KEEP_MS + 1));
        assertFalse("the file kept it", file.contains("1"));
    }

    @Test
    public void theFileIsReadOnceAndCleanedAsItIsRead() {
        file.edit()
                .putString("fresh", ResumePoints.encode(120_000, NOW - 1_000))
                .putString("stale", ResumePoints.encode(120_000, NOW - ResumePoints.KEEP_MS - 1))
                .putString("garbled", "twelve minutes")
                .putString("zero", ResumePoints.encode(0, NOW))
                .putString("noTime", "5000:")
                .putInt("notAString", 4)
                .commit();
        ResumePoints points = new ResumePoints(file);
        assertEquals(1, points.size(NOW));
        assertEquals(120_000, points.get("fresh", NOW).positionMs);
        assertEquals("the file kept what isn't a point", 1, file.getAll().size());
    }

    @Test
    public void aFileWithMoreThanTheLimitKeepsTheNewest() {
        SharedPreferences.Editor edit = file.edit();
        for (int index = 0; index < ResumePoints.MAX_POINTS + 5; index++) {
            edit.putString("id" + index, ResumePoints.encode(60_000, NOW - 10_000 + index));
        }
        edit.commit();
        ResumePoints points = new ResumePoints(file);
        assertEquals(ResumePoints.MAX_POINTS, points.size(NOW));
        for (int index = 0; index < 5; index++) assertNull(points.get("id" + index, NOW));
        assertNotNull(points.get("id5", NOW));
        assertEquals(ResumePoints.MAX_POINTS, file.getAll().size());
    }

    @Test
    public void aPointReadsBackAsItWasWritten() {
        ResumePoints.Point point = ResumePoints.decode(ResumePoints.encode(754_000, NOW));
        assertNotNull(point);
        assertEquals(754_000, point.positionMs);
        assertEquals(NOW, point.savedAt);
        assertNull(ResumePoints.decode(":5"));
        assertNull(ResumePoints.decode("-5:" + NOW));
    }
}
