package com.google.firebase.crashlytics.internal.metadata;

import com.google.firebase.crashlytics.internal.model.CrashlyticsReport;
import im.d;
import org.json.JSONException;
import org.json.JSONObject;
import vm.c;

/* loaded from: classes3.dex */
public abstract class RolloutAssignment {
    private static final int MAX_PARAMETER_VALUE_LENGTH = 256;
    public static final gm.a ROLLOUT_ASSIGNMENT_JSON_ENCODER;

    static {
        d dVar = new d();
        AutoRolloutAssignmentEncoder.CONFIG.configure(dVar);
        ROLLOUT_ASSIGNMENT_JSON_ENCODER = new c(dVar, 14);
    }

    public static RolloutAssignment create(String str, String str2, String str3, String str4, long j11) {
        return new AutoValue_RolloutAssignment(str, str2, validate(str3), str4, j11);
    }

    private static String validate(String str) {
        return str.length() > 256 ? str.substring(0, 256) : str;
    }

    public abstract String getParameterKey();

    public abstract String getParameterValue();

    public abstract String getRolloutId();

    public abstract long getTemplateVersion();

    public abstract String getVariantId();

    public CrashlyticsReport.Session.Event.RolloutAssignment toReportProto() {
        return CrashlyticsReport.Session.Event.RolloutAssignment.builder().setRolloutVariant(CrashlyticsReport.Session.Event.RolloutAssignment.RolloutVariant.builder().setVariantId(getVariantId()).setRolloutId(getRolloutId()).build()).setParameterKey(getParameterKey()).setParameterValue(getParameterValue()).setTemplateVersion(getTemplateVersion()).build();
    }

    public static RolloutAssignment create(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject(str);
        return create(jSONObject.getString("rolloutId"), jSONObject.getString("parameterKey"), jSONObject.getString("parameterValue"), jSONObject.getString("variantId"), jSONObject.getLong("templateVersion"));
    }
}
