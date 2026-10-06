package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.content.SharedPreferences;

/** Small on-device trace so subtitle failures can be diagnosed without adb/logcat. */
final class CaptionDiagnostics {
    private static final String PREFS = "deepseek_caption_diagnostics";
    private static final String STAGE = "stage";
    private static final String DETAIL = "detail";
    private static final String TIME = "time";
    private static final String HISTORY = "history";
    private static final int MAX_HISTORY = 8000;
    private static final String DECISIONS = "timing_and_protocol_decisions";

    private CaptionDiagnostics() {}

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /**
     * Hot-path entry. It performs no configuration load, no keystore access, no file I/O and no
     * SharedPreferences commit: the record is queued with the caller's already-known credential
     * reference and redacted later on the diagnostics lane.
     */
    static void mark(Context context, String stage, String detail, CaptionCredentialRef credential) {
        mark(context, stage, detail, credential, "");
    }

    /**
     * {@code mergeKey} declares a repeated high-frequency observation. Records with the same stage and
     * key are merged in the bounded queue and exported once with their total count.
     */
    static void mark(Context context, String stage, String detail, CaptionCredentialRef credential,
            String mergeKey) {
        if (context == null) return;
        enqueued++;
        CaptionDiagnosticsWriter.enqueue(context, stage, detail, credential, mergeKey);
    }

    /**
     * Compatibility entry for callers that only have a context. It resolves the credential reference
     * here, which is why no playback, animation or preview path may use it.
     */
    static synchronized void mark(Context context, String stage, String detail) {
        if (context == null) return;
        mark(context, stage, detail, SecureApiKey.credentialRef(context));
    }

    private static final char SEPARATOR = (char) 1;
    /** Bounded evidence: how many records were produced by mark calls. */
    static long enqueued;

    /** Latest bounded summary, read from the archive lane so the display path never commits prefs. */
    private static String[] summary(Context context) {
        String record = CaptionDiagnosticArchive.readSummary(context, CaptionDiagnosticsWriter.epoch());
        if (record != null && !record.isEmpty()) {
            String[] parts = record.split(String.valueOf(SEPARATOR), -1);
            if (parts.length >= 5) return new String[]{parts[1], parts[2], parts[3], parts[4]};
        }
        // Last resort: derive the latest record from the durable history line itself, so a captured
        // request is never reported as "no request yet" when the summary slot is momentarily behind.
        String history = CaptionDiagnosticArchive.read(context, "history");
        if (history == null || history.isEmpty()) return null;
        String line = null;
        for (String candidate : history.split("\n")) {
            if (candidate.length() > 20 && candidate.charAt(0) >= '0' && candidate.charAt(0) <= '9'
                    && candidate.contains(" | ")) line = candidate;
        }
        if (line == null) return null;
        int first = line.indexOf(" | ");
        int second = line.indexOf(" | ", first + 3);
        String at = line.substring(0, first).trim();
        String stage = second < 0 ? line.substring(first + 3) : line.substring(first + 3, second);
        String detail = second < 0 ? "" : line.substring(second + 3);
        return new String[]{stage, detail, at, importantDecision(stage) ? line : ""};
    }

    static boolean isDecision(String stage) {
        return importantDecision(stage);
    }

    static void clear(Context context) {
        CaptionDiagnosticsWriter.clear(context);
        CaptionDiagnosticSnapshot.invalidate();
        CaptionDiagnosticArchive.clear(context);
        long epoch=CaptionDiagnosticsWriter.epoch();
        CaptionDiagnosticsWriter.background(()->{
            if(epoch!=CaptionDiagnosticsWriter.epoch())return;
            prefs(context).edit().clear().apply();
            CaptionQualityTrace.clear(context);TokenCostAudit.clear(context);
        });
    }

    private static void CaptionDiagnosticWriterClear(Context context) {
        CaptionDiagnosticsWriter.clear(context);
    }

    /**
     * Test/verification evidence reader: drains the bounded writer queue and returns the recorded
     * history channel. Production code reads the same channel through {@link #fullText(Context)}.
     */
    static String history(Context context) {
        CaptionDiagnosticsWriter.drainNow(context);
        return CaptionDiagnosticArchive.read(context, "history");
    }

    /**
     * The three localized header lines. Each one is a single authored template: the engine label, the
     * mode sentence and the debug state are never assembled from translated fragments here, and the
     * "On"/"Off" wording comes from the catalog so it stays grammatical in every language.
     */
    private static String localizedHeader(Context context) {
        String separator = CaptionStrings.settings(context, "label_separator");
        String engine = format(separator, CaptionStrings.settings(context, "engine"))
                + CaptionStrings.settings(context, "engine_event_rebuild") + " / " + RebuildProtocol.VERSION;
        String mode = format(separator, CaptionStrings.settings(context, "mode"))
                + CaptionStrings.settings(context, CaptionChoice.translates()
                        ? "mode_auto_translate" : "mode_original");
        String debug = format(CaptionStrings.settings(context, "display_debug"),
                CaptionStrings.settings(context, DeepSeekConfig.displayTextDebugEnabled(context) ? "on" : "off"));
        return engine + "\n" + mode + "\n" + debug;
    }

    /** One positional substitution into an authored template. */
    private static String format(String template, Object... values) {
        return String.format(java.util.Locale.ROOT, template, values);
    }

    /**
     * The diagnostics panel body. UI text is resolved through the settings catalog so it follows the
     * interface language; every recorded source line, translation, provider reply, identifier, counter
     * and timestamp is appended verbatim and is never translated. Reading the panel drains the bounded
     * writer first, so what the user opens never hides records that were already produced.
     */
    static String uiText(Context context) {
        return CaptionDiagnosticSnapshot.peekText(context);
    }

    /**
     * The raw diagnostic report. {@code localized=false} is the export form used by
     * {@link #fullText(Context)}: its headings stay exactly as they were, because the saved report has to
     * remain byte-comparable with earlier exports and must not absorb the reader's interface language.
     */
    static String uiText(Context context,boolean localized){
        return localized?uiText(context):reportText(context,false);
    }
    /** Complete bounded panel formatter, only used by the background report/export lane. */
    static String reportText(Context context, boolean localized) {
        // Reading any report form first materialises the bounded queue, so a report never hides records
        // that were already produced. The drain is idempotent and free when the queue is empty.
        CaptionDiagnosticsWriter.drainNow(context);
        try {
            SharedPreferences p = prefs(context);
            String[] latest = summary(context);
            String stage = latest != null ? latest[0] : p.getString(STAGE, "");
            String detail = latest != null ? latest[1] : p.getString(DETAIL, "");
            long time = latest != null ? parseLong(latest[2], p.getLong(TIME, 0L)) : p.getLong(TIME, 0L);
            String audit = TokenCostAudit.uiText(context, localized);
            String header = localized
                    ? localizedHeader(context)
                    : "Engine: Event rebuild / " + RebuildProtocol.VERSION + "\nMode: "
                            + (CaptionChoice.translates() ? "automatic translation" : "original captions (no translation API)")
                            + "\nDisplay text debug: " + (DeepSeekConfig.displayTextDebugEnabled(context) ? "on" : "off");
            if (stage == null || stage.isEmpty()) {
                String base = localized
                        ? CaptionStrings.settings(context, "no_request_yet")
                        : "No automatic translation request captured yet. Enable translation, set an API key, play a video, select a target language, then refresh diagnostics.";
                return audit == null || audit.isEmpty()
                        ? header + "\n" + base
                        : header + "\n" + base + "\n\n" + audit;
            }
            long seconds = time <= 0 ? -1 : Math.max(0L, (System.currentTimeMillis() - time) / 1000L);
            String age = seconds < 0 ? "" : localized
                    ? " " + format(CaptionStrings.settings(context, "age_open"), seconds)
                            + CaptionStrings.settings(context, "age_close")
                    : " (about " + seconds + " seconds ago)";
            StringBuilder text = new StringBuilder();
            text.append(header).append("\n");
            text.append(localized
                            ? format(CaptionStrings.settings(context, "label_separator"),
                                    CaptionStrings.settings(context, "message_44feb4d98d48"))
                            : "Latest stage: ")
                    .append(stage).append(age);
            if (detail != null && !detail.isEmpty()) text.append("\n").append(detail);
            if (audit != null && !audit.isEmpty()) {
                text.append("\n\n").append(audit);
            }
            String decisions = latest != null ? latest[3] : p.getString(DECISIONS, "");
            if(decisions!=null && !decisions.isEmpty())text.append("\n\n")
                    .append(localized ? CaptionStrings.settings(context, "timing_decisions") : "Timing decisions and errors (preserved with timestamps):\n")
                    .append(decisions);
            // The reader-facing panel keeps its recent-events heading; the export below appends the whole
            // channel verbatim, so both readers keep exactly what they had before.
            if (localized) {
                String recent = CaptionDiagnosticArchive.read(context, "history");
                if (recent != null && !recent.isEmpty()) {
                    text.append("\n\n").append(CaptionStrings.settings(context, "recent_trace")).append("\n")
                            .append(recent.length() > 8000 ? recent.substring(0, 8000) : recent);
                }
            }
            text.append(CaptionDiagnosticsWriter.stats(localized ? CaptionStrings.settings(context, "diagnostics")
                    : "Diagnostics queue"));
            text.append(CaptionQualityTrace.text(context));
            return text.toString(); // Recorded source/translation/provider evidence must remain verbatim.
        } catch (Throwable error) {
            return (localized ? CaptionStrings.settings(context, "message_75a885d3b526") : "Failed to read diagnostics: ")
                    + error.getClass().getSimpleName();
        }
    }

    private static long parseLong(String value, long fallback) {
        try { return Long.parseLong(value); } catch (RuntimeException invalid) { return fallback; }
    }

    /**
     * The saved export. Its header is the raw, unlocalized report so an exported file keeps the format
     * earlier exports used, and the manifest and archive channels are appended unchanged. The export
     * takes one bounded barrier so records produced before it started are included; it never blocks the
     * playback thread for the thirty-second archive read.
     */
    static String fullText(Context c) {
        // One drain converts everything queued before this export into ordered appends; the barrier
        // then waits for those appends. Neither step runs on a playback or animation path.
        CaptionDiagnosticsWriter.drainNow(c);
        CaptionDiagnosticsWriter.flush(c);
        String history=CaptionDiagnosticArchive.read(c,"history"),quality=CaptionDiagnosticArchive.read(c,"quality"),timing=CaptionDiagnosticArchive.read(c,"timing");
        return reportText(c,false) + "\n\n[Export manifest; ui="+app.yydarlinker.extension.BuildConfig.CAPTION_PATCH_VERSION+"; engine="+RebuildProtocol.VERSION+"; build=n37; official=1.45.0; presentation=n29-presentation-v3; presentation_revision=n37-consistent-observation-v1"+"; exported_at="+System.currentTimeMillis()
            +"; completeness=bounded_not_guaranteed; history_records="+records(history,false)+"; quality_records="+records(quality,true)+"; timing_records="+records(timing,true)
            +"; truncation_markers="+(occurrences(history,"record truncated")+occurrences(quality,"record truncated")+occurrences(timing,"record truncated"))
            +"; dropped_records="+CaptionDiagnosticsWriter.droppedCount()+"; merged_records="+CaptionDiagnosticsWriter.mergedCount()
            +"; reused_repeats="+CaptionDiagnosticsWriter.reusedRepeatCount()+"; queue_epoch="+CaptionDiagnosticsWriter.epoch()
            +"; debug="+DeepSeekConfig.displayTextDebugEnabled(c)+"]\n"
            + "\n[Extended history: chronological; last 24h; up to 8 MiB per channel]\n"
            + history + "\n[Extended quality evidence; captured only while debug enabled]\n"+quality
            + "\n[Extended timing evidence; bounded raw reference parts]\n"+timing;
    }

    private static int records(String text,boolean json){int n=0;for(String line:text.split("\n"))if(json?line.startsWith("{"):line.matches("^[0-9]+ \\|.*"))n++;return n;}
    private static int occurrences(String text,String needle){int n=0,p=0;while((p=text.indexOf(needle,p))>=0){n++;p+=needle.length();}return n;}

    /**
     * Reserved-tier decision list. These stages are the ones the report must never lose to repeated
     * display noise: request lifecycle, structural rejection, source repair, cancellation, the real
     * first caption display, owner recovery and every error path.
     */
    private static boolean importantDecision(String stage) {
        return (stage.startsWith("REBUILD_") && !stage.equals("REBUILD_SELECTED") && !stage.equals("REBUILD_PRESENTED") && !stage.equals("REBUILD_DISPLAY")) || stage.equals("SOURCE_RETRY_SCHEDULED") || stage.equals("SOURCE_LOAD_FAILED")
                || stage.equals("CONTEXTUAL_CORE_ERROR") || stage.equals("CONTEXTUAL_SEEK_REPRIORITIZED")
                || stage.equals("ASR_CUE_TIMING_BASE") || stage.equals("ASR_CUE_TIMING_APPLIED")
                || stage.equals("ASR_REFERENCE_FETCH_FAILED") || stage.equals("SOURCE_TIMING_FALLBACK")
                || stage.equals("SOURCE_TIMING_CALIBRATED") || stage.equals("SOURCE_TIMING_CONFIRMED")
                || stage.equals("ANCHOR_RESPONSE_REJECTED") || stage.equals("CONTEXTUAL_BATCH_FAILED")
                || stage.equals("FIRST_AI_READY") || stage.equals("SOURCE_TIMING_BASE")
                || stage.equals("ASR_LOCAL_TIMING_APPLIED") || stage.equals("ASR_LOCAL_TIMING_REJECTED")
                || stage.equals("ASR_NATIVE_WORD_TIMING_SELECTED") || stage.equals("ASR_NATIVE_WORD_TIMING_ALIGNED")
                || stage.equals("ASR_WORD_TIMING_UNAVAILABLE") || stage.equals("ASR_REFERENCE_CANDIDATE")
                || stage.equals("ASR_REFERENCE_SELECTED") || stage.equals("ASR_REFERENCE_UNAVAILABLE")
                || stage.equals("SOURCE_TIMING_CAPABILITIES") || stage.equals("REBUILD_SOURCE_REFERENCE_APPLIED")
                || stage.equals("ENGINE_MODE_SAVED")
                || stage.equals("NATIVE_APPLIED_CAPTURE_FAILED") || stage.equals("NATIVE_APPLIED_OWNER_REJECTED")
                || stage.equals("OVERLAY_READABILITY_DEGRADED") || stage.equals("ENGINE_SNAPSHOT_ACTIVATED") || stage.equals("BACKGROUND_ACTIVATION_IGNORED")
                || stage.equals("CAPTION_FIRST_DISPLAY") || stage.equals("PLAYER_TRANSITION_STABLE")
                || stage.equals("PLAYER_TRANSITION_SAFE_BLANK") || stage.equals("PLAYER_AUTHORITY_CHANGE")
                || stage.equals("REBUILD_CANCELLED") || stage.equals("REBUILD_CANCEL_REASON")
                || stage.equals("REBUILD_PRESENTATION_HARD_REJECT") || stage.equals("REBUILD_HTTP_FAILURE")
                || stage.equals("REBUILD_DISPLAY_RESULT") || stage.equals("REBUILD_PRESENTED")
                || stage.equals("NATIVE_APPLIED_OWNER_REJECTED");
    }

    private static String sanitize(String value, int max) {
        if (value == null) return "";
        String clean = value.replace('\r', ' ').replace('\n', ' ').trim();
        return clean.length() <= max ? clean : clean.substring(0, max);
    }

    static String errorDetail(Throwable error) {
        if (error == null) return "unknown";
        String message = error.getMessage();
        if (message == null || message.trim().isEmpty()) message = error.getClass().getSimpleName();
        return sanitize(message, 220);
    }
}
