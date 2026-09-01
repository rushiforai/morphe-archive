package defpackage;

import android.os.IBinder;
import android.os.IInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e0g implements m3g, IInterface {
    public final IBinder e;

    public e0g(IBinder iBinder) {
        this.e = iBinder;
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.e;
    }
}
