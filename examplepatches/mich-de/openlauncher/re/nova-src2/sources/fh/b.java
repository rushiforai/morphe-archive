package fh;

import android.os.IBinder;
import android.os.IInterface;

/* loaded from: classes3.dex */
public final class b implements d, IInterface {

    /* renamed from: a, reason: collision with root package name */
    public final IBinder f55130a;

    public b(IBinder iBinder) {
        this.f55130a = iBinder;
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.f55130a;
    }
}
