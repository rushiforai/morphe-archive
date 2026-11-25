package nl.johninnl.warningprobe;

import android.app.Activity;
import android.app.Instrumentation;
import android.os.Bundle;
import android.os.Process;
import org.json.JSONObject;

/** Test-only same-signer instrumentation, never part of an application extension. */
public final class NativeWarningProbe extends Instrumentation {
    private Bundle arguments;

    @Override public void onCreate(Bundle args) {
        super.onCreate(args);
        arguments = args == null ? new Bundle() : args;
        start();
    }

    @Override public void onStart() {
        Bundle output = new Bundle();
        try {
            String target = getTargetContext().getPackageName();
            String probeClass;
            if (target.equals("app.vela") && arguments.getString("scenario", "").startsWith("adapter_")) probeClass = "VelaAdapterProbe";
            else if (arguments.getString("scenario", "").startsWith("ledger_")
                    && (target.equals("app.vela") || target.equals("com.google.android.apps.maps"))) probeClass = "PlaybackLedgerProbe";
            else if (arguments.getString("scenario", "").equals("codec")
                    && (target.equals("app.vela") || target.equals("com.google.android.apps.maps"))) probeClass = "WarningCodecProbe";
            else if (target.equals("app.vela")) probeClass = "VelaVoiceProbe";
            else if (target.equals("com.google.android.apps.maps")) probeClass = "MapsVoiceProbe";
            else throw new IllegalArgumentException("Unexpected native spike target: " + target);
            JSONObject report = (JSONObject) Class.forName("nl.johninnl.warningprobe." + probeClass)
                    .getMethod("run", Instrumentation.class, Bundle.class).invoke(null, this, arguments);
            report.put("probe_completed", true);
            report.put("target_package", target);
            report.put("process_uid", Process.myUid());
            report.put("target_uid", getTargetContext().getApplicationInfo().uid);
            report.put("android_sdk", android.os.Build.VERSION.SDK_INT);
            report.put("acceptance_scope", "Native lifecycle spike only; no complete warning feature or car-routing acceptance");
            output.putString("native_warning_result", report.toString());
            finish(Activity.RESULT_OK, output);
        } catch (Throwable error) {
            output.putString("native_warning_error", android.util.Log.getStackTraceString(error));
            finish(Activity.RESULT_CANCELED, output);
        }
    }
}
