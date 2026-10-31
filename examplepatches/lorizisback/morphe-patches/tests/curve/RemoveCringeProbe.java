import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.os.Looper;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/** Checks the real patched Compose path and foreign-resource isolation in a fresh process. */
public final class RemoveCringeProbe {
    public static void main(String[] args) throws Exception {
        PatchSettingsProbe.require(args.length == 1, "Usage: RemoveCringeProbe present|absent");
        boolean present = args[0].equals("present");
        PatchSettingsProbe.require(present || args[0].equals("absent"), "Unknown patch variant");
        if (Looper.myLooper() == null) Looper.prepareMainLooper();
        Class<?> activityThread = Class.forName("android.app.ActivityThread");
        Object thread = activityThread.getMethod("systemMain").invoke(null);
        Context system = (Context) activityThread.getMethod("getSystemContext").invoke(thread);
        Context curve = system.createPackageContext("com.imaginecurve.curve.prd", Context.CONTEXT_IGNORE_SECURITY);
        Resources resources = curve.getResources();
        PatchSettingsProbe.Memory memory = new PatchSettingsProbe.Memory();
        Context fixture = new ContextWrapper(memory.context) {
            @Override public Resources getResources() { return resources; }
        };
        Class<?> settings = Class.forName("app.local.extension.curve.PatchSettings");
        settings.getMethod("initialize", Context.class).invoke(null, fixture);
        Class<?> helper = Class.forName("app.local.extension.curve.RemoveCringe");
        PatchSettingsProbe.require(Boolean.valueOf(present).equals(helper.getMethod("isIncluded").invoke(null)), "Wrong variant");
        Method getString = helper.getMethod("getString", Resources.class, int.class);
        int id = resources.getIdentifier("backup_card_title", "string", "com.imaginecurve.curve.prd");
        PatchSettingsProbe.require(id != 0, "Curve resource missing");
        Resources foreign = new Resources(Resources.getSystem().getAssets(), resources.getDisplayMetrics(), resources.getConfiguration()) {
            @Override public String getResourcePackageName(int ignored) { return "com.google.android.gms"; }
            @Override public String getString(int ignored) { return "Foreign package string"; }
        };
        for (int iteration = 0; iteration < 2; iteration++) {
            PatchSettingsProbe.require("Foreign package string".equals(getString.invoke(null, foreign, id)),
                "Foreign ID collision before/after catalog loading");
            PatchSettingsProbe.require(Resources.getSystem().getString(android.R.string.cancel)
                .equals(getString.invoke(null, Resources.getSystem(), android.R.string.cancel)), "System resource changed");
            getString.invoke(null, resources, id);
        }
        Class<?> composerType = Class.forName("androidx.compose.runtime.Composer");
        Object composer = Proxy.newProxyInstance(composerType.getClassLoader(), new Class<?>[]{composerType},
            (proxy, method, arguments) -> {
                if (method.getName().equals("m")) return resources;
                throw new AssertionError("Unexpected Composer method: " + method);
            });
        Method composeString = Class.forName("bm7").getMethod("J", composerType, int.class);
        for (boolean enabled : new boolean[]{true, false, true}) {
            PatchSettingsProbe.save(true, false, java.util.Collections.emptySet(), enabled);
            String expected = present && enabled ? "Backup cards" : resources.getString(id);
            PatchSettingsProbe.require(expected.equals(composeString.invoke(null, composer, id)), "Real Compose string path mismatch");
        }
        System.out.println("PASS Remove Cringe " + args[0] + ": foreign/system resource isolation before/after loading and actual Compose on/off/on");
    }
}
