package app.yydarlinker.deepseekcaptions;

import java.util.Locale;

/** Pure state policy shared by the Android CC observer and host-side regression tests. */
final class CaptionIntentPolicy {
    static final int UNKNOWN = -1;
    static final int OFF = 0;
    static final int ON = 1;

    /** Phrases of the CC button's description that mean captions are on (or can be turned off). */
    private static final String[] MEANS_ON = {
        "turn off",
        "disable captions",
        "captions on",
        "captions enabled",
        "关闭字幕",
        "關閉字幕",
        "字幕已开启",
        "字幕已開啟",
        "字幕开启",
        "字幕開啟",
        "字幕をオフ",
        "자막 사용 중지"
    };

    /** Phrases that mean captions are off (or can be turned on). */
    private static final String[] MEANS_OFF = {
        "turn on",
        "enable captions",
        "captions off",
        "captions disabled",
        "字幕已关闭",
        "字幕已關閉",
        "字幕关闭",
        "字幕關閉",
        "开启字幕",
        "開啟字幕",
        "打开字幕",
        "字幕をオン"
    };

    private CaptionIntentPolicy() {}

    static boolean mayActivate(int intent, long nowMs, long explicitSelectionUntilMs) {
        return intent == ON || nowMs <= explicitSelectionUntilMs;
    }

    static boolean shouldTurnOff(boolean aiVisible, int nativeState, int rememberedIntent) {
        if (nativeState != UNKNOWN) return nativeState == ON;
        return rememberedIntent == ON || (rememberedIntent == UNKNOWN && aiVisible);
    }

    /** Parses action labels and current-state labels without depending on one locale. */
    static int fromDescription(String rawDescription) {
        String description =
                rawDescription == null ? "" : rawDescription.trim().toLowerCase(Locale.ROOT);
        if (containsAny(description, MEANS_ON)) return ON;
        if (containsAny(description, MEANS_OFF)) return OFF;
        return UNKNOWN;
    }

    private static boolean containsAny(String value, String[] phrases) {
        for (String phrase : phrases) if (value.contains(phrase)) return true;
        return false;
    }
}
