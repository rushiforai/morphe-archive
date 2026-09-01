package com.userleap;

import defpackage.ajb;
import defpackage.gy2;
import defpackage.ka1;
import java.util.Locale;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u001c\b\u0087\u0001\u0018\u0000 \f2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\rB\t\b\u0002¢\u0006\u0004\b\n\u0010\u000bR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u0014\u0010\b\u001a\u00020\u00078VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\b\u0010\tj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001aj\u0002\b\u001bj\u0002\b\u001cj\u0002\b\u001dj\u0002\b\u001ej\u0002\b\u001fj\u0002\b j\u0002\b!j\u0002\b\"¨\u0006#"}, d2 = {"Lcom/userleap/EventName;", "", "", "value", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", "", "isLoggingEventType", "()Z", "<init>", "(Ljava/lang/String;I)V", "Companion", "a", "SDK_READY", "VISITOR_ID_UPDATED", "SURVEY_HEIGHT", "SURVEY_STATE_RETURNED", "SURVEY_WILL_PRESENT", "SURVEY_PRESENTED", "SURVEY_APPEARED", "QUESTION_ANSWERED", "SURVEY_CLOSE_REQUESTED", "SURVEY_WILL_CLOSE", "SURVEY_CLOSED", "SURVEY_COMPLETED", "REPLAY_CAPTURE", "REPLAY_CAPTURE_STARTED", "REPLAY_CAPTURE_STOPPED", "REPLAY_CAPTURE_COMPLETED", "REPLAY_RENDERING_COMPLETED", "REPLAY_UPLOAD_COMPLETED", "REPLAY_EVENTS_UPLOAD_COMPLETED", "LOGGING_EVENT", "REPLAY_EVENTS_UPLOADED_COMPLETED", "userleap_release"}, k = 1, mv = {1, 8, 0})
public enum EventName {
    SDK_READY,
    VISITOR_ID_UPDATED,
    SURVEY_HEIGHT,
    SURVEY_STATE_RETURNED,
    SURVEY_WILL_PRESENT,
    SURVEY_PRESENTED,
    SURVEY_APPEARED,
    QUESTION_ANSWERED { // from class: com.userleap.EventName.b
        public final String a = "question.answered";

        @Override // com.userleap.EventName
        public String getValue() {
            return this.a;
        }
    },
    SURVEY_CLOSE_REQUESTED,
    SURVEY_WILL_CLOSE,
    SURVEY_CLOSED,
    SURVEY_COMPLETED,
    REPLAY_CAPTURE,
    REPLAY_CAPTURE_STARTED,
    REPLAY_CAPTURE_STOPPED,
    REPLAY_CAPTURE_COMPLETED,
    REPLAY_RENDERING_COMPLETED,
    REPLAY_UPLOAD_COMPLETED,
    REPLAY_EVENTS_UPLOAD_COMPLETED,
    LOGGING_EVENT,
    REPLAY_EVENTS_UPLOADED_COMPLETED;


    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private final String value;

    EventName() {
        this.value = ka1.r("Sprig.UPDATES.", name());
    }

    public String getValue() {
        return this.value;
    }

    public boolean isLoggingEventType() {
        return this == LOGGING_EVENT;
    }

    /* JADX INFO: renamed from: com.userleap.EventName$a, reason: from kotlin metadata */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final EventName a(String str) {
            Object ajbVar;
            str.getClass();
            try {
                String strReplace = str.replace('.', '_');
                strReplace.getClass();
                String upperCase = strReplace.toUpperCase(Locale.ROOT);
                upperCase.getClass();
                ajbVar = EventName.valueOf(upperCase);
            } catch (Throwable th) {
                ajbVar = new ajb(th);
            }
            if (ajbVar instanceof ajb) {
                ajbVar = null;
            }
            return (EventName) ajbVar;
        }

        public Companion() {
        }
    }

    /* synthetic */ EventName(gy2 gy2Var) {
        this();
    }
}
