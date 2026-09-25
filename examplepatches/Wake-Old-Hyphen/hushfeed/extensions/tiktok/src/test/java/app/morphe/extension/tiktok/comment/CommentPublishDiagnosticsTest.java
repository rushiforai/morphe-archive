package app.morphe.extension.tiktok.comment;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.preference.LogBufferManager;
import app.morphe.extension.tiktok.SettingsContextRule;

import java.util.Arrays;
import java.util.Collections;
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
 * The report says what a comment send had in hand and where the publish entry went.
 *
 * <p>On a Galaxy S25, tapping Send left the text in the box with no toast and nothing in the
 * log, on every video tried. TikTok's publish entry has a dozen silent returns before the
 * request; these pin the lines that tell them apart.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class CommentPublishDiagnosticsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        BaseSettings.DEBUG_LOG_FILTERS.save("all");
        LogBufferManager.clearLogBuffer();
    }

    @After public void tearDown() {
        BaseSettings.DEBUG_LOG_FILTERS.resetToDefault();
        LogBufferManager.clearLogBuffer();
    }

    @Test public void theRequestLineSaysWhatTheEntryHadInHandWithoutTheText() throws Exception {
        String state = CommentPublishDiagnostics.describe(new ViewModel(), new Params());
        assertEquals("text=10 chars, lists=[2,0,1], gift=no, reply=no, context=yes, video=yes", state);

        // The text itself never reaches the report, only its length.
        CommentPublishDiagnostics.onPublishRequested(new ViewModel(), new Params());
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("requested with text=10 chars"));
        assertTrue(report, !report.contains("Nice video"));
    }

    @Test public void aMissingContextOrVideoIsSaidSo() throws Exception {
        ViewModel empty = new ViewModel();
        empty.context = null;
        assertTrue(CommentPublishDiagnostics.describe(empty, new Params()).endsWith("context=no, video=no"));
        ViewModel noVideo = new ViewModel();
        noVideo.context.common.aweme = null;
        assertTrue(CommentPublishDiagnostics.describe(noVideo, new Params()).endsWith("context=yes, video=no"));
        assertTrue(CommentPublishDiagnostics.describe(null, null).startsWith("text=0 chars, lists=[]"));
    }

    @Test public void theExitAndTheHandOffEachLeaveTheirLine() {
        CommentPublishDiagnostics.onPublishExit(37);
        CommentPublishDiagnostics.onPublishHandedOff();
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("returned before the request at exit 37"));
        assertTrue(report, report.contains("handed to the request"));
    }

    /** The publish parameters as TikTok lays them out: text, three lists, a sticker, a gift, a reply. */
    public static final class Params {
        public CharSequence text = "Nice video";
        public List<Object> images = Arrays.asList(new Object(), new Object());
        public List<Object> mentions = Collections.emptyList();
        public List<Object> audio = Collections.singletonList(new Object());
        public Object sticker = null;
        public GiftStruct gift = null;
        public Comment replyTo = null;
    }

    public static final class GiftStruct {}

    public static final class Comment {}

    public static final class ViewModel {
        CommentContextSource context = new CommentContextSource();

        CommentContextSource contextSource() {
            return context;
        }
    }

    public static final class CommentContextSource {
        CommonModel common = new CommonModel();

        public CommonModel getCommonModel() {
            return common;
        }
    }

    public static final class CommonModel {
        public Object aweme = new Object();
    }
}
