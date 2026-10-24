package app.proxma.mytelenor;

import android.content.Context;
import android.util.Log;

import org.json.JSONObject;
public final class QuizClaim {

    private static final String TAG = "PROXMA_MT";

    static String sResult = "n/a";

    private QuizClaim() {}

    public static String getResult() { return sResult; }

    public static boolean tryClaimQuiz(Context context) {
        sResult = "n/a";
        try {
            return quizInner(context);
        } catch (Throwable t) {
            Log.i(TAG, "QUIZ_ERR " + t);
            sResult = "error: " + t.getMessage();
            return false;
        }
    }

    private static boolean quizInner(Context context) throws Exception {
        String skip = AutoClaim.check(context, "quiz");
        if (skip != null) {
            Log.i(TAG, "QUIZ_SKIP " + skip);
            sResult = skip;
            return true;
        }

        String msisdn = AccountScope.msisdn(context);
        if (msisdn == null || msisdn.isEmpty()) {
            sResult = "no msisdn";
            return true;
        }

        // Try to claim any pending quiz reward (user may have answered in the app UI
        // but didn't tap "claim"). This is safe — claim only works if user already answered correctly.
        String claimUrl = StreakClaim.resolveUrl("getClaimAnswerAndWin",
            "api/qplayandwin/questions/answer/v3/claim/");
        Log.i(TAG, "QUIZ_CLAIM_ATTEMPT");
        StreakClaim.HttpResult claimResult = StreakClaim.httpPost(context, claimUrl, "{}", msisdn);
        Log.i(TAG, "QUIZ_CLAIM " + claimResult.code + " " + truncate(claimResult.body));

        if (claimResult.code >= 200 && claimResult.code < 300) {
            AutoClaim.latch(context, "quiz");
            sResult = "claimed";
            try {
                JSONObject cr = new JSONObject(claimResult.body);
                JSONObject cData = cr.optJSONObject("data");
                if (cData != null) {
                    String allowance = cData.optString("allowance", "");
                    String rewardType = cData.optString("rewardType", "");
                    if (!allowance.isEmpty()) {
                        sResult += " " + allowance + " " + rewardType;
                    }
                }
            } catch (Throwable ignored) {}
            return true;
        }

        // 4xx = no pending reward (user hasn't answered, or already claimed)
        if (claimResult.code == 400 || claimResult.code == 409 || claimResult.code == 404) {
            String bodyLower = claimResult.body != null ? claimResult.body.toLowerCase() : "";
            if (bodyLower.contains("already") || bodyLower.contains("claimed")
                || bodyLower.contains("no pending") || bodyLower.contains("not found")) {
                AutoClaim.latch(context, "quiz");
                sResult = "no pending reward";
                return true;
            }
            // User hasn't answered yet — don't burn the attempt
            sResult = "not answered yet";
            return true;
        }

        // Server error — retry later
        sResult = "claim fail " + claimResult.code;
        return false;
    }

    private static String truncate(String value) {
        if (value == null) return "";
        return value.length() > 200 ? value.substring(0, 200) : value;
    }
}
