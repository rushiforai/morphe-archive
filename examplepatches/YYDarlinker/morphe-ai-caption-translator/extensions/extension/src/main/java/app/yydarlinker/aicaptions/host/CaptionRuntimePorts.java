package app.yydarlinker.aicaptions.host;

import app.yydarlinker.aicaptions.CaptionApiClient;
import app.yydarlinker.aicaptions.CaptionCredentialRef;
import app.yydarlinker.aicaptions.CaptionDisplayPage;
import app.yydarlinker.aicaptions.CaptionEventTimeline;
import app.yydarlinker.aicaptions.CaptionPresentationBudget;
import app.yydarlinker.aicaptions.CaptionRenderSpec;
import app.yydarlinker.aicaptions.RebuildApi;
import app.yydarlinker.aicaptions.RebuildController;
import app.yydarlinker.aicaptions.RebuildSource;
import app.yydarlinker.aicaptions.TranslationOutput;
import app.yydarlinker.aicaptions.TranslationPresentation;
import app.yydarlinker.aicaptions.TranslationRuntime;
import app.yydarlinker.aicaptions.TranslationSettings;
import app.yydarlinker.aicaptions.TranslationSourceAccess;
import app.yydarlinker.aicaptions.diagnostics.CaptionDiagnostics;
import app.yydarlinker.aicaptions.overlay.CaptionOverlay;
import app.yydarlinker.aicaptions.settings.AiCaptionConfig;
import app.yydarlinker.aicaptions.settings.ApiProfiles;
import app.yydarlinker.aicaptions.settings.CaptionStrings;
import app.yydarlinker.aicaptions.settings.ProviderModelCatalog;
import app.yydarlinker.aicaptions.settings.SecureApiKey;
import app.yydarlinker.aicaptions.source.RawCaptionSource;
import app.yydarlinker.aicaptions.source.SourceCaptionCache;

import android.app.Activity;
import android.content.Context;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.util.Log;

import app.yydarlinker.caption.contracts.CaptionContracts.*;

import java.lang.ref.WeakReference;
import java.util.List;

/** Binds the host controller, settings and overlay to the translation runtime. */
public final class CaptionRuntimePorts extends TranslationRuntime.Host
        implements CaptionPort,
                CaptionActions.SettingsServices,
                TranslationOutput.Sink {
    private static final CaptionRuntimePorts INSTANCE = new CaptionRuntimePorts();
    private static volatile Context context;

    static void install(Activity activity) {
        context = activity.getApplicationContext();
        TranslationRuntime.install(INSTANCE);
        TranslationOutput.install(INSTANCE);
        CaptionActions.install(INSTANCE, INSTANCE);
        CaptionOverlay.setActivity(activity);
        RebuildController.activity(context);
    }

    @Override
    public void command(Action action, String value) {
        Context c = context;
        if (c == null) return;
        switch (action) {
            case ACTIVATE:
            case PREWARM:
            case SOURCE:
                if (selectionOn()) RebuildController.activate(
                        c, value, action == Action.SOURCE, action != Action.PREWARM);
                break;
            case DEACTIVATE:
                CaptionSession.retire();
                if ("user_off".equals(value)) NativeCaptionBridge.setCc(NativeCaptionBridge.OFF);
                RebuildController.stop();
                break;
            case VIDEO:
                if (value.isEmpty()) RebuildController.stop();
                else RebuildController.video(value);
                break;
            case PLAYER_TYPE:
                CaptionOverlay.setPlayerType(value);
                break;
            case CONFIGURATION:
                RebuildController.refresh(c);
                CaptionOverlay.refreshStyle(c);
                break;
            case APPEARANCE:
            case POSITION_RESET:
                CaptionOverlay.refreshStyle(c);
                break;
            case CLEAR_CACHE:
                RebuildController.clearCache(c);
                break;
            case RECOVER:
                RebuildController.refresh(c);
                break;
            default:
                break;
        }
    }

    @Override
    public boolean active() {
        return RebuildController.visible();
    }

    @Override
    public boolean ownsNativeTrack() {
        return RebuildController.ownsNativeTrack() || active();
    }

    @Override
    public String videoId() {
        return CaptionSession.video();
    }

    @Override
    public String restoreTarget(String url) {
        return url;
    }

    @Override
    public void playback(long at) {
        RebuildController.time(at);
    }

    @Override
    public TranslationSettings settings(Context c) {
        synchronized (ApiProfiles.LOCK) {
            AiCaptionConfig.RequestSettings read = AiCaptionConfig.requestSettings(c);
            AiCaptionConfig.ProviderSettings p = read.provider;
            return new TranslationSettings(
                    p.enabled,
                    p.baseUrl,
                    p.model,
                    p.prompt,
                    read.apiKey,
                    p.preferenceProvenance);
        }
    }

    private static TranslationSourceAccess.Source adapt(RawCaptionSource.Source source) {
        return source == null
                ? null
                : new TranslationSourceAccess.Source(
                        source.body,
                        source.document,
                        source.timingProfile,
                        source.timingQuality,
                        source.timingEvidence);
    }

    @Override
    protected TranslationSourceAccess.Source load(
            Context c, String url, boolean translate, CaptionApiClient.RequestControl control)
            throws Exception {
        return adapt(RawCaptionSource.load(c, url, translate, control));
    }

    @Override
    protected TranslationSourceAccess.Source reference(
            Context c, String url, RebuildSource primary, CaptionApiClient.RequestControl control)
            throws Exception {
        return adapt(RawCaptionSource.reference(c, url, primary, control));
    }

    @Override
    protected boolean selectionOn() {
        return CaptionSession.displayAllowed() && NativeCaptionBridge.selection() != null;
    }

    @Override
    protected String target() {
        NativeCaptionBridge.Selection selected = NativeCaptionBridge.selection();
        return selected == null ? "" : selected.target;
    }

    @Override
    protected boolean authoredTrack(String url) {
        return CaptionTracks.authored(url);
    }

    @Override
    protected boolean transitioning() {
        return CaptionPlayer.transitioning();
    }

    @Override
    protected long ownerEpoch() {
        return CaptionPlayer.ownerEpoch();
    }

    @Override
    protected PlaybackState playbackState() {
        Activity a = CaptionPlayer.activity();
        try {
            MediaController c = a == null ? null : a.getMediaController();
            return c == null || !a.getPackageName().equals(c.getPackageName())
                    ? null : c.getPlaybackState();
        } catch (RuntimeException unavailable) {
            return null;
        }
    }

    @Override
    protected TranslationRuntime.ClockSample clock(String owner) {
        return CaptionPlayer.clock(owner);
    }

    @Override
    protected String sourceKey(String url) {
        try {
            return SourceCaptionCache.key(url);
        } catch (Exception e) {
            return super.sourceKey(url);
        }
    }

    @Override
    protected String message(Context c, String key) {
        return CaptionStrings.get(c, key);
    }

    @Override
    protected void mark(Context c, String stage, String detail, CaptionCredentialRef ref) {
        CaptionDiagnostics.mark(c, stage, detail, ref);
    }

    @Override
    protected void clearSourceCache(Context c) {
        SourceCaptionCache.clear(c);
    }

    @Override
    protected void cacheClearFinished(Context c, boolean success) {
        android.widget.Toast.makeText(
                        c,
                        CaptionStrings.get(c, success ? "message_e8b2177e1cd3" : "config_operation_uncertain"),
                        android.widget.Toast.LENGTH_SHORT)
                .show();
    }

    @Override
    protected String redact(String text, String key, int limit) {
        return CaptionDiagnostics.redact(text, key, limit);
    }

    @Override
    protected String errorDetail(Throwable error) {
        return CaptionDiagnostics.errorDetail(error);
    }

    @Override
    public CaptionPresentationBudget budget() {
        return CaptionOverlay.budget();
    }

    /** The overlay's view of a render guard. */
    private static CaptionOverlay.RenderGuard guard(TranslationOutput.RenderGuard value) {
        return new CaptionOverlay.RenderGuard() {
            public boolean isValid() { return value.isValid(); }
            public void onApplied() { value.onApplied(); }
            public long displayPosition(long supplied) { return value.displayPosition(supplied); }
            public String identity() { return value.identity(); }
            public String session() { return value.session(); }
            public long windowStart() { return value.windowStart(); }
            public long windowEnd() { return value.windowEnd(); }
            public String blankReason() { return value.blankReason(); }
            public CaptionCredentialRef credential() { return value.credential(); }
        };
    }

    @Override
    public void clear(TranslationOutput.RenderGuard g) {
        CaptionOverlay.clear(guard(g));
    }

    @Override
    public void hide(TranslationOutput.RenderGuard g) {
        display(() -> CaptionOverlay.hide(guard(g)));
    }

    @Override
    public void refreshSurface() {
        CaptionOverlay.refreshSurface();
    }

    @Override
    public void position(long at, TranslationOutput.RenderGuard g) {
        CaptionOverlay.position(at, guard(g));
    }

    @Override
    public void showStatus(String text, TranslationOutput.RenderGuard g) {
        display(() -> CaptionOverlay.showStatus(text, guard(g)));
    }

    @Override
    public void showWaitingEvent(
            String text,
            TranslationOutput.RenderGuard g,
            String id,
            long start,
            long end,
            long at) {
        display(() -> CaptionOverlay.showWaitingEvent(text, guard(g), id, start, end, at));
    }

    @Override
    public void showEvent(String text, TranslationOutput.RenderGuard g, String id,
            long start, long end, long at, CaptionRenderSpec spec) {
        showEvent(text, g, id, start, end, at, spec, null);
    }

    @Override
    public void showEvent(
            String text,
            TranslationOutput.RenderGuard g,
            String id,
            long start,
            long end,
            long at,
            CaptionRenderSpec spec,
            CaptionEventTimeline sourceTimeline) {
        display(
                () ->
                        CaptionOverlay.showEvent(
                                text, guard(g), id, start, end, at, spec, sourceTimeline));
    }

    /** A display fault must never take the host app down: the next tick draws the caption again. */
    private static void display(Runnable draw) {
        try {
            draw.run();
        } catch (RuntimeException fault) {
            Log.w("AiCaptions", "caption display fault: " + fault);
        }
    }

    @Override
    public List<CaptionDisplayPage> displayPages(
            String text,
            long start,
            long end,
            CaptionPresentationBudget geometry,
            CaptionRenderSpec spec) {
        return TranslationPresentation.pages(text, start, end, geometry, spec);
    }

    @Override
    public List<CaptionDisplayPage> displayPages(
            String text,
            long start,
            long end,
            CaptionPresentationBudget geometry,
            CaptionRenderSpec spec,
            CaptionEventTimeline sourceTimeline) {
        return TranslationPresentation.pages(text, start, end, geometry, spec, sourceTimeline);
    }

    @Override
    public List<String> models(String endpoint) throws Exception {
        AiCaptionConfig.ProviderSettings cfg = AiCaptionConfig.load(context);
        String profile = ApiProfiles.active(context);
        if (!endpoint.equals(cfg.baseUrl)) throw new IllegalStateException("profile_changed");
        return ProviderModelCatalog.fetch(
                endpoint,
                () -> {
                    synchronized (ApiProfiles.LOCK) {
                        AiCaptionConfig.ProviderSettings now = AiCaptionConfig.load(context);
                        if (!profile.equals(ApiProfiles.active(context))
                                || !cfg.baseUrl.equals(now.baseUrl)
                                || !cfg.credentialId.equals(now.credentialId))
                            throw new IllegalStateException("profile_changed");
                        return SecureApiKey.load(context);
                    }
                });
    }

    @Override
    public String testApi() throws Exception {
        return RebuildApi.test(settings(context));
    }
}
