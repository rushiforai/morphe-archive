package app.voidhack.extension.twitter.spaces.mute;

import android.content.Context;
import android.content.res.Configuration;

import java.util.Locale;

/**
 * Self-contained ja/en strings for Spaces Local Mute UI.
 * Avoids Android XML resource injection so there are zero resource ID or split-APK conflicts.
 */
public final class SpaceLocalMuteStrings {
    private SpaceLocalMuteStrings() {}

    public static boolean isJapanese(Context context) {
        try {
            if (context != null && context.getResources() != null) {
                Configuration cfg = context.getResources().getConfiguration();
                Locale loc = cfg.getLocales().get(0);
                if (loc != null) {
                    return "ja".equalsIgnoreCase(loc.getLanguage());
                }
            }
        } catch (Throwable ignored) {}
        return "ja".equalsIgnoreCase(Locale.getDefault().getLanguage());
    }

    public static String sheetTitle(Context ctx) {
        return isJapanese(ctx) ? "スペース ローカルミュート" : "Space Local Mute";
    }

    public static String headerPillIdle(Context ctx) {
        return isJapanese(ctx) ? "🔇 ミュート" : "🔇 Mute";
    }

    public static String close(Context ctx) {
        return isJapanese(ctx) ? "閉じる" : "Close";
    }

    public static String sectionHeader(Context ctx) {
        return isJapanese(ctx) ? "リスナー側ミュート（特定ユーザー）" : "Local Mute (Per User)";
    }

    public static String engineSummary(Context ctx, boolean webRtcHardware, boolean silencingNow, int mutedCount) {
        boolean ja = isJapanese(ctx);
        String base = webRtcHardware
                ? (ja ? "WebRTC 話者別トラック個別ミュート（完全分離）" : "WebRTC per-speaker hardware track mute")
                : (ja ? "HLS 話者別リアルタイム音量ゲート（400ms保持）" : "HLS real-time active-speaker gate (400ms hold)");
        if (silencingNow) {
            return base + (ja ? "  •  🔇 ミュート作動中" : "  •  🔇 Silencing now");
        }
        if (mutedCount > 0) {
            return base + (ja ? ("  •  " + mutedCount + "人をミュート中") : ("  •  " + mutedCount + " muted"));
        }
        return base;
    }

    public static String sessionInfo(Context ctx, String title, String mode, int speakerCount) {
        String safeTitle = (title == null || title.trim().isEmpty())
                ? (isJapanese(ctx) ? "スペース" : "Space")
                : title.trim();
        if (isJapanese(ctx)) {
            return safeTitle + "\nモード: " + mode + " / 話者: " + speakerCount + "人";
        }
        return safeTitle + "\nMode: " + mode + " / Speakers: " + speakerCount;
    }

    public static String noSpeakers(Context ctx) {
        return isJapanese(ctx)
                ? "話者が検出されていません。スピーカーのアイコンをタップしてもミュートできます。"
                : "No speakers detected yet. You can also tap any user's avatar in the Space to mute them.";
    }

    public static String muteBtn(Context ctx) {
        return isJapanese(ctx) ? "ミュート" : "Mute";
    }

    public static String mutedBtn(Context ctx) {
        return isJapanese(ctx) ? "ミュート中" : "Muted";
    }

    public static String unmuteAll(Context ctx, int count) {
        return isJapanese(ctx) ? ("全解除 (" + count + ")") : ("Unmute all (" + count + ")");
    }

    public static String otherMutedHeader(Context ctx) {
        return isJapanese(ctx) ? "ミュート済み（現在の話者一覧外）" : "Muted (not currently speaking)";
    }

    public static String smartOverlap(Context ctx) {
        return isJapanese(ctx) ? "同時発話時は他の話者を優先（スマート）" : "Prioritize unmuted speakers on overlap (Smart)";
    }

    public static String smartOverlapSub(Context ctx) {
        return isJapanese(ctx)
                ? "ON: 他の人が同時に話したら即解除 / OFF: ミュート対象が話している間は完全に無音"
                : "ON: Unmutes immediately when another speaker talks / OFF: Strict silence whenever muted user talks";
    }

    public static String profileMuteAction(Context ctx) {
        return isJapanese(ctx) ? "🔇  リスナー側でミュート（自分だけ無音）" : "🔇  Mute locally (only for you)";
    }

    public static String profileUnmuteAction(Context ctx) {
        return isJapanese(ctx) ? "🔊  ローカルミュート中（タップで解除）" : "🔊  Locally muted (tap to unmute)";
    }

    public static String toastUserMuted(Context ctx, String displayLabel) {
        return isJapanese(ctx)
                ? (displayLabel + " をリスナー側でミュートしました")
                : ("Locally muted " + displayLabel);
    }

    public static String toastUserUnmuted(Context ctx, String displayLabel) {
        return isJapanese(ctx)
                ? (displayLabel + " のローカルミュートを解除しました")
                : ("Unmuted " + displayLabel + " locally");
    }

    public static String toastUnmutedAll(Context ctx) {
        return isJapanese(ctx) ? "すべてのローカルミュートを解除しました" : "Cleared all local mutes";
    }
}
