package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.text.style.MetricAffectingSpan;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Properties;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/** Uses the bundled emoji font only for emoji clusters missing from the device font. */
final class EmojiFontFallback {
    private static final String FONT_ASSET = "haiagaru/NotoColorEmoji.ttf";
    private static volatile Typeface emojiTypeface;
    private static volatile boolean fontLoadFailed;
    private static volatile Context applicationContext;
    /** missing = only clusters absent from the device, all = every emoji cluster. */
    private static volatile String renderMode = "missing";
    private static boolean lifecycleRegistered;
    private static final WeakHashMap<View, ViewTreeObserver.OnGlobalLayoutListener>
            threadObservers = new WeakHashMap<>();

    private EmojiFontFallback() {
    }

    static synchronized void initialize(Context context) {
        if (context == null) return;
        Context resolved = context.getApplicationContext();
        applicationContext = resolved == null ? context : resolved;
        loadConfiguration(applicationContext);
    }

    static synchronized void register(Application application) {
        if (lifecycleRegistered) return;
        initialize(application);
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, Bundle state) {
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityResumed(Activity activity) {
                if (!isThreadActivity(activity)) return;
                View root = activity.getWindow().getDecorView();
                if (threadObservers.containsKey(root)) return;
                WeakReference<View> reference = new WeakReference<>(root);
                ViewTreeObserver.OnGlobalLayoutListener observer = () -> {
                    View current = reference.get();
                    if (current != null) applyToRow(current);
                };
                root.getViewTreeObserver().addOnGlobalLayoutListener(observer);
                threadObservers.put(root, observer);
                root.post(() -> applyToRow(root));
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle state) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
                View root = activity.getWindow().getDecorView();
                ViewTreeObserver.OnGlobalLayoutListener observer = threadObservers.remove(root);
                if (observer != null && root.getViewTreeObserver().isAlive()) {
                    root.getViewTreeObserver().removeOnGlobalLayoutListener(observer);
                }
            }
        });
        lifecycleRegistered = true;
    }

    private static boolean isThreadActivity(Activity activity) {
        String name = activity.getClass().getName();
        // Newer releases use Hilt_ResListActivity as the concrete class.
        return name.contains("ResListActivity") || name.contains("TabletHomeActivity");
    }

    static void applyToRow(View view) {
        if (view instanceof TextView) {
            applyToTextView((TextView) view);
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                applyToRow(group.getChildAt(index));
            }
        }
    }

    /** Called from ChMate's setText bridge, before a CharSequence reaches a TextView. */
    static CharSequence processText(CharSequence source) {
        if (source == null || applicationContext == null || "off".equals(renderMode)) return source;
        source = restoreExternalEmojiPlaceholders(source);
        Typeface fallback = getTypeface(applicationContext);
        if (fallback == null || !containsEmojiCandidate(source)) return source;
        return applyToText(source, new Paint(), fallback);
    }

    private static void applyToTextView(TextView view) {
        if ("off".equals(renderMode)) return;
        CharSequence source = view.getText();
        if (source == null || source.length() == 0 || !containsEmojiCandidate(source)) return;
        CharSequence repaired = restoreExternalEmojiPlaceholders(source);
        // The adapter reuses rows. Never apply a second copy over our own span.
        if (repaired instanceof android.text.Spanned
                && ((android.text.Spanned) repaired).getSpans(
                0, repaired.length(), EmojiTypefaceSpan.class).length != 0) {
            if (repaired != source) view.setText(repaired, TextView.BufferType.SPANNABLE);
            return;
        }

        Typeface fallback = getTypeface(view.getContext());
        CharSequence result = fallback == null
                ? repaired
                : applyToText(repaired, view.getPaint(), fallback);
        if (result != source) view.setText(result, TextView.BufferType.SPANNABLE);
    }

    private static CharSequence applyToText(
            CharSequence source,
            Paint devicePaint,
            Typeface fallback
    ) {
        Paint fallbackPaint = new Paint(devicePaint);
        fallbackPaint.setTypeface(fallback);
        SpannableStringBuilder result = null;
        for (int start = 0; start < source.length();) {
            int codePoint = Character.codePointAt(source, start);
            int end = start + Character.charCount(codePoint);
            if (!isEmojiBase(codePoint) && !isKeycapBase(source, start, codePoint)) {
                start = end;
                continue;
            }
            end = clusterEnd(source, start);
            String cluster = source.subSequence(start, end).toString();
            // ZWJ sequences are especially inconsistent on older Android emoji
            // stacks; prefer the bundled font for the complete cluster.
            boolean deviceHasGlyph = "all".equals(renderMode)
                    ? false
                    : cluster.indexOf('\u200d') >= 0
                    ? false
                    : hasDeviceGlyph(devicePaint, source, start, end);
            // Android 11's Paint.hasGlyph() may report false for CBDT color-font
            // glyphs even though Typeface drawing can render them. Once the
            // device font is missing the cluster, trust the bundled font.
            if (!deviceHasGlyph) {
                if (result == null) result = new SpannableStringBuilder(source);
                result.setSpan(new EmojiTypefaceSpan(fallback), start, end,
                        android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            start = end;
        }
        return result == null ? source : result;
    }

    /**
     * Some external boards decode UTF-8 emoji as Shift_JIS and expose the
     * unsupported bytes as U+FFFD. Recover the common emoji presentation and
     * ZWJ markers when the surrounding emoji bases make the intent unambiguous.
     */
    private static CharSequence restoreExternalEmojiPlaceholders(CharSequence source) {
        // A number of Android color fonts render U+1F441 U+200D U+1F5E8 as
        // the eye component only. Keep both glyphs visible by using the
        // equivalent non-ZWJ sequence for this one commonly affected emoji.
        String canonicalEyeBubble = "\uD83D\uDC41\uFE0F\u200D\uD83D\uDDE8\uFE0F";
        String splitEyeBubble = "\uD83D\uDC41\uFE0F\uD83D\uDDE8\uFE0F";
        if (source.toString().contains(canonicalEyeBubble)) {
            SpannableStringBuilder split = source instanceof android.text.Spanned
                    ? new SpannableStringBuilder(source)
                    : new SpannableStringBuilder(source.toString());
            String splitText = split.toString();
            for (int index = splitText.length() - canonicalEyeBubble.length(); index >= 0; index--) {
                if (splitText.substring(index, index + canonicalEyeBubble.length())
                        .equals(canonicalEyeBubble)) {
                    split.replace(index, index + canonicalEyeBubble.length(), splitEyeBubble);
                }
            }
            source = split;
        }
        List<Replacement> replacements = new ArrayList<>();
        for (int index = 0; index < source.length();) {
            int base = Character.codePointAt(source, index);
            if (!isEmojiBase(base)) {
                index += Character.charCount(base);
                continue;
            }
            int baseEnd = index + Character.charCount(base);
            if (baseEnd >= source.length()
                    || Character.codePointAt(source, baseEnd) != 0xfffd) {
                index = baseEnd;
                continue;
            }
            int firstReplacementEnd = baseEnd + 1;
            if (firstReplacementEnd < source.length()
                    && Character.codePointAt(source, firstReplacementEnd) == 0xfffd
                    && firstReplacementEnd + 1 < source.length()) {
                int joined = Character.codePointAt(source, firstReplacementEnd + 1);
                int joinedEnd = firstReplacementEnd + 1 + Character.charCount(joined);
                if (isEmojiBase(joined) && joinedEnd < source.length()
                        && Character.codePointAt(source, joinedEnd) == 0xfffd) {
                    // On some Android fonts the recovered eye-in-speech-bubble
                    // ligature looks like an eye alone. Keep both components
                    // visible for this already-corrupted external-board text.
                    String joiner = base == 0x1f441 && joined == 0x1f5e8
                            ? ""
                            : "\u200d";
                    replacements.add(new Replacement(
                            baseEnd,
                            joinedEnd + 1,
                            "\ufe0f" + joiner + new String(Character.toChars(joined)) + "\ufe0f"
                    ));
                    index = joinedEnd + 1;
                    continue;
                }
            }
            replacements.add(new Replacement(baseEnd, firstReplacementEnd, "\ufe0f"));
            index = firstReplacementEnd;
        }
        if (replacements.isEmpty()) return source;
        SpannableStringBuilder repaired = source instanceof android.text.Spanned
                ? new SpannableStringBuilder(source)
                : new SpannableStringBuilder(source.toString());
        for (int index = replacements.size() - 1; index >= 0; index--) {
            Replacement replacement = replacements.get(index);
            repaired.replace(replacement.start, replacement.end, replacement.text);
        }
        return repaired;
    }

    private static final class Replacement {
        final int start;
        final int end;
        final String text;

        Replacement(int start, int end, String text) {
            this.start = start;
            this.end = end;
            this.text = text;
        }
    }

    private static boolean hasDeviceGlyph(Paint paint, CharSequence text, int start, int end) {
        if (Build.VERSION.SDK_INT < 23) return false;
        for (int index = start; index < end;) {
            int codePoint = Character.codePointAt(text, index);
            if (isEmojiBase(codePoint)) {
                // Android 11 devices in the field can report a tofu-capable
                // fallback as a valid glyph for the newer hand emojis. Treat
                // these code points as missing so the bundled Noto font span
                // is applied consistently, including after adapter reloads.
                if (codePoint == 0x1faf7 || codePoint == 0x1faf8) return false;
                if (!paint.hasGlyph(new String(Character.toChars(codePoint)))) return false;
            }
            index += Character.charCount(codePoint);
        }
        return true;
    }

    private static boolean hasFallbackGlyph(Paint paint, CharSequence text, int start, int end) {
        if (Build.VERSION.SDK_INT < 23) return true;
        for (int index = start; index < end;) {
            int codePoint = Character.codePointAt(text, index);
            if (isEmojiBase(codePoint)
                    && !paint.hasGlyph(new String(Character.toChars(codePoint)))) return false;
            index += Character.charCount(codePoint);
        }
        return true;
    }

    private static boolean containsEmojiCandidate(CharSequence text) {
        for (int index = 0; index < text.length(); index++) {
            char value = text.charAt(index);
            if (Character.isHighSurrogate(value) || value == '\u00a9'
                    || value == '\u00ae' || value == '\u2122'
                    || value == '\u2139' || value == '\u20e3' || value == '\ufe0f'
                    || (value >= '\u2300' && value <= '\u3299')) {
                return true;
            }
        }
        return false;
    }

    private static boolean isEmojiBase(int codePoint) {
        return codePoint >= 0x1f000 && codePoint <= 0x1ffff
                || codePoint >= 0x2300 && codePoint <= 0x3299
                || codePoint == 0xa9 || codePoint == 0xae
                || codePoint == 0x2122 || codePoint == 0x2139;
    }

    private static boolean isKeycapBase(CharSequence text, int start, int codePoint) {
        if (!(codePoint == '#' || codePoint == '*'
                || codePoint >= '0' && codePoint <= '9')) return false;
        int nextIndex = start + Character.charCount(codePoint);
        if (nextIndex < text.length()
                && Character.codePointAt(text, nextIndex) == 0xfe0f) nextIndex++;
        return nextIndex < text.length()
                && Character.codePointAt(text, nextIndex) == 0x20e3;
    }

    private static int clusterEnd(CharSequence text, int start) {
        int first = Character.codePointAt(text, start);
        int end = start + Character.charCount(first);
        if (isRegionalIndicator(first) && end < text.length()) {
            int next = Character.codePointAt(text, end);
            if (isRegionalIndicator(next)) end += Character.charCount(next);
        }
        while (end < text.length()) {
            int next = Character.codePointAt(text, end);
            if (isEmojiModifier(next) || isVariationSelector(next)
                    || next == 0x20e3 || next >= 0xe0020 && next <= 0xe007f) {
                end += Character.charCount(next);
            } else if (next == 0x200d && end + 1 < text.length()) {
                int joined = Character.codePointAt(text, end + 1);
                if (!isEmojiBase(joined)) break;
                end += 1 + Character.charCount(joined);
            } else {
                break;
            }
        }
        return end;
    }

    private static boolean isRegionalIndicator(int value) {
        return value >= 0x1f1e6 && value <= 0x1f1ff;
    }

    private static boolean isEmojiModifier(int value) {
        return value >= 0x1f3fb && value <= 0x1f3ff;
    }

    private static boolean isVariationSelector(int value) {
        return value == 0xfe0e || value == 0xfe0f;
    }

    private static Typeface getTypeface(Context context) {
        if (emojiTypeface != null || fontLoadFailed) return emojiTypeface;
        synchronized (EmojiFontFallback.class) {
            if (emojiTypeface != null || fontLoadFailed) return emojiTypeface;
            try {
                emojiTypeface = Typeface.createFromAsset(context.getAssets(), FONT_ASSET);
            } catch (Throwable error) {
                fontLoadFailed = true;
                Log.w("Haiagaru", "Unable to load bundled emoji font", error);
            }
            return emojiTypeface;
        }
    }

    private static void loadConfiguration(Context context) {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                context.getAssets().open("haiagaru/emoji.properties"),
                StandardCharsets.UTF_8))) {
            Properties properties = new Properties();
            properties.load(reader);
            String mode = properties.getProperty("mode", "missing").trim().toLowerCase();
            if ("all".equals(mode) || "off".equals(mode) || "missing".equals(mode)) {
                renderMode = mode;
            }
        } catch (Throwable ignored) {
            // Older patched APKs do not contain the optional configuration.
            renderMode = "missing";
        }
    }

    private static final class EmojiTypefaceSpan extends MetricAffectingSpan {
        private final Typeface typeface;

        private EmojiTypefaceSpan(Typeface typeface) {
            this.typeface = typeface;
        }

        @Override
        public void updateDrawState(TextPaint paint) {
            paint.setTypeface(typeface);
        }

        @Override
        public void updateMeasureState(TextPaint paint) {
            paint.setTypeface(typeface);
        }
    }
}
