package sg;

import android.app.PendingIntent;
import android.os.Bundle;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;

/* loaded from: classes.dex */
public final class y extends lh.i {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f87469b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(e eVar, Looper looper) {
        super(looper);
        this.f87469b = eVar;
    }

    @Override // lh.i, android.os.Handler
    public final void handleMessage(Message message) {
        Boolean bool;
        r rVar;
        e eVar = this.f87469b;
        if (eVar.zzd.get() != message.arg1) {
            int i5 = message.what;
            if ((i5 == 2 || i5 == 1 || i5 == 7) && (rVar = (r) message.obj) != null) {
                synchronized (rVar) {
                    rVar.f87458a = null;
                }
                e eVar2 = rVar.f87460c;
                synchronized (eVar2.zzj()) {
                    eVar2.zzj().remove(rVar);
                }
                return;
            }
            return;
        }
        int i11 = message.what;
        if ((i11 == 1 || i11 == 7 || i11 == 4 || i11 == 5) && !eVar.isConnecting()) {
            r rVar2 = (r) message.obj;
            if (rVar2 != null) {
                synchronized (rVar2) {
                    rVar2.f87458a = null;
                }
                e eVar3 = rVar2.f87460c;
                synchronized (eVar3.zzj()) {
                    eVar3.zzj().remove(rVar2);
                }
                return;
            }
            return;
        }
        int i12 = message.what;
        if (i12 == 4) {
            eVar.zzn(new ConnectionResult(message.arg2, null, null));
            if (eVar.zzg() && !eVar.zzo()) {
                eVar.a(3, null);
                return;
            }
            ConnectionResult connectionResultZzm = eVar.zzm() != null ? eVar.zzm() : new ConnectionResult(8, null, null);
            eVar.zzc.a(connectionResultZzm);
            connectionResultZzm.getClass();
            return;
        }
        if (i12 == 5) {
            ConnectionResult connectionResultZzm2 = eVar.zzm() != null ? eVar.zzm() : new ConnectionResult(8, null, null);
            eVar.zzc.a(connectionResultZzm2);
            connectionResultZzm2.getClass();
            return;
        }
        if (i12 == 3) {
            Object obj = message.obj;
            eVar.zzc.a(new ConnectionResult(message.arg2, obj instanceof PendingIntent ? (PendingIntent) obj : null, null));
            return;
        }
        if (i12 == 6) {
            eVar.a(5, null);
            if (eVar.zzk() != null) {
                eVar.zzk().onConnectionSuspended(message.arg2);
            }
            eVar.onConnectionSuspended();
            eVar.zze(5, 1, null);
            return;
        }
        if (i12 == 2 && !eVar.isConnected()) {
            r rVar3 = (r) message.obj;
            if (rVar3 != null) {
                synchronized (rVar3) {
                    rVar3.f87458a = null;
                }
                e eVar4 = rVar3.f87460c;
                synchronized (eVar4.zzj()) {
                    eVar4.zzj().remove(rVar3);
                }
                return;
            }
            return;
        }
        int i13 = message.what;
        if (i13 != 2 && i13 != 1 && i13 != 7) {
            Log.wtf("GmsClient", b.c0.p(new StringBuilder(String.valueOf(i13).length() + 34), "Don't know how to handle message: ", i13), new Exception());
            return;
        }
        r rVar4 = (r) message.obj;
        synchronized (rVar4) {
            try {
                bool = rVar4.f87458a;
                if (rVar4.f87459b) {
                    String string = rVar4.toString();
                    StringBuilder sb2 = new StringBuilder(string.length() + 47);
                    sb2.append("Callback proxy ");
                    sb2.append(string);
                    sb2.append(" being reused. This is not safe.");
                    Log.w("GmsClient", sb2.toString());
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (bool != null) {
            e eVar5 = rVar4.f87463f;
            int i14 = rVar4.f87461d;
            if (i14 != 0) {
                eVar5.a(1, null);
                Bundle bundle = rVar4.f87462e;
                rVar4.b(new ConnectionResult(i14, bundle != null ? (PendingIntent) bundle.getParcelable("pendingIntent") : null, null));
            } else if (!rVar4.a()) {
                eVar5.a(1, null);
                rVar4.b(new ConnectionResult(8, null, null));
            }
        }
        synchronized (rVar4) {
            rVar4.f87459b = true;
        }
        synchronized (rVar4) {
            rVar4.f87458a = null;
        }
        e eVar6 = rVar4.f87460c;
        synchronized (eVar6.zzj()) {
            eVar6.zzj().remove(rVar4);
        }
    }
}
