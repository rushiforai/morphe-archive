package app.proxma.mytelenor;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Random;

/**
 * Answer & Win, played the way the app plays it: GET questions, mark played, submit answers,
 * then claim (the app claims only allowance rewards). The questions response carries each
 * choice's isCorrect, which the app itself uses to highlight the right option.
 *
 * <p>Progress is kept per account + PKT day so a retry resumes at the step that failed: once the
 * day is marked the server won't hand the questions out again, and the MBs are only credited by
 * the claim.
 */
public final class QuizClaim {

    private static final String TAG = "PROXMA_MT";
    private static final String PREFS = "proxma_mt_quiz";
    private static final String KEY_STATE = "state";
    private static final String KEY_DRY_RUN = "dry_run";

    private static final String FETCHED = "fetched";
    private static final String MARKED = "marked";
    private static final String SUBMITTED = "submitted";
    private static final String DONE = "done";

    private static final int MAX_CLAIM_REJECTS = 3;

    static String sResult = "n/a";

    private QuizClaim() {}

    public static String getResult() { return sResult; }

    /** Returns false when the run should be retried later. */
    /** Marking the quiz uses up the day, so this is the switch to turn auto-play off if it breaks. */
    static final boolean ENABLED = true;

    public static boolean tryClaimQuiz(Context context) {
        sResult = "n/a";
        if (!ENABLED) {
            sResult = "latched (auto-play off, play in app)";
            return true;
        }
        try {
            return quizInner(context);
        } catch (java.io.IOException e) {
            Log.i(TAG, "QUIZ_NET_ERR " + e);
            sResult = "network error (" + e.getClass().getSimpleName() + "), retrying";
            return false;
        } catch (Throwable t) {
            Log.i(TAG, "QUIZ_ERR " + t);
            sResult = "error: " + t.getMessage();
            return false;
        }
    }

    private static boolean quizInner(Context context) throws Exception {
        String account = AccountScope.id(context);
        SharedPreferences prefs = context.getSharedPreferences(PREFS, 0);
        JSONObject state = loadState(prefs, account);

        String skip = AutoClaim.check(context, "quiz");
        if (skip != null) {
            Log.i(TAG, "QUIZ_SKIP " + skip);
            sResult = DONE.equals(state.optString("stage")) ? state.optString("msg", skip) : skip;
            return true;
        }

        String msisdn = StreakClaim.resolveMsisdn(context);
        if (msisdn == null || msisdn.isEmpty()) {
            sResult = "no msisdn";
            return true;
        }
        if (!StreakClaim.loggedIn(context)) {
            sResult = StreakClaim.NOT_LOGGED_IN;
            return true;
        }

        String submitUrl = submitUrl();
        String stage = state.optString("stage", "");
        Log.i(TAG, "QUIZ_STAGE " + (stage.isEmpty() ? "new" : stage));

        // 1. Questions + answer key
        if (stage.isEmpty()) {
            String url = questionsUrl(msisdn);
            StreakClaim.HttpResult r = get(context, "quiz-questions", url, msisdn);
            int status = StreakClaim.bodyStatus(r);
            Log.i(TAG, "QUIZ_QUESTIONS " + r.code + "/" + status + " " + truncate(r.body, 300));
            note(prefs, state, "questions", r, status);
            if (StreakClaim.authFailed(r)) {
                sResult = StreakClaim.LOGIN_EXPIRED;
                return true;
            }
            if (status == 312 || status == 313) {
                return finish(context, prefs, state, "already played today");
            }
            if (!StreakClaim.succeeded(r)) {
                sResult = "questions fail " + status;
                return false;
            }
            JSONArray answers = answerKey(r.body);
            if (answers == null) {
                Log.w(TAG, "QUIZ_NO_KEY " + truncate(r.body, 1500));
                return finish(context, prefs, state, "skipped: answer key missing, play in app");
            }
            if (prefs.getBoolean(KEY_DRY_RUN, false)) {
                Log.i(TAG, "QUIZ_DRY_RUN answers=" + answers);
                sResult = "dry run: " + answers.length() + " questions, key ok";
                return true;
            }
            state.put("answers", answers.toString());
            stage = advance(prefs, state, FETCHED);
        }

        JSONObject answersBody = new JSONObject();
        answersBody.put("markPlayed", false);
        answersBody.put("msisdn", msisdn);
        answersBody.put("answers", new JSONArray(state.getString("answers")));

        // 2. Mark played. 312/313 here is either the user playing in between or our earlier mark
        // whose response was lost; the submit tells which.
        if (FETCHED.equals(stage)) {
            JSONObject markBody = new JSONObject();
            markBody.put("markPlayed", true);
            markBody.put("msisdn", msisdn);
            StreakClaim.HttpResult r = post(context, "quiz-mark", submitUrl, markBody.toString(), msisdn);
            int status = StreakClaim.bodyStatus(r);
            Log.i(TAG, "QUIZ_MARK " + r.code + "/" + status + " " + truncate(r.body, 300));
            note(prefs, state, "mark", r, status);
            if (StreakClaim.authFailed(r)) {
                sResult = StreakClaim.LOGIN_EXPIRED;
                return true;
            }
            if (!StreakClaim.succeeded(r) && status != 312 && status != 313) {
                sResult = "mark fail " + status;
                return false;
            }
            stage = advance(prefs, state, MARKED);
            pace(state);
        }

        // 3. Submit answers
        if (MARKED.equals(stage)) {
            StreakClaim.HttpResult r = post(context, "quiz-submit", submitUrl, answersBody.toString(), msisdn);
            int status = StreakClaim.bodyStatus(r);
            Log.i(TAG, "QUIZ_SUBMIT " + r.code + "/" + status + " " + truncate(r.body, 600));
            note(prefs, state, "submit", r, status);
            if (StreakClaim.authFailed(r)) {
                sResult = StreakClaim.LOGIN_EXPIRED;
                return true;
            }
            if (status == 312 || status == 313) {
                // Our earlier submit may have landed with its response lost: one claim attempt.
                state.put("reward", new JSONObject().put("rewardType", "allowance").toString());
                state.put("lastChance", true);
            } else if (status == 412) {
                return finish(context, prefs, state, "rejected: " + message(r));
            } else if (StreakClaim.succeeded(r)) {
                JSONObject data = new JSONObject(r.body).optJSONObject("data");
                state.put("reward", data != null ? data.toString() : "{}");
            } else {
                sResult = "submit fail " + status;
                return false;
            }
            stage = advance(prefs, state, SUBMITTED);
        }

        // 4. Claim (allowance only, as in the app)
        if (SUBMITTED.equals(stage)) {
            JSONObject reward = new JSONObject(state.optString("reward", "{}"));
            String type = reward.optString("rewardType", "");
            if ("voucher".equalsIgnoreCase(type)) {
                JSONObject v = reward.optJSONObject("voucher");
                String code = v != null ? v.optString("voucher_code", "") : "";
                String label = v != null ? v.optString("voucher_label", "") : "";
                return finish(context, prefs, state, ("won voucher " + code + " " + label).trim());
            }
            if ("unclaimable".equalsIgnoreCase(type)) {
                if ("ALL_CORRECT".equalsIgnoreCase(reward.optString("case", ""))) {
                    return finish(context, prefs, state, "all correct, no reward today");
                }
                Log.w(TAG, "QUIZ_WRONG_ANSWERS sent=" + state.optString("answers") + " got=" + reward);
                return finish(context, prefs, state, "answers rejected (check patch)");
            }
            if (!"allowance".equalsIgnoreCase(type)) {
                return finish(context, prefs, state, "no reward (" + (type.isEmpty() ? "none" : type) + ")");
            }

            sleep(3_000L + new Random().nextInt(2_000)); // the app claims a few seconds after the result
            String claimUrl = claimUrl();
            // Kept across runs: if a claim got no response, a later rejection is most likely the
            // server refusing a duplicate of a claim that went through.
            boolean previousLost = state.optBoolean("claimInFlight", false);
            state.put("claimInFlight", true);
            save(prefs, state);
            StreakClaim.HttpResult r = post(context, "quiz-claim", claimUrl, answersBody.toString(), msisdn);
            state.put("claimInFlight", false);
            save(prefs, state);
            int status = StreakClaim.bodyStatus(r);
            Log.i(TAG, "QUIZ_CLAIM " + r.code + "/" + status + " " + truncate(r.body, 600));
            note(prefs, state, "claim", r, status);
            if (StreakClaim.authFailed(r)) {
                sResult = StreakClaim.LOGIN_EXPIRED;
                return true;
            }
            if (StreakClaim.succeeded(r)) {
                return finish(context, prefs, state, "claimed " + rewardLabel(reward));
            }
            if (StreakClaim.bodyLower(r).contains("already")) {
                return finish(context, prefs, state, "claimed (already)");
            }
            if (state.optBoolean("lastChance", false)) {
                return finish(context, prefs, state, "already played today");
            }
            if (status >= 400 && status < 500 && previousLost) {
                return finish(context, prefs, state,
                    "claim response was lost, likely credited: check balance (" + message(r) + ")");
            }
            if (status >= 400 && status < 500) {
                int rejects = state.optInt("rejects", 0) + 1;
                state.put("rejects", rejects);
                save(prefs, state);
                if (rejects >= MAX_CLAIM_REJECTS) {
                    return finish(context, prefs, state, "claim rejected: " + message(r));
                }
            }
            sResult = "claim fail " + status + ", retrying";
            return false;
        }

        sResult = "unknown stage " + stage;
        return true;
    }

    // Paths confirmed from the app's own traffic (2026-10-26); the native getters are preferred.
    static String questionsUrl(String msisdn) {
        return logged("questions", StreakClaim.resolveUrl("getTrivialQuestionAnswerAndWin",
            "api/qplayandwin/questions/daily/v2/" + msisdn, msisdn));
    }

    static String submitUrl() {
        return logged("submit", StreakClaim.resolveUrl("getSubmitAnswerAndWin",
            "api/qplayandwin/questions/answer/v3/submit/"));
    }

    static String claimUrl() {
        return logged("claim", StreakClaim.resolveUrl("getClaimAnswerAndWin",
            "api/qplayandwin/questions/answer/v3/claim/"));
    }

    private static String logged(String what, String url) {
        Log.i(TAG, "QUIZ_URL " + what + " " + url.replaceAll("\\d{11,}", "<msisdn>"));
        return url;
    }

    /** One {questionID, choiceID} per question, or null unless every question has exactly one correct choice. */
    static JSONArray answerKey(String body) {
        try {
            JSONObject data = new JSONObject(body).optJSONObject("data");
            JSONArray questions = data != null ? data.optJSONArray("triviaQuestions") : null;
            if (questions == null || questions.length() == 0) return null;
            JSONArray answers = new JSONArray();
            for (int i = 0; i < questions.length(); i++) {
                JSONObject q = questions.getJSONObject(i);
                JSONArray choices = q.optJSONArray("choices");
                if (!q.has("questionId") || choices == null) return null;
                int correct = -1;
                int found = 0;
                for (int j = 0; j < choices.length(); j++) {
                    JSONObject c = choices.getJSONObject(j);
                    if (c.optBoolean("isCorrect", false) && c.has("choiceId")) {
                        correct = c.getInt("choiceId");
                        found++;
                    }
                }
                if (found != 1) return null;
                answers.put(new JSONObject()
                    .put("questionID", q.getInt("questionId"))
                    .put("choiceID", correct));
            }
            return answers;
        } catch (Throwable t) {
            Log.i(TAG, "QUIZ_KEY_ERR " + t);
            return null;
        }
    }

    private static StreakClaim.HttpResult get(Context context, String what, String url, String msisdn)
            throws Exception {
        return StreakClaim.withNetRetry(what, () -> StreakClaim.httpGet(context, url, msisdn));
    }

    private static StreakClaim.HttpResult post(Context context, String what, String url, String body,
            String msisdn) throws Exception {
        return StreakClaim.withNetRetry(what, () -> {
            StreakClaim.HttpResult r = appPost(url, new JSONObject(body));
            return r != null ? r : StreakClaim.httpPost(context, url, body, msisdn);
        });
    }

    /**
     * Sends the POST through the app's own Retrofit client, so its interceptors add the headers and
     * signature exactly as for a manual play. Returns null when the app's classes can't be reached.
     */
    private static StreakClaim.HttpResult appPost(String url, JSONObject body) throws Exception {
        Object api;
        Class<?> apiClass;
        Class<?> boClass;
        java.lang.reflect.Constructor<?> answerCtor;
        try {
            Class<?> appClass = Class.forName("com.telenor.pakistan.mytelenor.BaseApp.DaggerApplication");
            api = appClass.getMethod("h").invoke(appClass.getMethod("d").invoke(null));
            apiClass = Class.forName("com.telenor.pakistan.mytelenor.Interface.MyEndPointsInterface");
            boClass = Class.forName("com.telenor.pakistan.mytelenor.AnswerAndWin.models.SubmitQuestionBO");
            answerCtor = Class.forName("com.telenor.pakistan.mytelenor.AnswerAndWin.models.SubmitQuestionAnswerNWin")
                .getConstructor(int.class, int.class);
            if (api == null) throw new IllegalStateException("no api");
        } catch (Throwable t) {
            Log.i(TAG, "QUIZ_APP_CLIENT_UNAVAILABLE " + t);
            return null;
        }

        String msisdn = body.getString("msisdn");
        Object bo;
        JSONArray answers = body.optJSONArray("answers");
        if (answers == null) {
            bo = boClass.getConstructor(String.class, boolean.class).newInstance(msisdn, body.getBoolean("markPlayed"));
        } else {
            java.util.List<Object> list = new java.util.ArrayList<>();
            for (int i = 0; i < answers.length(); i++) {
                JSONObject a = answers.getJSONObject(i);
                list.add(answerCtor.newInstance(a.getInt("questionID"), a.getInt("choiceID")));
            }
            bo = boClass.getConstructor(java.util.List.class, String.class).newInstance(list, msisdn);
        }

        // The submit method's @Url is dynamic, so it serves the claim URL too; only statusCode,
        // message and data are read from the reply.
        try {
            Object call = apiClass.getMethod("submitQuestionAnswerNWin", String.class, boClass).invoke(api, url, bo);
            Object resp = Class.forName("retrofit2.Call").getMethod("execute").invoke(call);
            Class<?> respClass = Class.forName("retrofit2.Response");
            int code = (Integer) respClass.getMethod("code").invoke(resp);
            Object parsed = respClass.getMethod("body").invoke(resp);
            String text;
            if (parsed != null) {
                Class<?> gson = Class.forName("com.google.gson.Gson");
                text = (String) gson.getMethod("toJson", Object.class).invoke(gson.newInstance(), parsed);
            } else {
                Object err = respClass.getMethod("errorBody").invoke(resp);
                text = err != null ? (String) err.getClass().getMethod("string").invoke(err) : "";
            }
            Log.i(TAG, "QUIZ_APP_CLIENT " + code);
            return new StreakClaim.HttpResult(code, text);
        } catch (java.lang.reflect.InvocationTargetException e) {
            Throwable cause = e.getCause();
            if (cause instanceof java.io.IOException) throw (java.io.IOException) cause;
            throw e;
        }
    }

    /** A real 5-question play took ~36 s from mark to submit; mirror a human pace. */
    private static void pace(JSONObject state) {
        int n = 3;
        try {
            n = new JSONArray(state.getString("answers")).length();
        } catch (Throwable ignored) {}
        sleep(Math.min(60_000L, 6_000L * n + new Random().nextInt(4_000)));
    }

    private static void sleep(long ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException ignored) {}
    }

    private static String rewardLabel(JSONObject reward) {
        JSONObject allowance = reward.optJSONObject("allowance");
        if (allowance == null) return "reward";
        JSONArray subs = allowance.optJSONArray("subaccounts");
        if (subs != null && subs.length() > 0) {
            String label = subs.optJSONObject(0).optString("label", "");
            if (!label.isEmpty()) return label;
        }
        String label = allowance.optString("label", "");
        return label.isEmpty() ? "reward" : label;
    }

    private static String message(StreakClaim.HttpResult r) {
        try {
            String m = new JSONObject(r.body).optString("message", "");
            if (!m.isEmpty()) return m;
        } catch (Throwable ignored) {}
        return "HTTP " + r.code;
    }

    /** Short per-step record in the saved state (no msisdn/tokens), readable after the fact. */
    private static void note(SharedPreferences prefs, JSONObject state, String step,
            StreakClaim.HttpResult r, int status) {
        try {
            JSONArray trail = state.optJSONArray("trail");
            if (trail == null) trail = new JSONArray();
            trail.put(new java.text.SimpleDateFormat("HH:mm:ss", java.util.Locale.US).format(new java.util.Date())
                + " " + step + " " + r.code + "/" + status + " " + message(r));
            state.put("trail", trail);
            save(prefs, state);
        } catch (Throwable ignored) {}
    }

    private static JSONObject loadState(SharedPreferences prefs, String account) {
        String day = AutoClaim.today();
        try {
            JSONObject s = new JSONObject(prefs.getString(KEY_STATE, "{}"));
            if (day.equals(s.optString("day")) && String.valueOf(account).equals(s.optString("account"))) {
                return s;
            }
        } catch (Throwable ignored) {}
        JSONObject fresh = new JSONObject();
        try {
            fresh.put("day", day).put("account", String.valueOf(account)).put("stage", "");
        } catch (Throwable ignored) {}
        return fresh;
    }

    private static String advance(SharedPreferences prefs, JSONObject state, String stage) throws Exception {
        state.put("stage", stage);
        save(prefs, state);
        return stage;
    }

    private static void save(SharedPreferences prefs, JSONObject state) {
        // commit, not apply: a process death right after a step must not lose it
        prefs.edit().putString(KEY_STATE, state.toString()).commit();
    }

    private static boolean finish(Context context, SharedPreferences prefs, JSONObject state, String msg)
            throws Exception {
        state.put("msg", msg);
        advance(prefs, state, DONE);
        AutoClaim.latch(context, "quiz");
        Log.i(TAG, "QUIZ_DONE " + msg);
        sResult = msg;
        return true;
    }

    private static String truncate(String s, int max) {
        if (s == null) return "";
        return s.length() > max ? s.substring(0, max) : s;
    }
}
