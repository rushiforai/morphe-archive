package com.google.android.gms.internal.measurement;

import android.content.Intent;
import android.os.Bundle;
import android.os.IInterface;
import java.util.Map;

/* loaded from: classes3.dex */
public interface d7 extends IInterface {
    void beginAdUnitExposure(String str, long j11);

    void clearConditionalUserProperty(String str, String str2, Bundle bundle);

    void clearMeasurementEnabled(long j11);

    void endAdUnitExposure(String str, long j11);

    void generateEventId(f7 f7Var);

    void getAppInstanceId(f7 f7Var);

    void getCachedAppInstanceId(f7 f7Var);

    void getConditionalUserProperties(String str, String str2, f7 f7Var);

    void getCurrentScreenClass(f7 f7Var);

    void getCurrentScreenName(f7 f7Var);

    void getGmpAppId(f7 f7Var);

    void getMaxUserProperties(String str, f7 f7Var);

    void getSessionId(f7 f7Var);

    void getTestFlag(f7 f7Var, int i5);

    void getUserProperties(String str, String str2, boolean z11, f7 f7Var);

    void initForTests(Map map);

    void initialize(ah.b bVar, zzdb zzdbVar, long j11);

    void initializeWithElapsedTime(ah.b bVar, zzdb zzdbVar, long j11, long j12);

    void isDataCollectionEnabled(f7 f7Var);

    void logEvent(String str, String str2, Bundle bundle, boolean z11, boolean z12, long j11);

    void logEventAndBundle(String str, String str2, Bundle bundle, f7 f7Var, long j11);

    void logEventWithElapsedTime(String str, String str2, Bundle bundle, boolean z11, boolean z12, long j11, long j12);

    void logHealthData(int i5, String str, ah.b bVar, ah.b bVar2, ah.b bVar3);

    void onActivityCreated(ah.b bVar, Bundle bundle, long j11);

    void onActivityCreatedByScionActivityInfo(zzdd zzddVar, Bundle bundle, long j11);

    void onActivityDestroyed(ah.b bVar, long j11);

    void onActivityDestroyedByScionActivityInfo(zzdd zzddVar, long j11);

    void onActivityPaused(ah.b bVar, long j11);

    void onActivityPausedByScionActivityInfo(zzdd zzddVar, long j11);

    void onActivityResumed(ah.b bVar, long j11);

    void onActivityResumedByScionActivityInfo(zzdd zzddVar, long j11);

    void onActivitySaveInstanceState(ah.b bVar, f7 f7Var, long j11);

    void onActivitySaveInstanceStateByScionActivityInfo(zzdd zzddVar, f7 f7Var, long j11);

    void onActivityStarted(ah.b bVar, long j11);

    void onActivityStartedByScionActivityInfo(zzdd zzddVar, long j11);

    void onActivityStopped(ah.b bVar, long j11);

    void onActivityStoppedByScionActivityInfo(zzdd zzddVar, long j11);

    void performAction(Bundle bundle, f7 f7Var, long j11);

    void registerOnMeasurementEventListener(k7 k7Var);

    void resetAnalyticsData(long j11);

    void resetAnalyticsDataWithElapsedTime(long j11, long j12);

    void retrieveAndUploadBatches(h7 h7Var);

    void setConditionalUserProperty(Bundle bundle, long j11);

    void setConsent(Bundle bundle, long j11);

    void setConsentThirdParty(Bundle bundle, long j11);

    void setCurrentScreen(ah.b bVar, String str, String str2, long j11);

    void setCurrentScreenByScionActivityInfo(zzdd zzddVar, String str, String str2, long j11);

    void setDataCollectionEnabled(boolean z11);

    void setDefaultEventParameters(Bundle bundle);

    void setEventInterceptor(k7 k7Var);

    void setInstanceIdProvider(m7 m7Var);

    void setMeasurementEnabled(boolean z11, long j11);

    void setMinimumSessionDuration(long j11);

    void setSessionTimeoutDuration(long j11);

    void setSgtmDebugInfo(Intent intent);

    void setUserId(String str, long j11);

    void setUserProperty(String str, String str2, ah.b bVar, boolean z11, long j11);

    void unregisterOnMeasurementEventListener(k7 k7Var);
}
