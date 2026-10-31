package com.google.firebase.crashlytics.internal.model;

import a2.c;
import a80.m;
import com.google.firebase.crashlytics.internal.model.CrashlyticsReport;
import java.util.List;

/* loaded from: classes.dex */
final class AutoValue_CrashlyticsReport_Session_Event_Application_Execution extends CrashlyticsReport.Session.Event.Application.Execution {
    private final CrashlyticsReport.ApplicationExitInfo appExitInfo;
    private final List<CrashlyticsReport.Session.Event.Application.Execution.BinaryImage> binaries;
    private final CrashlyticsReport.Session.Event.Application.Execution.Exception exception;
    private final CrashlyticsReport.ProfilingManagerInfo profilingManagerInfo;
    private final CrashlyticsReport.Session.Event.Application.Execution.Signal signal;
    private final List<CrashlyticsReport.Session.Event.Application.Execution.Thread> threads;

    /* loaded from: classes3.dex */
    public static final class Builder extends CrashlyticsReport.Session.Event.Application.Execution.Builder {
        private CrashlyticsReport.ApplicationExitInfo appExitInfo;
        private List<CrashlyticsReport.Session.Event.Application.Execution.BinaryImage> binaries;
        private CrashlyticsReport.Session.Event.Application.Execution.Exception exception;
        private CrashlyticsReport.ProfilingManagerInfo profilingManagerInfo;
        private CrashlyticsReport.Session.Event.Application.Execution.Signal signal;
        private List<CrashlyticsReport.Session.Event.Application.Execution.Thread> threads;

        @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution.Builder
        public CrashlyticsReport.Session.Event.Application.Execution build() {
            List<CrashlyticsReport.Session.Event.Application.Execution.BinaryImage> list;
            CrashlyticsReport.Session.Event.Application.Execution.Signal signal = this.signal;
            if (signal != null && (list = this.binaries) != null) {
                return new AutoValue_CrashlyticsReport_Session_Event_Application_Execution(this.threads, this.exception, this.appExitInfo, this.profilingManagerInfo, signal, list);
            }
            StringBuilder sb2 = new StringBuilder();
            if (this.signal == null) {
                sb2.append(" signal");
            }
            if (this.binaries == null) {
                sb2.append(" binaries");
            }
            throw new IllegalStateException(c.k("Missing required properties:", sb2));
        }

        @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution.Builder
        public CrashlyticsReport.Session.Event.Application.Execution.Builder setAppExitInfo(CrashlyticsReport.ApplicationExitInfo applicationExitInfo) {
            this.appExitInfo = applicationExitInfo;
            return this;
        }

        @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution.Builder
        public CrashlyticsReport.Session.Event.Application.Execution.Builder setBinaries(List<CrashlyticsReport.Session.Event.Application.Execution.BinaryImage> list) {
            if (list == null) {
                throw new NullPointerException("Null binaries");
            }
            this.binaries = list;
            return this;
        }

        @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution.Builder
        public CrashlyticsReport.Session.Event.Application.Execution.Builder setException(CrashlyticsReport.Session.Event.Application.Execution.Exception exception) {
            this.exception = exception;
            return this;
        }

        @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution.Builder
        public CrashlyticsReport.Session.Event.Application.Execution.Builder setProfilingManagerInfo(CrashlyticsReport.ProfilingManagerInfo profilingManagerInfo) {
            this.profilingManagerInfo = profilingManagerInfo;
            return this;
        }

        @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution.Builder
        public CrashlyticsReport.Session.Event.Application.Execution.Builder setSignal(CrashlyticsReport.Session.Event.Application.Execution.Signal signal) {
            if (signal == null) {
                throw new NullPointerException("Null signal");
            }
            this.signal = signal;
            return this;
        }

        @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution.Builder
        public CrashlyticsReport.Session.Event.Application.Execution.Builder setThreads(List<CrashlyticsReport.Session.Event.Application.Execution.Thread> list) {
            this.threads = list;
            return this;
        }

        public Builder() {
        }

        private Builder(CrashlyticsReport.Session.Event.Application.Execution execution) {
            this.threads = execution.getThreads();
            this.exception = execution.getException();
            this.appExitInfo = execution.getAppExitInfo();
            this.profilingManagerInfo = execution.getProfilingManagerInfo();
            this.signal = execution.getSignal();
            this.binaries = execution.getBinaries();
        }
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof CrashlyticsReport.Session.Event.Application.Execution) {
            CrashlyticsReport.Session.Event.Application.Execution execution = (CrashlyticsReport.Session.Event.Application.Execution) obj;
            List<CrashlyticsReport.Session.Event.Application.Execution.Thread> list = this.threads;
            if (list != null ? list.equals(execution.getThreads()) : execution.getThreads() == null) {
                CrashlyticsReport.Session.Event.Application.Execution.Exception exception = this.exception;
                if (exception != null ? exception.equals(execution.getException()) : execution.getException() == null) {
                    CrashlyticsReport.ApplicationExitInfo applicationExitInfo = this.appExitInfo;
                    if (applicationExitInfo != null ? applicationExitInfo.equals(execution.getAppExitInfo()) : execution.getAppExitInfo() == null) {
                        CrashlyticsReport.ProfilingManagerInfo profilingManagerInfo = this.profilingManagerInfo;
                        if (profilingManagerInfo != null ? profilingManagerInfo.equals(execution.getProfilingManagerInfo()) : execution.getProfilingManagerInfo() == null) {
                            if (this.signal.equals(execution.getSignal()) && this.binaries.equals(execution.getBinaries())) {
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution
    public CrashlyticsReport.ApplicationExitInfo getAppExitInfo() {
        return this.appExitInfo;
    }

    @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution
    public List<CrashlyticsReport.Session.Event.Application.Execution.BinaryImage> getBinaries() {
        return this.binaries;
    }

    @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution
    public CrashlyticsReport.Session.Event.Application.Execution.Exception getException() {
        return this.exception;
    }

    @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution
    public CrashlyticsReport.ProfilingManagerInfo getProfilingManagerInfo() {
        return this.profilingManagerInfo;
    }

    @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution
    public CrashlyticsReport.Session.Event.Application.Execution.Signal getSignal() {
        return this.signal;
    }

    @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution
    public List<CrashlyticsReport.Session.Event.Application.Execution.Thread> getThreads() {
        return this.threads;
    }

    public int hashCode() {
        List<CrashlyticsReport.Session.Event.Application.Execution.Thread> list = this.threads;
        int iHashCode = ((list == null ? 0 : list.hashCode()) ^ 1000003) * 1000003;
        CrashlyticsReport.Session.Event.Application.Execution.Exception exception = this.exception;
        int iHashCode2 = (iHashCode ^ (exception == null ? 0 : exception.hashCode())) * 1000003;
        CrashlyticsReport.ApplicationExitInfo applicationExitInfo = this.appExitInfo;
        int iHashCode3 = (iHashCode2 ^ (applicationExitInfo == null ? 0 : applicationExitInfo.hashCode())) * 1000003;
        CrashlyticsReport.ProfilingManagerInfo profilingManagerInfo = this.profilingManagerInfo;
        return ((((iHashCode3 ^ (profilingManagerInfo != null ? profilingManagerInfo.hashCode() : 0)) * 1000003) ^ this.signal.hashCode()) * 1000003) ^ this.binaries.hashCode();
    }

    @Override // com.google.firebase.crashlytics.internal.model.CrashlyticsReport.Session.Event.Application.Execution
    public CrashlyticsReport.Session.Event.Application.Execution.Builder toBuilder() {
        return new Builder(this);
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("Execution{threads=");
        sb2.append(this.threads);
        sb2.append(", exception=");
        sb2.append(this.exception);
        sb2.append(", appExitInfo=");
        sb2.append(this.appExitInfo);
        sb2.append(", profilingManagerInfo=");
        sb2.append(this.profilingManagerInfo);
        sb2.append(", signal=");
        sb2.append(this.signal);
        sb2.append(", binaries=");
        return m.j(sb2, this.binaries, "}");
    }

    private AutoValue_CrashlyticsReport_Session_Event_Application_Execution(List<CrashlyticsReport.Session.Event.Application.Execution.Thread> list, CrashlyticsReport.Session.Event.Application.Execution.Exception exception, CrashlyticsReport.ApplicationExitInfo applicationExitInfo, CrashlyticsReport.ProfilingManagerInfo profilingManagerInfo, CrashlyticsReport.Session.Event.Application.Execution.Signal signal, List<CrashlyticsReport.Session.Event.Application.Execution.BinaryImage> list2) {
        this.threads = list;
        this.exception = exception;
        this.appExitInfo = applicationExitInfo;
        this.profilingManagerInfo = profilingManagerInfo;
        this.signal = signal;
        this.binaries = list2;
    }
}
