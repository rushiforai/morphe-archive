package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Bundle;

/**
 * Exercises the host device-test transport without changing settings or account data. With `-e probe
 * message_log_render` it runs MessageLogRenderProbe instead, and `-e stall_ms 1500` stalls its viewer on purpose.
 */
public final class BuildTransportProbe extends Instrumentation {
    private String probe;
    private long stallMs;

    @Override public void onCreate(Bundle arguments) {
        super.onCreate(arguments);
        probe = arguments == null ? null : arguments.getString("probe");
        String stall = arguments == null ? null : arguments.getString("stall_ms");
        stallMs = stall == null ? 0 : Long.parseLong(stall);
        start();
    }

    /** The status a test runner reads for the one probe this run makes. */
    private static Bundle status(String className, String testName) {
        Bundle test = new Bundle();
        test.putString("id", "InstrumentationTestRunner");
        test.putString("class", className);
        test.putString("test", testName);
        test.putInt("numtests", 1);
        test.putInt("current", 1);
        return test;
    }

    @Override public void onStart() {
        if ("message_log_render".equals(probe)) {
            // Statuses too, so a runner that reads them rather than the text sees a failed render.
            Bundle test = status(MessageLogRenderProbe.class.getName(), "testMessageLogRenders");
            sendStatus(1, test);
            Bundle result = new Bundle();
            try {
                String report = new MessageLogRenderProbe(this, stallMs).run();
                sendStatus(0, test);
                result.putString("stream", "\n" + report + "\nOK (1 probe)\n");
            } catch (Exception | AssertionError error) {
                test.putString("stack", error.toString());
                sendStatus(-2, test);
                result.putString("stream", "\nFAILURES!!!\n" + error + "\n");
            }
            finish(Activity.RESULT_OK, result);
            return;
        }
        Bundle test = status(getClass().getName(), "testBuildLibrariesStayOutsideTheExtension");
        sendStatus(1, test);
        Bundle result = new Bundle();
        try {
            Context target = getTargetContext();
            if (!"app.hushmessenger.extension".equals(target.getPackageName())) {
                throw new AssertionError("Run this probe against the UI preview only");
            }
            PackageInfo installed = target.getPackageManager().getPackageInfo(target.getPackageName(), 0);
            if (!BuildConfig.VERSION_NAME.equals(installed.versionName)) {
                throw new AssertionError("Installed preview version differs from its compiled extension");
            }
            for (String name : new String[] {
                    "io.netty.channel.Channel", "io.grpc.ServerBuilder",
                    "org.apache.http.client.HttpClient", "org.apache.commons.lang3.ClassUtils"}) {
                try {
                    Class.forName(name, false, target.getClassLoader());
                } catch (ClassNotFoundException expected) {
                    continue;
                }
                throw new AssertionError("Host test library was bundled: " + name);
            }
            sendStatus(0, test);
            result.putString("stream", "\nOK (1 test)\n");
        } catch (Exception | AssertionError error) {
            test.putString("stack", error.toString());
            sendStatus(-2, test);
            result.putString("stream", "\nFAILURES!!!\n" + error + "\n");
        }
        finish(Activity.RESULT_OK, result);
    }
}
