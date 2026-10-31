package ads_mobile_sdk;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.HandlerThread;
import android.os.Parcel;
import com.google.android.gms.common.ConnectionResult;
import java.util.concurrent.LinkedBlockingQueue;

/* loaded from: classes.dex */
public final class qt0 implements sg.b, sg.c {

    /* renamed from: a, reason: collision with root package name */
    public final rt0 f8797a;

    /* renamed from: b, reason: collision with root package name */
    public final String f8798b;

    /* renamed from: c, reason: collision with root package name */
    public final String f8799c;

    /* renamed from: d, reason: collision with root package name */
    public final fk f8800d;

    /* renamed from: f, reason: collision with root package name */
    public final LinkedBlockingQueue f8801f;

    /* renamed from: g, reason: collision with root package name */
    public final HandlerThread f8802g;

    /* renamed from: h, reason: collision with root package name */
    public final v6 f8803h;

    /* renamed from: i, reason: collision with root package name */
    public final long f8804i;

    public qt0(Context context, fk fkVar, String str, String str2, v6 v6Var) {
        this.f8798b = str;
        this.f8800d = fkVar;
        this.f8799c = str2;
        this.f8803h = v6Var;
        HandlerThread handlerThread = new HandlerThread("GassDGClient");
        this.f8802g = handlerThread;
        handlerThread.start();
        this.f8804i = System.currentTimeMillis();
        rt0 rt0Var = new rt0(19621000, context, handlerThread.getLooper(), this, this);
        this.f8797a = rt0Var;
        this.f8801f = new LinkedBlockingQueue();
        rt0Var.checkAvailabilityAndConnect();
    }

    public final void a(int i5, long j11, Exception exc) {
        v6 v6Var = this.f8803h;
        if (v6Var != null) {
            v6Var.a(i5, System.currentTimeMillis() - j11, exc);
        }
    }

    @Override // sg.b
    public final void onConnected() {
        b.b5 b5Var;
        HandlerThread handlerThread = this.f8802g;
        long j11 = this.f8804i;
        rt0 rt0Var = this.f8797a;
        try {
            b5Var = (b.b5) rt0Var.getService();
        } catch (DeadObjectException | IllegalStateException unused) {
            b5Var = null;
        }
        if (b5Var != null) {
            try {
                tm2 tm2Var = new tm2(this.f8798b, 1, 1, this.f8800d.f3374a, this.f8799c);
                b.g4 g4Var = (b.g4) b5Var;
                Parcel parcelObtain = Parcel.obtain();
                parcelObtain.writeInterfaceToken(g4Var.f74936c);
                parcelObtain.writeInt(1);
                tm2Var.writeToParcel(parcelObtain, 0);
                Parcel parcelA = g4Var.a(parcelObtain, 3);
                vm2 vm2VarCreateFromParcel = parcelA.readInt() == 0 ? null : vm2.CREATOR.createFromParcel(parcelA);
                parcelA.recycle();
                a(5011, j11, null);
                this.f8801f.put(vm2VarCreateFromParcel);
            } catch (Throwable th2) {
                try {
                    a(2010, j11, new Exception(th2));
                } finally {
                    if (rt0Var != null && (rt0Var.isConnected() || rt0Var.isConnecting())) {
                        rt0Var.disconnect();
                    }
                    handlerThread.quit();
                }
            }
            if (rt0Var != null && (rt0Var.isConnected() || rt0Var.isConnecting())) {
            }
        }
    }

    @Override // sg.c
    public final void onConnectionFailed(ConnectionResult connectionResult) throws InterruptedException {
        try {
            a(4012, this.f8804i, null);
            this.f8801f.put(new vm2(null, 1, 1));
        } catch (InterruptedException unused) {
        }
    }

    @Override // sg.b
    public final void onConnectionSuspended(int i5) throws InterruptedException {
        try {
            a(4011, this.f8804i, null);
            this.f8801f.put(new vm2(null, 1, 1));
        } catch (InterruptedException unused) {
        }
    }
}
