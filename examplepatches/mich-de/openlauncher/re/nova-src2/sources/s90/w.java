package s90;

import android.adservices.measurement.MeasurementManager;
import android.content.Context;
import android.net.http.CallbackException;
import android.net.http.HttpEngine;
import android.net.http.HttpException;

/* loaded from: classes5.dex */
public abstract /* synthetic */ class w {
    public static /* bridge */ /* synthetic */ MeasurementManager b(Object obj) {
        return (MeasurementManager) obj;
    }

    public static /* bridge */ /* synthetic */ CallbackException d(Exception exc) {
        return (CallbackException) exc;
    }

    public static /* synthetic */ HttpEngine.Builder e(Context context) {
        return new HttpEngine.Builder(context);
    }

    public static /* bridge */ /* synthetic */ HttpException f(Exception exc) {
        return (HttpException) exc;
    }

    public static /* bridge */ /* synthetic */ Class g() {
        return MeasurementManager.class;
    }

    public static /* synthetic */ void h() {
    }

    public static /* bridge */ /* synthetic */ boolean n(Exception exc) {
        return exc instanceof CallbackException;
    }

    public static /* bridge */ /* synthetic */ boolean o(Exception exc) {
        return exc instanceof HttpException;
    }
}
