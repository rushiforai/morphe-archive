package com.google.android.gms.internal.measurement;

import android.os.Bundle;
import android.os.Parcel;

/* loaded from: classes3.dex */
public final class b7 extends p6 implements d7 {
    @Override // com.google.android.gms.internal.measurement.d7
    public final void beginAdUnitExposure(String str, long j11) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeLong(j11);
        Z(parcelX, 23);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void clearConditionalUserProperty(String str, String str2, Bundle bundle) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeString(str2);
        r6.b(parcelX, bundle);
        Z(parcelX, 9);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void endAdUnitExposure(String str, long j11) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeLong(j11);
        Z(parcelX, 24);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void generateEventId(f7 f7Var) {
        Parcel parcelX = X();
        r6.c(parcelX, f7Var);
        Z(parcelX, 22);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void getCachedAppInstanceId(f7 f7Var) {
        Parcel parcelX = X();
        r6.c(parcelX, f7Var);
        Z(parcelX, 19);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void getConditionalUserProperties(String str, String str2, f7 f7Var) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeString(str2);
        r6.c(parcelX, f7Var);
        Z(parcelX, 10);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void getCurrentScreenClass(f7 f7Var) {
        Parcel parcelX = X();
        r6.c(parcelX, f7Var);
        Z(parcelX, 17);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void getCurrentScreenName(f7 f7Var) {
        Parcel parcelX = X();
        r6.c(parcelX, f7Var);
        Z(parcelX, 16);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void getGmpAppId(f7 f7Var) {
        Parcel parcelX = X();
        r6.c(parcelX, f7Var);
        Z(parcelX, 21);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void getMaxUserProperties(String str, f7 f7Var) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        r6.c(parcelX, f7Var);
        Z(parcelX, 6);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void getUserProperties(String str, String str2, boolean z11, f7 f7Var) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeString(str2);
        ClassLoader classLoader = r6.f33029a;
        parcelX.writeInt(z11 ? 1 : 0);
        r6.c(parcelX, f7Var);
        Z(parcelX, 5);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void initialize(ah.b bVar, zzdb zzdbVar, long j11) {
        Parcel parcelX = X();
        r6.c(parcelX, bVar);
        r6.b(parcelX, zzdbVar);
        parcelX.writeLong(j11);
        Z(parcelX, 1);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void initializeWithElapsedTime(ah.b bVar, zzdb zzdbVar, long j11, long j12) {
        Parcel parcelX = X();
        r6.c(parcelX, bVar);
        r6.b(parcelX, zzdbVar);
        parcelX.writeLong(j11);
        parcelX.writeLong(j12);
        Z(parcelX, 60);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void logEventWithElapsedTime(String str, String str2, Bundle bundle, boolean z11, boolean z12, long j11, long j12) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeString(str2);
        r6.b(parcelX, bundle);
        parcelX.writeInt(z11 ? 1 : 0);
        parcelX.writeInt(z12 ? 1 : 0);
        parcelX.writeLong(j11);
        parcelX.writeLong(j12);
        Z(parcelX, 59);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void logHealthData(int i5, String str, ah.b bVar, ah.b bVar2, ah.b bVar3) {
        Parcel parcelX = X();
        parcelX.writeInt(5);
        parcelX.writeString("Error with data collection. Data lost.");
        r6.c(parcelX, bVar);
        r6.c(parcelX, bVar2);
        r6.c(parcelX, bVar3);
        Z(parcelX, 33);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void onActivityCreatedByScionActivityInfo(zzdd zzddVar, Bundle bundle, long j11) {
        Parcel parcelX = X();
        r6.b(parcelX, zzddVar);
        r6.b(parcelX, bundle);
        parcelX.writeLong(j11);
        Z(parcelX, 53);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void onActivityDestroyedByScionActivityInfo(zzdd zzddVar, long j11) {
        Parcel parcelX = X();
        r6.b(parcelX, zzddVar);
        parcelX.writeLong(j11);
        Z(parcelX, 54);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void onActivityPausedByScionActivityInfo(zzdd zzddVar, long j11) {
        Parcel parcelX = X();
        r6.b(parcelX, zzddVar);
        parcelX.writeLong(j11);
        Z(parcelX, 55);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void onActivityResumedByScionActivityInfo(zzdd zzddVar, long j11) {
        Parcel parcelX = X();
        r6.b(parcelX, zzddVar);
        parcelX.writeLong(j11);
        Z(parcelX, 56);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void onActivitySaveInstanceStateByScionActivityInfo(zzdd zzddVar, f7 f7Var, long j11) {
        Parcel parcelX = X();
        r6.b(parcelX, zzddVar);
        r6.c(parcelX, f7Var);
        parcelX.writeLong(j11);
        Z(parcelX, 57);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void onActivityStartedByScionActivityInfo(zzdd zzddVar, long j11) {
        Parcel parcelX = X();
        r6.b(parcelX, zzddVar);
        parcelX.writeLong(j11);
        Z(parcelX, 51);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void onActivityStoppedByScionActivityInfo(zzdd zzddVar, long j11) {
        Parcel parcelX = X();
        r6.b(parcelX, zzddVar);
        parcelX.writeLong(j11);
        Z(parcelX, 52);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void performAction(Bundle bundle, f7 f7Var, long j11) {
        Parcel parcelX = X();
        r6.b(parcelX, bundle);
        r6.c(parcelX, f7Var);
        parcelX.writeLong(j11);
        Z(parcelX, 32);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void registerOnMeasurementEventListener(k7 k7Var) {
        Parcel parcelX = X();
        r6.c(parcelX, k7Var);
        Z(parcelX, 35);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void resetAnalyticsData(long j11) {
        Parcel parcelX = X();
        parcelX.writeLong(j11);
        Z(parcelX, 12);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void resetAnalyticsDataWithElapsedTime(long j11, long j12) {
        Parcel parcelX = X();
        parcelX.writeLong(j11);
        parcelX.writeLong(j12);
        Z(parcelX, 61);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void retrieveAndUploadBatches(h7 h7Var) {
        Parcel parcelX = X();
        r6.c(parcelX, h7Var);
        Z(parcelX, 58);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void setConditionalUserProperty(Bundle bundle, long j11) {
        Parcel parcelX = X();
        r6.b(parcelX, bundle);
        parcelX.writeLong(j11);
        Z(parcelX, 8);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void setConsentThirdParty(Bundle bundle, long j11) {
        Parcel parcelX = X();
        r6.b(parcelX, bundle);
        parcelX.writeLong(j11);
        Z(parcelX, 45);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void setCurrentScreenByScionActivityInfo(zzdd zzddVar, String str, String str2, long j11) {
        Parcel parcelX = X();
        r6.b(parcelX, zzddVar);
        parcelX.writeString(str);
        parcelX.writeString(str2);
        parcelX.writeLong(j11);
        Z(parcelX, 50);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void setDataCollectionEnabled(boolean z11) {
        Parcel parcelX = X();
        ClassLoader classLoader = r6.f33029a;
        parcelX.writeInt(z11 ? 1 : 0);
        Z(parcelX, 39);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void setEventInterceptor(k7 k7Var) {
        Parcel parcelX = X();
        r6.c(parcelX, k7Var);
        Z(parcelX, 34);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void setMeasurementEnabled(boolean z11, long j11) {
        Parcel parcelX = X();
        ClassLoader classLoader = r6.f33029a;
        parcelX.writeInt(z11 ? 1 : 0);
        parcelX.writeLong(j11);
        Z(parcelX, 11);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void setUserId(String str, long j11) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeLong(j11);
        Z(parcelX, 7);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void setUserProperty(String str, String str2, ah.b bVar, boolean z11, long j11) {
        Parcel parcelX = X();
        parcelX.writeString(str);
        parcelX.writeString(str2);
        r6.c(parcelX, bVar);
        parcelX.writeInt(z11 ? 1 : 0);
        parcelX.writeLong(j11);
        Z(parcelX, 4);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public final void unregisterOnMeasurementEventListener(k7 k7Var) {
        Parcel parcelX = X();
        r6.c(parcelX, k7Var);
        Z(parcelX, 36);
    }
}
