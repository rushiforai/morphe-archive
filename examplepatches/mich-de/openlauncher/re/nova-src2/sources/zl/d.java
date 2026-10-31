package zl;

import com.google.android.gms.measurement.api.AppMeasurementSdk;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import z.e0;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final Object f98570a;

    public d(AppMeasurementSdk appMeasurementSdk, yl.b bVar) {
        this.f98570a = bVar;
        appMeasurementSdk.registerOnMeasurementEventListener(new c(this));
    }

    public d(long[] jArr) {
        e0 e0Var;
        if (jArr != null) {
            long[] jArrCopyOf = Arrays.copyOf(jArr, jArr.length);
            e0Var = new e0(jArrCopyOf.length);
            int i5 = e0Var.f97814b;
            if (i5 >= 0) {
                if (jArrCopyOf.length != 0) {
                    int length = jArrCopyOf.length + i5;
                    long[] jArr2 = e0Var.f97813a;
                    if (jArr2.length < length) {
                        long[] jArrCopyOf2 = Arrays.copyOf(jArr2, Math.max(length, (jArr2.length * 3) / 2));
                        Intrinsics.f(jArrCopyOf2, "copyOf(...)");
                        e0Var.f97813a = jArrCopyOf2;
                    }
                    long[] jArr3 = e0Var.f97813a;
                    int i11 = e0Var.f97814b;
                    if (i5 != i11) {
                        u90.b.s(jArr3, jArr3, jArrCopyOf.length + i5, i5, i11);
                    }
                    u90.b.s(jArrCopyOf, jArr3, i5, 0, jArrCopyOf.length);
                    e0Var.f97814b += jArrCopyOf.length;
                }
            } else {
                android.support.v4.media.session.b.m0(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                throw null;
            }
        } else {
            e0Var = new e0(16);
        }
        this.f98570a = e0Var;
    }
}
