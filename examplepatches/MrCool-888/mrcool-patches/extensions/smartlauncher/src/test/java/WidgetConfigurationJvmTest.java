import android.app.Activity;
import android.appwidget.AppWidgetHost;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.os.Process;
import android.os.SystemProperties;
import android.os.UserHandle;
import app.mrcool.extension.smartlauncher.WidgetConfiguration;

public final class WidgetConfigurationJvmTest {
    private static final String BUDS = "com.samsung.accessory.paranmgr";
    private static final String BASE = "com.samsung.accessory.hearablemgr.core.appwidget.base.";
    private static final String UI67 = BASE + "WidgetSettingActivityUI6UI7";
    private static final String UI85 = BASE + "WidgetSettingActivityUI85";
    private static final int ID = 4721, FLAGS = Intent.FLAG_ACTIVITY_NEW_TASK | 0x20, REQUEST = 91;
    private static int passed;

    public static void main(String[] args) {
        directLaunchPreservesInputs();
        fallback("provider mismatch", f -> f.info.provider = new ComponentName("other.package", "Provider"));
        fallback("configure mismatch", f -> f.info.configure = new ComponentName(BUDS, BASE + "WidgetSettingActivity"));
        fallback("null widget info", f -> AppWidgetManager.getInstance(f.activity).info = null);
        fallback("null configure component", f -> f.info.configure = null);
        fallback("older One UI", f -> SystemProperties.oneUi = 80499);
        fallback("cross profile", f -> f.info.profile = new UserHandle(11));
        fallback("target missing", f -> f.activity.packageManager.missing = true);
        fallback("target disabled", f -> f.activity.packageManager.target.enabled = false);
        fallback("target not exported", f -> f.activity.packageManager.target.exported = false);
        fallback("target app disabled", f -> f.activity.packageManager.target.applicationInfo.enabled = false);
        fallback("reflection invocation failure", f -> SystemProperties.fail = true);
        fallback("package manager runtime failure", f -> f.activity.packageManager.runtimeFailure = true);
        fallback("ActivityNotFoundException", f -> f.activity.failure = new ActivityNotFoundException("gone"));
        fallback("SecurityException", f -> f.activity.failure = new SecurityException("denied"));
        hostExceptionPropagates();
        System.out.println("PASS " + passed + " JVM behavior scenarios");
    }

    private static void directLaunchPreservesInputs() {
        Fixture f = new Fixture();
        WidgetConfiguration.startConfiguration(f.host, f.activity, ID, FLAGS, REQUEST, f.options);
        check(f.activity.startCalls == 1, "direct start call count");
        check(f.activity.intents.size() == 1, "one direct intent");
        Intent intent = f.activity.intents.get(0);
        check(AppWidgetManager.ACTION_APPWIDGET_CONFIGURE.equals(intent.getAction()), "configure action");
        check(new ComponentName(BUDS, UI85).equals(intent.getComponent()), "UI85 target");
        check(intent.getIntExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, -1) == ID, "widget id extra");
        check(intent.getFlags() == FLAGS, "intent flags");
        check(f.activity.requestCode == REQUEST && f.activity.options == f.options, "request code and options");
        check(f.host.calls == 0, "host should not run for direct launch");
        cleanActivity(f.activity);
        passed++;
    }

    private static void fallback(String name, Mutation mutate) {
        Fixture f = new Fixture();
        mutate.apply(f);
        WidgetConfiguration.startConfiguration(f.host, f.activity, ID, FLAGS, REQUEST, f.options);
        check(f.host.calls == 1, name + ": host fallback");
        check(f.host.activity == f.activity && f.host.widgetId == ID && f.host.flags == FLAGS
                && f.host.requestCode == REQUEST && f.host.options == f.options, name + ": fallback arguments");
        if (name.startsWith("ActivityNotFoundException") || name.startsWith("SecurityException"))
            check(f.activity.startCalls == 1, name + ": direct attempt happened");
        else check(f.activity.startCalls == 0, name + ": no direct attempt");
        cleanActivity(f.activity);
        passed++;
    }

    private static void hostExceptionPropagates() {
        Fixture f = new Fixture();
        f.info.provider = new ComponentName("not.buds", "Provider");
        RuntimeException expected = new IllegalStateException("host failure");
        f.host.failure = expected;
        try {
            WidgetConfiguration.startConfiguration(f.host, f.activity, ID, FLAGS, REQUEST, f.options);
            throw new AssertionError("host exception was swallowed");
        } catch (RuntimeException actual) {
            check(actual == expected, "same host exception propagates");
        }
        check(f.host.calls == 1, "host called before exception");
        cleanActivity(f.activity);
        passed++;
    }

    private static void cleanActivity(Activity a) {
        check(a.setResultCalls == 0 && a.finishCalls == 0, "helper must not rewrite result or finish activity");
    }
    private static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    private interface Mutation { void apply(Fixture f); }
    private static final class Fixture {
        final Activity activity = new Activity();
        final AppWidgetHost host = new AppWidgetHost();
        final Bundle options = new Bundle();
        final AppWidgetProviderInfo info = new AppWidgetProviderInfo();
        Fixture() {
            SystemProperties.oneUi = 80500; SystemProperties.fail = false;
            Process.user = new UserHandle(10);
            info.provider = new ComponentName(BUDS, "BudsProvider");
            info.configure = new ComponentName(BUDS, UI67);
            info.profile = new UserHandle(10);
            AppWidgetManager.getInstance(activity).info = info;
            options.put("sentinel", "preserved");
            ActivityInfo target = activity.packageManager.target;
            target.enabled = true; target.exported = true; target.applicationInfo.enabled = true;
        }
    }
}
