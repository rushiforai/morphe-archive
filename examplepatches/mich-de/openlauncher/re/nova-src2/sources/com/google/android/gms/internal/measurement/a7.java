package com.google.android.gms.internal.measurement;

import android.os.Bundle;
import android.os.Parcel;
import android.util.Log;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class a7 extends q6 implements f7 {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicReference f32371a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f32372b;

    public a7() {
        super("com.google.android.gms.measurement.api.internal.IBundleReceiver");
        this.f32371a = new AtomicReference();
    }

    public static final Object V(Class cls, Bundle bundle) {
        Object obj;
        if (bundle == null || (obj = bundle.get("r")) == null) {
            return null;
        }
        try {
            return cls.cast(obj);
        } catch (ClassCastException e3) {
            Log.w("AM", b.c0.m("Unexpected object type. Expected, Received: ", cls.getCanonicalName(), ", ", obj.getClass().getCanonicalName()), e3);
            throw e3;
        }
    }

    @Override // com.google.android.gms.internal.measurement.f7
    public final void G(Bundle bundle) {
        AtomicReference atomicReference = this.f32371a;
        synchronized (atomicReference) {
            try {
                try {
                    atomicReference.set(bundle);
                    this.f32372b = true;
                } finally {
                    this.f32371a.notify();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // com.google.android.gms.internal.measurement.q6
    public final boolean T(int i5, Parcel parcel, Parcel parcel2) {
        if (i5 != 1) {
            return false;
        }
        Bundle bundle = (Bundle) r6.a(parcel, Bundle.CREATOR);
        r6.d(parcel);
        G(bundle);
        parcel2.writeNoException();
        return true;
    }

    public final Bundle U(long j11) {
        Bundle bundle;
        AtomicReference atomicReference = this.f32371a;
        synchronized (atomicReference) {
            if (!this.f32372b) {
                try {
                    atomicReference.wait(j11);
                } catch (InterruptedException unused) {
                    return null;
                }
            }
            bundle = (Bundle) this.f32371a.get();
        }
        return bundle;
    }
}
