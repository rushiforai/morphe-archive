package ads_mobile_sdk;

import android.os.RemoteException;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class f33 extends e13 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f3138b;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f3139e;

    public /* synthetic */ f33(Object obj, int i5) {
        this.f3139e = i5;
        this.f3138b = obj;
    }

    @Override // ads_mobile_sdk.e13
    public final void a() {
        switch (this.f3139e) {
            case 0:
                synchronized (((k33) this.f3138b).f5483f) {
                    try {
                        if (((k33) this.f3138b).f5489l.get() > 0 && ((k33) this.f3138b).f5489l.decrementAndGet() > 0) {
                            ((k33) this.f3138b).f5479b.a("Leaving the connection open for other ongoing calls.", new Object[0]);
                            return;
                        }
                        k33 k33Var = (k33) this.f3138b;
                        if (k33Var.n != null) {
                            k33Var.f5479b.a("Unbind from service.", new Object[0]);
                            k33 k33Var2 = (k33) this.f3138b;
                            k33Var2.f5478a.unbindService(k33Var2.f5490m);
                            k33 k33Var3 = (k33) this.f3138b;
                            k33Var3.f5484g = false;
                            k33Var3.n = null;
                            k33Var3.f5490m = null;
                        }
                        k33 k33Var4 = (k33) this.f3138b;
                        Iterator it = k33Var4.f5482e.iterator();
                        while (it.hasNext()) {
                            ((fi.j) it.next()).b(new RemoteException(k33Var4.f5480c + " : Binder has died."));
                        }
                        k33Var4.f5482e.clear();
                        return;
                    } finally {
                    }
                }
            default:
                k33 k33Var5 = ((j33) this.f3138b).f5115a;
                k33Var5.f5479b.a("unlinkToDeath", new Object[0]);
                k33Var5.n.asBinder().unlinkToDeath(k33Var5.f5488k, 0);
                k33Var5.n = null;
                k33Var5.f5484g = false;
                return;
        }
    }
}
