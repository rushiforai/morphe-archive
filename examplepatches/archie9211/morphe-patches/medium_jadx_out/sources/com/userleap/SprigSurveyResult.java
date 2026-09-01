package com.userleap;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u0014"}, d2 = {"Lcom/userleap/SprigSurveyResult;", "", "surveyState", "Lcom/userleap/SurveyState;", "surveyId", "", "(Lcom/userleap/SurveyState;I)V", "getSurveyId", "()I", "getSurveyState", "()Lcom/userleap/SurveyState;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "toString", "", "userleap_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final /* data */ class SprigSurveyResult {
    private final int surveyId;
    private final SurveyState surveyState;

    public SprigSurveyResult(SurveyState surveyState, int i) {
        surveyState.getClass();
        this.surveyState = surveyState;
        this.surveyId = i;
    }

    public static /* synthetic */ SprigSurveyResult copy$default(SprigSurveyResult sprigSurveyResult, SurveyState surveyState, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            surveyState = sprigSurveyResult.surveyState;
        }
        if ((i2 & 2) != 0) {
            i = sprigSurveyResult.surveyId;
        }
        return sprigSurveyResult.copy(surveyState, i);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final SurveyState getSurveyState() {
        return this.surveyState;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getSurveyId() {
        return this.surveyId;
    }

    public final SprigSurveyResult copy(SurveyState surveyState, int surveyId) {
        surveyState.getClass();
        return new SprigSurveyResult(surveyState, surveyId);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SprigSurveyResult)) {
            return false;
        }
        SprigSurveyResult sprigSurveyResult = (SprigSurveyResult) other;
        return this.surveyState == sprigSurveyResult.surveyState && this.surveyId == sprigSurveyResult.surveyId;
    }

    public final int getSurveyId() {
        return this.surveyId;
    }

    public final SurveyState getSurveyState() {
        return this.surveyState;
    }

    public int hashCode() {
        return (this.surveyState.hashCode() * 31) + this.surveyId;
    }

    public String toString() {
        return "SprigSurveyResult(surveyState=" + this.surveyState + ", surveyId=" + this.surveyId + ")";
    }
}
