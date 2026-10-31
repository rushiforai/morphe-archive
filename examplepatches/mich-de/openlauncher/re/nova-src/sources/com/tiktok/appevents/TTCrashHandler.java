package com.tiktok.appevents;

import android.app.Application;
import android.text.TextUtils;
import b.u4;
import com.tiktok.TikTokBusinessSdk;
import com.tiktok.util.HttpRequestUtil;
import com.tiktok.util.IOUtils;
import com.tiktok.util.JSON;
import com.tiktok.util.TTLogger;
import com.tiktok.util.TTUtil;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTCrashHandler {
    private static final String CRASH_REPORT_FILE = "tt_crash_log";
    private static final int MONITOR_BATCH_MAX = 5;
    private static final int MONITOR_RETRY_LIMIT = 2;
    private static final String TAG = "TTCrashHandler";
    private static final TTLogger ttLogger = new TTLogger(TAG, TikTokBusinessSdk.getLogLevel());
    static volatile TTCrashReport crashReport = new TTCrashReport();

    public static class TTCrashReport implements Serializable {
        List<Monitor> reports = new CopyOnWriteArrayList();

        public static class Monitor implements Serializable {
            public int attempt;
            public final String monitor;

            /* renamed from: ts, reason: collision with root package name */
            public long f46530ts;

            public Monitor(String str, long j11, int i5) {
                this.monitor = str;
                this.f46530ts = j11;
                this.attempt = i5;
            }
        }

        public void addReport(String str, long j11, int i5) {
            if (i5 < 2) {
                this.reports.add(new Monitor(str, j11, i5));
            }
        }
    }

    public static void handleCrash(String str, Throwable th2, int i5) {
        if (th2 != null) {
            if (TextUtils.isEmpty(str)) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            ttLogger.error(th2, fq.c.f(th2, u4.k("Error caused by sdk at ", str, "\n")), new Object[0]);
            persistException(th2, i5);
        }
    }

    public static void initCrashReporter() {
        try {
            TTCrashReport fromFile = readFromFile();
            if (fromFile != null && fromFile.reports != null) {
                crashReport.reports.addAll(fromFile.reports);
            }
            try {
                File file = new File(TikTokBusinessSdk.getApplicationContext().getFilesDir(), CRASH_REPORT_FILE);
                if (file.exists()) {
                    file.delete();
                }
            } catch (Throwable unused) {
            }
            saveToFile(reportMonitor(crashReport));
            crashReport = new TTCrashReport();
        } catch (Throwable unused2) {
        }
    }

    public static boolean isTTSDKRelatedException(Throwable th2) {
        if (th2 == null) {
            return false;
        }
        Throwable th3 = null;
        while (th2 != null && th2 != th3) {
            if (isTTSDKRelatedException(th2.getStackTrace())) {
                return true;
            }
            th3 = th2;
            th2 = th2.getCause();
        }
        return false;
    }

    private static void persistException(Throwable th2, int i5) {
        JSONObject jSONObject = null;
        try {
            JSONObject healthMonitorBase = TTRequestBuilder.getHealthMonitorBase();
            try {
                JSON.putObject(healthMonitorBase, "monitor", TTUtil.getMonitorException(th2, null, i5));
                crashReport.addReport(healthMonitorBase.toString(), System.currentTimeMillis(), 0);
                saveToFile(crashReport);
                crashReport = new TTCrashReport();
            } catch (Throwable unused) {
                jSONObject = healthMonitorBase;
                if (jSONObject == null || !jSONObject.has("monitor")) {
                    return;
                }
                JSONArray jSONArrayBuildArr = JSON.buildArr();
                JSON.putArr(jSONArrayBuildArr, jSONObject);
                JSONObject basePayloadWithTs = TTRequestBuilder.getBasePayloadWithTs();
                JSON.putObject(basePayloadWithTs, "batch", jSONArrayBuildArr);
                TTRequest.reportMonitorEvent(basePayloadWithTs);
            }
        } catch (Throwable unused2) {
        }
    }

    public static void persistToFile() {
        try {
            if (crashReport == null || crashReport.reports.isEmpty()) {
                return;
            }
            saveToFile(crashReport);
            crashReport = new TTCrashReport();
        } catch (Throwable unused) {
        }
    }

    private static TTCrashReport readFromFile() {
        FileInputStream fileInputStreamOpenFileInput;
        Application applicationContext = TikTokBusinessSdk.getApplicationContext();
        if (applicationContext == null) {
            return null;
        }
        try {
            fileInputStreamOpenFileInput = applicationContext.openFileInput(CRASH_REPORT_FILE);
        } catch (Throwable unused) {
            fileInputStreamOpenFileInput = null;
        }
        try {
            TTCrashReport tTCrashReportSafeReadTTCrashHandler = TTSafeReadObjectUtil.safeReadTTCrashHandler(fileInputStreamOpenFileInput);
            IOUtils.close(fileInputStreamOpenFileInput);
            return tTCrashReportSafeReadTTCrashHandler;
        } catch (Throwable unused2) {
            IOUtils.close(fileInputStreamOpenFileInput);
            return null;
        }
    }

    private static TTCrashReport reportMonitor(TTCrashReport tTCrashReport) {
        List<TTCrashReport.Monitor> list = tTCrashReport.reports;
        if (list == null || list.isEmpty()) {
            return tTCrashReport;
        }
        TTCrashReport tTCrashReport2 = new TTCrashReport();
        try {
            ArrayList arrayList = new ArrayList();
            int i5 = 0;
            while (i5 < tTCrashReport.reports.size()) {
                int i11 = i5 + 5;
                try {
                    List<TTCrashReport.Monitor> listSubList = tTCrashReport.reports.subList(i5, i11 > tTCrashReport.reports.size() ? tTCrashReport.reports.size() : i11);
                    JSONArray jSONArrayBuildArr = JSON.buildArr();
                    Iterator<TTCrashReport.Monitor> it = listSubList.iterator();
                    while (it.hasNext()) {
                        try {
                            String str = it.next().monitor;
                            if (!TextUtils.isEmpty(str) && !arrayList.contains(str)) {
                                arrayList.add(str);
                                JSONObject jSONObjectBuild = JSON.build(str);
                                if (jSONObjectBuild != null && jSONObjectBuild.length() > 0) {
                                    JSON.putArr(jSONArrayBuildArr, jSONObjectBuild);
                                }
                            }
                        } catch (Throwable unused) {
                        }
                    }
                    if (jSONArrayBuildArr.length() > 0) {
                        JSONObject basePayloadWithTs = TTRequestBuilder.getBasePayloadWithTs();
                        JSON.putObject(basePayloadWithTs, "batch", jSONArrayBuildArr);
                        HttpRequestUtil.HttpResponse httpResponseReportMonitorEvent = TTRequest.reportMonitorEvent(basePayloadWithTs);
                        if (httpResponseReportMonitorEvent == null || !httpResponseReportMonitorEvent.isOK()) {
                            for (TTCrashReport.Monitor monitor : listSubList) {
                                tTCrashReport2.addReport(monitor.monitor, System.currentTimeMillis(), monitor.attempt + 1);
                            }
                        }
                    }
                } catch (Throwable unused2) {
                }
                i5 = i11;
            }
        } catch (Throwable unused3) {
        }
        return tTCrashReport2;
    }

    public static void retryLater(JSONObject jSONObject) {
        try {
            if (crashReport != null) {
                crashReport.addReport(jSONObject.toString(), System.currentTimeMillis(), 0);
            }
        } catch (Throwable unused) {
        }
    }

    private static void saveToFile(TTCrashReport tTCrashReport) {
        List<TTCrashReport.Monitor> list;
        ObjectOutputStream objectOutputStream;
        if (tTCrashReport == null || (list = tTCrashReport.reports) == null || list.isEmpty()) {
            return;
        }
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream fileOutputStreamOpenFileOutput = TikTokBusinessSdk.getApplicationContext().openFileOutput(CRASH_REPORT_FILE, 0);
            try {
                objectOutputStream = new ObjectOutputStream(fileOutputStreamOpenFileOutput);
                try {
                    objectOutputStream.writeObject(tTCrashReport);
                    IOUtils.close(fileOutputStreamOpenFileOutput, objectOutputStream);
                } catch (Throwable unused) {
                    fileOutputStream = fileOutputStreamOpenFileOutput;
                    try {
                        reportMonitor(tTCrashReport);
                        IOUtils.close(fileOutputStream, objectOutputStream);
                    } catch (Throwable th2) {
                        IOUtils.close(fileOutputStream, objectOutputStream);
                        throw th2;
                    }
                }
            } catch (Throwable unused2) {
                objectOutputStream = null;
            }
        } catch (Throwable unused3) {
            objectOutputStream = null;
        }
    }

    public static boolean isTTSDKRelatedException(StackTraceElement[] stackTraceElementArr) {
        if (stackTraceElementArr != null && stackTraceElementArr.length >= 1) {
            for (StackTraceElement stackTraceElement : stackTraceElementArr) {
                if (stackTraceElement != null && stackTraceElement.getClassName().startsWith("com.tiktok")) {
                    return true;
                }
            }
        }
        return false;
    }
}
