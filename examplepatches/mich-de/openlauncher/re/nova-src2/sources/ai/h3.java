package ai;

import android.os.Parcel;
import com.google.android.gms.internal.measurement.q6;
import com.google.android.gms.internal.measurement.r6;
import com.google.android.gms.measurement.internal.zzoh;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class h3 extends q6 implements c0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AtomicReference f12996a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h3(p3 p3Var, AtomicReference atomicReference) {
        super("com.google.android.gms.measurement.internal.ITriggerUrisCallback");
        this.f12996a = atomicReference;
    }

    @Override // com.google.android.gms.internal.measurement.q6
    public final boolean T(int i5, Parcel parcel, Parcel parcel2) {
        if (i5 != 2) {
            return false;
        }
        ArrayList arrayListCreateTypedArrayList = parcel.createTypedArrayList(zzoh.CREATOR);
        r6.d(parcel);
        n(arrayListCreateTypedArrayList);
        return true;
    }

    @Override // ai.c0
    public final void n(List list) {
        AtomicReference atomicReference = this.f12996a;
        synchronized (atomicReference) {
            atomicReference.set(list);
            atomicReference.notifyAll();
        }
    }
}
