package com.google.firebase.crashlytics.internal.common;

import com.google.firebase.crashlytics.internal.Logger;
import com.google.firebase.crashlytics.internal.persistence.FileStore;

/* loaded from: classes.dex */
public class CrashlyticsAppQualitySessionsSubscriber {
    private final CrashlyticsAppQualitySessionsStore appQualitySessionsStore;
    private final DataCollectionArbiter dataCollectionArbiter;

    public CrashlyticsAppQualitySessionsSubscriber(DataCollectionArbiter dataCollectionArbiter, FileStore fileStore) {
        this.dataCollectionArbiter = dataCollectionArbiter;
        this.appQualitySessionsStore = new CrashlyticsAppQualitySessionsStore(fileStore);
    }

    public String getAppQualitySessionId(String str) {
        return this.appQualitySessionsStore.getAppQualitySessionId(str);
    }

    public cn.d getSessionSubscriberName() {
        return cn.d.f20142a;
    }

    public boolean isDataCollectionEnabled() {
        return this.dataCollectionArbiter.isAutomaticDataCollectionEnabled();
    }

    public void onSessionChanged(cn.e eVar) {
        Logger.getLogger().d("App Quality Sessions session changed: " + eVar);
        this.appQualitySessionsStore.rotateAppQualitySessionId(eVar.f20145a);
    }

    public void setSessionId(String str) {
        this.appQualitySessionsStore.rotateSessionId(str);
    }
}
