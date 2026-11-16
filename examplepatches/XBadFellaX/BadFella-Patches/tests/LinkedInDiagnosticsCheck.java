package app.badfella.extension.linkedin;

import android.app.Activity;
import android.app.Application;
import android.os.Handler;
import android.os.SystemClock;
import android.view.FrameMetrics;
import android.view.Window;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;

public class LinkedInDiagnosticsCheck {
    static void check(boolean ok, String why) { if (!ok) throw new AssertionError(why); }

    public static void main(String[] args) throws Exception {
        if (args[0].equals("privacy")) privacy(Path.of(args[1]));
        else if (args[0].equals("capture")) capture();
        else memo();
    }

    static void privacy(Path work) throws Exception {
        String secret = "AliceExampleSentinel alice-private-sentinel@example.com urn:li:member:123456 https://linkedin.com/in/alice-private-sentinel cookie=abcsecret token=plainsecret private-message-sentinel";
        Settings.values.putAll(Map.of("debug_logging", true, "muted_words", secret,
                "download_folder", secret, secret, true));
        Diagnostics.debug("view " + secret);
        Diagnostics.debug("sdui request " + secret);
        RuntimeException failure = new RuntimeException(secret, new IllegalStateException(secret));
        failure.setStackTrace(new StackTraceElement[]{
                new StackTraceElement("external." + secret, secret, secret, 1),
                new StackTraceElement("app.badfella.extension.linkedin.PostMenu", "remember", secret, 42)});
        Diagnostics.error(secret, failure);
        android.content.Context.files = work.toFile();
        Files.writeString(work.resolve("michii_log.txt"), secret);
        Files.writeString(work.resolve("account-data.txt"), secret);
        String report = Diagnostics.report(new android.content.Context());
        for (String forbidden : secret.split(" ")) check(!report.contains(forbidden), "Leaked " + forbidden);
        check(report.contains("DEBUG_LOGGING = true"), report);
        check(!report.contains("MUTED_WORDS") && !report.contains("DOWNLOAD_FOLDER"), report);
        check(report.contains("PostMenu.remember:42"), report);
        check(report.contains("feed/filter: 1") && report.contains("tracking: 1"), report);
        Diagnostics.discardLegacyLog(new android.content.Context());
        for (int i=0; i<100 && Files.exists(work.resolve("michii_log.txt")); i++) Thread.sleep(10);
        check(!Files.exists(work.resolve("michii_log.txt")), "Legacy log retained");
        check(Files.readString(work.resolve("account-data.txt")).equals(secret), "Other data touched");
        for (int i=0; i<100; i++) Diagnostics.error(secret, null);
        report = Diagnostics.report(null);
        check(report.lines().filter(line -> line.equals("extension error")).count() == 40, "Error buffer is not bounded");
        Diagnostics.clear();
        check(Diagnostics.report(null).lines().noneMatch(line -> line.equals("extension error")), "Clear retained events");
    }

    static void capture() {
        check(PerformanceCapture.beginHook()==0, "Disabled capture reads the clock");
        Application app=new Application();
        check(PerformanceCapture.start(app), "Could not start");
        check(!PerformanceCapture.start(app), "Duplicate capture started");
        app.callbacks.onActivityResumed(new SettingsActivity());
        Activity host=new Activity();
        app.callbacks.onActivityResumed(host);
        Window.OnFrameMetricsAvailableListener listener=host.window.listener;
        check(listener!=null, "No listener");
        listener.onFrameMetricsAvailable(host.window,new FrameMetrics(5_000_000,1,0),0);
        listener.onFrameMetricsAvailable(host.window,new FrameMetrics(20_000_000,1,0),2);
        listener.onFrameMetricsAvailable(host.window,new FrameMetrics(90_000_000,1,1),0);
        listener.onFrameMetricsAvailable(host.window,new FrameMetrics(-1,1,0),0);
        long start=PerformanceCapture.beginHook();
        PerformanceCapture.endHook(0,start);
        app.callbacks.onActivityPaused(host);
        check(host.window.listener==null, "Pause retained listener");
        app.callbacks.onActivityResumed(host);
        SystemClock.now=20_000;
        Handler.finish();
        check(app.callbacks==null && host.window.listener==null, "Capture did not detach");
        check(android.os.HandlerThread.quit==1 && Handler.tasks.isEmpty(), "Worker or timer leaked");
        String report=PerformanceCapture.report();
        check(report.contains("rendered_frames: 2; over_frame_budget: 1"), report);
        check(report.contains("mean_frame_ms: 12.500; max_frame_ms: 20.000"), report);
        check(report.contains("first_draw_frames_excluded: 1; dropped_metric_callbacks: 2"), report);
        check(report.contains("SDUI rewrite: calls=1"), report);
        listener.onFrameMetricsAvailable(host.window,new FrameMetrics(99_000_000,1,0),0);
        PerformanceCapture.endHook(0,start);
        check(report.equals(PerformanceCapture.report()), "Late data changed completed capture");
        check(PerformanceCapture.beginHook()==0, "Capture stayed active");
        PerformanceCapture.stop();
        android.os.Build.VERSION.SDK_INT=36;
        check(PerformanceCapture.start(app), "Repeat failed");
        app.callbacks.onActivityResumed(host);
        host.window.listener.onFrameMetricsAvailable(host.window,new FrameMetrics(10_000_000,8_000_000,0),0);
        PerformanceCapture.stop();
        check(PerformanceCapture.report().contains("over_frame_budget: 1"), "Frame deadline ignored");
        PerformanceCapture.clear();
        check(PerformanceCapture.report().contains("not captured"), "Clear retained measurements");
    }

    public static class Component {
        int serializations;
        final byte[] bytes;
        Component(int value) { bytes=new byte[]{(byte)value}; }
        public byte[] toByteArray() { serializations++; return bytes; }
    }

    static void memo() throws Exception {
        Method payload=SduiComponentFilter.class.getDeclaredMethod("payload",Object.class);
        Method memo=SduiComponentFilter.class.getDeclaredMethod("memo",Object.class);
        payload.setAccessible(true); memo.setAccessible(true);
        Component a=new Component(1),b=new Component(2);
        Object storage=memo.invoke(null,a);
        check(payload.invoke(null,a)==a.bytes && payload.invoke(null,a)==a.bytes, "Payload changed");
        check(a.serializations==1, "Same component serialized twice");
        check(payload.invoke(null,b)==b.bytes && b.serializations==1, "Stale bytes for next component");
        check(memo.invoke(null,b)==storage, "Storage allocated per component");
        check(payload.invoke(null,a)==a.bytes && a.serializations==2, "Old component did not invalidate cache");
    }
}
