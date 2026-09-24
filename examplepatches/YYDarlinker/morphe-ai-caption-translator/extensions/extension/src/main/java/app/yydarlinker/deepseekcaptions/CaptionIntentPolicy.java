package app.yydarlinker.deepseekcaptions;

import java.util.Locale;

/** Pure state policy shared by the Android CC observer and host-side regression tests. */
final class CaptionIntentPolicy {
    static final int UNKNOWN = -1;
    static final int OFF = 0;
    static final int ON = 1;

    private CaptionIntentPolicy() {}

    static boolean mayActivate(int intent, long nowMs, long explicitSelectionUntilMs) {
        return intent == ON || nowMs <= explicitSelectionUntilMs;
    }

    static boolean shouldTurnOff(boolean aiVisible, int nativeState, int rememberedIntent) {
        return aiVisible || nativeState == ON ||
                (nativeState == UNKNOWN && rememberedIntent == ON);
    }

    /** Parses both action labels and current-state labels without depending on one locale. */
    static int fromDescription(String rawDescription) {
        String description = rawDescription == null
                ? ""
                : rawDescription.trim().toLowerCase(Locale.ROOT);
        if (description.isEmpty()) return UNKNOWN;

        if (containsAny(description, "turn off", "disable captions", "captions on",
                "captions enabled", "关闭字幕", "關閉字幕", "字幕已开启", "字幕已開啟",
                "字幕开启", "字幕開啟", "字幕をオフ", "자막 사용 중지")) {
            return ON;
        }
        if (containsAny(description, "turn on", "enable captions", "captions off",
                "captions disabled", "字幕已关闭", "字幕已關閉", "字幕关闭", "字幕關閉",
                "开启字幕", "開啟字幕", "打开字幕", "字幕をオン")) {
            return OFF;
        }
        return UNKNOWN;
    }

    private static boolean containsAny(String value, String... candidates) {
        for (String candidate : candidates) {
            if (!candidate.isEmpty() && value.contains(candidate.toLowerCase(Locale.ROOT))) {
                return true;
            }
        }
        return false;
    }
}
