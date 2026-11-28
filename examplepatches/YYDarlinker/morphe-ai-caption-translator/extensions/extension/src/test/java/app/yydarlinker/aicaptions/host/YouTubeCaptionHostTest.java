package app.yydarlinker.aicaptions.host;

import app.yydarlinker.aicaptions.overlay.CaptionOverlay;
import app.yydarlinker.aicaptions.overlay.CaptionUiGeometryFixture;
import app.yydarlinker.aicaptions.settings.AiCaptionConfig;
import app.yydarlinker.aicaptions.settings.CaptionQuickToggle;

import static app.morphe.extension.youtube.shared.PlayerType.*;
import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.media.session.PlaybackState;
import android.view.View;
import android.widget.ImageView;

import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.VideoState;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, shadows = {CaptionUiGeometryFixture.Geometry.class, YouTubeHostFixture.Flags.class,
        YouTubeHostFixture.Model.class, YouTubeHostFixture.Credentials.class, YouTubeHostFixture.Menus.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class YouTubeCaptionHostTest extends YouTubeHostFixture {
    @Test
    public void workerVideoAndCommittedTrackReachTheMainThreadInOrder() throws Exception {
        install(true);
        Manager next = new Manager(SECOND);
        long before = ownerEpoch();
        worker(() -> {
            AiCaptionHook.onVideoId(SECOND);
            AiCaptionHook.onPlayerType(WATCH_WHILE_MAXIMIZED);
            commit(next, source(SECOND, "en"), Origin.PREFERRED_TRACK, 2);
            AiCaptionHook.onVideoTime(0);
        });
        assertEquals("", CaptionActions.currentVideoIdSnapshot());
        assertEquals(before, ownerEpoch());
        assertTrue(sourceRequests.isEmpty());
        awaitCaption(ORIGINAL);
        assertEquals(SECOND, CaptionActions.currentVideoIdSnapshot());
        assertTrue(ownerEpoch() > before);
        wasRequested("v", SECOND);
    }

    @Test
    public void queuedOldSelectionCannotTakeOverAfterASynchronousVideoChange() throws Exception {
        install(true);
        regular(FIRST);
        Manager old = new Manager(FIRST);
        long firstEpoch = ownerEpoch();
        worker(() -> commit(old, translated(FIRST, "fr"), Origin.PREFERRED_TRACK, 2));
        regular(SECOND);
        commit(new Manager(SECOND), source(SECOND, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        assertTrue(ownerEpoch() > firstEpoch);
        assertEquals(1, sourceRequests.size());
        wasRequested("v", SECOND);
        assertTrue(modelRequests.isEmpty());
    }

    @Test
    public void queuedOldPlayerTypeAndTickCannotHideOrSeekTheNewCaption() throws Exception {
        install(true);
        regular(FIRST);
        worker(() -> {
            AiCaptionHook.onPlayerType(WATCH_WHILE_MINIMIZED);
            AiCaptionHook.onVideoTime(8000);
        });
        regular(SECOND);
        commit(new Manager(SECOND), source(SECOND, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        assertFalse(shows(NEXT_CUE));
        assertEquals(SECOND, CaptionActions.currentVideoIdSnapshot());
    }

    @Test
    public void duplicateVideoIdKeepsItsEpochButReplacementActivityStartsANewOwner() {
        install(true);
        regular(FIRST);
        commit(new Manager(FIRST), source(FIRST, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        long firstEpoch = ownerEpoch();
        video(FIRST);
        frames();
        assertEquals(firstEpoch, ownerEpoch());
        assertTrue(shows(ORIGINAL));
        Activity previous = activity;
        activity = newActivity();
        CaptionAddonSupport.initialize(activity);
        previous.finish();
        assertTrue(ownerEpoch() > firstEpoch);
        assertFalse(CaptionActions.isVisibleActive());
        assertFalse(shows(ORIGINAL));
    }

    @Test
    public void aHeldSourceReplyCannotPublishIntoTheNextVideo() throws Exception {
        install(true);
        regular(FIRST);
        holdFirstSource = true;
        commit(new Manager(FIRST), source(FIRST, "en"), Origin.PREFERRED_TRACK, 2);
        assertTrue(sourceStarted.await(3, TimeUnit.SECONDS));
        regular(SECOND);
        releaseSource.countDown();
        assertFalse(CaptionActions.isVisibleActive());
        assertFalse(shows(ORIGINAL));
        commit(new Manager(SECOND), source(SECOND, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        assertEquals(2, sourceRequests.size());
        assertTrue(modelRequests.isEmpty());
    }

    @Test
    public void aHeldModelReplyCannotPaintAfterTheNativeTargetChanges() throws Exception {
        install(true);
        regular(FIRST);
        holdFirstModel = true;
        Manager manager = new Manager(FIRST);
        commit(manager, translated(FIRST, "fr"), Origin.PREFERRED_TRACK, 2);
        assertTrue(modelStarted.await(3, TimeUnit.SECONDS));
        commit(manager, translated(FIRST, "de"), Origin.DEFAULT, 2);
        releaseModel.countDown();
        awaitCaption(GERMAN);
        idle(300);
        assertTrue(shows(GERMAN));
        assertFalse(shows(FRENCH));
        assertEquals(Arrays.asList("fr", "de"), modelRequests);
    }

    @Test
    public void anAutomaticRegularTrackWaitsForSettledCcPermission() {
        install(true);
        regular(FIRST);
        ImageView cc = captionButton("Turn on captions");
        commit(new Manager(FIRST), translated(FIRST, "fr"), Origin.DEFAULT, 2);
        time(0);
        assertFalse(CaptionActions.isVisibleActive());
        assertTrue(sourceRequests.isEmpty());
        assertTrue(modelRequests.isEmpty());
        buttonState(cc, "Turn off captions");
        awaitCaption(FRENCH);
        assertEquals(Collections.singletonList("fr"), modelRequests);
    }

    @Test
    public void buttonCallbackReadsTheFinalControllerStateAndCanTurnCcOff() {
        install(true);
        regular(FIRST);
        ImageView cc = captionButton("Turn off captions");
        Manager manager = new Manager(FIRST);
        commit(manager, source(FIRST, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        buttonState(cc, "Turn on captions");
        assertFalse(shows(ORIGINAL));
        assertTrue(AiCaptionConfig.enabled(activity));
        assertTrue(NativeCaptionBridge.suppressNativeDraw());
        buttonState(cc, "Turn off captions");
        awaitCaption(ORIGINAL);
        assertTrue(modelRequests.isEmpty());
    }

    @Test
    public void aForcedTrackCannotOverrideTheUsersRequestedOff() {
        install(true);
        regular(FIRST);
        Manager manager = new Manager(FIRST);
        Track forced = source(FIRST, "en");
        commit(manager, forced, Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        Track off = new Track("DISABLE_CAPTIONS_OPTION", "", "");
        NativeCaptionBridge.onNativeAppliedEvent(manager, forced, off, Origin.PREFERRED_TRACK, 2, FIRST);
        commit(manager, translated(FIRST, "de"), Origin.DEFAULT, 2);
        time(0);
        assertFalse(CaptionActions.isVisibleActive());
        assertFalse(shows(ORIGINAL));
        assertTrue(AiCaptionConfig.enabled(activity));
        assertTrue(modelRequests.isEmpty());
    }

    @Test
    public void automaticResetObservesNoTrackAndCanRecoverWithoutAToggle() {
        install(true);
        regular(FIRST);
        Manager manager = new Manager(FIRST);
        commit(manager, source(FIRST, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        commit(manager, null, Origin.DEFAULT, 2);
        assertFalse(CaptionActions.isVisibleActive());
        commit(manager, translated(FIRST, "fr"), Origin.DEFAULT, 2);
        awaitCaption(FRENCH);
        assertEquals(Collections.singletonList("fr"), modelRequests);
    }

    @Test
    public void aForeignUrlAndAnUnknownModelCannotGrantCc() {
        install(true);
        regular(FIRST);
        Manager manager = new Manager(FIRST);
        NativeCaptionBridge.onNativeAppliedEvent(manager, translated(SECOND, "fr"),
                translated(SECOND, "fr"), Origin.PREFERRED_TRACK, 2, FIRST);
        Track unrelated = new Track("en", ".en", "https://example.invalid/api/timedtext?v=" + FIRST);
        commit(manager, unrelated, Origin.PREFERRED_TRACK, 2);
        NativeCaptionBridge.onNativeAppliedEvent(manager, null, null, Origin.PREFERRED_TRACK, 2, "");
        time(0);
        assertFalse(CaptionActions.isVisibleActive());
        assertTrue(sourceRequests.isEmpty());
        assertTrue(modelRequests.isEmpty());
    }

    @Test
    public void prefetchAndTimedTextRequestsCannotInventOrReplaceTheNativeLanguage() {
        install(true);
        regular(FIRST);
        Manager manager = new Manager(FIRST);
        AiCaptionHook.onTimedTextRequest(null, translated(FIRST, "de").url);
        AiCaptionHook.onTimedTextRequest(null, translated(SECOND, "es").url);
        assertFalse(CaptionActions.isVisibleActive());
        commit(manager, translated(FIRST, "fr"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(FRENCH);
        AiCaptionHook.onTimedTextRequest(null, translated(SECOND, "es").url);
        AiCaptionHook.onTimedTextRequest(null, url(FIRST, "en"));
        AiCaptionHook.onTimedTextRequest(null, translated(FIRST, "de").url);
        time(0);
        assertEquals(Collections.singletonList("fr"), modelRequests);
        assertTrue(shows(FRENCH));
    }

    @Test
    public void enablingAfterANativeSelectionWhileDisabledFollowsTheLatestLanguage() {
        install(false);
        regular(FIRST);
        Manager manager = new Manager(FIRST);
        commit(manager, translated(FIRST, "fr"), Origin.PREFERRED_TRACK, 2);
        commit(manager, translated(FIRST, "de"), Origin.PREFERRED_TRACK, 2);
        assertFalse(AiCaptionConfig.enabled(activity));
        assertFalse(NativeCaptionBridge.suppressNativeDraw());
        assertTrue(sourceRequests.isEmpty());
        assertTrue(CaptionQuickToggle.setEngine(activity, true));
        awaitCaption(GERMAN);
        assertEquals(Collections.singletonList("de"), modelRequests);
    }

    @Test
    public void highFrequencyHooksReturnWithoutPostingOrReadingTracksWhileOff() throws Exception {
        install(false);
        regular(FIRST);
        ImageView cc = captionButton("Turn off captions");
        int reads = Credentials.reads;
        int trackReads = Model.trackReads;
        long epoch = ownerEpoch();
        worker(() -> {
            for (int i = 0; i < 100; i++) {
                AiCaptionHook.onVideoTime(i * 1000L);
                AiCaptionHook.onPlayerType(WATCH_WHILE_MINIMIZED);
                AiCaptionHook.onNativeCaptionButtonController(cc);
                AiCaptionHook.onTimedTextRequest(new Object(), translated(FIRST, "fr").url);
                NativeCaptionBridge.onOriginalTrackList(Collections.singletonList(source(FIRST, "en")));
                assertFalse(NativeCaptionBridge.suppressNativeDraw());
            }
        });
        idle(5000);
        assertEquals(reads, Credentials.reads);
        assertEquals(trackReads, Model.trackReads);
        assertEquals(epoch, ownerEpoch());
        assertFalse(cc.hasOnClickListeners());
        assertFalse(CaptionActions.isVisibleActive());
        assertTrue(sourceRequests.isEmpty());
        assertTrue(modelRequests.isEmpty());
    }

    @Test
    public void missingCredentialLeavesTheMenuAndNativeDrawingInOffMode() {
        install(false);
        regular(FIRST);
        Credentials.available = false;
        commit(new Manager(FIRST), translated(FIRST, "fr"), Origin.PREFERRED_TRACK, 2);
        assertFalse(CaptionQuickToggle.setEngine(activity, true));
        assertFalse(AiCaptionConfig.enabled(activity));
        assertFalse(NativeCaptionBridge.suppressNativeDraw());
        assertTrue(sourceRequests.isEmpty());
        assertTrue(modelRequests.isEmpty());
    }

    @Test
    public void nativeSourceModeShowsBothCuesAndMakesZeroModelRequests() {
        twoCues = true;
        install(true);
        regular(FIRST);
        commit(new Manager(FIRST), source(FIRST, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        assertTrue(NativeCaptionBridge.suppressNativeDraw());
        time(6500);
        awaitCaption(NEXT_CUE);
        assertEquals(1, sourceRequests.size());
        assertEquals(0, provider.getRequestCount());
    }

    @Test
    public void aSignedAuthoredTrackInTheTargetLanguageBypassesTheModel() {
        install(true);
        regular(FIRST);
        Manager manager = new Manager(FIRST);
        manager.tracks = Arrays.asList(asr(FIRST, "fr"), source(FIRST, "fr"), source(FIRST, "en"));
        commit(manager, translated(FIRST, "fr"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        wasRequested("lang", "fr");
        assertEquals(1, sourceRequests.size());
        assertFalse(sourceRequests.get(0).contains("kind=asr"));
        assertEquals(0, provider.getRequestCount());
    }

    @Test
    public void selectsAuthoredSpeechLanguageAheadOfEnglishPivot() {
        install(true);
        regular(FIRST);
        Manager manager = new Manager(FIRST);
        manager.tracks = Arrays.asList(source(FIRST, "en"), asr(FIRST, "de"), source(FIRST, "de"));
        commit(manager, translated(FIRST, "fr"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(FRENCH);
        wasRequested("lang", "de");
        assertFalse(sourceRequests.get(0).contains("kind=asr"));
        assertEquals(Collections.singletonList("fr"), modelRequests);
    }

    @Test
    public void selectsEnglishPivotWhenThereIsNoAuthoredSpeechTrack() {
        install(true);
        regular(FIRST);
        Manager manager = new Manager(FIRST);
        manager.tracks = Arrays.asList(asr(FIRST, "de"), source(FIRST, "en"), source(FIRST, "es"));
        Track selection = new Track("fr", "tfr.es", url(FIRST, "es") + "&tlang=fr");
        commit(manager, selection, Origin.PREFERRED_TRACK, 2);
        awaitCaption(FRENCH);
        wasRequested("lang", "en");
        assertEquals(Collections.singletonList("fr"), modelRequests);
    }

    @Test
    public void fallsBackToTheSignedSameLanguageAsrTrackWhenTheSourceTimesOut() {
        install(true);
        regular(FIRST);
        Manager manager = new Manager(FIRST);
        Track manual = new Track("en", ".en", url(FIRST, "en") + "&name=unavailable");
        manager.tracks = Arrays.asList(manual, asr(FIRST, "en"), asr(FIRST, "de"));
        unavailableSource = "name=unavailable";
        commit(manager, manual, Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        assertTrue(sourceRequests.get(0).contains("name=unavailable"));
        assertTrue(sourceRequests.get(1).contains("lang=en&kind=asr&sig=fixture"));
        assertEquals(0, provider.getRequestCount());
    }

    @Test
    public void trackListIsParsedButCannotChooseTheForegroundTarget() {
        install(true);
        regular(FIRST);
        NativeCaptionBridge.onOriginalTrackList(List.of(source(FIRST, "de"), translated(FIRST, "fr"),
                source(SECOND, "fr"), new Track("en", ".en", "invalid")));
        time(0);
        assertFalse(CaptionActions.isVisibleActive());
        assertTrue(sourceRequests.isEmpty());
        commit(new Manager(FIRST), translated(FIRST, "de"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        wasRequested("v", FIRST);
        wasRequested("lang", "de");
        assertEquals(0, provider.getRequestCount());
    }

    @Test
    public void regularToShortsAndBackKeepsEachPlayersOwnCaption() {
        install(true);
        regular(FIRST);
        commit(new Manager(FIRST), source(FIRST, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        long firstEpoch = ownerEpoch();
        shorts(true, true);
        video(SECOND);
        type(NONE);
        commit(new Manager(SECOND), translated(SECOND, "fr"), Origin.DEFAULT, 2);
        awaitCaption(FRENCH);
        assertTrue(ownerEpoch() > firstEpoch);
        assertFalse(shows(ORIGINAL));
        shorts(false, false);
        assertFalse(shows(FRENCH));
        regular(THIRD);
        commit(new Manager(THIRD), source(THIRD, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        wasRequested("v", THIRD);
    }

    @Test
    public void anEarlyShortsSelectionStartsWhenTheSurfaceAppearsWithoutATick() {
        install(true);
        shorts(true, false);
        Manager manager = new Manager(FIRST);
        commit(manager, translated(FIRST, "fr"), Origin.DEFAULT, 2);
        video(FIRST);
        type(NONE);
        idle(200);
        assertTrue(modelRequests.isEmpty());
        CaptionUiGeometryFixture.shorts = true;
        AiCaptionHook.onPlayerType(NONE);
        awaitCaption(FRENCH);
        assertEquals(Collections.singletonList("fr"), modelRequests);
    }

    @Test
    public void sameShortReentryAfterCloseUsesFreshSelectionWhenLayoutReturns() {
        install(true);
        shorts(true, true);
        video(FIRST);
        type(NONE);
        Manager manager = new Manager(FIRST);
        commit(manager, translated(FIRST, "fr"), Origin.DEFAULT, 2);
        awaitCaption(FRENCH);
        long firstVisit = ownerEpoch();
        shorts(false, false);
        assertFalse(shows(FRENCH));
        commit(manager, translated(FIRST, "de"), Origin.DEFAULT, 2);
        shorts(true, false);
        video(FIRST);
        frames();
        assertEquals(Collections.singletonList("fr"), modelRequests);
        CaptionUiGeometryFixture.shorts = true;
        activity.getWindow().getDecorView().getViewTreeObserver().dispatchOnGlobalLayout();
        awaitCaption(GERMAN);
        assertTrue(ownerEpoch() > firstVisit);
        assertEquals(Arrays.asList("fr", "de"), modelRequests);
    }

    @Test
    public void aLoopingShortRecoversAfterItsSurfaceTemporarilyDisappears() {
        twoCues = true;
        install(true);
        shorts(true, true);
        video(FIRST);
        type(NONE);
        commit(new Manager(FIRST), source(FIRST, "en"), Origin.DEFAULT, 2);
        awaitCaption(ORIGINAL);
        long started = ownerEpoch();
        CaptionUiGeometryFixture.shorts = false;
        AiCaptionHook.onPlayerType(NONE);
        frames();
        assertFalse(shows(ORIGINAL));
        CaptionUiGeometryFixture.shorts = true;
        time(6500);
        awaitCaption(NEXT_CUE);
        assertEquals(started, ownerEpoch());
        assertEquals(1, sourceRequests.size());
    }

    @Test
    public void aLateShortsCloseCannotRetractTheCurrentRegularVideo() {
        install(true);
        shorts(true, true);
        video(FIRST);
        type(NONE);
        commit(new Manager(FIRST), translated(FIRST, "fr"), Origin.DEFAULT, 2);
        awaitCaption(FRENCH);
        CaptionUiGeometryFixture.shorts = false;
        regular(SECOND);
        commit(new Manager(SECOND), source(SECOND, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        long regular = ownerEpoch();
        shorts(false, false);
        frames();
        assertTrue(shows(ORIGINAL));
        assertEquals(regular, ownerEpoch());
    }

    @Test
    public void shortsOffStaysOffAcrossDefaultSelectionAndAiSwitching() {
        install(true);
        shorts(true, true);
        video(FIRST);
        type(NONE);
        Manager manager = new Manager(FIRST);
        commit(manager, source(FIRST, "en"), Origin.DEFAULT, 2);
        awaitCaption(ORIGINAL);
        commit(manager, null, Origin.PREFERRED_TRACK, 1);
        commit(manager, translated(FIRST, "fr"), Origin.DEFAULT, 2);
        assertTrue(CaptionQuickToggle.setEngine(activity, false));
        assertTrue(CaptionQuickToggle.setEngine(activity, true));
        time(0);
        assertFalse(shows(ORIGINAL));
        assertTrue(modelRequests.isEmpty());
        commit(manager, translated(FIRST, "fr"), Origin.PREFERRED_TRACK, 1);
        awaitCaption(FRENCH);
    }

    @Test
    public void advancingShortsClockOverridesTheRegularPlayersPausedState() {
        install(true);
        shorts(true, true);
        video(FIRST);
        type(NONE);
        VideoState.current = VideoState.PAUSED;
        VideoInformation.position = 1000;
        assertEquals(PlaybackState.STATE_PAUSED, clock().state);
        idle(300);
        VideoInformation.position = 1300;
        assertEquals(PlaybackState.STATE_PLAYING, clock().state);
        idle(520);
        assertEquals(PlaybackState.STATE_PAUSED, clock().state);
    }

    @Test
    public void aPausedSeekAndAnOldVideosClockDoNotLookLikePlayback() {
        install(true);
        regular(FIRST);
        VideoState.current = VideoState.PAUSED;
        VideoInformation.position = 1000;
        assertTrue(clock().available);
        idle(200);
        VideoInformation.position = 6000;
        assertEquals(PlaybackState.STATE_PAUSED, clock().state);
        AiCaptionHook.onVideoId(SECOND);
        assertFalse(clock().available);
        VideoInformation.videoId = SECOND;
        VideoInformation.position = 0;
        assertEquals(PlaybackState.STATE_PAUSED, clock().state);
    }

    @Test
    public void commentsViewportAllowsTheCaptionAcrossTheSideBarsWithoutReplanning() {
        longShortsCue = true;
        install(true);
        shorts(true, true);
        video(FIRST);
        type(NONE);
        commit(new Manager(FIRST), source(FIRST, "zh-Hans"), Origin.DEFAULT, 2);
        awaitCaption(SHORTS_LINE);
        int width = CaptionOverlay.budget().width;
        float initialSize = caption().getTextSize();
        CaptionUiGeometryFixture.bounds = new Rect(400, 40, 864, 860);
        for (int i = 0; i < 5; i++) frames();
        assertTrue(shows(SHORTS_LINE));
        assertEquals(width, CaptionOverlay.budget().width);
        assertEquals(initialSize, caption().getTextSize(), .01f);
        assertTrue(anchor().getWidth() > CaptionUiGeometryFixture.bounds.width());
        assertTrue(anchor().getTranslationX() >= 0);
        assertTrue(anchor().getTranslationX() + anchor().getWidth() <= 1265);
    }

    @Test
    public void nativeRendererStopsPaintingWhileAiIsOnAndResumesWithItsText() {
        install(true);
        regular(FIRST);
        Manager manager = new Manager(FIRST);
        commit(manager, source(FIRST, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        int[] paints = {0}, invalidations = {0};
        View nativeRenderer = new View(activity) {
            @Override
            public void invalidate() {
                invalidations[0]++;
                super.invalidate();
            }

            @Override
            public void draw(Canvas canvas) {
                if (NativeCaptionBridge.suppressNativeDraw()) return;
                paints[0]++;
                super.draw(canvas);
            }
        };
        ((android.view.ViewGroup) activity.findViewById(android.R.id.content)).addView(nativeRenderer);
        NativeCaptionBridge.onNativeRendererAttached(nativeRenderer);
        nativeRenderer.draw(new Canvas());
        assertEquals(0, paints[0]);
        int before = invalidations[0];
        assertTrue(CaptionQuickToggle.setEngine(activity, false));
        assertTrue(invalidations[0] > before);
        nativeRenderer.draw(new Canvas());
        assertEquals(1, paints[0]);
        assertEquals(1f, nativeRenderer.getAlpha(), 0f);
        assertFalse(shows(ORIGINAL));
    }

    @Test
    public void flyoutSwitchUpdatesTheNativeMenuAndReusesCcPermission() {
        install(true);
        regular(FIRST);
        commit(new Manager(FIRST), source(FIRST, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        Menus.top = true;
        Object panel = new Object();
        assertEquals(4, CaptionQuickToggle.onMenu(panel, 3));
        String on = Menus.label;
        Menus.click.onClick(new View(activity));
        assertEquals(1, Menus.closed);
        assertFalse(AiCaptionConfig.enabled(activity));
        assertEquals(4, CaptionQuickToggle.onMenu(panel, 3));
        assertNotEquals(on, Menus.label);
        Menus.click.onClick(new View(activity));
        awaitCaption(ORIGINAL);
        assertEquals(2, Menus.closed);
        assertTrue(NativeCaptionBridge.suppressNativeDraw());
        assertTrue(modelRequests.isEmpty());
    }

    @Test
    public void shortsMenuIgnoresCaptionSubmenusAndConsumesItsTopLevelSignalOnce() {
        install(false);
        shorts(true, true);
        video(FIRST);
        Object panel = new Object();
        byte[] icon = "yt_outline_closed_caption".getBytes(StandardCharsets.US_ASCII);
        CaptionQuickToggle.observeMenuPath("overflow_menu_item.e/captions_sheet", icon);
        assertEquals(3, CaptionQuickToggle.onMenu(panel, 3));
        CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", icon);
        assertEquals(4, CaptionQuickToggle.onMenu(panel, 3));
        assertEquals(3, CaptionQuickToggle.onMenu(panel, 3));
        AiCaptionConfig.saveShortsFlyoutMenuEnabled(activity, false);
        CaptionQuickToggle.observeMenuPath("overflow_menu_item.e", icon);
        assertEquals(3, CaptionQuickToggle.onMenu(panel, 3));
    }

    @Test
    public void savedModeIsReadButOldLanguagePreferencesNeverSelectATrack() {
        activity.getSharedPreferences("deepseek_caption_session", 0).edit()
                .putBoolean("ai_enabled", true).putLong("revision", 42)
                .putString("target_language", "es").putBoolean("translate_target", true).apply();
        install(true);
        regular(FIRST);
        buttonState(captionButton("Turn off captions"), "Turn off captions");
        time(0);
        assertTrue(modelRequests.isEmpty());
        assertFalse(CaptionActions.isVisibleActive());
        commit(new Manager(FIRST), translated(FIRST, "fr"), Origin.DEFAULT, 2);
        awaitCaption(FRENCH);
        assertEquals(Collections.singletonList("fr"), modelRequests);
        assertEquals(42L, activity.getSharedPreferences("ai_caption_session", 0)
                .getLong("revision", 0L));
        assertEquals("es", activity.getSharedPreferences("deepseek_caption_session", 0)
                .getString("target_language", ""));
    }

    @Test
    public void theNativePlayerCanExitAndReenterPipWithoutDroppingItsTrack() {
        install(true);
        regular(FIRST);
        commit(new Manager(FIRST), source(FIRST, "en"), Origin.PREFERRED_TRACK, 2);
        awaitCaption(ORIGINAL);
        long epoch = ownerEpoch();
        type(WATCH_WHILE_PICTURE_IN_PICTURE);
        frames();
        assertFalse(shows(ORIGINAL));
        type(WATCH_WHILE_FULLSCREEN);
        awaitCaption(ORIGINAL);
        assertEquals(epoch, ownerEpoch());
        assertEquals(1, sourceRequests.size());
    }
}
