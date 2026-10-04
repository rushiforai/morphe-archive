/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.comment;

import static org.junit.Assert.*;
import android.content.Context;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import kotlin.jvm.functions.Function0;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import app.hushgram.extension.instagram.download.MediaSave;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class CommentPhotoTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private final List<?> stock = Collections.singletonList("Report");
    private final FakeNative nativeRows = new FakeNative();
    private final List<List<MediaSave.Rendition>> queued = new ArrayList<>();
    private final CommentPhoto.Save save = (context, snapshot) -> queued.add(snapshot);
    private Context context;

    @Before public void enable() {
        context = RuntimeEnvironment.getApplication();
        context.getApplicationInfo().targetSdkVersion = 36;
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        BaseSettings.SAFE_MODE.save(false);
        Settings.COPY_COMMENTS.save(true);
        Settings.SAVE_COMMENT_PHOTOS.save(true);
        ShadowToast.reset();
    }

    @After public void restore() {
        Settings.COPY_COMMENTS.resetToDefault();
        Settings.SAVE_COMMENT_PHOTOS.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        BaseSettings.SAFE_MODE.save(false);
    }

    private static List<MediaSave.Rendition> photo(String name) {
        return new ArrayList<>(Arrays.asList(
                new MediaSave.Rendition("https://scontent.cdninstagram.com/" + name + "-small.jpg", 640, 480, 0),
                new MediaSave.Rendition("https://scontent.cdninstagram.com/" + name + "-large.jpg", 1440, 1080, 0)));
    }

    @Test public void explicitTapSavesAnImmutableSnapshotAndReturnsForDismissal() {
        List<MediaSave.Rendition> source = photo("selected");
        List<?> rows = CommentPhoto.rows(stock, source, context, nativeRows, save);
        assertEquals(2, rows.size());
        assertSame(stock.get(0), rows.get(0));
        assertTrue("showing the menu saves nothing", queued.isEmpty());
        source.clear();
        assertNull(((Row) rows.get(1)).callback.invoke());
        assertEquals(1, queued.size());
        assertEquals(2, queued.get(0).size());
        assertEquals("https://scontent.cdninstagram.com/selected-large.jpg", queued.get(0).get(1).url);
        assertEquals(1440, queued.get(0).get(1).width);
        assertEquals(1080, queued.get(0).get(1).height);
        assertThrows(UnsupportedOperationException.class, () -> queued.get(0).clear());
        assertEquals(36, context.getApplicationInfo().targetSdkVersion);
    }

    @Test public void immutableRepeatedAndChangedMenusKeepStockRowsAndOneOwnedRow() {
        List<?> rows = CommentPhoto.rows(stock, photo("first"), context, nativeRows, save);
        assertEquals(1, stock.size());
        assertSame(rows, CommentPhoto.rows(rows, photo("first"), context, nativeRows, save));
        List<?> duplicated = Collections.unmodifiableList(Arrays.asList(stock.get(0), rows.get(1), rows.get(1)));
        List<?> repaired = CommentPhoto.rows(duplicated, photo("first"), context, nativeRows, save);
        assertEquals(2, repaired.size());
        assertSame(stock.get(0), repaired.get(0));
        assertEquals(3, duplicated.size());
        List<?> changed = CommentPhoto.rows(rows, photo("second"), context, nativeRows, save);
        assertEquals(2, changed.size());
        assertSame(stock.get(0), changed.get(0));
        ((Row) changed.get(1)).callback.invoke();
        assertTrue(queued.get(0).get(0).url.endsWith("second-small.jpg"));
        assertEquals(3, nativeRows.created);
    }

    @Test public void noPhotoNowRemovesOnlyStaleOwnedRows() {
        List<?> first = CommentPhoto.rows(stock, photo("first"), context, nativeRows, save);
        List<?> duplicated = Collections.unmodifiableList(Arrays.asList(first.get(1), stock.get(0), first.get(1)));
        for (Object comment : Arrays.asList(Collections.emptyList(), new Object(), "parent media only", "pending upload only")) {
            List<?> cleaned = CommentPhoto.rows(duplicated, comment, context, nativeRows, save);
            assertEquals(Collections.singletonList(stock.get(0)), cleaned);
            assertSame(cleaned, CommentPhoto.rows(cleaned, comment, context, nativeRows, save));
            assertEquals(3, duplicated.size());
        }
        assertSame(stock, CommentPhoto.rows(stock, new Object(), context, nativeRows, save));
        assertEquals(1, nativeRows.created);
        assertTrue(queued.isEmpty());
    }

    @Test public void eachFamilyAloneAndTogetherKeepDistinctOwnedRows() {
        CommentCopyTest.FakeNative copy = new CommentCopyTest.FakeNative();
        CommentActions.Action copies = list -> CommentCopy.rows(list, new String[]{"original"}, context, copy);
        CommentActions.Action photos = list -> CommentPhoto.rows(list, photo("selected"), context, nativeRows, save);
        CommentActions.Action never = list -> { throw new AssertionError("a family that isn't in the build ran"); };
        assertSame(stock, CommentActions.dispatch(stock, false, false, never, never));
        List<?> copyAlone = CommentActions.dispatch(stock, true, false, copies, never);
        assertEquals(2, copyAlone.size());
        assertTrue(((CommentCopyTest.Row) copyAlone.get(1)).callback instanceof CommentCopy.CopyAction);
        List<?> photoAlone = CommentActions.dispatch(stock, false, true, never, photos);
        assertEquals(2, photoAlone.size());
        assertTrue(((Row) photoAlone.get(1)).callback instanceof CommentPhoto.PhotoAction);
        List<?> together = CommentActions.dispatch(stock, true, true, copies, photos);
        assertEquals(3, together.size());
        assertSame(stock.get(0), together.get(0));
        assertTrue(((CommentCopyTest.Row) together.get(1)).callback instanceof CommentCopy.CopyAction);
        assertTrue(((Row) together.get(2)).callback instanceof CommentPhoto.PhotoAction);
        assertSame(together, CommentActions.dispatch(together, true, true, copies, photos));
        Settings.COPY_COMMENTS.save(false);
        List<?> copyOff = CommentActions.dispatch(together, true, true, copies, photos);
        assertSame("a switched-off family leaves its rows to Instagram's next menu", together, copyOff);
        assertTrue(queued.isEmpty());
    }

    @Test public void offPausedUnreadyAndMissingInputsLeaveStockUntouched() {
        Settings.SAVE_COMMENT_PHOTOS.save(false);
        assertSame(stock, CommentPhoto.rows(stock, photo("selected"), context, nativeRows, save));
        Settings.SAVE_COMMENT_PHOTOS.save(true);
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertSame(stock, CommentPhoto.rows(stock, photo("selected"), context, nativeRows, save));
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() ->
                assertSame(stock, CommentPhoto.rows(stock, photo("selected"), context, nativeRows, save)));
        assertSame(stock, CommentPhoto.rows(stock, photo("selected"), null, nativeRows, save));
        assertSame(stock, CommentPhoto.rows(stock, null, context, nativeRows, save));
        assertNull(CommentPhoto.rows(null, photo("selected"), context, nativeRows, save));
        assertSame("the unpatched stubs find no photo", stock, CommentPhoto.rows(stock, new Object(), context));
        assertEquals(0, nativeRows.created);
        assertTrue(queued.isEmpty());
    }

    @Test public void getterRowAndQueueFailuresStayContainedAndRespectALateSwitch() {
        nativeRows.fail = true;
        assertSame(stock, CommentPhoto.rows(stock, photo("selected"), context, nativeRows, save));
        nativeRows.fail = false;
        nativeRows.failRow = true;
        assertSame(stock, CommentPhoto.rows(stock, photo("selected"), context, nativeRows, save));
        nativeRows.failRow = false;
        nativeRows.nullRow = true;
        assertSame(stock, CommentPhoto.rows(stock, photo("selected"), context, nativeRows, save));
        nativeRows.nullRow = false;

        List<?> rows = CommentPhoto.rows(stock, photo("selected"), context, nativeRows,
                (ctx, snapshot) -> { throw new IllegalStateException("queue failed"); });
        assertNull(((Row) rows.get(1)).callback.invoke());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Download failed", String.valueOf(ShadowToast.getTextOfLatestToast()));

        rows = CommentPhoto.rows(stock, photo("selected"), context, nativeRows, save);
        Settings.SAVE_COMMENT_PHOTOS.save(false);
        assertNull(((Row) rows.get(1)).callback.invoke());
        Settings.SAVE_COMMENT_PHOTOS.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertNull(((Row) rows.get(1)).callback.invoke());
        assertTrue(queued.isEmpty());
    }

    @Test public void initialOffAndSafetyGatesNeverReadOrSaveNativeCommentMedia() {
        Settings.SAVE_COMMENT_PHOTOS.resetToDefault();
        assertSame(stock, CommentPhoto.rows(stock, photo("selected"), context, nativeRows, save));
        assertSame(null, CommentPhoto.rows(null, photo("selected"), context, nativeRows, save));
        Settings.SAVE_COMMENT_PHOTOS.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertSame(stock, CommentPhoto.rows(stock, photo("selected"), context, nativeRows, save));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() ->
                assertSame(stock, CommentPhoto.rows(stock, photo("selected"), context, nativeRows, save)));
        SettingsContextRule.beforeThePauseIsDecided(() ->
                assertSame(stock, CommentPhoto.rows(stock, photo("selected"), context, nativeRows, save)));
        assertEquals("no media getter or native row callback", 0, nativeRows.inspected);
        assertEquals(0, nativeRows.created);
        assertTrue(queued.isEmpty());
    }

    static final class Row {
        final Function0<?> callback;
        Row(Object callback) { this.callback = (Function0<?>) callback; }
    }

    static final class FakeNative implements CommentPhoto.NativeRows {
        int created;
        int inspected;
        boolean fail, failRow, nullRow;
        @SuppressWarnings("unchecked") public List<MediaSave.Rendition> photo(Object comment) {
            inspected++;
            if (fail) throw new IllegalStateException("native photo getter failed");
            return comment instanceof List ? (List<MediaSave.Rendition>) comment : null;
        }
        public Object row(Object callback) {
            if (failRow) throw new IllegalStateException("row failed");
            if (nullRow) return null;
            created++;
            return new Row(callback);
        }
        public Object callback(Object row) { inspected++; return row instanceof Row ? ((Row) row).callback : null; }
    }
}
