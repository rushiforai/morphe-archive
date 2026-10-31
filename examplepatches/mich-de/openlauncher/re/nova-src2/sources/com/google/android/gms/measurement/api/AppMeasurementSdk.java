package com.google.android.gms.measurement.api;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import androidx.annotation.Keep;
import com.google.android.gms.internal.measurement.i8;
import com.google.android.gms.internal.measurement.zzdd;
import java.util.List;
import java.util.Map;
import zh.a;
import zh.b;

/* loaded from: classes.dex */
public class AppMeasurementSdk {

    /* renamed from: a, reason: collision with root package name */
    public final i8 f33751a;

    public AppMeasurementSdk(i8 i8Var) {
        this.f33751a = i8Var;
    }

    @Keep
    public static AppMeasurementSdk getInstance(Context context) {
        return i8.q(context, null).r();
    }

    @Keep
    public void beginAdUnitExposure(String str) {
        this.f33751a.H(str);
    }

    public void clearConditionalUserProperty(String str, String str2, Bundle bundle) {
        this.f33751a.B(str, str2, bundle);
    }

    @Keep
    public void endAdUnitExposure(String str) {
        this.f33751a.I(str);
    }

    @Keep
    public long generateEventId() {
        return this.f33751a.L();
    }

    public String getAppIdOrigin() {
        return this.f33751a.f();
    }

    @Keep
    public String getAppInstanceId() {
        return this.f33751a.K();
    }

    public List<Bundle> getConditionalUserProperties(String str, String str2) {
        return this.f33751a.C(str, str2);
    }

    public String getCurrentScreenClass() {
        return this.f33751a.b();
    }

    public String getCurrentScreenName() {
        return this.f33751a.a();
    }

    @Keep
    public String getGmpAppId() {
        return this.f33751a.J();
    }

    public int getMaxUserProperties(String str) {
        return this.f33751a.e(str);
    }

    public Map<String, Object> getUserProperties(String str, String str2, boolean z11) {
        return this.f33751a.c(str, str2, z11);
    }

    @Keep
    public void logEvent(String str, String str2, Bundle bundle) {
        this.f33751a.x(str, str2, bundle);
    }

    public void logEventNoInterceptor(String str, String str2, Bundle bundle, long j11) {
        this.f33751a.y(str, str2, bundle, j11);
    }

    public void performAction(Bundle bundle) {
        this.f33751a.d(false, bundle);
    }

    public Bundle performActionWithResponse(Bundle bundle) {
        return this.f33751a.d(true, bundle);
    }

    public void registerOnMeasurementEventListener(b bVar) {
        this.f33751a.u(bVar);
    }

    public void setConditionalUserProperty(Bundle bundle) {
        this.f33751a.A(bundle);
    }

    @Deprecated
    public void setConsent(Bundle bundle) {
    }

    public void setCurrentScreen(Activity activity, String str, String str2) {
        this.f33751a.E(zzdd.b(activity), str, str2);
    }

    public void setEventInterceptor(a aVar) {
        this.f33751a.t(aVar);
    }

    @Deprecated
    public void setMeasurementEnabled(Boolean bool) {
    }

    public void setUserProperty(String str, String str2, Object obj) {
        this.f33751a.z(str, str2, obj, true);
    }

    public void unregisterOnMeasurementEventListener(b bVar) {
        this.f33751a.v(bVar);
    }

    public final void zza(boolean z11) {
        this.f33751a.g(z11);
    }

    @Deprecated
    public void setMeasurementEnabled(boolean z11) {
    }

    @Deprecated
    public static AppMeasurementSdk getInstance(Context context, String str, String str2, String str3, Bundle bundle) {
        return i8.q(context, bundle).r();
    }
}
