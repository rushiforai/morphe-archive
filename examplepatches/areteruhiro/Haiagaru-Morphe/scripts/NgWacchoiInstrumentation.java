package app.haiagaru.tests.ngwacchoi;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.ClipData;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import java.lang.reflect.Method;
import java.util.regex.Pattern;

/** Focused runtime checks for preset defaults, clipboard cleanup and reporter/Wacchoi helpers. */
public final class NgWacchoiInstrumentation extends Instrumentation {
    private int checks;
    private void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
    private Method method(Class<?> owner, String name, Class<?>... types) throws Exception {
        Method value = owner.getDeclaredMethod(name, types);
        value.setAccessible(true);
        return value;
    }

    @Override public void onCreate(Bundle arguments) {
        super.onCreate(arguments);
        start();
    }

    @Override public void onStart() {
        super.onStart();
        Bundle result = new Bundle();
        int code = Activity.RESULT_CANCELED;
        Context context = getTargetContext();
        SharedPreferences settings = context.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config", 0);
        SharedPreferences actions = context.getSharedPreferences("haiagaru_response_actions", 0);
        boolean hadActive = settings.contains("minimalSetupV1");
        boolean oldActive = settings.getBoolean("minimalSetupV1", false);
        boolean hadScoped = settings.contains("threadScopedNgEnabled");
        boolean oldScoped = settings.getBoolean("threadScopedNgEnabled", false);
        boolean hadStrip = actions.contains("wacchoiCopyStripParentheses");
        boolean oldStrip = actions.getBoolean("wacchoiCopyStripParentheses", false);
        try {
            ClassLoader loader = context.getClassLoader();
            Class<?> scoped = loader.loadClass("app.morphe.extension.chmate.ThreadScopedNg");
            Method enabled = method(scoped, "enabled", Context.class);
            settings.edit().putBoolean("minimalSetupV1", true).remove("threadScopedNgEnabled").commit();
            check(!(Boolean) enabled.invoke(null, context), "an existing recommended preset defaults thread-only registration off");
            settings.edit().putBoolean("minimalSetupV1", false).remove("threadScopedNgEnabled").commit();
            check((Boolean) enabled.invoke(null, context), "ordinary installs retain the thread-only registration default");
            settings.edit().putBoolean("minimalSetupV1", true).putBoolean("threadScopedNgEnabled", true).commit();
            check((Boolean) enabled.invoke(null, context), "an explicit setting overrides the recommended preset default");
            settings.edit().putBoolean("minimalSetupV1", false).putBoolean("threadScopedNgEnabled", false).commit();
            check(!(Boolean) enabled.invoke(null, context), "an explicit off setting is retained");

            Class<?> clipboard = loader.loadClass("app.morphe.extension.chmate.WacchoiClipboard");
            Method strip = method(clipboard, "stripIfEnabled", Context.class, ClipData.class);
            ClipData full = ClipData.newPlainText("wacchoi", "名無しさん (ﾜｯﾁｮｲ 8f01-uDul)");
            actions.edit().putBoolean("wacchoiCopyStripParentheses", true).commit();
            ClipData stripped = (ClipData) strip.invoke(null, context, full);
            check("名無しさん ﾜｯﾁｮｲ 8f01-uDul".contentEquals(stripped.getItemAt(0).getText()), "parenthesized full copy is cleaned when enabled");
            actions.edit().putBoolean("wacchoiCopyStripParentheses", false).commit();
            ClipData preserved = (ClipData) strip.invoke(null, context, full);
            check("名無しさん (ﾜｯﾁｮｲ 8f01-uDul)".contentEquals(preserved.getItemAt(0).getText()), "full copy remains unchanged when disabled");

            Class<?> parts = loader.loadClass("app.morphe.extension.chmate.WacchoiSuffixNg");
            Method upper = parts.getMethod("prefixClipboardValue", String.class);
            Method lower = parts.getMethod("suffixClipboardValue", String.class);
            String query = "名無しさん (ﾜｯﾁｮｲ 8f01-uDul)";
            check("8f01-".equals(upper.invoke(null, query)), "upper copy includes the separator");
            check("-uDul".equals(lower.invoke(null, query)), "lower copy uses -XXXX format");
            Method fragment = method(parts, "regexFragment", String.class);
            Method append = method(parts, "appendRegex", String.class, String.class);
            String merged = (String) append.invoke(null, Pattern.quote("(ﾜｯﾁｮｲ abcd-old1)") + "|",
                    fragment.invoke(null, "(ﾜｯﾁｮｲ abcd-uDul)"));
            check(Pattern.compile(merged).matcher("(ﾜｯﾁｮｲ abcd-old1)").find()
                    && Pattern.compile(merged).matcher("(ﾜｯﾁｮｲ abcd-uDul)").find(), "parenthesized Wacchoi can be added to a regex rule");

            Class<?> reporter = loader.loadClass("app.morphe.extension.chmate.EdgeReporterId");
            check("A1b2C3d4".equals(method(reporter, "reporterId", String.class).invoke(null, "題名 [A1b2C3d4★]")),
                    "thread title reporter ID extraction");
            Class<?> rule = loader.loadClass("app.morphe.extension.chmate.EdgeReporterNg");
            Method compile = method(rule, "compile", String.class, short.class);
            Object exact = compile.invoke(null, " [A1b2C3d4★]", (short) 0x10);
            check(exact != null && (Boolean) method(rule, "matches", String.class).invoke(exact, " [A1b2C3d4★]"),
                    "registered reporter ID matches its subject suffix");
            check(compile.invoke(null, " [A1b2C3d4★]", (short) 0x14) == null, "disabled reporter rule is ignored");

            code = Activity.RESULT_OK;
            result.putString("result", "PASS " + checks + " focused NG/Wacchoi/reporter checks");
        } catch (Throwable error) {
            result.putInt("checksCompleted", checks);
            result.putString("error", android.util.Log.getStackTraceString(error));
        } finally {
            SharedPreferences.Editor settingsEdit = settings.edit();
            if (hadActive) settingsEdit.putBoolean("minimalSetupV1", oldActive); else settingsEdit.remove("minimalSetupV1");
            if (hadScoped) settingsEdit.putBoolean("threadScopedNgEnabled", oldScoped); else settingsEdit.remove("threadScopedNgEnabled");
            settingsEdit.commit();
            if (hadStrip) actions.edit().putBoolean("wacchoiCopyStripParentheses", oldStrip).commit();
            else actions.edit().remove("wacchoiCopyStripParentheses").commit();
        }
        finish(code, result);
    }
}
