package xyz.urro.transit;

/** The GO card renders markup directly; its plain-text resolver only supplies semantics. */
public final class GoComposeReminders {
    private GoComposeReminders() {}
    private static Object preferenceState;
    private static java.lang.reflect.Method readState, writeState;

    private static synchronized Object preferenceRevision() throws ReflectiveOperationException {
        if (preferenceState == null) {
            ClassLoader loader = GoComposeReminders.class.getClassLoader();
            Class<?> state = Class.forName("es6", false, loader);
            readState = state.getMethod("getValue");
            writeState = state.getMethod("setValue", Object.class);
            preferenceState = Class.forName("androidx.compose.runtime.k", false, loader)
                    .getMethod("g", Object.class).invoke(null, Integer.valueOf(0));
        }
        // Read during the host composable so Compose subscribes its GO render scope.
        return readState.invoke(preferenceState);
    }

    static synchronized void refresh() {
        if (preferenceState == null) return;
        try {
            int revision = ((Number) readState.invoke(preferenceState)).intValue() + 1;
            writeState.invoke(preferenceState, Integer.valueOf(revision));
            GoModelDiagnostics.trace("reminder_preference_refresh", "surface=in_app revision=" + revision);
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w("TransitMorphe", "GO reminder preference refresh unavailable", error);
        }
    }

    public static String styledReplacement(String raw, String rendered) {
        if (raw == null) return rendered;
        String color = "";
        int position = 0;
        // A color directive applies to the rest of the SmartString. Keep the color
        // active at its first word, not a later stop name's accent color.
        while (position < raw.length()) {
            while (position < raw.length() && Character.isWhitespace(raw.charAt(position))) position++;
            if (position >= raw.length() || raw.charAt(position) != '<') break;
            int end = raw.indexOf('>', position + 1);
            if (end < 0) break;
            String tag = raw.substring(position, end + 1);
            if (tag.startsWith("<color|")) color = tag;
            position = end + 1;
        }
        return color + rendered;
    }

    public static Object instruction(Object smart) {
        if (smart == null) return null;
        try {
            preferenceRevision(); // Subscribe even while Bike mode is off.
            String raw = (String) smart.getClass().getMethod("getValue").invoke(smart);
            String original = GoInstruction.plain(raw);
            // text() retains the existing feature, preference and GO-identity checks.
            String rendered = TransitHooks.text(smart, original);
            if (java.util.Objects.equals(original, rendered)) return smart;
            String styled = styledReplacement(raw, rendered);
            Object replacement = smart.getClass().getConstructor(String.class).newInstance(styled);
            GoModelDiagnostics.trace("reminder_style", "surface=in_app leading_color_preserved=" + !styled.equals(rendered));
            LiveReminders.output("in_app_compose_input", "go_main_instruction", original, rendered);
            return replacement;
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w("TransitMorphe", "GO rich-text reminder replacement unavailable", error);
            return smart;
        }
    }
}
