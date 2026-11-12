package app.geminipatch.contractprobe;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Bundle;

/** Metadata/permission regression probe; no Google account or root required. */
public final class ContractProbe extends Instrumentation {
    private String expected;
    @Override public void onCreate(Bundle args) {
        super.onCreate(args);
        expected = args.getString("expected", "granted");
        start();
    }
    @Override public void onStart() {
        Bundle report = new Bundle();
        try {
            Context context = getTargetContext();
            PackageManager pm = context.getPackageManager();
            String clone = "com.google.android.googlequicksearchbox.morphe";
            pm.getPackageInfo(clone, 0);
            ServiceInfo service = pm.getServiceInfo(new ComponentName(clone,
                    "com.google.android.apps.search.lens.service.LensService"), 0);
            String fixed = clone + ".permission.LENS_SERVICE";
            boolean allowed = pm.checkPermission(service.permission, context.getPackageName()) == PackageManager.PERMISSION_GRANTED;
            boolean cloneGrant = pm.checkPermission(fixed, context.getPackageName()) == PackageManager.PERMISSION_GRANTED;
            report.putString("lens_permission", service.permission);
            report.putString("client_has_clone_permission", String.valueOf(cloneGrant));
            report.putString("client_authorized_for_service", String.valueOf(allowed));
            if (!cloneGrant || allowed != "granted".equals(expected)) throw new AssertionError("Unexpected authorization result");
            if ("granted".equals(expected) && !fixed.equals(service.permission)) throw new AssertionError("Service uses original permission");
            report.putString("result", "PASS");
            finish(Activity.RESULT_OK, report);
        } catch (Throwable failure) {
            report.putString("result", "FAIL");
            report.putString("error", failure.toString());
            finish(Activity.RESULT_CANCELED, report);
        }
    }
}
