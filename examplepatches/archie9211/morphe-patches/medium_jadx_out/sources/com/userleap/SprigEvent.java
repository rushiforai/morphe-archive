package com.userleap;

import defpackage.b09;
import defpackage.g76;
import defpackage.gy2;
import java.util.Locale;
import kotlin.Metadata;
import org.json.JSONObject;
import sprig.a.a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\b\b\u0087\b\u0018\u0000 \"2\u00020\u0001:\u0001#B\u0019\u0012\u0006\u0010\b\u001a\u00020\u0004\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b \u0010!J\b\u0010\u0003\u001a\u00020\u0002H\u0016J\t\u0010\u0005\u001a\u00020\u0004HÆ\u0003J\u000b\u0010\u0007\u001a\u0004\u0018\u00010\u0006HÆ\u0003J\u001f\u0010\n\u001a\u00020\u00002\b\b\u0002\u0010\b\u001a\u00020\u00042\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0006HÆ\u0001J\t\u0010\f\u001a\u00020\u000bHÖ\u0001J\u0013\u0010\u000f\u001a\u00020\u000e2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\b\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012R\u0019\u0010\t\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\t\u0010\u0013\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\u0018\u001a\u0004\u0018\u00010\u000b8F¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\u001b\u001a\u00020\u00028F¢\u0006\u0006\u001a\u0004\b\u0019\u0010\u001aR\u0011\u0010\u001f\u001a\u00020\u001c8F¢\u0006\u0006\u001a\u0004\b\u001d\u0010\u001e¨\u0006$"}, d2 = {"Lcom/userleap/SprigEvent;", "", "", "toString", "Lcom/userleap/EventName;", "component1", "Lorg/json/JSONObject;", "component2", "name", "data", "copy", "", "hashCode", "other", "", "equals", "Lcom/userleap/EventName;", "getName", "()Lcom/userleap/EventName;", "Lorg/json/JSONObject;", "getData", "()Lorg/json/JSONObject;", "getSurveyId", "()Ljava/lang/Integer;", "surveyId", "getLogMessage", "()Ljava/lang/String;", "logMessage", "Lcom/userleap/SprigLoggingLevel;", "getLogLevel", "()Lcom/userleap/SprigLoggingLevel;", "logLevel", "<init>", "(Lcom/userleap/EventName;Lorg/json/JSONObject;)V", "Companion", "a", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final /* data */ class SprigEvent {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private final JSONObject data;
    private final EventName name;

    public SprigEvent(EventName eventName, JSONObject jSONObject) {
        eventName.getClass();
        this.name = eventName;
        this.data = jSONObject;
    }

    public static /* synthetic */ SprigEvent copy$default(SprigEvent sprigEvent, EventName eventName, JSONObject jSONObject, int i, Object obj) {
        if ((i & 1) != 0) {
            eventName = sprigEvent.name;
        }
        if ((i & 2) != 0) {
            jSONObject = sprigEvent.data;
        }
        return sprigEvent.copy(eventName, jSONObject);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final EventName getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final JSONObject getData() {
        return this.data;
    }

    public final SprigEvent copy(EventName name, JSONObject data) {
        name.getClass();
        return new SprigEvent(name, data);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SprigEvent)) {
            return false;
        }
        SprigEvent sprigEvent = (SprigEvent) other;
        return this.name == sprigEvent.name && g76.L(this.data, sprigEvent.data);
    }

    public final JSONObject getData() {
        return this.data;
    }

    public final SprigLoggingLevel getLogLevel() {
        JSONObject jSONObject = this.data;
        String strOptString = jSONObject != null ? jSONObject.optString("log.level") : null;
        if (strOptString == null) {
            return SprigLoggingLevel.INFO;
        }
        try {
            String upperCase = strOptString.toUpperCase(Locale.ROOT);
            upperCase.getClass();
            return SprigLoggingLevel.valueOf(upperCase);
        } catch (IllegalArgumentException unused) {
            return SprigLoggingLevel.INFO;
        }
    }

    public final String getLogMessage() {
        JSONObject jSONObject = this.data;
        if (jSONObject == null || !jSONObject.has("log.message")) {
            return "";
        }
        String strOptString = jSONObject.optString("log.message");
        strOptString.getClass();
        return strOptString;
    }

    public final EventName getName() {
        return this.name;
    }

    public final Integer getSurveyId() {
        JSONObject jSONObject = this.data;
        if (jSONObject == null || !jSONObject.has("survey.id")) {
            return null;
        }
        return Integer.valueOf(jSONObject.optInt("survey.id"));
    }

    public int hashCode() {
        int iHashCode = this.name.hashCode() * 31;
        JSONObject jSONObject = this.data;
        return iHashCode + (jSONObject == null ? 0 : jSONObject.hashCode());
    }

    public String toString() {
        String logMessage = getLogMessage();
        Integer surveyId = getSurveyId();
        String strW = surveyId != null ? b09.w(surveyId.intValue(), ", surveyId: ") : "";
        int length = logMessage.length();
        EventName eventName = this.name;
        if (length <= 0) {
            return eventName + strW;
        }
        return eventName + ": message: " + logMessage + ", level: " + getLogLevel() + strW;
    }

    /* JADX INFO: renamed from: com.userleap.SprigEvent$a, reason: from kotlin metadata */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final SprigEvent a(String str, String str2) {
            str.getClass();
            str2.getClass();
            EventName eventNameA = EventName.INSTANCE.a(str);
            if (eventNameA != null) {
                return new SprigEvent(eventNameA, a.b(str2));
            }
            return null;
        }

        public Companion() {
        }
    }
}
