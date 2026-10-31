package com.google.android.libraries.places.internal;

import com.google.android.gms.internal.play_billing.f1;
import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public final /* synthetic */ class zzajs {
    public static /* synthetic */ boolean zza(Unsafe unsafe, Object obj, long j11, Object obj2, Object obj3) {
        while (!f1.a(unsafe, obj, j11, obj2, obj3)) {
            if (unsafe.getObject(obj, j11) != obj2) {
                return false;
            }
        }
        return true;
    }
}
