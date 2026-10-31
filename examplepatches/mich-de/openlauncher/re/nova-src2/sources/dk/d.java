package dk;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.util.SparseArray;
import b5.f;
import com.google.android.gms.cloudmessaging.zzt;
import og.e;

/* loaded from: classes3.dex */
public final class d implements Handler.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49268a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f49269b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f49268a = i5;
        this.f49269b = obj;
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        switch (this.f49268a) {
            case 0:
                if (message.what != 0) {
                    return false;
                }
                f fVar = (f) this.f49269b;
                if (message.obj != null) {
                    throw new ClassCastException();
                }
                synchronized (fVar.f17550a) {
                    throw null;
                }
            default:
                int i5 = message.arg1;
                if (Log.isLoggable("MessengerIpcClient", 3)) {
                    new StringBuilder(String.valueOf(i5).length() + 30);
                }
                e eVar = (e) this.f49269b;
                synchronized (eVar) {
                    try {
                        SparseArray sparseArray = eVar.f80396e;
                        og.f fVar2 = (og.f) sparseArray.get(i5);
                        if (fVar2 == null) {
                            StringBuilder sb2 = new StringBuilder(String.valueOf(i5).length() + 39);
                            sb2.append("Received response for unknown request: ");
                            sb2.append(i5);
                            Log.w("MessengerIpcClient", sb2.toString());
                            return true;
                        }
                        sparseArray.remove(i5);
                        eVar.l();
                        Bundle data = message.getData();
                        if (data.getBoolean("unsupported", false)) {
                            fVar2.c(new zzt("Not supported by GmsCore", null));
                            return true;
                        }
                        switch (fVar2.f80402e) {
                            case 0:
                                if (data.getBoolean("ack", false)) {
                                    fVar2.b(null);
                                    return true;
                                }
                                fVar2.c(new zzt("Invalid response to one way request", null));
                                return true;
                            default:
                                Bundle bundle = data.getBundle("data");
                                if (bundle == null) {
                                    bundle = Bundle.EMPTY;
                                }
                                fVar2.b(bundle);
                                return true;
                        }
                    } finally {
                    }
                }
        }
    }
}
