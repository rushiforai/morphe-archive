package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The one persistent authority for AI captions: whether the user wants them and which target
 * language they are for.
 *
 * <p>Only a user act writes here: the AI switch, a caption language picked in YouTube's own caption
 * menu, or the official CC control tapped on/off. Everything the native player reports is an
 * observation and belongs to {@link CaptionNativeProjection}: it never changes this record. That is
 * what keeps "AI on + target language" across a video switch, a player teardown and an app restart,
 * and what makes a transient native Off unable to end the session.
 *
 * <p>The record is versioned: every user act increments {@link #revision}, and the revision is the
 * only thing that makes {@link CaptionSessionReconciler} apply the same video again.
 */
final class CaptionSessionIntent {
    /** No user act has ever been recorded. */
    static final String PROVENANCE_NONE = "NONE";

    /** The record was written by a user act. */
    static final String PROVENANCE_USER = "USER";

    private static final String STORE = "deepseek_caption_session";
    private static final String KEY_ENABLED = "ai_enabled";
    private static final String KEY_TARGET = "target_language";
    private static final String KEY_TRANSLATE = "translate_target";
    private static final String KEY_REVISION = "revision";
    private static final String KEY_PROVENANCE = "provenance";

    final boolean aiEnabled;

    /** The stored target language code, empty until the user has chosen one. */
    final String targetLanguage;

    /** True when the target must be translated; false when it is the source shown as it is. */
    final boolean translateTarget;

    final long revision;
    final String provenance;

    private CaptionSessionIntent(
            boolean aiEnabled,
            String targetLanguage,
            boolean translateTarget,
            long revision,
            String provenance) {
        this.aiEnabled = aiEnabled;
        this.targetLanguage = targetLanguage == null ? "" : targetLanguage;
        this.translateTarget = translateTarget;
        this.revision = revision;
        this.provenance = provenance == null ? PROVENANCE_NONE : provenance;
    }

    /** The stored record; never invented, never derived from an observation. */
    static CaptionSessionIntent load(Context context) {
        if (context == null) return none();
        SharedPreferences store = store(context);
        if (store == null) return none();
        try {
            return new CaptionSessionIntent(
                    store.getBoolean(KEY_ENABLED, false),
                    normalize(store.getString(KEY_TARGET, "")),
                    store.getBoolean(KEY_TRANSLATE, false),
                    Math.max(0L, store.getLong(KEY_REVISION, 0L)),
                    store.getString(KEY_PROVENANCE, PROVENANCE_NONE));
        } catch (RuntimeException unavailable) {
            return none();
        }
    }

    static CaptionSessionIntent none() {
        return new CaptionSessionIntent(false, "", false, 0L, PROVENANCE_NONE);
    }

    /**
     * The user turned AI captions on or off. The target is kept as it was: turning the switch off
     * must not forget which language the session was for.
     */
    static CaptionSessionIntent userToggled(Context context, boolean enabled) {
        return userToggled(context, enabled, "", false, false);
    }

    /**
     * The user turned AI captions on after never choosing a target inside this app. The target the
     * native CC menu already had is adopted once, inside the user's own act - it is not an
     * observation flipping a switch.
     */
    static CaptionSessionIntent userEnabledFor(
            Context context, String targetLanguage, boolean translateTarget) {
        return userToggled(context, true, targetLanguage, translateTarget, true);
    }

    /** The user picked a caption language in YouTube's own caption menu. */
    static CaptionSessionIntent userSelected(
            Context context, String targetLanguage, boolean translateTarget) {
        String target = normalize(targetLanguage);
        // An option row or an empty value is not a language: it must not erase the stored target.
        if (target.isEmpty()) return load(context);
        CaptionSessionIntent previous = load(context);
        return write(
                context,
                true,
                target,
                translateTarget,
                previous.revision + 1,
                PROVENANCE_USER);
    }

    private static CaptionSessionIntent userToggled(
            Context context,
            boolean enabled,
            String targetLanguage,
            boolean translateTarget,
            boolean adopt) {
        CaptionSessionIntent previous = load(context);
        String adopted = adopt ? normalize(targetLanguage) : "";
        // An adopted target that is unusable is not a target: the previous one is kept, and the
        // switch itself still changes.
        String target = adopted.isEmpty() ? previous.targetLanguage : targetLanguage;
        boolean translate = adopted.isEmpty() ? previous.translateTarget : translateTarget;
        return write(
                context,
                enabled,
                target,
                translate,
                previous.revision + 1,
                PROVENANCE_USER);
    }

    private static CaptionSessionIntent write(
            Context context,
            boolean aiEnabled,
            String targetLanguage,
            boolean translateTarget,
            long revision,
            String provenance) {
        String target = normalize(targetLanguage);
        CaptionSessionIntent next =
                new CaptionSessionIntent(
                        aiEnabled,
                        target,
                        translateTarget && !target.isEmpty(),
                        revision,
                        provenance);
        SharedPreferences store = store(context);
        if (store != null) {
            try {
                store.edit()
                        .putBoolean(KEY_ENABLED, next.aiEnabled)
                        .putString(KEY_TARGET, next.targetLanguage)
                        .putBoolean(KEY_TRANSLATE, next.translateTarget)
                        .putLong(KEY_REVISION, next.revision)
                        .putString(KEY_PROVENANCE, next.provenance)
                        .apply();
            } catch (RuntimeException unavailable) {
                // The record stays what it was; the next act rewrites the whole snapshot anyway.
            }
        }
        return next;
    }

    boolean hasTarget() {
        return !targetLanguage.isEmpty();
    }

    /** The AI overlay is meant to translate right now. */
    boolean translates() {
        return aiEnabled && translateTarget && hasTarget();
    }

    /**
     * The target this session stands for: the language whose captions are shown (translated or as
     * they are). Whether AI captions are wanted right now is {@link #aiEnabled}; the engine asks
     * {@link #selectionOn()} for that, so a target kept across an off switch can never start alone.
     */
    String target() {
        return targetLanguage;
    }

    /** Diagnostics only: never contains a signed url or a view hierarchy. */
    String summary() {
        return "enabled="
                + aiEnabled
                + ";target="
                + (targetLanguage.isEmpty() ? "none" : targetLanguage)
                + ";translate="
                + translateTarget
                + ";revision="
                + revision
                + ";provenance="
                + provenance;
    }

    static void resetForTests(Context context) {
        SharedPreferences store = store(context);
        if (store == null) return;
        store.edit().clear().apply();
    }

    private static SharedPreferences store(Context context) {
        try {
            return context.getApplicationContext()
                    .getSharedPreferences(STORE, Context.MODE_PRIVATE);
        } catch (RuntimeException unavailable) {
            return null;
        }
    }

    /** The stored code, canonicalised; an option row or an empty value is not a language. */
    private static String normalize(String code) {
        if (code == null) return "";
        String trimmed = code.trim();
        if (trimmed.isEmpty() || trimmed.endsWith("_OPTION")) return "";
        TargetLanguage language = TargetLanguage.fromCode(trimmed);
        return language == null ? "" : language.code;
    }
}
