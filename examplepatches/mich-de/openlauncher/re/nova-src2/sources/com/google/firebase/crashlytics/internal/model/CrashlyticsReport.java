package com.google.firebase.crashlytics.internal.model;

import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_ApplicationExitInfo;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_ApplicationExitInfo_BuildIdMappingForArch;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_CustomAttribute;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_FilesPayload;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_FilesPayload_File;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_ProfilingManagerInfo;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_ProfilingManagerInfo_ProfilingTrigger;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Application;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Application_Organization;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Device;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_Application;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_Application_Execution;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_Application_Execution_BinaryImage;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_Application_Execution_Exception;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_Application_Execution_Signal;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_Application_Execution_Thread;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_Application_Execution_Thread_Frame;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_Application_ProcessDetails;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_Device;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_Log;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_RolloutAssignment;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_RolloutAssignment_RolloutVariant;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_Event_RolloutsState;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_OperatingSystem;
import com.google.firebase.crashlytics.internal.model.AutoValue_CrashlyticsReport_Session_User;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.nio.charset.Charset;
import java.util.List;

/* loaded from: classes.dex */
public abstract class CrashlyticsReport {
    private static final Charset UTF_8 = Charset.forName("UTF-8");

    public static abstract class ApplicationExitInfo {

        public static abstract class BuildIdMappingForArch {

            /* loaded from: classes3.dex */
            public static abstract class Builder {
                public abstract BuildIdMappingForArch build();

                public abstract Builder setArch(String str);

                public abstract Builder setBuildId(String str);

                public abstract Builder setLibraryName(String str);
            }

            public static Builder builder() {
                return new AutoValue_CrashlyticsReport_ApplicationExitInfo_BuildIdMappingForArch.Builder();
            }

            public abstract String getArch();

            public abstract String getBuildId();

            public abstract String getLibraryName();
        }

        /* loaded from: classes3.dex */
        public static abstract class Builder {
            public abstract ApplicationExitInfo build();

            public abstract Builder setBuildIdMappingForArch(List<BuildIdMappingForArch> list);

            public abstract Builder setImportance(int i5);

            public abstract Builder setPid(int i5);

            public abstract Builder setProcessName(String str);

            public abstract Builder setPss(long j11);

            public abstract Builder setReasonCode(int i5);

            public abstract Builder setRss(long j11);

            public abstract Builder setTimestamp(long j11);

            public abstract Builder setTraceFile(String str);
        }

        public static Builder builder() {
            return new AutoValue_CrashlyticsReport_ApplicationExitInfo.Builder();
        }

        public abstract List<BuildIdMappingForArch> getBuildIdMappingForArch();

        public abstract int getImportance();

        public abstract int getPid();

        public abstract String getProcessName();

        public abstract long getPss();

        public abstract int getReasonCode();

        public abstract long getRss();

        public abstract long getTimestamp();

        public abstract String getTraceFile();
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes3.dex */
    public @interface Architecture {
        public static final int ARM64 = 9;
        public static final int ARMV6 = 5;
        public static final int ARMV7 = 6;
        public static final int UNKNOWN = 7;
        public static final int X86_32 = 0;
        public static final int X86_64 = 1;
    }

    public static abstract class Builder {
        public abstract CrashlyticsReport build();

        public abstract Builder setAppExitInfo(ApplicationExitInfo applicationExitInfo);

        public abstract Builder setAppQualitySessionId(String str);

        public abstract Builder setBuildVersion(String str);

        public abstract Builder setDisplayVersion(String str);

        public abstract Builder setFirebaseAuthenticationToken(String str);

        public abstract Builder setFirebaseInstallationId(String str);

        public abstract Builder setGmpAppId(String str);

        public abstract Builder setInstallationUuid(String str);

        public abstract Builder setNdkPayload(FilesPayload filesPayload);

        public abstract Builder setPlatform(int i5);

        public abstract Builder setSdkVersion(String str);

        public abstract Builder setSession(Session session);
    }

    public static abstract class CustomAttribute {

        /* loaded from: classes3.dex */
        public static abstract class Builder {
            public abstract CustomAttribute build();

            public abstract Builder setKey(String str);

            public abstract Builder setValue(String str);
        }

        public static Builder builder() {
            return new AutoValue_CrashlyticsReport_CustomAttribute.Builder();
        }

        public abstract String getKey();

        public abstract String getValue();
    }

    public static abstract class FilesPayload {

        /* loaded from: classes3.dex */
        public static abstract class Builder {
            public abstract FilesPayload build();

            public abstract Builder setFiles(List<File> list);

            public abstract Builder setOrgId(String str);
        }

        public static abstract class File {

            /* loaded from: classes3.dex */
            public static abstract class Builder {
                public abstract File build();

                public abstract Builder setContents(byte[] bArr);

                public abstract Builder setFilename(String str);
            }

            public static Builder builder() {
                return new AutoValue_CrashlyticsReport_FilesPayload_File.Builder();
            }

            public abstract byte[] getContents();

            public abstract String getFilename();
        }

        public static Builder builder() {
            return new AutoValue_CrashlyticsReport_FilesPayload.Builder();
        }

        public abstract List<File> getFiles();

        public abstract String getOrgId();

        public abstract Builder toBuilder();
    }

    /* loaded from: classes3.dex */
    public static abstract class ProfilingManagerInfo {

        public static abstract class Builder {
            public abstract ProfilingManagerInfo build();

            public abstract Builder setProfilingTrigger(ProfilingTrigger profilingTrigger);
        }

        public static abstract class ProfilingTrigger {

            public static abstract class Builder {
                public abstract ProfilingTrigger build();

                public abstract Builder setTrigger(int i5);
            }

            public static Builder builder() {
                return new AutoValue_CrashlyticsReport_ProfilingManagerInfo_ProfilingTrigger.Builder();
            }

            public abstract int getTrigger();
        }

        public static Builder builder() {
            return new AutoValue_CrashlyticsReport_ProfilingManagerInfo.Builder();
        }

        public abstract ProfilingTrigger getProfilingTrigger();
    }

    public static abstract class Session {

        public static abstract class Application {

            public static abstract class Builder {
                public abstract Application build();

                public abstract Builder setDevelopmentPlatform(String str);

                public abstract Builder setDevelopmentPlatformVersion(String str);

                public abstract Builder setDisplayVersion(String str);

                public abstract Builder setIdentifier(String str);

                public abstract Builder setInstallationUuid(String str);

                public abstract Builder setOrganization(Organization organization);

                public abstract Builder setVersion(String str);
            }

            public static abstract class Organization {

                /* loaded from: classes3.dex */
                public static abstract class Builder {
                    public abstract Organization build();

                    public abstract Builder setClsId(String str);
                }

                public static Builder builder() {
                    return new AutoValue_CrashlyticsReport_Session_Application_Organization.Builder();
                }

                public abstract String getClsId();

                public abstract Builder toBuilder();
            }

            public static Builder builder() {
                return new AutoValue_CrashlyticsReport_Session_Application.Builder();
            }

            public abstract String getDevelopmentPlatform();

            public abstract String getDevelopmentPlatformVersion();

            public abstract String getDisplayVersion();

            public abstract String getIdentifier();

            public abstract String getInstallationUuid();

            public abstract Organization getOrganization();

            public abstract String getVersion();

            public abstract Builder toBuilder();

            public Application withOrganizationId(String str) {
                Organization organization = getOrganization();
                return toBuilder().setOrganization((organization != null ? organization.toBuilder() : Organization.builder()).setClsId(str).build()).build();
            }
        }

        public static abstract class Builder {
            public abstract Session build();

            public abstract Builder setApp(Application application);

            public abstract Builder setAppQualitySessionId(String str);

            public abstract Builder setCrashed(boolean z11);

            public abstract Builder setDevice(Device device);

            public abstract Builder setEndedAt(Long l9);

            public abstract Builder setEvents(List<Event> list);

            public abstract Builder setGenerator(String str);

            public abstract Builder setGeneratorType(int i5);

            public abstract Builder setIdentifier(String str);

            public Builder setIdentifierFromUtf8Bytes(byte[] bArr) {
                return setIdentifier(new String(bArr, CrashlyticsReport.UTF_8));
            }

            public abstract Builder setOs(OperatingSystem operatingSystem);

            public abstract Builder setStartedAt(long j11);

            public abstract Builder setUser(User user);
        }

        public static abstract class Device {

            public static abstract class Builder {
                public abstract Device build();

                public abstract Builder setArch(int i5);

                public abstract Builder setCores(int i5);

                public abstract Builder setDiskSpace(long j11);

                public abstract Builder setManufacturer(String str);

                public abstract Builder setModel(String str);

                public abstract Builder setModelClass(String str);

                public abstract Builder setRam(long j11);

                public abstract Builder setSimulator(boolean z11);

                public abstract Builder setState(int i5);
            }

            public static Builder builder() {
                return new AutoValue_CrashlyticsReport_Session_Device.Builder();
            }

            public abstract int getArch();

            public abstract int getCores();

            public abstract long getDiskSpace();

            public abstract String getManufacturer();

            public abstract String getModel();

            public abstract String getModelClass();

            public abstract long getRam();

            public abstract int getState();

            public abstract boolean isSimulator();
        }

        public static abstract class Event {

            public static abstract class Application {

                /* loaded from: classes3.dex */
                public static abstract class Builder {
                    public abstract Application build();

                    public abstract Builder setAppProcessDetails(List<ProcessDetails> list);

                    public abstract Builder setBackground(Boolean bool);

                    public abstract Builder setCurrentProcessDetails(ProcessDetails processDetails);

                    public abstract Builder setCustomAttributes(List<CustomAttribute> list);

                    public abstract Builder setExecution(Execution execution);

                    public abstract Builder setInternalKeys(List<CustomAttribute> list);

                    public abstract Builder setUiOrientation(int i5);
                }

                public static abstract class Execution {

                    public static abstract class BinaryImage {

                        /* loaded from: classes3.dex */
                        public static abstract class Builder {
                            public abstract BinaryImage build();

                            public abstract Builder setBaseAddress(long j11);

                            public abstract Builder setName(String str);

                            public abstract Builder setSize(long j11);

                            public abstract Builder setUuid(String str);

                            public Builder setUuidFromUtf8Bytes(byte[] bArr) {
                                return setUuid(new String(bArr, CrashlyticsReport.UTF_8));
                            }
                        }

                        public static Builder builder() {
                            return new AutoValue_CrashlyticsReport_Session_Event_Application_Execution_BinaryImage.Builder();
                        }

                        public abstract long getBaseAddress();

                        public abstract String getName();

                        public abstract long getSize();

                        public abstract String getUuid();

                        public byte[] getUuidUtf8Bytes() {
                            String uuid = getUuid();
                            if (uuid != null) {
                                return uuid.getBytes(CrashlyticsReport.UTF_8);
                            }
                            return null;
                        }
                    }

                    /* loaded from: classes3.dex */
                    public static abstract class Builder {
                        public abstract Execution build();

                        public abstract Builder setAppExitInfo(ApplicationExitInfo applicationExitInfo);

                        public abstract Builder setBinaries(List<BinaryImage> list);

                        public abstract Builder setException(Exception exception);

                        public abstract Builder setProfilingManagerInfo(ProfilingManagerInfo profilingManagerInfo);

                        public abstract Builder setSignal(Signal signal);

                        public abstract Builder setThreads(List<Thread> list);
                    }

                    public static abstract class Exception {

                        /* loaded from: classes3.dex */
                        public static abstract class Builder {
                            public abstract Exception build();

                            public abstract Builder setCausedBy(Exception exception);

                            public abstract Builder setFrames(List<Thread.Frame> list);

                            public abstract Builder setOverflowCount(int i5);

                            public abstract Builder setReason(String str);

                            public abstract Builder setType(String str);
                        }

                        public static Builder builder() {
                            return new AutoValue_CrashlyticsReport_Session_Event_Application_Execution_Exception.Builder();
                        }

                        public abstract Exception getCausedBy();

                        public abstract List<Thread.Frame> getFrames();

                        public abstract int getOverflowCount();

                        public abstract String getReason();

                        public abstract String getType();
                    }

                    public static abstract class Signal {

                        /* loaded from: classes3.dex */
                        public static abstract class Builder {
                            public abstract Signal build();

                            public abstract Builder setAddress(long j11);

                            public abstract Builder setCode(String str);

                            public abstract Builder setName(String str);
                        }

                        public static Builder builder() {
                            return new AutoValue_CrashlyticsReport_Session_Event_Application_Execution_Signal.Builder();
                        }

                        public abstract long getAddress();

                        public abstract String getCode();

                        public abstract String getName();
                    }

                    public static abstract class Thread {

                        /* loaded from: classes3.dex */
                        public static abstract class Builder {
                            public abstract Thread build();

                            public abstract Builder setFrames(List<Frame> list);

                            public abstract Builder setImportance(int i5);

                            public abstract Builder setName(String str);
                        }

                        public static abstract class Frame {

                            /* loaded from: classes3.dex */
                            public static abstract class Builder {
                                public abstract Frame build();

                                public abstract Builder setFile(String str);

                                public abstract Builder setImportance(int i5);

                                public abstract Builder setOffset(long j11);

                                public abstract Builder setPc(long j11);

                                public abstract Builder setSymbol(String str);
                            }

                            public static Builder builder() {
                                return new AutoValue_CrashlyticsReport_Session_Event_Application_Execution_Thread_Frame.Builder();
                            }

                            public abstract String getFile();

                            public abstract int getImportance();

                            public abstract long getOffset();

                            public abstract long getPc();

                            public abstract String getSymbol();
                        }

                        public static Builder builder() {
                            return new AutoValue_CrashlyticsReport_Session_Event_Application_Execution_Thread.Builder();
                        }

                        public abstract List<Frame> getFrames();

                        public abstract int getImportance();

                        public abstract String getName();
                    }

                    public static Builder builder() {
                        return new AutoValue_CrashlyticsReport_Session_Event_Application_Execution.Builder();
                    }

                    public abstract ApplicationExitInfo getAppExitInfo();

                    public abstract List<BinaryImage> getBinaries();

                    public abstract Exception getException();

                    public abstract ProfilingManagerInfo getProfilingManagerInfo();

                    public abstract Signal getSignal();

                    public abstract List<Thread> getThreads();

                    public abstract Builder toBuilder();
                }

                public static abstract class ProcessDetails {

                    public static abstract class Builder {
                        public abstract ProcessDetails build();

                        public abstract Builder setDefaultProcess(boolean z11);

                        public abstract Builder setImportance(int i5);

                        public abstract Builder setPid(int i5);

                        public abstract Builder setProcessName(String str);
                    }

                    public static Builder builder() {
                        return new AutoValue_CrashlyticsReport_Session_Event_Application_ProcessDetails.Builder();
                    }

                    public abstract int getImportance();

                    public abstract int getPid();

                    public abstract String getProcessName();

                    public abstract boolean isDefaultProcess();
                }

                public static Builder builder() {
                    return new AutoValue_CrashlyticsReport_Session_Event_Application.Builder();
                }

                public abstract List<ProcessDetails> getAppProcessDetails();

                public abstract Boolean getBackground();

                public abstract ProcessDetails getCurrentProcessDetails();

                public abstract List<CustomAttribute> getCustomAttributes();

                public abstract Execution getExecution();

                public abstract List<CustomAttribute> getInternalKeys();

                public abstract int getUiOrientation();

                public abstract Builder toBuilder();
            }

            /* loaded from: classes3.dex */
            public static abstract class Builder {
                public abstract Event build();

                public abstract Builder setApp(Application application);

                public abstract Builder setDevice(Device device);

                public abstract Builder setLog(Log log);

                public abstract Builder setRollouts(RolloutsState rolloutsState);

                public abstract Builder setTimestamp(long j11);

                public abstract Builder setType(String str);
            }

            public static abstract class Device {

                /* loaded from: classes3.dex */
                public static abstract class Builder {
                    public abstract Device build();

                    public abstract Builder setBatteryLevel(Double d5);

                    public abstract Builder setBatteryVelocity(int i5);

                    public abstract Builder setDiskUsed(long j11);

                    public abstract Builder setOrientation(int i5);

                    public abstract Builder setProximityOn(boolean z11);

                    public abstract Builder setRamUsed(long j11);
                }

                public static Builder builder() {
                    return new AutoValue_CrashlyticsReport_Session_Event_Device.Builder();
                }

                public abstract Double getBatteryLevel();

                public abstract int getBatteryVelocity();

                public abstract long getDiskUsed();

                public abstract int getOrientation();

                public abstract long getRamUsed();

                public abstract boolean isProximityOn();
            }

            public static abstract class Log {

                /* loaded from: classes3.dex */
                public static abstract class Builder {
                    public abstract Log build();

                    public abstract Builder setContent(String str);
                }

                public static Builder builder() {
                    return new AutoValue_CrashlyticsReport_Session_Event_Log.Builder();
                }

                public abstract String getContent();
            }

            public static abstract class RolloutAssignment {

                /* loaded from: classes3.dex */
                public static abstract class Builder {
                    public abstract RolloutAssignment build();

                    public abstract Builder setParameterKey(String str);

                    public abstract Builder setParameterValue(String str);

                    public abstract Builder setRolloutVariant(RolloutVariant rolloutVariant);

                    public abstract Builder setTemplateVersion(long j11);
                }

                public static abstract class RolloutVariant {

                    /* loaded from: classes3.dex */
                    public static abstract class Builder {
                        public abstract RolloutVariant build();

                        public abstract Builder setRolloutId(String str);

                        public abstract Builder setVariantId(String str);
                    }

                    public static Builder builder() {
                        return new AutoValue_CrashlyticsReport_Session_Event_RolloutAssignment_RolloutVariant.Builder();
                    }

                    public abstract String getRolloutId();

                    public abstract String getVariantId();
                }

                public static Builder builder() {
                    return new AutoValue_CrashlyticsReport_Session_Event_RolloutAssignment.Builder();
                }

                public abstract String getParameterKey();

                public abstract String getParameterValue();

                public abstract RolloutVariant getRolloutVariant();

                public abstract long getTemplateVersion();
            }

            public static abstract class RolloutsState {

                /* loaded from: classes3.dex */
                public static abstract class Builder {
                    public abstract RolloutsState build();

                    public abstract Builder setRolloutAssignments(List<RolloutAssignment> list);
                }

                public static Builder builder() {
                    return new AutoValue_CrashlyticsReport_Session_Event_RolloutsState.Builder();
                }

                public abstract List<RolloutAssignment> getRolloutAssignments();
            }

            public static Builder builder() {
                return new AutoValue_CrashlyticsReport_Session_Event.Builder();
            }

            public abstract Application getApp();

            public abstract Device getDevice();

            public abstract Log getLog();

            public abstract RolloutsState getRollouts();

            public abstract long getTimestamp();

            public abstract String getType();

            public abstract Builder toBuilder();
        }

        public static abstract class OperatingSystem {

            public static abstract class Builder {
                public abstract OperatingSystem build();

                public abstract Builder setBuildVersion(String str);

                public abstract Builder setJailbroken(boolean z11);

                public abstract Builder setPlatform(int i5);

                public abstract Builder setVersion(String str);
            }

            public static Builder builder() {
                return new AutoValue_CrashlyticsReport_Session_OperatingSystem.Builder();
            }

            public abstract String getBuildVersion();

            public abstract int getPlatform();

            public abstract String getVersion();

            public abstract boolean isJailbroken();
        }

        public static abstract class User {

            /* loaded from: classes3.dex */
            public static abstract class Builder {
                public abstract User build();

                public abstract Builder setIdentifier(String str);
            }

            public static Builder builder() {
                return new AutoValue_CrashlyticsReport_Session_User.Builder();
            }

            public abstract String getIdentifier();
        }

        public static Builder builder() {
            return new AutoValue_CrashlyticsReport_Session.Builder().setCrashed(false);
        }

        public abstract Application getApp();

        public abstract String getAppQualitySessionId();

        public abstract Device getDevice();

        public abstract Long getEndedAt();

        public abstract List<Event> getEvents();

        public abstract String getGenerator();

        public abstract int getGeneratorType();

        public abstract String getIdentifier();

        public byte[] getIdentifierUtf8Bytes() {
            return getIdentifier().getBytes(CrashlyticsReport.UTF_8);
        }

        public abstract OperatingSystem getOs();

        public abstract long getStartedAt();

        public abstract User getUser();

        public abstract boolean isCrashed();

        public abstract Builder toBuilder();

        public Session withAppQualitySessionId(String str) {
            return toBuilder().setAppQualitySessionId(str).build();
        }

        public Session withEvents(List<Event> list) {
            return toBuilder().setEvents(list).build();
        }

        public Session withOrganizationId(String str) {
            return toBuilder().setApp(getApp().withOrganizationId(str)).build();
        }

        public Session withSessionEndFields(long j11, boolean z11, String str) {
            Builder builder = toBuilder();
            builder.setEndedAt(Long.valueOf(j11));
            builder.setCrashed(z11);
            if (str != null) {
                builder.setUser(User.builder().setIdentifier(str).build());
            }
            return builder.build();
        }
    }

    /* loaded from: classes3.dex */
    public enum Type {
        INCOMPLETE,
        JAVA,
        NATIVE
    }

    public static Builder builder() {
        return new AutoValue_CrashlyticsReport.Builder();
    }

    public abstract ApplicationExitInfo getAppExitInfo();

    public abstract String getAppQualitySessionId();

    public abstract String getBuildVersion();

    public abstract String getDisplayVersion();

    public abstract String getFirebaseAuthenticationToken();

    public abstract String getFirebaseInstallationId();

    public abstract String getGmpAppId();

    public abstract String getInstallationUuid();

    public abstract FilesPayload getNdkPayload();

    public abstract int getPlatform();

    public abstract String getSdkVersion();

    public abstract Session getSession();

    public Type getType() {
        return getSession() != null ? Type.JAVA : getNdkPayload() != null ? Type.NATIVE : Type.INCOMPLETE;
    }

    public abstract Builder toBuilder();

    public CrashlyticsReport withAppQualitySessionId(String str) {
        Builder appQualitySessionId = toBuilder().setAppQualitySessionId(str);
        if (getSession() != null) {
            appQualitySessionId.setSession(getSession().withAppQualitySessionId(str));
        }
        return appQualitySessionId.build();
    }

    public CrashlyticsReport withApplicationExitInfo(ApplicationExitInfo applicationExitInfo) {
        return applicationExitInfo == null ? this : toBuilder().setAppExitInfo(applicationExitInfo).build();
    }

    public CrashlyticsReport withEvents(List<Session.Event> list) {
        if (getSession() != null) {
            return toBuilder().setSession(getSession().withEvents(list)).build();
        }
        throw new IllegalStateException("Reports without sessions cannot have events added to them.");
    }

    public CrashlyticsReport withFirebaseAuthenticationToken(String str) {
        return toBuilder().setFirebaseAuthenticationToken(str).build();
    }

    public CrashlyticsReport withFirebaseInstallationId(String str) {
        return toBuilder().setFirebaseInstallationId(str).build();
    }

    public CrashlyticsReport withNdkPayload(FilesPayload filesPayload) {
        return toBuilder().setSession(null).setNdkPayload(filesPayload).build();
    }

    public CrashlyticsReport withOrganizationId(String str) {
        Builder builder = toBuilder();
        FilesPayload ndkPayload = getNdkPayload();
        if (ndkPayload != null) {
            builder.setNdkPayload(ndkPayload.toBuilder().setOrgId(str).build());
        }
        Session session = getSession();
        if (session != null) {
            builder.setSession(session.withOrganizationId(str));
        }
        return builder.build();
    }

    public CrashlyticsReport withSessionEndFields(long j11, boolean z11, String str) {
        Builder builder = toBuilder();
        if (getSession() != null) {
            builder.setSession(getSession().withSessionEndFields(j11, z11, str));
        }
        return builder.build();
    }
}
