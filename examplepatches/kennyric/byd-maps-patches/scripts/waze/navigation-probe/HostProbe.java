package nl.johninnl.wazehostprobe;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/** Runs Waze's own HostValidator and hosts_allowlist against the installed hosts. */
public class HostProbe extends Instrumentation {
    private static final String GEARSLIP = "app.seb3thehacker.gearslip";
    private static final String GEARHEAD = "com.google.android.projection.gearhead";
    private final StringBuilder log = new StringBuilder();
    private int failed;
    private Object validator;
    private Method isValid;
    private Class<?> info;

    @Override public void onCreate(Bundle arguments) {
        super.onCreate(arguments);
        start();
    }

    private void expect(String name, boolean actual, boolean expected) {
        boolean ok = actual == expected;
        if (!ok) failed++;
        log.append(ok ? "PASS " : "FAIL ").append(name).append(": got ").append(actual).append('\n');
    }

    private Object host(String packageName, int uid) throws Exception {
        return info.getConstructor(String.class, int.class).newInstance(packageName, uid);
    }

    private boolean accepted(String packageName, int uid) throws Exception {
        return (Boolean) isValid.invoke(validator, host(packageName, uid));
    }

    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            Context waze = getTargetContext();
            PackageManager packages = waze.getPackageManager();
            ClassLoader loader = waze.getClassLoader();
            Class<?> builderType = Class.forName("androidx.car.app.validation.HostValidator$Builder", true, loader);
            info = Class.forName("androidx.car.app.HostInfo", true, loader);
            int allowlist = waze.getResources().getIdentifier("hosts_allowlist", "array", "com.waze");
            Object builder = builderType.getConstructor(Context.class).newInstance(waze);
            builderType.getMethod("addAllowedHosts", int.class).invoke(builder, allowlist);
            validator = builderType.getMethod("build").invoke(builder);
            isValid = validator.getClass().getMethod("isValidHost", info);
            log.append("allowlist entries: ").append(waze.getResources().getStringArray(allowlist).length).append('\n');

            int gearslipUid = packages.getApplicationInfo(GEARSLIP, 0).uid;
            expect("Gearslip re-signed with an unrelated key is admitted", accepted(GEARSLIP, gearslipUid), true);

            String other = "com.google.android.gms";
            expect("unlisted package is rejected", accepted(other, packages.getApplicationInfo(other, 0).uid), false);

            boolean forged = false;
            try {
                accepted(GEARSLIP, 0);
            } catch (InvocationTargetException denied) {
                forged = denied.getCause() instanceof IllegalStateException;
            }
            expect("Gearslip package claimed by the wrong UID is rejected", forged, true);

            String[] entries = waze.getResources().getStringArray(allowlist);
            int androidAuto = 0;
            for (String entry : entries) if (entry.replace(" ", "").endsWith("," + GEARHEAD)) androidAuto++;
            expect("three Android Auto certificates retained", androidAuto == 3, true);
            result.putInt("failed", failed);
        } catch (Throwable error) {
            failed++;
            log.append("ERROR ").append(android.util.Log.getStackTraceString(error));
        }
        result.putString(Instrumentation.REPORT_KEY_STREAMRESULT, log.toString() + (failed == 0 ? "RESULT PASS\n" : "RESULT FAIL\n"));
        finish(failed == 0 ? Activity.RESULT_OK : Activity.RESULT_CANCELED, result);
    }
}
