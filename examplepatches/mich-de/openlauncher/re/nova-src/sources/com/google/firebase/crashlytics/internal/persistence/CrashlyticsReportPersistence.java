package com.google.firebase.crashlytics.internal.persistence;

import aa.t;
import aa.z;
import android.os.Build;
import b.c0;
import b3.h0;
import com.google.firebase.crashlytics.internal.Logger;
import com.google.firebase.crashlytics.internal.common.CrashlyticsAppQualitySessionsSubscriber;
import com.google.firebase.crashlytics.internal.common.CrashlyticsReportWithSessionId;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.google.firebase.crashlytics.internal.model.CrashlyticsReport;
import com.google.firebase.crashlytics.internal.model.serialization.CrashlyticsReportJsonTransform;
import com.google.firebase.crashlytics.internal.settings.SettingsProvider;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes.dex */
public class CrashlyticsReportPersistence {
    private static final String EVENT_COUNTER_FORMAT = "%010d";
    private static final int EVENT_COUNTER_WIDTH = 10;
    private static final String EVENT_FILE_NAME_PREFIX = "event";
    private static final int MAX_OPEN_SESSIONS = 8;
    private static final String NORMAL_EVENT_SUFFIX = "";
    private static final String PRIORITY_EVENT_SUFFIX = "_";
    private static final String PROFILING_MANAGER_INFO_FILE_NAME = "profiling-manager-info";
    private static final String REPORT_FILE_NAME = "report";
    private static final String SESSION_START_TIMESTAMP_FILE_NAME = "start-time";
    private final AtomicInteger eventCounter = new AtomicInteger(0);
    private final FileStore fileStore;
    private final CrashlyticsAppQualitySessionsSubscriber sessionsSubscriber;
    private final SettingsProvider settingsProvider;
    private static final Charset UTF_8 = Charset.forName("UTF-8");
    private static final int EVENT_NAME_LENGTH = 15;
    private static final CrashlyticsReportJsonTransform TRANSFORM = new CrashlyticsReportJsonTransform();
    private static final Comparator<? super File> LATEST_SESSION_ID_FIRST_COMPARATOR = new h0(1);
    private static final FilenameFilter EVENT_FILE_FILTER = new a();

    public CrashlyticsReportPersistence(FileStore fileStore, SettingsProvider settingsProvider, CrashlyticsAppQualitySessionsSubscriber crashlyticsAppQualitySessionsSubscriber) {
        this.fileStore = fileStore;
        this.settingsProvider = settingsProvider;
        this.sessionsSubscriber = crashlyticsAppQualitySessionsSubscriber;
    }

    private SortedSet<String> capAndGetOpenSessions(String str) {
        this.fileStore.cleanupPreviousFileSystems();
        SortedSet<String> openSessionIds = getOpenSessionIds();
        if (str != null) {
            openSessionIds.remove(str);
        }
        if (openSessionIds.size() > 8) {
            while (openSessionIds.size() > 8) {
                String strLast = openSessionIds.last();
                Logger.getLogger().d("Removing session over cap: " + strLast);
                this.fileStore.deleteSessionFiles(strLast);
                openSessionIds.remove(strLast);
            }
        }
        return openSessionIds;
    }

    private static int capFilesCount(List<File> list, int i5) {
        int size = list.size();
        for (File file : list) {
            if (size <= i5) {
                break;
            }
            FileStore.recursiveDelete(file);
            size--;
        }
        return size;
    }

    private void capFinalizedReports() {
        int i5 = this.settingsProvider.getSettingsSync().sessionData.maxCompleteSessionsCount;
        List<File> allFinalizedReportFiles = getAllFinalizedReportFiles();
        int size = allFinalizedReportFiles.size();
        if (size <= i5) {
            return;
        }
        Iterator<File> it = allFinalizedReportFiles.subList(i5, size).iterator();
        while (it.hasNext()) {
            it.next().delete();
        }
    }

    private static long convertTimestampFromSecondsToMs(long j11) {
        return j11 * 1000;
    }

    private CrashlyticsReport.Session.Event decorateWithProfilingManagerInfoIfFatal(String str, CrashlyticsReport.Session.Event event) {
        return (Build.VERSION.SDK_INT < 37 || !isFatalEvent(event)) ? event : (CrashlyticsReport.Session.Event) Optional.of(this.fileStore.getSessionFile(str, PROFILING_MANAGER_INFO_FILE_NAME)).filter(new z(1)).flatMap(new t(6)).map(new d(event, 0)).orElse(event);
    }

    private void deleteFiles(List<File> list) {
        Iterator<File> it = list.iterator();
        while (it.hasNext()) {
            it.next().delete();
        }
    }

    private static String generateEventFilename(int i5, boolean z11) {
        return c0.l("event", String.format(Locale.US, EVENT_COUNTER_FORMAT, Integer.valueOf(i5)), z11 ? PRIORITY_EVENT_SUFFIX : "");
    }

    private List<File> getAllFinalizedReportFiles() {
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(this.fileStore.getPriorityReports());
        arrayList.addAll(this.fileStore.getNativeReports());
        Comparator<? super File> comparator = LATEST_SESSION_ID_FIRST_COMPARATOR;
        Collections.sort(arrayList, comparator);
        List<File> reports = this.fileStore.getReports();
        Collections.sort(reports, comparator);
        arrayList.addAll(reports);
        return arrayList;
    }

    private static String getEventNameWithoutPriority(String str) {
        return str.substring(0, EVENT_NAME_LENGTH);
    }

    private static boolean isFatalEvent(CrashlyticsReport.Session.Event event) {
        return event.getType().equals("crash") || event.getType().equals("ndk-crash");
    }

    private static boolean isHighPriorityEventFile(String str) {
        return str.startsWith("event") && str.endsWith(PRIORITY_EVENT_SUFFIX);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isNormalPriorityEventFile(File file, String str) {
        return str.startsWith("event") && !str.endsWith(PRIORITY_EVENT_SUFFIX);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ Optional lambda$decorateWithProfilingManagerInfoIfFatal$2(File file) {
        try {
            return Optional.of(TRANSFORM.profilingManagerInfoFromJson(readTextFile(file)));
        } catch (IOException e3) {
            Logger.getLogger().w("Unable to read the Profiling Manager file ", e3);
            return Optional.empty();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ CrashlyticsReport.Session.Event lambda$decorateWithProfilingManagerInfoIfFatal$3(CrashlyticsReport.Session.Event event, CrashlyticsReport.ProfilingManagerInfo profilingManagerInfo) {
        return event.toBuilder().setApp(event.getApp().toBuilder().setExecution(event.getApp().getExecution().toBuilder().setProfilingManagerInfo(profilingManagerInfo).build()).build()).build();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ int lambda$static$0(File file, File file2) {
        return file2.getName().compareTo(file.getName());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ boolean lambda$static$1(File file, String str) {
        return str.startsWith("event");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int oldestEventFileFirst(File file, File file2) {
        return getEventNameWithoutPriority(file.getName()).compareTo(getEventNameWithoutPriority(file2.getName()));
    }

    private static String readTextFile(File file) throws IOException {
        byte[] bArr = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        FileInputStream fileInputStream = new FileInputStream(file);
        while (true) {
            try {
                int i5 = fileInputStream.read(bArr);
                if (i5 <= 0) {
                    String str = new String(byteArrayOutputStream.toByteArray(), UTF_8);
                    fileInputStream.close();
                    return str;
                }
                byteArrayOutputStream.write(bArr, 0, i5);
            } catch (Throwable th2) {
                try {
                    fileInputStream.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
                throw th2;
            }
        }
    }

    private void synthesizeNativeReportFile(File file, CrashlyticsReport.FilesPayload filesPayload, String str, CrashlyticsReport.ApplicationExitInfo applicationExitInfo) {
        String appQualitySessionId = this.sessionsSubscriber.getAppQualitySessionId(str);
        try {
            CrashlyticsReportJsonTransform crashlyticsReportJsonTransform = TRANSFORM;
            writeTextFile(this.fileStore.getNativeReport(str), crashlyticsReportJsonTransform.reportToJson(crashlyticsReportJsonTransform.reportFromJson(readTextFile(file)).withNdkPayload(filesPayload).withApplicationExitInfo(applicationExitInfo).withAppQualitySessionId(appQualitySessionId)));
        } catch (IOException e3) {
            Logger.getLogger().w("Could not synthesize final native report file for " + file, e3);
        }
    }

    private void synthesizeReport(String str, long j11) {
        boolean z11;
        List<File> sessionFiles = this.fileStore.getSessionFiles(str, EVENT_FILE_FILTER);
        if (sessionFiles.isEmpty()) {
            Logger.getLogger().v("Session " + str + " has no events.");
            return;
        }
        Collections.sort(sessionFiles);
        ArrayList arrayList = new ArrayList();
        loop0: while (true) {
            z11 = false;
            for (File file : sessionFiles) {
                try {
                    arrayList.add(decorateWithProfilingManagerInfoIfFatal(str, TRANSFORM.eventFromJson(readTextFile(file))));
                } catch (IOException e3) {
                    Logger.getLogger().w("Could not add event to report for " + file, e3);
                }
                if (z11 || isHighPriorityEventFile(file.getName())) {
                    z11 = true;
                }
            }
        }
        if (!arrayList.isEmpty()) {
            synthesizeReportFile(this.fileStore.getSessionFile(str, REPORT_FILE_NAME), arrayList, j11, z11, UserMetadata.readUserId(str, this.fileStore), this.sessionsSubscriber.getAppQualitySessionId(str));
        } else {
            Logger.getLogger().w("Could not parse event files for session " + str);
        }
    }

    private void synthesizeReportFile(File file, List<CrashlyticsReport.Session.Event> list, long j11, boolean z11, String str, String str2) {
        try {
            CrashlyticsReportJsonTransform crashlyticsReportJsonTransform = TRANSFORM;
            CrashlyticsReport crashlyticsReportWithEvents = crashlyticsReportJsonTransform.reportFromJson(readTextFile(file)).withSessionEndFields(j11, z11, str).withAppQualitySessionId(str2).withEvents(list);
            CrashlyticsReport.Session session = crashlyticsReportWithEvents.getSession();
            if (session == null) {
                return;
            }
            Logger.getLogger().d("appQualitySessionId: " + str2);
            writeTextFile(z11 ? this.fileStore.getPriorityReport(session.getIdentifier()) : this.fileStore.getReport(session.getIdentifier()), crashlyticsReportJsonTransform.reportToJson(crashlyticsReportWithEvents));
        } catch (IOException e3) {
            Logger.getLogger().w("Could not synthesize final report file for " + file, e3);
        }
    }

    private int trimEvents(String str, int i5) {
        List<File> sessionFiles = this.fileStore.getSessionFiles(str, new b(0));
        Collections.sort(sessionFiles, new c(0));
        return capFilesCount(sessionFiles, i5);
    }

    private static void writeTextFile(File file, String str) throws IOException {
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(new FileOutputStream(file), UTF_8);
        try {
            outputStreamWriter.write(str);
            outputStreamWriter.close();
        } catch (Throwable th2) {
            try {
                outputStreamWriter.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public void deleteAllReports() {
        deleteFiles(this.fileStore.getReports());
        deleteFiles(this.fileStore.getPriorityReports());
        deleteFiles(this.fileStore.getNativeReports());
    }

    public void finalizeReports(String str, long j11) {
        for (String str2 : capAndGetOpenSessions(str)) {
            Logger.getLogger().v("Finalizing report for session " + str2);
            synthesizeReport(str2, j11);
            this.fileStore.deleteSessionFiles(str2);
        }
        capFinalizedReports();
    }

    public void finalizeSessionWithNativeEvent(String str, CrashlyticsReport.FilesPayload filesPayload, CrashlyticsReport.ApplicationExitInfo applicationExitInfo) {
        File sessionFile = this.fileStore.getSessionFile(str, REPORT_FILE_NAME);
        Logger.getLogger().d("Writing native session report for " + str + " to file: " + sessionFile);
        synthesizeNativeReportFile(sessionFile, filesPayload, str, applicationExitInfo);
    }

    public SortedSet<String> getOpenSessionIds() {
        return new TreeSet(this.fileStore.getAllOpenSessionIds()).descendingSet();
    }

    public long getStartTimestampMillis(String str) {
        return this.fileStore.getSessionFile(str, SESSION_START_TIMESTAMP_FILE_NAME).lastModified();
    }

    public boolean hasFinalizedReports() {
        return (this.fileStore.getReports().isEmpty() && this.fileStore.getPriorityReports().isEmpty() && this.fileStore.getNativeReports().isEmpty()) ? false : true;
    }

    public List<CrashlyticsReportWithSessionId> loadFinalizedReports() {
        List<File> allFinalizedReportFiles = getAllFinalizedReportFiles();
        ArrayList arrayList = new ArrayList();
        for (File file : allFinalizedReportFiles) {
            try {
                arrayList.add(CrashlyticsReportWithSessionId.create(TRANSFORM.reportFromJson(readTextFile(file)), file.getName(), file));
            } catch (IOException e3) {
                Logger.getLogger().w("Could not load report file " + file + "; deleting", e3);
                file.delete();
            }
        }
        return arrayList;
    }

    public void persistEvent(CrashlyticsReport.Session.Event event, String str) {
        persistEvent(event, str, false);
    }

    public void persistProfilingManagerInfo(CrashlyticsReport.ProfilingManagerInfo profilingManagerInfo, String str) {
        try {
            writeTextFile(this.fileStore.getSessionFile(str, PROFILING_MANAGER_INFO_FILE_NAME), TRANSFORM.profilingManagerInfoToJson(profilingManagerInfo));
        } catch (IOException e3) {
            Logger.getLogger().w("Could not persist Profiling Manager info " + str, e3);
        }
    }

    public void persistReport(CrashlyticsReport crashlyticsReport) {
        CrashlyticsReport.Session session = crashlyticsReport.getSession();
        if (session == null) {
            Logger.getLogger().d("Could not get session for report");
            return;
        }
        String identifier = session.getIdentifier();
        try {
            writeTextFile(this.fileStore.getSessionFile(identifier, REPORT_FILE_NAME), TRANSFORM.reportToJson(crashlyticsReport));
            writeTextFile(this.fileStore.getSessionFile(identifier, SESSION_START_TIMESTAMP_FILE_NAME), "", session.getStartedAt());
        } catch (IOException e3) {
            Logger.getLogger().d("Could not persist report for session " + identifier, e3);
        }
    }

    public void persistEvent(CrashlyticsReport.Session.Event event, String str, boolean z11) {
        int i5 = this.settingsProvider.getSettingsSync().sessionData.maxCustomExceptionEvents;
        try {
            writeTextFile(this.fileStore.getSessionFile(str, generateEventFilename(this.eventCounter.getAndIncrement(), z11)), TRANSFORM.eventToJson(event));
        } catch (IOException e3) {
            Logger.getLogger().w("Could not persist event for session " + str, e3);
        }
        trimEvents(str, i5);
    }

    private static void writeTextFile(File file, String str, long j11) throws IOException {
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(new FileOutputStream(file), UTF_8);
        try {
            outputStreamWriter.write(str);
            file.setLastModified(convertTimestampFromSecondsToMs(j11));
            outputStreamWriter.close();
        } catch (Throwable th2) {
            try {
                outputStreamWriter.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }
}
