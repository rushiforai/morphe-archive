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

    static synchronized void mark(Context context, String stage, String detail) {
        if (context == null) return;
        try {
            String cleanStage = sanitize(stage, 80);
            String cleanDetail = sanitize(detail, 260);
            long now = System.currentTimeMillis();
            SharedPreferences p = prefs(context);
            String old = p.getString(HISTORY, "");
            String line = now + " | " + cleanStage + (cleanDetail.isEmpty() ? "" : " | " + cleanDetail);
            String next = old == null || old.isEmpty() ? line : line + "\n" + old;
            if (next.length() > MAX_HISTORY) next = next.substring(0, MAX_HISTORY);
            // Keep bounded clock/rejection evidence separate from noisy display selections.
            if(importantDecision(cleanStage)) {
                String decisions=p.getString(DECISIONS, "");
                decisions=line+(decisions.isEmpty()?"":"\n"+decisions);
                if(decisions.length()>3000)decisions=decisions.substring(0,3000);
                p.edit().putString(DECISIONS,decisions).apply();
            }
            p.edit()
                    .putString(STAGE, cleanStage)
                    .putString(DETAIL, cleanDetail)
                    .putLong(TIME, now)
                    .putString(HISTORY, next)
                    .apply();

        } catch (Throwable ignored) {
        }
    }

    static void clear(Context context) {
        try { prefs(context).edit().clear().apply(); } catch (Throwable ignored) {}
        try { CaptionQualityTrace.clear(context); } catch (Throwable ignored) {}
        try { TokenCostAudit.clear(context); } catch (Throwable ignored) {}
    }

    static String uiText(Context context) {
        try {
            SharedPreferences p = prefs(context);
            String stage = p.getString(STAGE, "");
            String detail = p.getString(DETAIL, "");
            long time = p.getLong(TIME, 0L);
            String audit = TokenCostAudit.uiText(context);
            String header = "引擎：Anchored / source-phrase-134\n当前模式：" + (CaptionChoice.translates() ? "自动翻译" : "原字幕（零翻译 API）") + "\n显示文本调试：" +
                    CaptionStrings.localize(context,DeepSeekConfig.displayTextDebugEnabled(context) ? "开" : "关");
            if (stage == null || stage.isEmpty()) {
                String base = "尚未捕获到自动翻译请求。启用并填写 API Key 后，播放视频并从“自动翻译”选择任意目标语言，再回来点“刷新诊断”。";
                return CaptionStrings.localize(context,audit == null || audit.isEmpty()
                        ? header + "\n" + base
                        : header + "\n" + base + "\n\n" + audit);
            }
            long seconds = time <= 0 ? -1 : Math.max(0L, (System.currentTimeMillis() - time) / 1000L);
            String age = seconds < 0 ? "" : "（约 " + seconds + " 秒前）";
            StringBuilder text = new StringBuilder();
            text.append(CaptionStrings.localize(context,header)).append("\n");
            text.append(CaptionStrings.localize(context,"最近阶段：")).append(stage).append(CaptionStrings.localize(context,age));
            if (detail != null && !detail.isEmpty()) text.append("\n").append(detail);
            if (audit != null && !audit.isEmpty()) {
                text.append("\n\n").append(audit);
            }
            String decisions=p.getString(DECISIONS, "");
            if(!decisions.isEmpty())text.append(CaptionStrings.localize(context,"\n\n时间参照与异常（独立保留，含时间戳）：\n")).append(decisions);
            String history = p.getString(HISTORY, "");
            if (history != null && !history.isEmpty()) {
                text.append(CaptionStrings.localize(context,"\n\n最近链路：\n")).append(history);
            }
            text.append(CaptionQualityTrace.text(context));
            return text.toString(); // Recorded source/translation/provider evidence must remain verbatim.
        } catch (Throwable error) {
            return CaptionStrings.localize(context,"读取诊断状态失败：") + error.getClass().getSimpleName();
        }
    }

    private static boolean importantDecision(String stage) {
        return stage.equals("SOURCE_RETRY_SCHEDULED") || stage.equals("SOURCE_LOAD_FAILED")
                || stage.equals("CONTEXTUAL_CORE_ERROR") || stage.equals("CONTEXTUAL_SEEK_REPRIORITIZED")
                || stage.equals("ASR_CUE_TIMING_BASE") || stage.equals("ASR_CUE_TIMING_APPLIED")
                || stage.equals("ASR_REFERENCE_FETCH_FAILED") || stage.equals("SOURCE_TIMING_FALLBACK")
                || stage.equals("SOURCE_TIMING_CALIBRATED") || stage.equals("SOURCE_TIMING_CONFIRMED")
                || stage.equals("ANCHOR_RESPONSE_REJECTED") || stage.equals("CONTEXTUAL_BATCH_FAILED")
                || stage.equals("FIRST_AI_READY") || stage.equals("SOURCE_TIMING_BASE")
                || stage.equals("ASR_LOCAL_TIMING_APPLIED") || stage.equals("ASR_LOCAL_TIMING_REJECTED")
                || stage.equals("ASR_NATIVE_WORD_TIMING_SELECTED") || stage.equals("ASR_NATIVE_WORD_TIMING_ALIGNED")
                || stage.equals("ASR_WORD_TIMING_UNAVAILABLE") || stage.equals("ENGINE_MODE_SAVED")
                || stage.equals("NATIVE_APPLIED_CAPTURE_FAILED") || stage.equals("NATIVE_APPLIED_OWNER_REJECTED")
                || stage.equals("OVERLAY_READABILITY_DEGRADED") || stage.equals("ENGINE_SNAPSHOT_ACTIVATED") || stage.equals("BACKGROUND_ACTIVATION_IGNORED");
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
