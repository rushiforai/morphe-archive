package app.yydarlinker.deepseekcaptions;

import android.content.Context;

import java.util.Locale;

/**
 * On-device trace, so that subtitle failures can be diagnosed without adb or logcat.
 *
 * <p>{@link #mark} is the only call of the playback path: it queues the record and returns. The
 * panel shows the report of the last snapshot, the export saves the whole of it.
 */
final class CaptionDiagnostics {
    private static final String LEGACY_PREFS = "deepseek_caption_diagnostics";
    private static final char SEPARATOR = '\u0001';
    private static final int PANEL_HISTORY_CHARS = 8000;

    private CaptionDiagnostics() {}

    /**
     * Hot-path entry. It does no configuration load, keystore access, file I/O or preferences
     * commit: the record is queued with the credential reference the caller already has, and
     * redacted later on the writer thread.
     */
    static void mark(
            Context context, String stage, String detail, CaptionCredentialRef credential) {
        mark(context, stage, detail, credential, "");
    }

    /**
     * {@code mergeKey} declares a repeated high-frequency observation: records of the same stage
     * and key that follow each other are kept once, with their count.
     */
    static void mark(
            Context context,
            String stage,
            String detail,
            CaptionCredentialRef credential,
            String mergeKey) {
        if (context != null)
            CaptionDiagnosticsWriter.enqueue(context, stage, detail, credential, mergeKey);
    }

    /** For callers that only have a context; it resolves the credential, so not for playback. */
    static synchronized void mark(Context context, String stage, String detail) {
        if (context != null) mark(context, stage, detail, SecureApiKey.credentialRef(context));
    }

    /**
     * Stages the report must never lose to repeated display noise: the request lifecycle,
     * structural rejection, source repair, cancellation, the first caption shown, owner recovery
     * and every error.
     */
    static boolean isDecision(String stage) {
        return stage.startsWith("REBUILD_")
                        && !stage.equals("REBUILD_SELECTED")
                        && !stage.equals("REBUILD_DISPLAY")
                || stage.equals("ENGINE_MODE_SAVED")
                || stage.equals("INTENT_APPLY")
                || stage.equals("INTENT_USER_OFF")
                || stage.equals("INTENT_USER_SELECTED")
                || stage.equals("INTENT_DEACTIVATE")
                || stage.equals("ENGINE_SNAPSHOT_ACTIVATED")
                || stage.equals("NATIVE_APPLIED_CAPTURE_FAILED")
                || stage.equals("NATIVE_APPLIED_OWNER_REJECTED")
                || stage.equals("NATIVE_OBSERVATION_STALE")
                || stage.equals("PLAYER_TRANSITION_SAFE_BLANK")
                || stage.equals("PLAYER_TRANSITION_STABLE");
    }

    static void clear(Context context) {
        CaptionDiagnosticsWriter.clear(context);
        CaptionDiagnosticSnapshot.invalidate();
        CaptionDiagnosticArchive.clear(context);
        long epoch = CaptionDiagnosticsWriter.epoch();
        CaptionDiagnosticsWriter.background(
                () -> {
                    if (epoch != CaptionDiagnosticsWriter.epoch()) return;
                    context.getSharedPreferences(LEGACY_PREFS, Context.MODE_PRIVATE)
                            .edit()
                            .clear()
                            .apply();
                    CaptionQualityTrace.clear(context);
                    TokenCostAudit.clear(context);
                });
    }

    /** The recorded history, once the queue has been written; for tests and checks. */
    static String history(Context context) {
        CaptionDiagnosticsWriter.drainNow(context);
        return CaptionDiagnosticArchive.read(context, "history");
    }

    /** The engine is the patch itself: the report names the version of the package. */
    static String engineVersion() {
        return app.yydarlinker.extension.BuildConfig.CAPTION_PATCH_VERSION;
    }

    static String sanitize(String value, int max) {
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

    /** The latest record: {stage, detail, time, decision lines}, or null before the first one. */
    private static String[] latest(Context context) {
        String slot =
                CaptionDiagnosticArchive.readSummary(context, CaptionDiagnosticsWriter.epoch());
        if (slot != null) {
            String[] parts = slot.split(String.valueOf(SEPARATOR), -1);
            if (parts.length >= 5) return new String[] {parts[1], parts[2], parts[3], parts[4]};
        }
        // The slot may be a moment behind: the last line of the history is the latest record too,
        // so a captured request is never reported as "no request yet".
        String history = CaptionDiagnosticArchive.read(context, "history");
        String line = null;
        for (String candidate : history.split("\n")) {
            if (candidate.length() > 20
                    && candidate.charAt(0) >= '0'
                    && candidate.charAt(0) <= '9'
                    && candidate.contains(" | ")) line = candidate;
        }
        if (line == null) return null;
        int first = line.indexOf(" | ");
        int second = line.indexOf(" | ", first + 3);
        String stage = second < 0 ? line.substring(first + 3) : line.substring(first + 3, second);
        return new String[] {
            stage,
            second < 0 ? "" : line.substring(second + 3),
            line.substring(0, first).trim(),
            isDecision(stage) ? line : ""
        };
    }

    private static String format(String template, Object... values) {
        return String.format(Locale.ROOT, template, values);
    }

    /** The text of the panel: the report of the last snapshot, or "loading" before the first. */
    static String uiText(Context context) {
        return CaptionDiagnosticSnapshot.peekText(context);
    }

    /**
     * The report. The panel form is in the interface language. The export form keeps its English
     * headings, so that saved reports of different users and versions can be compared. Whatever was
     * recorded (source lines, translations, provider replies, identifiers) is never translated.
     */
    static String uiText(Context context, boolean localized) {
        return localized ? uiText(context) : reportText(context, false);
    }

    /** The three header lines: engine, mode and the state of the display text debug. */
    private static String header(Context context, boolean localized) {
        boolean translates = CaptionSessionIntent.load(context).translates();
        boolean debug = DeepSeekConfig.displayTextDebugEnabled(context);
        if (!localized) {
            return "Engine: Event rebuild / "
                    + engineVersion()
                    + "\nMode: "
                    + (translates
                            ? "automatic translation"
                            : "original captions (no translation API)")
                    + "\nDisplay text debug: "
                    + (debug ? "on" : "off");
        }
        String separator = CaptionStrings.get(context, "label_separator");
        return format(separator, CaptionStrings.get(context, "engine"))
                + CaptionStrings.get(context, "engine_event_rebuild")
                + " / "
                + engineVersion()
                + "\n"
                + format(separator, CaptionStrings.get(context, "mode"))
                + CaptionStrings.get(context, translates ? "mode_auto_translate" : "mode_original")
                + "\n"
                + format(
                        CaptionStrings.get(context, "display_debug"),
                        CaptionStrings.get(context, debug ? "on" : "off"));
    }

    /** The complete report; the panel and the export are made from it on the report thread. */
    static String reportText(Context context, boolean localized) {
        // Whatever was queued before the report is part of it.
        CaptionDiagnosticsWriter.drainNow(context);
        try {
            String[] latest = latest(context);
            String audit = TokenCostAudit.uiText(context, localized);
            String header = header(context, localized);
            StringBuilder text = new StringBuilder(header).append("\n");
            if (latest == null || latest[0].isEmpty()) {
                text.append(
                        localized
                                ? CaptionStrings.get(context, "no_request_yet")
                                : "No automatic translation request captured yet. Enable"
                                        + " translation, set an API key, play a video, select a"
                                        + " target language, then refresh diagnostics.");
                if (audit != null && !audit.isEmpty()) text.append("\n\n").append(audit);
                return text.toString();
            }
            text.append(
                            localized
                                    ? format(
                                            CaptionStrings.get(context, "label_separator"),
                                            CaptionStrings.get(context, "message_44feb4d98d48"))
                                    : "Latest stage: ")
                    .append(latest[0])
                    .append(age(context, localized, parseLong(latest[2])));
            if (!latest[1].isEmpty()) text.append("\n").append(latest[1]);
            if (audit != null && !audit.isEmpty()) text.append("\n\n").append(audit);
            if (!latest[3].isEmpty())
                text.append("\n\n")
                        .append(
                                localized
                                        ? CaptionStrings.get(context, "timing_decisions")
                                        : "Timing decisions and errors (preserved with"
                                                + " timestamps):\n")
                        .append(latest[3]);
            if (localized) {
                // The panel shows the start of the history under its heading; the export appends
                // the whole channel itself.
                String recent = CaptionDiagnosticArchive.read(context, "history");
                if (!recent.isEmpty())
                    text.append("\n\n")
                            .append(CaptionStrings.get(context, "recent_trace"))
                            .append("\n")
                            .append(
                                    recent.length() > PANEL_HISTORY_CHARS
                                            ? recent.substring(0, PANEL_HISTORY_CHARS)
                                            : recent);
            }
            return text.append(
                            CaptionDiagnosticsWriter.stats(
                                    localized
                                            ? CaptionStrings.get(context, "diagnostics")
                                            : "Diagnostics queue"))
                    .append(CaptionQualityTrace.text(context))
                    .toString();
        } catch (Throwable error) {
            return (localized
                            ? CaptionStrings.get(context, "message_75a885d3b526")
                            : "Failed to read diagnostics: ")
                    + error.getClass().getSimpleName();
        }
    }

    /** " (12 seconds ago)", or nothing when the record has no time. */
    private static String age(Context context, boolean localized, long time) {
        if (time <= 0) return "";
        long seconds = Math.max(0L, (System.currentTimeMillis() - time) / 1000L);
        return localized
                ? " "
                        + format(CaptionStrings.get(context, "age_open"), seconds)
                        + CaptionStrings.get(context, "age_close")
                : " (about " + seconds + " seconds ago)";
    }

    private static long parseLong(String value) {
        try {
            return Long.parseLong(value);
        } catch (RuntimeException invalid) {
            return 0L;
        }
    }

    /**
     * The saved export: the report with the English headings, a manifest, and the history, quality
     * and timing channels in full. It waits once, at most 400 ms, for the records produced before
     * it; it never runs on a playback thread.
     */
    static String fullText(Context context) {
        CaptionDiagnosticsWriter.drainNow(context);
        CaptionDiagnosticsWriter.flush(context);
        String history = CaptionDiagnosticArchive.read(context, "history");
        String quality = CaptionDiagnosticArchive.read(context, "quality");
        String timing = CaptionDiagnosticArchive.read(context, "timing");
        return reportText(context, false)
                + "\n\n[Export manifest; ui="
                + app.yydarlinker.extension.BuildConfig.CAPTION_PATCH_VERSION
                + "; engine="
                + engineVersion()
                + "; core="
                + CaptionEngineIdentity.ID
                + "; build="
                + app.yydarlinker.extension.BuildConfig.CAPTION_BUILD_ID
                + "; official=1.45.0; presentation=n29-presentation-v3;"
                + " presentation_revision=n37-consistent-observation-v1; exported_at="
                + System.currentTimeMillis()
                + "; completeness=bounded_not_guaranteed; history_records="
                + records(history, false)
                + "; quality_records="
                + records(quality, true)
                + "; timing_records="
                + records(timing, true)
                + "; truncation_markers="
                + (occurrences(history, "record truncated")
                        + occurrences(quality, "record truncated")
                        + occurrences(timing, "record truncated"))
                + "; dropped_records="
                + CaptionDiagnosticsWriter.droppedCount()
                + "; merged_records="
                + CaptionDiagnosticsWriter.mergedCount()
                + "; queue_epoch="
                + CaptionDiagnosticsWriter.epoch()
                + "; debug="
                + DeepSeekConfig.displayTextDebugEnabled(context)
                + "]\n"
                + "\n[Extended history: chronological; last 24h; up to 8 MiB per channel]\n"
                + history
                + "\n[Extended quality evidence; captured only while debug enabled]\n"
                + quality
                + "\n[Extended timing evidence; bounded raw reference parts]\n"
                + timing;
    }

    /** Records of a channel: lines that start with a time, or JSON lines. */
    private static int records(String text, boolean json) {
        int n = 0;
        for (String line : text.split("\n"))
            if (json ? line.startsWith("{") : line.matches("^[0-9]+ \\|.*")) n++;
        return n;
    }

    private static int occurrences(String text, String needle) {
        int n = 0;
        for (int at = text.indexOf(needle);
                at >= 0;
                at = text.indexOf(needle, at + needle.length())) n++;
        return n;
    }
}
