package sprig.view;

import android.app.Activity;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import com.userleap.EventName;
import com.userleap.SprigEvent;
import com.userleap.SprigLoggingLevel;
import com.userleap.internal.data.GenerateVideoUploadUrlPayload;
import com.userleap.internal.data.ReplayRequest;
import defpackage.c1e;
import defpackage.co6;
import defpackage.cu1;
import defpackage.dh7;
import defpackage.ei7;
import defpackage.en7;
import defpackage.f09;
import defpackage.fn7;
import defpackage.g76;
import defpackage.gbd;
import defpackage.gy2;
import defpackage.jhf;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.no7;
import defpackage.o7f;
import defpackage.qbb;
import defpackage.r13;
import defpackage.rbb;
import defpackage.sbb;
import defpackage.vx0;
import defpackage.vz2;
import defpackage.whf;
import defpackage.x2b;
import defpackage.x45;
import defpackage.xg3;
import defpackage.ygf;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import org.json.JSONException;
import org.json.JSONObject;
import sprig.b.g;
import sprig.g.a;
import sprig.g.b;
import sprig.g.c;
import sprig.graphics.EnumC0050b;
import sprig.graphics.l;
import sprig.view.b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000n\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\r\b \u0018\u0000 C2\u00020\u0001:\u0001!B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0007\u0010\bJ\u0017\u0010\r\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\tH\u0000¢\u0006\u0004\b\u000b\u0010\fJ\u0015\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u0010\u0010\u0011J\u001d\u0010\u0014\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0013\u001a\u00020\u0012¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0016\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u0016\u0010\u0011J\u0015\u0010\u0017\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0017\u0010\bJ\u0015\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u0019\u0010\u001aJ\u0017\u0010\u001b\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0004¢\u0006\u0004\b\u001b\u0010\bJ+\u0010\u001f\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0012\u0010\u001e\u001a\u000e\u0012\u0004\u0012\u00020\u001d\u0012\u0004\u0012\u00020\u00060\u001cH\u0014¢\u0006\u0004\b\u001f\u0010 J\u0017\u0010!\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\tH\u0002¢\u0006\u0004\b!\u0010\fJ\u0017\u0010$\u001a\u00020\u00062\u0006\u0010#\u001a\u00020\"H\u0002¢\u0006\u0004\b$\u0010%J\u0017\u0010!\u001a\u00020\u00182\u0006\u0010#\u001a\u00020\"H\u0002¢\u0006\u0004\b!\u0010&J\u0017\u0010!\u001a\u00020\u00182\u0006\u0010\u000f\u001a\u00020\u000eH\u0002¢\u0006\u0004\b!\u0010\u001aJ\u0017\u0010$\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002¢\u0006\u0004\b$\u0010\bJ\u0017\u0010!\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002¢\u0006\u0004\b!\u0010\bR\u0014\u0010)\u001a\u00020'8\u0002X\u0082D¢\u0006\u0006\n\u0004\b!\u0010(R%\u0010.\u001a\u0010\u0012\u0004\u0012\u00020\u000e\u0012\u0006\u0012\u0004\u0018\u00010\u00040*8\u0006¢\u0006\f\n\u0004\b$\u0010+\u001a\u0004\b,\u0010-R$\u00106\u001a\u0004\u0018\u00010/8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b0\u00101\u001a\u0004\b2\u00103\"\u0004\b4\u00105R\u001a\u0010<\u001a\u0002078\u0000X\u0080\u0004¢\u0006\f\n\u0004\b8\u00109\u001a\u0004\b:\u0010;R(\u0010?\u001a\u0010\u0012\u0004\u0012\u00020\u000e\u0012\u0006\u0012\u0004\u0018\u00010\u00180*8\u0000X\u0080\u0004¢\u0006\f\n\u0004\b=\u0010+\u001a\u0004\b>\u0010-R\u0016\u0010B\u001a\u00020\u00188\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b@\u0010A¨\u0006D"}, d2 = {"Lsprig/d/a;", "", "<init>", "()V", "Lcom/userleap/internal/data/ReplayRequest;", "replayRequest", "Lc1e;", "startRecordingSession", "(Lcom/userleap/internal/data/ReplayRequest;)V", "Lsprig/h/b;", "reason", "stopRecording$userleap_release", "(Lsprig/h/b;)V", "stopRecording", "", "surveyId", "surveyForSessionHasBeenAnswered", "(I)V", "Lsprig/g/b;", "sessionRecorderOutcome", "sessionRecordingHasEnded", "(Lcom/userleap/internal/data/ReplayRequest;Lsprig/g/b;)V", "surveyForSessionHasEnded", "reportSessionCompleteAndUploadRecording", "", "sessionReplayReadyToBeUploaded", "(I)Z", "uploadSession", "Lkotlin/Function1;", "Lsprig/g/a;", "completion", "reportSessionReplayComplete", "(Lcom/userleap/internal/data/ReplayRequest;Lx45;)V", "a", "Landroid/content/Context;", "context", "b", "(Landroid/content/Context;)V", "(Landroid/content/Context;)Z", "", "Ljava/lang/String;", "TAG", "", "Ljava/util/Map;", "getReplayRequestsInProgress", "()Ljava/util/Map;", "replayRequestsInProgress", "Lsprig/d/c;", "c", "Lsprig/d/c;", "getCurrentSessionReplay", "()Lsprig/d/c;", "setCurrentSessionReplay", "(Lsprig/d/c;)V", "currentSessionReplay", "Lsprig/j/e;", "d", "Lsprig/j/e;", "getLogger$userleap_release", "()Lsprig/j/e;", "logger", "e", "getSurveysAnswered$userleap_release", "surveysAnswered", "f", "Z", "memoryListenerRegistered", "Companion", "userleap_release"}, k = 1, mv = {1, 8, 0})
public abstract class a {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    public static a g = new sprig.graphics.b();

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public sprig.view.c currentSessionReplay;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    public boolean memoryListenerRegistered;

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final String TAG = "SessionManager";

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final Map replayRequestsInProgress = new LinkedHashMap();

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public final sprig.j.e logger = new sprig.j.e();

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public final Map surveysAnswered = new LinkedHashMap();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0005\u0010\u0006J\u0017\u0010\t\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"sprig/d/a$b", "Landroid/content/ComponentCallbacks2;", "", "level", "Lc1e;", "onTrimMemory", "(I)V", "Landroid/content/res/Configuration;", "newConfig", "onConfigurationChanged", "(Landroid/content/res/Configuration;)V", "onLowMemory", "()V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class b implements ComponentCallbacks2 {
        public b() {
        }

        @Override // android.content.ComponentCallbacks
        public void onConfigurationChanged(Configuration newConfig) {
            newConfig.getClass();
        }

        @Override // android.content.ComponentCallbacks
        public void onLowMemory() throws JSONException {
            sprig.j.e.logError$default(a.this.getLogger(), "Memory pressure", null, "Stopping recording due to memory pressure", null, null, null, 58, null);
            a.this.stopRecording$userleap_release(EnumC0050b.LOW_MEMORY);
        }

        @Override // android.content.ComponentCallbacks2
        public void onTrimMemory(int level) {
            if (level >= 15) {
                String unused = a.this.TAG;
                a.this.stopRecording$userleap_release(EnumC0050b.CRITICAL_LOW_MEMORY);
            } else if (level >= 5) {
                String unused2 = a.this.TAG;
            } else if (level >= 10) {
                String unused3 = a.this.TAG;
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0005\u0010\u0006J\u001b\u0010\n\u001a\u00020\u00042\n\u0010\t\u001a\u00060\u0007j\u0002`\bH\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u001b\u0010\f\u001a\u00020\u00042\n\u0010\t\u001a\u00060\u0007j\u0002`\bH\u0016¢\u0006\u0004\b\f\u0010\u000b¨\u0006\r"}, d2 = {"sprig/d/a$d", "Lwhf;", "", "response", "Lc1e;", "onSuccess", "(Ljava/lang/String;)V", "Ljava/lang/Exception;", "Lkotlin/Exception;", "exception", "onException", "(Ljava/lang/Exception;)V", "onFailure", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class d implements whf {
        final /* synthetic */ x45 $completion;
        final /* synthetic */ b.C0022b $successOutcome;

        public d(x45 x45Var, b.C0022b c0022b) {
            this.$completion = x45Var;
            this.$successOutcome = c0022b;
        }

        @Override // defpackage.whf
        public void onException(Exception exception) {
            exception.getClass();
            this.$completion.invoke(new a.C0021a(exception));
        }

        @Override // defpackage.whf
        public void onFailure(Exception exception) {
            exception.getClass();
            this.$completion.invoke(new a.C0021a(exception));
        }

        @Override // defpackage.whf
        public void onSuccess(String response) {
            response.getClass();
            sprig.b.b bVar = sprig.b.b.INSTANCE;
            bVar.onEvent(new SprigEvent(EventName.REPLAY_EVENTS_UPLOAD_COMPLETED, null));
            bVar.onEvent(new SprigEvent(EventName.REPLAY_EVENTS_UPLOADED_COMPLETED, null));
            this.$completion.invoke(new a.b(this.$successOutcome.getLocalFileUrl()));
        }
    }

    public final void a(EnumC0050b reason) {
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Cleaning up session state. Reason: " + reason + ", Active requests: " + this.replayRequestsInProgress.size(), null, 0, 6, null);
        this.currentSessionReplay = null;
        for (ReplayRequest replayRequest : this.replayRequestsInProgress.values()) {
            if (replayRequest != null) {
                URL sessionRecordingFileUrl = replayRequest.getSessionRecordingFileUrl();
                if (sessionRecordingFileUrl != null) {
                    try {
                        File file = new File(sessionRecordingFileUrl.toURI());
                        if (file.exists()) {
                            boolean zDelete = file.delete();
                            sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Cleanup file: " + file.getPath() + ", Deleted: " + zDelete, null, 0, 6, null);
                        }
                    } catch (Exception e2) {
                        sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Failed to delete recording file: ", e2.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
                    }
                }
                replayRequest.setSessionRecorderOutcome(null);
                replayRequest.setSessionRecordingFileUrl(null);
            }
        }
        this.replayRequestsInProgress.clear();
        this.surveysAnswered.clear();
        l.INSTANCE.get$userleap_release().clearQueue();
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Session state cleaned up. Reason: " + reason, null, 0, 6, null);
    }

    public final void b(ReplayRequest replayRequest) {
        if (this.replayRequestsInProgress.get(Integer.valueOf(replayRequest.getSurveyId())) != null) {
            l.INSTANCE.get$userleap_release().queueSessionForUploading(replayRequest);
        } else {
            a(replayRequest);
        }
    }

    public final sprig.view.c getCurrentSessionReplay() {
        return this.currentSessionReplay;
    }

    /* JADX INFO: renamed from: getLogger$userleap_release, reason: from getter */
    public final sprig.j.e getLogger() {
        return this.logger;
    }

    public final Map<Integer, ReplayRequest> getReplayRequestsInProgress() {
        return this.replayRequestsInProgress;
    }

    public final Map<Integer, Boolean> getSurveysAnswered$userleap_release() {
        return this.surveysAnswered;
    }

    public final void reportSessionCompleteAndUploadRecording(ReplayRequest replayRequest) {
        replayRequest.getClass();
        if (((ReplayRequest) this.replayRequestsInProgress.get(Integer.valueOf(replayRequest.getSurveyId()))) == null) {
            a(replayRequest);
        } else if (replayRequest.getSessionRecorderOutcome() instanceof b.C0022b) {
            reportSessionReplayComplete(replayRequest, new c(replayRequest));
        }
    }

    public final void sessionRecordingHasEnded(ReplayRequest replayRequest, sprig.g.b sessionRecorderOutcome) {
        replayRequest.getClass();
        sessionRecorderOutcome.getClass();
        if (!(sessionRecorderOutcome instanceof b.C0022b)) {
            if (sessionRecorderOutcome instanceof b.a) {
                replayRequest.setSessionRecorderOutcome(sessionRecorderOutcome);
                this.replayRequestsInProgress.put(Integer.valueOf(replayRequest.getSurveyId()), replayRequest);
                b.a aVar = (b.a) sessionRecorderOutcome;
                String string = aVar.getException().toString();
                sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Error recording session: ", string), SprigLoggingLevel.ERROR, 0, 4, null);
                sprig.j.e.logError$default(this.logger, "Error recording session", null, string, kyd.h0(aVar.getException()), null, null, 50, null);
                return;
            }
            return;
        }
        replayRequest.setSessionRecorderOutcome(sessionRecorderOutcome);
        replayRequest.setSessionRecordingFileUrl(((b.C0022b) sessionRecorderOutcome).getLocalFileUrl());
        Boolean hasQuestions = replayRequest.getHasQuestions();
        if (hasQuestions == null || !hasQuestions.booleanValue()) {
            reportSessionCompleteAndUploadRecording(replayRequest);
        } else if (a(replayRequest.getSurveyId())) {
            reportSessionCompleteAndUploadRecording(replayRequest);
        } else {
            b(replayRequest);
        }
    }

    public final boolean sessionReplayReadyToBeUploaded(int surveyId) {
        ReplayRequest replayRequest = (ReplayRequest) this.replayRequestsInProgress.get(Integer.valueOf(surveyId));
        if (replayRequest == null) {
            return false;
        }
        if (g76.L(replayRequest.getHasQuestions(), Boolean.TRUE)) {
            return a(surveyId);
        }
        return true;
    }

    public final void setCurrentSessionReplay(sprig.view.c cVar) {
        this.currentSessionReplay = cVar;
    }

    public final void startRecordingSession(ReplayRequest replayRequest) {
        replayRequest.getClass();
        if (this.currentSessionReplay == null) {
            Activity currentActivity = sprig.j.b.INSTANCE.getCurrentActivity();
            if (currentActivity == null) {
                sprig.j.e.logError$default(this.logger, "Can't start recording", null, "Activity is null", null, null, null, 58, null);
                return;
            }
            Context applicationContext = currentActivity.getApplicationContext();
            applicationContext.getClass();
            b(applicationContext);
            if (a(currentActivity)) {
                replayRequest.setSessionRecorderOutcome(null);
                this.replayRequestsInProgress.put(Integer.valueOf(replayRequest.getSurveyId()), replayRequest);
                sprig.view.c cVarCreateSession = sprig.e.d.INSTANCE.get$userleap_release().createSession(replayRequest);
                this.currentSessionReplay = cVarCreateSession;
                if (cVarCreateSession != null) {
                    cVarCreateSession.record();
                }
            }
        }
    }

    public final void stopRecording$userleap_release(EnumC0050b reason) {
        reason.getClass();
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Stopping recording. Reason: " + reason, null, 0, 6, null);
        sprig.view.c cVar = this.currentSessionReplay;
        if (cVar != null) {
            cVar.stopRecording(reason);
        }
        if (reason != EnumC0050b.RECORDING_COMPLETE) {
            a(reason);
        }
    }

    public final void surveyForSessionHasBeenAnswered(int surveyId) {
        this.surveysAnswered.put(Integer.valueOf(surveyId), Boolean.TRUE);
    }

    public final void surveyForSessionHasEnded(int surveyId) {
        ReplayRequest replayRequest = (ReplayRequest) this.replayRequestsInProgress.get(Integer.valueOf(surveyId));
        if (replayRequest != null) {
            if (!a(surveyId)) {
                a(replayRequest);
            } else if (replayRequest.getSessionRecordingFileUrl() != null) {
                reportSessionCompleteAndUploadRecording(replayRequest);
            }
        }
    }

    public final void uploadSession(ReplayRequest replayRequest) {
        replayRequest.getClass();
        sprig.e.e.INSTANCE.get$userleap_release().createUploader(replayRequest).upload(new e(replayRequest));
    }

    public void reportSessionReplayComplete(ReplayRequest replayRequest, x45 completion) {
        b.C0022b c0022b;
        String responseGroupUid;
        fn7 fn7VarX;
        replayRequest.getClass();
        completion.getClass();
        sprig.g.b sessionRecorderOutcome = replayRequest.getSessionRecorderOutcome();
        c1e c1eVar = null;
        if (sessionRecorderOutcome instanceof b.C0022b) {
            c0022b = (b.C0022b) sessionRecorderOutcome;
        } else {
            c0022b = null;
        }
        if (c0022b != null) {
            Activity currentActivity = sprig.j.b.INSTANCE.getCurrentActivity();
            if (currentActivity != null) {
                jhf jhfVar = new jhf(currentActivity.getApplicationContext());
                GenerateVideoUploadUrlPayload generateVideoUploadUrlPayload = replayRequest.getGenerateVideoUploadUrlPayload();
                if (generateVideoUploadUrlPayload == null || (responseGroupUid = generateVideoUploadUrlPayload.getResponseGroupUid()) == null) {
                    responseGroupUid = "";
                }
                String strD = jhfVar.d();
                List<b.a> eventDigest = c0022b.getEventDigest();
                ArrayList arrayList = new ArrayList(cu1.k0(eventDigest, 10));
                for (b.a aVar : eventDigest) {
                    dh7 dh7Var = new dh7();
                    dh7Var.put("type", aVar.getType().toString());
                    dh7Var.put("timestampUnixMs", Long.valueOf(aVar.getTimestamp()));
                    String name = aVar.getName();
                    if (name != null) {
                        dh7Var.put("name", name);
                    }
                    Integer surveyId = aVar.getSurveyId();
                    if (surveyId != null) {
                        dh7Var.put("surveyId", Integer.valueOf(surveyId.intValue()));
                    }
                    arrayList.add(dh7Var.b());
                }
                Map mapQ = ei7.Q(new f09("surveyId", Integer.valueOf(replayRequest.getSurveyId())), new f09("responseGroupUuid", responseGroupUid), new f09(uvlZTF.Oip, arrayList), new f09("userAgent", strD));
                String visitorId = g.INSTANCE.getVisitorId();
                d dVar = new d(completion, c0022b);
                qbb qbbVar = sbb.a;
                String string = new JSONObject(mapQ).toString();
                string.getClass();
                x2b x2bVar = fn7.d;
                try {
                    fn7VarX = en7.x("application/json; charset=utf-8");
                } catch (IllegalArgumentException unused) {
                    fn7VarX = null;
                }
                rbb rbbVarN = no7.n(string, fn7VarX);
                r13 r13Var = xg3.a;
                vx0.c0(o7f.c(vz2.c), null, null, new gbd(jhfVar, rbbVarN, visitorId, dVar, null, 27), 3);
                c1eVar = c1e.a;
            } else {
                ygf.f("Context is null");
                return;
            }
        }
        if (c1eVar == null) {
            completion.invoke(new a.C0021a(new IllegalStateException("ReplayCaptureOutcome was not a success")));
        }
    }

    /* JADX INFO: renamed from: sprig.d.a$a, reason: collision with other inner class name and from kotlin metadata */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\b\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000f\u0010\u0007\u001a\u00020\u0004H\u0000¢\u0006\u0004\b\u0005\u0010\u0006J\u0017\u0010\f\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\u0004H\u0000¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\u000e\u001a\u00020\tH\u0000¢\u0006\u0004\b\r\u0010\u0003R\u0016\u0010\u000f\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u000f\u0010\u0010¨\u0006\u0011"}, d2 = {"Lsprig/d/a$a;", "", "<init>", "()V", "Lsprig/d/a;", "get$userleap_release", "()Lsprig/d/a;", "get", "override", "Lc1e;", "set$userleap_release", "(Lsprig/d/a;)V", "set", "reset$userleap_release", "reset", "instance", "Lsprig/d/a;", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final a get$userleap_release() {
            return a.g;
        }

        public final void reset$userleap_release() {
            a.g = new sprig.graphics.b();
        }

        public final void set$userleap_release(a override) {
            override.getClass();
            a.g = override;
        }

        private Companion() {
        }
    }

    public final void b(Context context) {
        if (this.memoryListenerRegistered) {
            return;
        }
        this.memoryListenerRegistered = true;
        context.getApplicationContext().registerComponentCallbacks(new b());
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lsprig/g/a;", "outcome", "Lc1e;", "invoke", "(Lsprig/g/a;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class c extends co6 implements x45 {
        final /* synthetic */ ReplayRequest $replayRequest;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(ReplayRequest replayRequest) {
            super(1);
            this.$replayRequest = replayRequest;
        }

        public final void invoke(sprig.g.a aVar) {
            aVar.getClass();
            a.this.getReplayRequestsInProgress().put(Integer.valueOf(this.$replayRequest.getSurveyId()), this.$replayRequest);
            if (aVar instanceof a.b) {
                a.this.uploadSession(this.$replayRequest);
            }
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) {
            invoke((sprig.g.a) obj);
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lsprig/g/c;", "outcome", "Lc1e;", "invoke", "(Lsprig/g/c;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class e extends co6 implements x45 {
        final /* synthetic */ ReplayRequest $replayRequest;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public e(ReplayRequest replayRequest) {
            super(1);
            this.$replayRequest = replayRequest;
        }

        public final void invoke(sprig.g.c cVar) throws JSONException {
            cVar.getClass();
            if (cVar instanceof c.b) {
                a.this.a(this.$replayRequest);
            } else if (cVar instanceof c.a) {
                c.a aVar = (c.a) cVar;
                sprig.j.e.logError$default(a.this.getLogger(), "Error uploading session replay", null, String.valueOf(aVar.getException()), kyd.h0(aVar.getException()), null, null, 50, null);
            }
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) throws JSONException {
            invoke((sprig.g.c) obj);
            return c1e.a;
        }
    }

    public final boolean a(Context context) {
        return context.getFilesDir().getUsableSpace() > 32505856;
    }

    public final boolean a(int surveyId) {
        Boolean bool = (Boolean) this.surveysAnswered.get(Integer.valueOf(surveyId));
        if (bool != null) {
            return bool.booleanValue();
        }
        return false;
    }

    public final void a(ReplayRequest replayRequest) {
        this.currentSessionReplay = null;
        this.replayRequestsInProgress.put(Integer.valueOf(replayRequest.getSurveyId()), null);
        this.surveysAnswered.put(Integer.valueOf(replayRequest.getSurveyId()), null);
        URL sessionRecordingFileUrl = replayRequest.getSessionRecordingFileUrl();
        if (sessionRecordingFileUrl != null) {
            try {
                new File(sessionRecordingFileUrl.toURI()).delete();
            } catch (Exception unused) {
            }
        }
    }
}
