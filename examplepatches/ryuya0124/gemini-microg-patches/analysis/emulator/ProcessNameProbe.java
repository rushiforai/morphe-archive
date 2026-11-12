package app.geminipatch.contractprobe;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.os.Bundle;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Executes the actual APK's provider for first-call, cached-call and seeded-cache paths. */
public final class ProcessNameProbe extends Instrumentation {
    private Bundle args;
    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); args = arguments; start(); }
    @Override public void onStart() {
        Bundle report = new Bundle();
        try {
            Context code = getTargetContext().createPackageContext("com.google.android.googlequicksearchbox.morphe",
                    Context.CONTEXT_INCLUDE_CODE | Context.CONTEXT_IGNORE_SECURITY);
            Class<?> provider = code.getClassLoader().loadClass(args.getString("provider", "ekjg"));
            Field cache = provider.getDeclaredField(args.getString("cache", "c"));
            cache.setAccessible(true);
            Method method = provider.getDeclaredMethod("b"); method.setAccessible(true);
            Object saved = cache.get(null);
            try {
                boolean fixed = "normalized".equals(args.getString("expected"));
                String raw = Application.getProcessName();
                if (!raw.contains(".morphe")) throw new AssertionError("Probe process must contain .morphe");
                cache.set(null, null);
                String first = (String) method.invoke(null);
                String second = (String) method.invoke(null);
                cache.set(null, "com.google.android.googlequicksearchbox.morphe:googleapp");
                String seeded = (String) method.invoke(null);
                report.putString("first", first); report.putString("cached", second); report.putString("seeded", seeded);
                if (!first.equals(raw.replace(".morphe", ""))) throw new AssertionError("First-call path failed");
                if (!second.equals(fixed ? raw.replace(".morphe", "") : raw)) throw new AssertionError("Cached path did not match expected state");
                if (!seeded.equals(fixed ? "com.google.android.googlequicksearchbox:googleapp" : "com.google.android.googlequicksearchbox.morphe:googleapp"))
                    throw new AssertionError("Seeded cached path did not match expected state");
            } finally { cache.set(null, saved); }
            report.putString("result", "PASS"); finish(Activity.RESULT_OK, report);
        } catch (Throwable error) { report.putString("error", error.toString()); report.putString("result", "FAIL"); finish(Activity.RESULT_CANCELED, report); }
    }
}
