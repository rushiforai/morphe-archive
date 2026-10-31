package com.google.firebase.analytics;

import ai.u2;
import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import androidx.annotation.Keep;
import com.google.android.gms.internal.measurement.i8;
import com.google.android.gms.internal.measurement.zzdd;
import com.google.android.gms.tasks.Tasks;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import om.d;
import om.e;
import sg.w;
import ul.g;
import xl.c;

/* loaded from: classes.dex */
public final class FirebaseAnalytics {

    /* renamed from: b, reason: collision with root package name */
    public static volatile FirebaseAnalytics f34687b;

    /* renamed from: a, reason: collision with root package name */
    public final i8 f34688a;

    public FirebaseAnalytics(i8 i8Var) {
        w.h(i8Var);
        this.f34688a = i8Var;
    }

    @Keep
    public static FirebaseAnalytics getInstance(Context context) {
        if (f34687b == null) {
            synchronized (FirebaseAnalytics.class) {
                try {
                    if (f34687b == null) {
                        f34687b = new FirebaseAnalytics(i8.q(context, null));
                    }
                } finally {
                }
            }
        }
        return f34687b;
    }

    @Keep
    public static u2 getScionFrontendApiImplementation(Context context, Bundle bundle) {
        i8 i8VarQ = i8.q(context, bundle);
        if (i8VarQ == null) {
            return null;
        }
        return new c(i8VarQ);
    }

    @Keep
    public String getFirebaseInstanceId() {
        try {
            Object obj = d.f80509m;
            return (String) Tasks.a(((d) g.c().b(e.class)).c(), 30000L, TimeUnit.MILLISECONDS);
        } catch (InterruptedException e3) {
            throw new IllegalStateException(e3);
        } catch (ExecutionException e11) {
            throw new IllegalStateException(e11.getCause());
        } catch (TimeoutException unused) {
            throw new IllegalThreadStateException("Firebase Installations getId Task has timed out.");
        }
    }

    @Keep
    @Deprecated
    public void setCurrentScreen(Activity activity, String str, String str2) {
        this.f34688a.E(zzdd.b(activity), str, str2);
    }
}
