package dev.srwi.gintype.extension.multiglide;

import android.content.Context;
import android.util.Log;
import dev.srwi.gintype.extension.multiglide.MultiGlideGeometry.KeySpec;
import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.Dwell;
import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.KeyContact;
import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.TouchPoint;
import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.WordCandidate;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/**
 * Structured JSONL telemetry logger for MultiGlide word decoding & touch-integration diagnostics.
 *
 * Emits:
 * - Chunk-safe logcat entries under tag {@code GboardMultiGlideTrace}
 * - Persistent rolling JSONL files {@code multiglide_trace.jsonl} / {@code multiglide_trace.prev.jsonl}
 *   under {@code context.getExternalFilesDir(null)} via a single background executor.
 */
public final class GboardMultiGlideTraceLogger {

    public static final String LOG_TAG = "GboardMultiGlideTrace";
    static final String TRACE_FILE_NAME = "multiglide_trace.jsonl";
    static final String TRACE_BACKUP_NAME = "multiglide_trace.prev.jsonl";
    private static final long MAX_FILE_BYTES = 256L * 1024L;
    private static final int LOGCAT_CHUNK_CHARS = 3500;
    private static final int MAX_TOP_CANDIDATES = 5;
    private static final int MAX_BASELINE_TAIL = 48;

    interface TraceSink {
        void onLine(Context context, String jsonLine);
    }

    private static volatile TraceSink customSink = null;
    private static volatile int lastLoggedGeomHash = 0;

    private static final ExecutorService IO_EXECUTOR = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "multiglide-trace-io");
        t.setDaemon(true);
        return t;
    });

    private GboardMultiGlideTraceLogger() {}

    static void setTraceSinkForTesting(TraceSink sink) {
        customSink = sink;
        lastLoggedGeomHash = 0;
    }

    public static void logWordDecode(
            Context context,
            MultiGlideGeometry geometry,
            boolean fromNativeLayout,
            int kbWidth,
            int kbHeight,
            String lang,
            List<MultiGlideInputToken> tokens,
            String bestWord,
            boolean capitalizeFirst,
            String prevWord,
            String baselineBeforeText,
            int passivePromotedCount,
            int rollbackDeleted,
            int restingDropped,
            List<WordCandidate> candidates
    ) {
        if (!isEnabled(context)) return;
        int geomHash = ensureGeometryLogged(context, geometry, fromNativeLayout, kbWidth, kbHeight, lang);
        String line = buildWordRecordJson(
                System.currentTimeMillis(),
                geomHash,
                lang,
                tokens,
                bestWord,
                capitalizeFirst,
                prevWord,
                baselineBeforeText,
                passivePromotedCount,
                rollbackDeleted,
                restingDropped,
                candidates);
        emitLine(context, line);
    }

    public static void logSkippedGesture(
            Context context,
            MultiGlideGeometry geometry,
            boolean fromNativeLayout,
            int kbWidth,
            int kbHeight,
            String lang,
            String reason,
            boolean hasSwipe,
            boolean sawMultiTouch,
            int passiveBufferSize,
            int restingDropped,
            String baselineBeforeText,
            List<MultiGlideInputToken> tokens
    ) {
        if (!isEnabled(context)) return;
        int geomHash = ensureGeometryLogged(context, geometry, fromNativeLayout, kbWidth, kbHeight, lang);
        StringBuilder sb = new StringBuilder(512);
        sb.append("{\"type\":\"pass\",\"ts\":").append(System.currentTimeMillis());
        sb.append(",\"geom\":").append(geomHash);
        sb.append(",\"lang\":");
        appendJsonString(sb, lang);
        sb.append(",\"reason\":");
        appendJsonString(sb, reason);
        sb.append(",\"swipe\":").append(hasSwipe);
        sb.append(",\"multi\":").append(sawMultiTouch);
        sb.append(",\"passive\":").append(passiveBufferSize);
        sb.append(",\"restingDropped\":").append(restingDropped);
        sb.append(",\"baseline\":");
        appendJsonString(sb, tail(baselineBeforeText, MAX_BASELINE_TAIL));
        sb.append(",\"tokens\":");
        appendTokensArray(sb, tokens);
        sb.append('}');
        emitLine(context, sb.toString());
    }

    public static void logCommit(
            Context context,
            String word,
            boolean autoSpaceInserted,
            String prevWord
    ) {
        if (!isEnabled(context)) return;
        StringBuilder sb = new StringBuilder(160);
        sb.append("{\"type\":\"commit\",\"ts\":").append(System.currentTimeMillis());
        sb.append(",\"word\":");
        appendJsonString(sb, word);
        sb.append(",\"autoSpace\":").append(autoSpaceInserted);
        sb.append(",\"prevWord\":");
        appendJsonString(sb, prevWord);
        sb.append('}');
        emitLine(context, sb.toString());
    }

    private static boolean isEnabled(Context context) {
        return customSink != null || GboardMultiGlideSettings.isTraceLoggingEnabled(context);
    }

    private static int ensureGeometryLogged(
            Context context,
            MultiGlideGeometry geometry,
            boolean fromNativeLayout,
            int kbWidth,
            int kbHeight,
            String lang
    ) {
        if (geometry == null || !geometry.isValid()) return 0;
        int hash = computeGeometryHash(geometry, fromNativeLayout, kbWidth, kbHeight, lang);
        if (hash != lastLoggedGeomHash) {
            lastLoggedGeomHash = hash;
            emitLine(context, buildGeometryRecordJson(
                    System.currentTimeMillis(), hash, geometry, fromNativeLayout, kbWidth, kbHeight, lang));
        }
        return hash;
    }

    static int computeGeometryHash(
            MultiGlideGeometry geometry,
            boolean fromNativeLayout,
            int kbWidth,
            int kbHeight,
            String lang
    ) {
        int h = 17;
        h = 31 * h + (lang != null ? lang.hashCode() : 0);
        h = 31 * h + (fromNativeLayout ? 1 : 0);
        h = 31 * h + kbWidth;
        h = 31 * h + kbHeight;
        h = 31 * h + (geometry.hasDedicatedUmlauts() ? 1 : 0);
        List<KeySpec> keys = geometry.allKeysSnapshot();
        for (int i = 0; i < keys.size(); i++) {
            KeySpec k = keys.get(i);
            h = 31 * h + k.character;
            h = 31 * h + Math.round(k.centerX * 10f);
            h = 31 * h + Math.round(k.centerY * 10f);
        }
        return h;
    }

    static String buildGeometryRecordJson(
            long tsMs,
            int geomHash,
            MultiGlideGeometry geometry,
            boolean fromNativeLayout,
            int kbWidth,
            int kbHeight,
            String lang
    ) {
        StringBuilder sb = new StringBuilder(1024);
        sb.append("{\"type\":\"geom\",\"ts\":").append(tsMs);
        sb.append(",\"geom\":").append(geomHash);
        sb.append(",\"lang\":");
        appendJsonString(sb, lang);
        sb.append(",\"native\":").append(fromNativeLayout);
        sb.append(",\"kbW\":").append(kbWidth);
        sb.append(",\"kbH\":").append(kbHeight);
        sb.append(",\"kw\":");
        appendRounded1(sb, geometry.keyWidthPx);
        sb.append(",\"kh\":");
        appendRounded1(sb, geometry.keyHeightPx);
        sb.append(",\"midX\":");
        appendRounded1(sb, geometry.midlinePx());
        sb.append(",\"umlauts\":").append(geometry.hasDedicatedUmlauts());
        sb.append(",\"keys\":{");
        List<KeySpec> keys = geometry.allKeysSnapshot();
        for (int i = 0; i < keys.size(); i++) {
            if (i > 0) sb.append(',');
            KeySpec k = keys.get(i);
            appendJsonString(sb, String.valueOf(k.character));
            sb.append(":[");
            appendRounded1(sb, k.centerX);
            sb.append(',');
            appendRounded1(sb, k.centerY);
            sb.append(',');
            appendRounded1(sb, k.width);
            sb.append(',');
            appendRounded1(sb, k.height);
            sb.append(']');
        }
        sb.append("}}");
        return sb.toString();
    }

    static String buildWordRecordJson(
            long tsMs,
            int geomHash,
            String lang,
            List<MultiGlideInputToken> tokens,
            String bestWord,
            boolean capitalizeFirst,
            String prevWord,
            String baselineBeforeText,
            int passivePromotedCount,
            int rollbackDeleted,
            int restingDropped,
            List<WordCandidate> candidates
    ) {
        StringBuilder sb = new StringBuilder(1536);
        sb.append("{\"type\":\"word\",\"ts\":").append(tsMs);
        sb.append(",\"geom\":").append(geomHash);
        sb.append(",\"lang\":");
        appendJsonString(sb, lang);
        sb.append(",\"best\":");
        appendJsonString(sb, bestWord);
        sb.append(",\"capFirst\":").append(capitalizeFirst);
        sb.append(",\"prevWord\":");
        appendJsonString(sb, prevWord);
        sb.append(",\"baseline\":");
        appendJsonString(sb, tail(baselineBeforeText, MAX_BASELINE_TAIL));
        sb.append(",\"passiveCount\":").append(passivePromotedCount);
        sb.append(",\"rollback\":").append(rollbackDeleted);
        sb.append(",\"restingDropped\":").append(restingDropped);
        sb.append(",\"top\":[");
        if (candidates != null) {
            int limit = Math.min(MAX_TOP_CANDIDATES, candidates.size());
            for (int i = 0; i < limit; i++) {
                if (i > 0) sb.append(',');
                WordCandidate c = candidates.get(i);
                sb.append("{\"w\":");
                appendJsonString(sb, c.word);
                sb.append(",\"s\":");
                appendRounded4(sb, c.totalScore);
                sb.append(",\"d\":");
                appendRounded3(sb, c.spatialScore);
                sb.append('}');
            }
        }
        sb.append("],\"tokens\":");
        appendTokensArray(sb, tokens);
        sb.append('}');
        return sb.toString();
    }

    private static void appendTokensArray(StringBuilder sb, List<MultiGlideInputToken> tokens) {
        sb.append('[');
        if (tokens != null && !tokens.isEmpty()) {
            long baseT0 = Long.MAX_VALUE;
            for (int i = 0; i < tokens.size(); i++) {
                MultiGlideInputToken tok = tokens.get(i);
                if (tok != null && tok.startTimeMs < baseT0) {
                    baseT0 = tok.startTimeMs;
                }
            }
            if (baseT0 == Long.MAX_VALUE) baseT0 = 0L;

            for (int i = 0; i < tokens.size(); i++) {
                MultiGlideInputToken tok = tokens.get(i);
                if (tok == null) continue;
                if (i > 0) sb.append(',');
                sb.append("{\"kind\":");
                appendJsonString(sb, tok.kind.name());
                sb.append(",\"ptr\":").append(tok.pointerId);
                sb.append(",\"st\":").append(tok.streamId);
                sb.append(",\"t0\":").append(tok.startTimeMs - baseT0);
                sb.append(",\"t1\":").append(tok.endTimeMs - baseT0);
                if (tok.kind == MultiGlideInputToken.Kind.TAP) {
                    sb.append(",\"c\":");
                    appendJsonString(sb, String.valueOf(tok.character));
                    sb.append(",\"x\":");
                    appendRounded1(sb, tok.tapX);
                    sb.append(",\"y\":");
                    appendRounded1(sb, tok.tapY);
                } else {
                    sb.append(",\"len\":");
                    appendRounded1(sb, tok.pathLengthPx);
                    sb.append(",\"pts\":[");
                    if (tok.points != null) {
                        for (int p = 0; p < tok.points.size(); p++) {
                            if (p > 0) sb.append(',');
                            TouchPoint pt = tok.points.get(p);
                            sb.append('[').append(pt.timeMs - baseT0).append(',');
                            appendRounded1(sb, pt.x);
                            sb.append(',');
                            appendRounded1(sb, pt.y);
                            sb.append(']');
                        }
                    }
                    sb.append("],\"contacts\":[");
                    for (int k = 0; k < tok.keyContacts.size(); k++) {
                        if (k > 0) sb.append(',');
                        KeyContact kc = tok.keyContacts.get(k);
                        char ch = MultiGlideAlphabet.indexToChar(kc.code);
                        sb.append('[');
                        appendJsonString(sb, ch != '\0' ? String.valueOf(ch) : String.valueOf(kc.code));
                        sb.append(',').append(kc.tEnter - baseT0);
                        sb.append(',').append(kc.tExit - baseT0).append(']');
                    }
                    sb.append("],\"dwells\":[");
                    for (int d = 0; d < tok.dwells.size(); d++) {
                        if (d > 0) sb.append(',');
                        Dwell dw = tok.dwells.get(d);
                        sb.append('[').append(dw.enterIdx)
                                .append(',').append(dw.exitIdx)
                                .append(',').append(dw.tEnter - baseT0)
                                .append(',').append(dw.tExit - baseT0).append(']');
                    }
                    sb.append(']');
                }
                sb.append('}');
            }
        }
        sb.append(']');
    }

    private static void emitLine(Context context, String jsonLine) {
        TraceSink sink = customSink;
        if (sink != null) {
            sink.onLine(context, jsonLine);
            return;
        }
        try {
            logToLogcatChunked(jsonLine);
        } catch (Throwable ignored) {
        }
        if (context != null) {
            final Context appCtx = context.getApplicationContext() != null
                    ? context.getApplicationContext()
                    : context;
            IO_EXECUTOR.execute(() -> appendLineToFile(appCtx, jsonLine));
        }
    }

    private static void logToLogcatChunked(String line) {
        int len = line.length();
        if (len <= LOGCAT_CHUNK_CHARS) {
            Log.i(LOG_TAG, line);
            return;
        }
        int totalParts = (len + LOGCAT_CHUNK_CHARS - 1) / LOGCAT_CHUNK_CHARS;
        String id = Long.toHexString(System.nanoTime());
        for (int part = 0; part < totalParts; part++) {
            int start = part * LOGCAT_CHUNK_CHARS;
            int end = Math.min(len, start + LOGCAT_CHUNK_CHARS);
            Log.i(LOG_TAG, "[chunk " + id + " " + (part + 1) + "/" + totalParts + "] "
                    + line.substring(start, end));
        }
    }

    public static final class TraceExportResult {
        public final String content;
        public final int lineCount;

        public TraceExportResult(String content, int lineCount) {
            this.content = content;
            this.lineCount = lineCount;
        }
    }

    public static TraceExportResult readTraceForExport(Context context, int minutesBack) {
        if (context == null) {
            return new TraceExportResult("", 0);
        }
        final Context appCtx = context.getApplicationContext() != null
                ? context.getApplicationContext()
                : context;
        try {
            return IO_EXECUTOR.submit(() -> {
                File dir = resolveTraceDir(appCtx);
                if (dir == null) {
                    return new TraceExportResult("", 0);
                }
                List<String> lines = new ArrayList<>();
                readLinesInto(new File(dir, TRACE_BACKUP_NAME), lines);
                readLinesInto(new File(dir, TRACE_FILE_NAME), lines);
                return buildTraceExport(lines, minutesBack, System.currentTimeMillis());
            }).get(3, TimeUnit.SECONDS);
        } catch (Throwable ignored) {
            return new TraceExportResult("", 0);
        }
    }

    public static boolean clearTraceLogs(Context context) {
        if (context == null) return false;
        final Context appCtx = context.getApplicationContext() != null
                ? context.getApplicationContext()
                : context;
        try {
            return IO_EXECUTOR.submit(() -> {
                File dir = resolveTraceDir(appCtx);
                boolean ok = true;
                if (dir != null) {
                    File main = new File(dir, TRACE_FILE_NAME);
                    if (main.exists()) ok &= main.delete();
                    File backup = new File(dir, TRACE_BACKUP_NAME);
                    if (backup.exists()) ok &= backup.delete();
                }
                lastLoggedGeomHash = 0;
                return ok;
            }).get(3, TimeUnit.SECONDS);
        } catch (Throwable ignored) {
            return false;
        }
    }

    static TraceExportResult buildTraceExport(
            List<String> chronologicalLines,
            int minutesBack,
            long nowMs
    ) {
        if (chronologicalLines == null || chronologicalLines.isEmpty()) {
            return new TraceExportResult("", 0);
        }
        if (minutesBack <= 0) {
            StringBuilder all = new StringBuilder();
            int count = 0;
            for (int i = 0; i < chronologicalLines.size(); i++) {
                String line = chronologicalLines.get(i);
                if (line == null || line.trim().isEmpty()) continue;
                if (count > 0) all.append('\n');
                all.append(line);
                count++;
            }
            return new TraceExportResult(all.toString(), count);
        }

        long windowMs = Math.max(1L, minutesBack) * 60_000L;
        long cutoffMs = nowMs - windowMs;
        Map<Integer, String> latestGeomLineByHash = new LinkedHashMap<>();
        List<String> inWindowLines = new ArrayList<>();
        Set<Integer> neededGeomHashes = new LinkedHashSet<>();
        Set<Integer> includedGeomHashes = new LinkedHashSet<>();

        for (int i = 0; i < chronologicalLines.size(); i++) {
            String line = chronologicalLines.get(i);
            if (line == null || line.trim().isEmpty()) continue;
            long ts = extractTimestampMs(line);
            Integer geomHash = extractGeomHash(line);
            boolean isGeom = line.startsWith("{\"type\":\"geom\"");
            if (ts >= cutoffMs) {
                inWindowLines.add(line);
                if (geomHash != null) {
                    if (isGeom) {
                        includedGeomHashes.add(geomHash);
                    } else {
                        neededGeomHashes.add(geomHash);
                    }
                }
            } else if (isGeom && geomHash != null) {
                latestGeomLineByHash.put(geomHash, line);
            }
        }

        if (inWindowLines.isEmpty()) {
            return new TraceExportResult("", 0);
        }

        StringBuilder out = new StringBuilder();
        int count = 0;
        for (Integer hash : neededGeomHashes) {
            if (!includedGeomHashes.contains(hash)) {
                String geomLine = latestGeomLineByHash.get(hash);
                if (geomLine != null) {
                    if (count > 0) out.append('\n');
                    out.append(geomLine);
                    count++;
                }
            }
        }
        for (int i = 0; i < inWindowLines.size(); i++) {
            if (count > 0) out.append('\n');
            out.append(inWindowLines.get(i));
            count++;
        }
        return new TraceExportResult(out.toString(), count);
    }

    static long extractTimestampMs(String jsonLine) {
        return extractLongField(jsonLine, "\"ts\":", -1L);
    }

    static Integer extractGeomHash(String jsonLine) {
        if (jsonLine == null) return null;
        int idx = jsonLine.indexOf("\"geom\":");
        if (idx < 0) return null;
        long parsed = parseSignedLongAt(jsonLine, idx + 7, Long.MIN_VALUE);
        return parsed == Long.MIN_VALUE ? null : (int) parsed;
    }

    private static long extractLongField(String jsonLine, String fieldPrefix, long fallback) {
        if (jsonLine == null) return fallback;
        int idx = jsonLine.indexOf(fieldPrefix);
        if (idx < 0) return fallback;
        return parseSignedLongAt(jsonLine, idx + fieldPrefix.length(), fallback);
    }

    private static long parseSignedLongAt(String s, int start, long fallback) {
        int len = s.length();
        while (start < len && s.charAt(start) == ' ') start++;
        if (start >= len) return fallback;
        boolean negative = false;
        if (s.charAt(start) == '-') {
            negative = true;
            start++;
        }
        if (start >= len || !Character.isDigit(s.charAt(start))) {
            return fallback;
        }
        long val = 0L;
        while (start < len && Character.isDigit(s.charAt(start))) {
            val = val * 10L + (s.charAt(start) - '0');
            start++;
        }
        return negative ? -val : val;
    }

    private static void readLinesInto(File file, List<String> dest) {
        if (file == null || !file.isFile()) return;
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                new FileInputStream(file), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    dest.add(line);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static File resolveTraceDir(Context context) {
        if (context == null) return null;
        return context.getFilesDir();
    }

    private static void appendLineToFile(Context context, String jsonLine) {
        try {
            File dir = resolveTraceDir(context);
            if (dir == null) return;
            if (!dir.exists() && !dir.mkdirs()) return;

            File traceFile = new File(dir, TRACE_FILE_NAME);
            if (traceFile.exists() && traceFile.length() >= MAX_FILE_BYTES) {
                File backup = new File(dir, TRACE_BACKUP_NAME);
                if (backup.exists()) {
                    //noinspection ResultOfMethodCallIgnored
                    backup.delete();
                }
                //noinspection ResultOfMethodCallIgnored
                traceFile.renameTo(backup);
                lastLoggedGeomHash = 0;
            }
            try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(traceFile, true), StandardCharsets.UTF_8))) {
                writer.write(jsonLine);
                writer.newLine();
            }
        } catch (Throwable ignored) {
        }
    }

    private static String tail(String s, int maxChars) {
        if (s == null) return null;
        if (s.length() <= maxChars) return s;
        return s.substring(s.length() - maxChars);
    }

    private static void appendRounded1(StringBuilder sb, float v) {
        if (Float.isNaN(v) || Float.isInfinite(v)) {
            sb.append("0");
            return;
        }
        sb.append(String.format(Locale.US, "%.1f", v));
    }

    private static void appendRounded3(StringBuilder sb, float v) {
        if (Float.isNaN(v) || Float.isInfinite(v)) {
            sb.append("0");
            return;
        }
        sb.append(String.format(Locale.US, "%.3f", v));
    }

    private static void appendRounded4(StringBuilder sb, float v) {
        if (Float.isNaN(v) || Float.isInfinite(v)) {
            sb.append("0");
            return;
        }
        sb.append(String.format(Locale.US, "%.4f", v));
    }

    private static void appendJsonString(StringBuilder sb, String value) {
        if (value == null) {
            sb.append("null");
            return;
        }
        sb.append('"');
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            switch (c) {
                case '"':
                    sb.append("\\\"");
                    break;
                case '\\':
                    sb.append("\\\\");
                    break;
                case '\b':
                    sb.append("\\b");
                    break;
                case '\f':
                    sb.append("\\f");
                    break;
                case '\n':
                    sb.append("\\n");
                    break;
                case '\r':
                    sb.append("\\r");
                    break;
                case '\t':
                    sb.append("\\t");
                    break;
                default:
                    if (c < 0x20) {
                        sb.append(String.format(Locale.US, "\\u%04x", (int) c));
                    } else {
                        sb.append(c);
                    }
                    break;
            }
        }
        sb.append('"');
    }
}
