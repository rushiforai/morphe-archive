package com.google.firebase.crashlytics.internal.common;

import android.app.ApplicationExitInfo;
import android.content.Context;
import android.system.OsConstants;
import com.google.android.gms.internal.measurement.k2;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.crashlytics.internal.Logger;
import com.google.firebase.crashlytics.internal.concurrency.CrashlyticsWorkers;
import com.google.firebase.crashlytics.internal.metadata.EventMetadata;
import com.google.firebase.crashlytics.internal.metadata.LogFileManager;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.google.firebase.crashlytics.internal.model.CrashlyticsReport;
import com.google.firebase.crashlytics.internal.persistence.CrashlyticsReportPersistence;
import com.google.firebase.crashlytics.internal.persistence.FileStore;
import com.google.firebase.crashlytics.internal.send.DataTransportCrashlyticsReportSender;
import com.google.firebase.crashlytics.internal.settings.SettingsProvider;
import com.google.firebase.crashlytics.internal.stacktrace.StackTraceTrimmingStrategy;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.SortedSet;
import java.util.concurrent.Executor;
import java.util.function.Consumer;
import java.util.function.Predicate;

/* loaded from: classes.dex */
public class SessionReportingCoordinator {
    private static final int DEFAULT_BUFFER_SIZE = 8192;
    private static final int EVENT_THREAD_IMPORTANCE = 4;
    private static final String EVENT_TYPE_CRASH = "crash";
    private static final String EVENT_TYPE_LOGGED = "error";
    private static final int MAX_CHAINED_EXCEPTION_DEPTH = 8;
    private final CrashlyticsWorkers crashlyticsWorkers;
    private final CrashlyticsReportDataCapture dataCapture;
    private final IdManager idManager;
    private final LogFileManager logFileManager;
    private final UserMetadata reportMetadata;
    private final CrashlyticsReportPersistence reportPersistence;
    private final DataTransportCrashlyticsReportSender reportsSender;

    public SessionReportingCoordinator(CrashlyticsReportDataCapture crashlyticsReportDataCapture, CrashlyticsReportPersistence crashlyticsReportPersistence, DataTransportCrashlyticsReportSender dataTransportCrashlyticsReportSender, LogFileManager logFileManager, UserMetadata userMetadata, IdManager idManager, CrashlyticsWorkers crashlyticsWorkers) {
        this.dataCapture = crashlyticsReportDataCapture;
        this.reportPersistence = crashlyticsReportPersistence;
        this.reportsSender = dataTransportCrashlyticsReportSender;
        this.logFileManager = logFileManager;
        this.reportMetadata = userMetadata;
        this.idManager = idManager;
        this.crashlyticsWorkers = crashlyticsWorkers;
    }

    private CrashlyticsReport.Session.Event addLogsAndCustomKeysToEvent(CrashlyticsReport.Session.Event event, LogFileManager logFileManager, UserMetadata userMetadata) {
        return addLogsCustomKeysAndEventKeysToEvent(event, logFileManager, userMetadata, Collections.EMPTY_MAP);
    }

    private CrashlyticsReport.Session.Event addLogsCustomKeysAndEventKeysToEvent(CrashlyticsReport.Session.Event event, LogFileManager logFileManager, UserMetadata userMetadata, Map<String, String> map) {
        CrashlyticsReport.Session.Event.Builder builder = event.toBuilder();
        String logString = logFileManager.getLogString();
        if (logString != null) {
            builder.setLog(CrashlyticsReport.Session.Event.Log.builder().setContent(logString).build());
        } else {
            Logger.getLogger().v("No log data to include with this event.");
        }
        List<CrashlyticsReport.CustomAttribute> sortedCustomAttributes = getSortedCustomAttributes(userMetadata.getCustomKeys(map));
        List<CrashlyticsReport.CustomAttribute> sortedCustomAttributes2 = getSortedCustomAttributes(userMetadata.getInternalKeys());
        if (!sortedCustomAttributes.isEmpty() || !sortedCustomAttributes2.isEmpty()) {
            builder.setApp(event.getApp().toBuilder().setCustomAttributes(sortedCustomAttributes).setInternalKeys(sortedCustomAttributes2).build());
        }
        return builder.build();
    }

    private CrashlyticsReport.Session.Event addMetaDataToEvent(CrashlyticsReport.Session.Event event, Map<String, String> map) {
        return addRolloutsStateToEvent(addLogsCustomKeysAndEventKeysToEvent(event, this.logFileManager, this.reportMetadata, map), this.reportMetadata);
    }

    private CrashlyticsReport.Session.Event addRolloutsStateToEvent(CrashlyticsReport.Session.Event event, UserMetadata userMetadata) {
        List<CrashlyticsReport.Session.Event.RolloutAssignment> rolloutsState = userMetadata.getRolloutsState();
        if (rolloutsState.isEmpty()) {
            return event;
        }
        CrashlyticsReport.Session.Event.Builder builder = event.toBuilder();
        builder.setRollouts(CrashlyticsReport.Session.Event.RolloutsState.builder().setRolloutAssignments(rolloutsState).build());
        return builder.build();
    }

    private static CrashlyticsReport.ApplicationExitInfo convertApplicationExitInfo(ApplicationExitInfo applicationExitInfo) throws IOException {
        String strConvertInputStreamToString = null;
        try {
            InputStream traceInputStream = applicationExitInfo.getTraceInputStream();
            if (traceInputStream != null) {
                strConvertInputStreamToString = convertInputStreamToString(traceInputStream);
            }
        } catch (IOException e3) {
            Logger.getLogger().w("Could not get input trace in application exit info: " + applicationExitInfo.toString() + " Error: " + e3);
        }
        return CrashlyticsReport.ApplicationExitInfo.builder().setImportance(applicationExitInfo.getImportance()).setProcessName(applicationExitInfo.getProcessName()).setReasonCode(applicationExitInfo.getReason()).setTimestamp(applicationExitInfo.getTimestamp()).setPid(applicationExitInfo.getPid()).setPss(applicationExitInfo.getPss()).setRss(applicationExitInfo.getRss()).setTraceFile(strConvertInputStreamToString).build();
    }

    public static String convertInputStreamToString(InputStream inputStream) throws IOException {
        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                byte[] bArr = new byte[8192];
                while (true) {
                    int i5 = bufferedInputStream.read(bArr);
                    if (i5 == -1) {
                        String string = byteArrayOutputStream.toString(StandardCharsets.UTF_8.name());
                        byteArrayOutputStream.close();
                        bufferedInputStream.close();
                        return string;
                    }
                    byteArrayOutputStream.write(bArr, 0, i5);
                }
            } finally {
            }
        } catch (Throwable th2) {
            try {
                bufferedInputStream.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public static SessionReportingCoordinator create(Context context, IdManager idManager, FileStore fileStore, AppData appData, LogFileManager logFileManager, UserMetadata userMetadata, StackTraceTrimmingStrategy stackTraceTrimmingStrategy, SettingsProvider settingsProvider, OnDemandCounter onDemandCounter, CrashlyticsAppQualitySessionsSubscriber crashlyticsAppQualitySessionsSubscriber, CrashlyticsWorkers crashlyticsWorkers) {
        return new SessionReportingCoordinator(new CrashlyticsReportDataCapture(context, idManager, appData, stackTraceTrimmingStrategy, settingsProvider), new CrashlyticsReportPersistence(fileStore, settingsProvider, crashlyticsAppQualitySessionsSubscriber), DataTransportCrashlyticsReportSender.create(context, settingsProvider, onDemandCounter), logFileManager, userMetadata, idManager, crashlyticsWorkers);
    }

    private CrashlyticsReportWithSessionId ensureHasFid(CrashlyticsReportWithSessionId crashlyticsReportWithSessionId) {
        if (crashlyticsReportWithSessionId.getReport().getFirebaseInstallationId() != null && crashlyticsReportWithSessionId.getReport().getFirebaseAuthenticationToken() != null) {
            return crashlyticsReportWithSessionId;
        }
        FirebaseInstallationId firebaseInstallationIdFetchTrueFid = this.idManager.fetchTrueFid(true);
        return CrashlyticsReportWithSessionId.create(crashlyticsReportWithSessionId.getReport().withFirebaseInstallationId(firebaseInstallationIdFetchTrueFid.getFid()).withFirebaseAuthenticationToken(firebaseInstallationIdFetchTrueFid.getAuthToken()), crashlyticsReportWithSessionId.getSessionId(), crashlyticsReportWithSessionId.getReportFile());
    }

    private ApplicationExitInfo findRelevantApplicationExitInfo(String str, List<ApplicationExitInfo> list, Predicate<ApplicationExitInfo> predicate) {
        long startTimestampMillis = this.reportPersistence.getStartTimestampMillis(str);
        Iterator<ApplicationExitInfo> it = list.iterator();
        while (it.hasNext()) {
            ApplicationExitInfo applicationExitInfoC = b.s.c(it.next());
            if (applicationExitInfoC.getTimestamp() >= startTimestampMillis && predicate.test(applicationExitInfoC)) {
                return applicationExitInfoC;
            }
        }
        return null;
    }

    private static List<CrashlyticsReport.CustomAttribute> getSortedCustomAttributes(Map<String, String> map) {
        ArrayList arrayList = new ArrayList();
        arrayList.ensureCapacity(map.size());
        for (Map.Entry<String, String> entry : map.entrySet()) {
            arrayList.add(CrashlyticsReport.CustomAttribute.builder().setKey(entry.getKey()).setValue(entry.getValue()).build());
        }
        Collections.sort(arrayList, new Comparator() { // from class: com.google.firebase.crashlytics.internal.common.s
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return SessionReportingCoordinator.lambda$getSortedCustomAttributes$4((CrashlyticsReport.CustomAttribute) obj, (CrashlyticsReport.CustomAttribute) obj2);
            }
        });
        return Collections.unmodifiableList(arrayList);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ int lambda$getSortedCustomAttributes$4(CrashlyticsReport.CustomAttribute customAttribute, CrashlyticsReport.CustomAttribute customAttribute2) {
        return customAttribute.getKey().compareTo(customAttribute2.getKey());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ boolean lambda$isOom$5(ApplicationExitInfo applicationExitInfo) {
        return (applicationExitInfo.getReason() == 3 && applicationExitInfo.getDescription() != null && applicationExitInfo.getDescription().contains("OOM")) || (applicationExitInfo.getReason() == 2 && applicationExitInfo.getStatus() == OsConstants.SIGKILL);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$persistEvent$3(CrashlyticsReport.Session.Event event, EventMetadata eventMetadata, boolean z11) {
        Logger.getLogger().d("disk worker: log non-fatal event to persistence");
        this.reportPersistence.persistEvent(event, eventMetadata.getSessionId(), z11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ Optional lambda$persistProfilingManagerInfo$1(String str, List list) {
        return isOom(str, list) ? Optional.of(7) : Optional.empty();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$persistProfilingManagerInfo$2(String str, Integer num) {
        this.reportPersistence.persistProfilingManagerInfo(CrashlyticsReport.ProfilingManagerInfo.builder().setProfilingTrigger(CrashlyticsReport.ProfilingManagerInfo.ProfilingTrigger.builder().setTrigger(num.intValue()).build()).build(), str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ boolean lambda$persistRelevantAppExitInfoEvent$0(ApplicationExitInfo applicationExitInfo) {
        return applicationExitInfo.getReason() == 6;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean onReportSendComplete(Task<CrashlyticsReportWithSessionId> task) {
        if (!task.q()) {
            Logger.getLogger().w("Crashlytics report could not be enqueued to DataTransport", task.l());
            return false;
        }
        CrashlyticsReportWithSessionId crashlyticsReportWithSessionId = (CrashlyticsReportWithSessionId) task.m();
        Logger.getLogger().d("Crashlytics report successfully enqueued to DataTransport: " + crashlyticsReportWithSessionId.getSessionId());
        File reportFile = crashlyticsReportWithSessionId.getReportFile();
        if (reportFile.delete()) {
            Logger.getLogger().d("Deleted report file: " + reportFile.getPath());
            return true;
        }
        Logger.getLogger().w("Crashlytics could not delete report file: " + reportFile.getPath());
        return true;
    }

    private void persistEvent(Throwable th2, Thread thread, String str, EventMetadata eventMetadata, boolean z11) {
        boolean zEquals = str.equals(EVENT_TYPE_CRASH);
        CrashlyticsReport.Session.Event eventAddMetaDataToEvent = addMetaDataToEvent(this.dataCapture.captureEventData(th2, thread, str, eventMetadata.getTimestamp(), 4, 8, z11), eventMetadata.getAdditionalCustomKeys());
        if (z11) {
            this.reportPersistence.persistEvent(eventAddMetaDataToEvent, eventMetadata.getSessionId(), zEquals);
        } else {
            this.crashlyticsWorkers.diskWrite.submit(new r(0, this, eventAddMetaDataToEvent, eventMetadata, zEquals));
        }
    }

    public void finalizeSessionWithNativeEvent(String str, List<NativeSessionFile> list, CrashlyticsReport.ApplicationExitInfo applicationExitInfo) {
        Logger.getLogger().d("SessionReportingCoordinator#finalizeSessionWithNativeEvent");
        ArrayList arrayList = new ArrayList();
        Iterator<NativeSessionFile> it = list.iterator();
        while (it.hasNext()) {
            CrashlyticsReport.FilesPayload.File fileAsFilePayload = it.next().asFilePayload();
            if (fileAsFilePayload != null) {
                arrayList.add(fileAsFilePayload);
            }
        }
        this.reportPersistence.finalizeSessionWithNativeEvent(str, CrashlyticsReport.FilesPayload.builder().setFiles(Collections.unmodifiableList(arrayList)).build(), applicationExitInfo);
    }

    public void finalizeSessions(long j11, String str) {
        this.reportPersistence.finalizeReports(str, j11);
    }

    public boolean hasReportsToSend() {
        return this.reportPersistence.hasFinalizedReports();
    }

    public boolean isOom(String str, List<ApplicationExitInfo> list) {
        return findRelevantApplicationExitInfo(str, list, new Predicate() { // from class: com.google.firebase.crashlytics.internal.common.o
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return SessionReportingCoordinator.lambda$isOom$5((ApplicationExitInfo) obj);
            }
        }) != null;
    }

    public SortedSet<String> listSortedOpenSessionIds() {
        return this.reportPersistence.getOpenSessionIds();
    }

    public void onBeginSession(String str, long j11) {
        this.reportPersistence.persistReport(this.dataCapture.captureReportData(str, j11));
    }

    public void persistFatalEvent(Throwable th2, Thread thread, String str, long j11) {
        Logger.getLogger().v("Persisting fatal event for session " + str);
        persistEvent(th2, thread, EVENT_TYPE_CRASH, new EventMetadata(str, j11), true);
    }

    public void persistNonFatalEvent(Throwable th2, Thread thread, EventMetadata eventMetadata) {
        Logger.getLogger().v("Persisting non-fatal event for session " + eventMetadata.getSessionId());
        persistEvent(th2, thread, EVENT_TYPE_LOGGED, eventMetadata, false);
    }

    public void persistProfilingManagerInfo(final String str, List<Integer> list, List<ApplicationExitInfo> list2) {
        k2.p(list.stream().findFirst(), new ab.f(1, this, str, list2)).ifPresent(new Consumer() { // from class: com.google.firebase.crashlytics.internal.common.q
            @Override // java.util.function.Consumer
            public final void accept(Object obj) {
                this.f34722a.lambda$persistProfilingManagerInfo$2(str, (Integer) obj);
            }
        });
    }

    public void persistRelevantAppExitInfoEvent(String str, List<ApplicationExitInfo> list, LogFileManager logFileManager, UserMetadata userMetadata) {
        ApplicationExitInfo applicationExitInfoFindRelevantApplicationExitInfo = findRelevantApplicationExitInfo(str, list, new p());
        if (applicationExitInfoFindRelevantApplicationExitInfo == null) {
            Logger.getLogger().v("No relevant ApplicationExitInfo occurred during session: " + str);
            return;
        }
        CrashlyticsReport.Session.Event eventCaptureAnrEventData = this.dataCapture.captureAnrEventData(convertApplicationExitInfo(applicationExitInfoFindRelevantApplicationExitInfo));
        Logger.getLogger().d("Persisting anr for session " + str);
        this.reportPersistence.persistEvent(addRolloutsStateToEvent(addLogsAndCustomKeysToEvent(eventCaptureAnrEventData, logFileManager, userMetadata), userMetadata), str, true);
    }

    public void removeAllReports() {
        this.reportPersistence.deleteAllReports();
    }

    public Task<Void> sendReports(Executor executor) {
        return sendReports(executor, null);
    }

    public Task<Void> sendReports(Executor executor, String str) {
        List<CrashlyticsReportWithSessionId> listLoadFinalizedReports = this.reportPersistence.loadFinalizedReports();
        ArrayList arrayList = new ArrayList();
        for (CrashlyticsReportWithSessionId crashlyticsReportWithSessionId : listLoadFinalizedReports) {
            if (str == null || str.equals(crashlyticsReportWithSessionId.getSessionId())) {
                arrayList.add(this.reportsSender.enqueueReport(ensureHasFid(crashlyticsReportWithSessionId), str != null).i(executor, new ae.i(this, 11)));
            }
        }
        return Tasks.e(arrayList);
    }
}
