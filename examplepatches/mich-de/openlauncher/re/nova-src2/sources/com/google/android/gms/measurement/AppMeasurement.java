package com.google.android.gms.measurement;

import ai.b2;
import ai.m1;
import ai.u2;
import android.content.Context;
import android.os.Bundle;
import androidx.annotation.Keep;
import com.google.android.gms.internal.measurement.zzdb;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import sg.w;
import yh.a;
import yh.b;
import yh.c;

@Deprecated
/* loaded from: classes3.dex */
public class AppMeasurement {

    /* renamed from: b, reason: collision with root package name */
    public static volatile AppMeasurement f33746b;

    /* renamed from: a, reason: collision with root package name */
    public final c f33747a;

    public static class ConditionalUserProperty {

        @Keep
        public boolean mActive;

        @Keep
        public String mAppId;

        @Keep
        public long mCreationTimestamp;

        @Keep
        public String mExpiredEventName;

        @Keep
        public Bundle mExpiredEventParams;

        @Keep
        public String mName;

        @Keep
        public String mOrigin;

        @Keep
        public long mTimeToLive;

        @Keep
        public String mTimedOutEventName;

        @Keep
        public Bundle mTimedOutEventParams;

        @Keep
        public String mTriggerEventName;

        @Keep
        public long mTriggerTimeout;

        @Keep
        public String mTriggeredEventName;

        @Keep
        public Bundle mTriggeredEventParams;

        @Keep
        public long mTriggeredTimestamp;

        @Keep
        public Object mValue;
    }

    public AppMeasurement(m1 m1Var) {
        this.f33747a = new a(m1Var);
    }

    /* JADX WARN: Unreachable blocks removed: 1, instructions: 1 */
    @Keep
    @Deprecated
    public static AppMeasurement getInstance(Context context) {
        if (f33746b == null) {
            synchronized (AppMeasurement.class) {
                if (f33746b == null) {
                    u2 u2Var = (u2) FirebaseAnalytics.class.getDeclaredMethod("getScionFrontendApiImplementation", Context.class, Bundle.class).invoke(null, context, null);
                    if (u2Var != null) {
                        f33746b = new AppMeasurement(u2Var);
                    } else {
                        f33746b = new AppMeasurement(m1.r(context, new zzdb(0L, 0L, true, null, null), null, null));
                    }
                }
            }
        }
        return f33746b;
    }

    @Keep
    public void beginAdUnitExposure(String str) {
        this.f33747a.g(str);
    }

    @Keep
    public void clearConditionalUserProperty(String str, String str2, Bundle bundle) {
        this.f33747a.j(str, str2, bundle);
    }

    @Keep
    public void endAdUnitExposure(String str) {
        this.f33747a.f(str);
    }

    @Keep
    public long generateEventId() {
        return this.f33747a.zzl();
    }

    @Keep
    public String getAppInstanceId() {
        return this.f33747a.zzj();
    }

    @Keep
    public List<ConditionalUserProperty> getConditionalUserProperties(String str, String str2) {
        List<Bundle> listK = this.f33747a.k(str, str2);
        ArrayList arrayList = new ArrayList(listK == null ? 0 : listK.size());
        for (Bundle bundle : listK) {
            ConditionalUserProperty conditionalUserProperty = new ConditionalUserProperty();
            w.h(bundle);
            conditionalUserProperty.mAppId = (String) b2.e(bundle, "app_id", String.class, null);
            conditionalUserProperty.mOrigin = (String) b2.e(bundle, "origin", String.class, null);
            conditionalUserProperty.mName = (String) b2.e(bundle, PendingUpgradeStore.KEY_NAME, String.class, null);
            conditionalUserProperty.mValue = b2.e(bundle, "value", Object.class, null);
            conditionalUserProperty.mTriggerEventName = (String) b2.e(bundle, "trigger_event_name", String.class, null);
            conditionalUserProperty.mTriggerTimeout = ((Long) b2.e(bundle, "trigger_timeout", Long.class, 0L)).longValue();
            conditionalUserProperty.mTimedOutEventName = (String) b2.e(bundle, "timed_out_event_name", String.class, null);
            conditionalUserProperty.mTimedOutEventParams = (Bundle) b2.e(bundle, "timed_out_event_params", Bundle.class, null);
            conditionalUserProperty.mTriggeredEventName = (String) b2.e(bundle, "triggered_event_name", String.class, null);
            conditionalUserProperty.mTriggeredEventParams = (Bundle) b2.e(bundle, "triggered_event_params", Bundle.class, null);
            conditionalUserProperty.mTimeToLive = ((Long) b2.e(bundle, "time_to_live", Long.class, 0L)).longValue();
            conditionalUserProperty.mExpiredEventName = (String) b2.e(bundle, "expired_event_name", String.class, null);
            conditionalUserProperty.mExpiredEventParams = (Bundle) b2.e(bundle, "expired_event_params", Bundle.class, null);
            conditionalUserProperty.mActive = ((Boolean) b2.e(bundle, "active", Boolean.class, Boolean.FALSE)).booleanValue();
            conditionalUserProperty.mCreationTimestamp = ((Long) b2.e(bundle, "creation_timestamp", Long.class, 0L)).longValue();
            conditionalUserProperty.mTriggeredTimestamp = ((Long) b2.e(bundle, "triggered_timestamp", Long.class, 0L)).longValue();
            arrayList.add(conditionalUserProperty);
        }
        return arrayList;
    }

    @Keep
    public String getCurrentScreenClass() {
        return this.f33747a.zzi();
    }

    @Keep
    public String getCurrentScreenName() {
        return this.f33747a.zzh();
    }

    @Keep
    public String getGmpAppId() {
        return this.f33747a.zzk();
    }

    @Keep
    public int getMaxUserProperties(String str) {
        return this.f33747a.h(str);
    }

    @Keep
    public Map<String, Object> getUserProperties(String str, String str2, boolean z11) {
        return this.f33747a.i(str, str2, z11);
    }

    @Keep
    public void logEventInternal(String str, String str2, Bundle bundle) {
        this.f33747a.d(str, str2, bundle);
    }

    @Keep
    public void setConditionalUserProperty(ConditionalUserProperty conditionalUserProperty) {
        w.h(conditionalUserProperty);
        Bundle bundle = new Bundle();
        String str = conditionalUserProperty.mAppId;
        if (str != null) {
            bundle.putString("app_id", str);
        }
        String str2 = conditionalUserProperty.mOrigin;
        if (str2 != null) {
            bundle.putString("origin", str2);
        }
        String str3 = conditionalUserProperty.mName;
        if (str3 != null) {
            bundle.putString(PendingUpgradeStore.KEY_NAME, str3);
        }
        Object obj = conditionalUserProperty.mValue;
        if (obj != null) {
            b2.d(bundle, obj);
        }
        String str4 = conditionalUserProperty.mTriggerEventName;
        if (str4 != null) {
            bundle.putString("trigger_event_name", str4);
        }
        bundle.putLong("trigger_timeout", conditionalUserProperty.mTriggerTimeout);
        String str5 = conditionalUserProperty.mTimedOutEventName;
        if (str5 != null) {
            bundle.putString("timed_out_event_name", str5);
        }
        Bundle bundle2 = conditionalUserProperty.mTimedOutEventParams;
        if (bundle2 != null) {
            bundle.putBundle("timed_out_event_params", bundle2);
        }
        String str6 = conditionalUserProperty.mTriggeredEventName;
        if (str6 != null) {
            bundle.putString("triggered_event_name", str6);
        }
        Bundle bundle3 = conditionalUserProperty.mTriggeredEventParams;
        if (bundle3 != null) {
            bundle.putBundle("triggered_event_params", bundle3);
        }
        bundle.putLong("time_to_live", conditionalUserProperty.mTimeToLive);
        String str7 = conditionalUserProperty.mExpiredEventName;
        if (str7 != null) {
            bundle.putString("expired_event_name", str7);
        }
        Bundle bundle4 = conditionalUserProperty.mExpiredEventParams;
        if (bundle4 != null) {
            bundle.putBundle("expired_event_params", bundle4);
        }
        bundle.putLong("creation_timestamp", conditionalUserProperty.mCreationTimestamp);
        bundle.putBoolean("active", conditionalUserProperty.mActive);
        bundle.putLong("triggered_timestamp", conditionalUserProperty.mTriggeredTimestamp);
        this.f33747a.e(bundle);
    }

    public AppMeasurement(u2 u2Var) {
        this.f33747a = new b(u2Var);
    }
}
