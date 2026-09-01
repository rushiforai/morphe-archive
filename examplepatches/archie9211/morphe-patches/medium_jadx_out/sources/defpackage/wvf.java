package defpackage;

import android.app.PendingIntent;
import android.os.Bundle;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wvf extends tjf {
    public final /* synthetic */ mn0 a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wvf(mn0 mn0Var, Looper looper) {
        super(looper, 4);
        this.a = mn0Var;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        Boolean bool;
        ykf ykfVar;
        mn0 mn0Var = this.a;
        int i = mn0Var.w.get();
        int i2 = message.arg1;
        int i3 = message.what;
        if (i != i2) {
            if ((i3 == 2 || i3 == 1 || i3 == 7) && (ykfVar = (ykf) message.obj) != null) {
                ykfVar.c();
                return;
            }
            return;
        }
        if ((i3 == 1 || i3 == 7 || i3 == 4 || i3 == 5) && !mn0Var.m()) {
            ykf ykfVar2 = (ykf) message.obj;
            if (ykfVar2 != null) {
                ykfVar2.c();
                return;
            }
            return;
        }
        int i4 = message.what;
        if (i4 == 4) {
            mn0Var.t = new h42(message.arg2, null, null);
            if (!mn0Var.u && !TextUtils.isEmpty(mn0Var.i()) && !TextUtils.isEmpty(null)) {
                try {
                    Class.forName(mn0Var.i());
                    if (!mn0Var.u) {
                        mn0Var.r(3, null);
                        return;
                    }
                } catch (ClassNotFoundException unused) {
                }
            }
            h42 h42Var = mn0Var.t;
            if (h42Var == null) {
                h42Var = new h42(8, null, null);
            }
            mn0Var.i.b(h42Var);
            System.currentTimeMillis();
            return;
        }
        if (i4 == 5) {
            h42 h42Var2 = mn0Var.t;
            if (h42Var2 == null) {
                h42Var2 = new h42(8, null, null);
            }
            mn0Var.i.b(h42Var2);
            System.currentTimeMillis();
            return;
        }
        if (i4 == 3) {
            Object obj = message.obj;
            mn0Var.i.b(new h42(message.arg2, obj instanceof PendingIntent ? (PendingIntent) obj : null, null));
            System.currentTimeMillis();
            return;
        }
        if (i4 == 6) {
            mn0Var.r(5, null);
            eoc eocVar = mn0Var.n;
            if (eocVar != null) {
                ((ce5) eocVar.a).c(message.arg2);
            }
            System.currentTimeMillis();
            mn0Var.p(5, 1, null);
            return;
        }
        if (i4 == 2 && !mn0Var.l()) {
            ykf ykfVar3 = (ykf) message.obj;
            if (ykfVar3 != null) {
                ykfVar3.c();
                return;
            }
            return;
        }
        int i5 = message.what;
        if (i5 != 2 && i5 != 1 && i5 != 7) {
            Log.wtf("GmsClient", b09.A(new StringBuilder(String.valueOf(i5).length() + 34), i5, "Don't know how to handle message: "), new Exception());
            return;
        }
        ykf ykfVar4 = (ykf) message.obj;
        synchronized (ykfVar4) {
            try {
                bool = ykfVar4.a;
                if (ykfVar4.b) {
                    String string = ykfVar4.toString();
                    StringBuilder sb = new StringBuilder(string.length() + 47);
                    sb.append("Callback proxy ");
                    sb.append(string);
                    sb.append(" being reused. This is not safe.");
                    Log.w("GmsClient", sb.toString());
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        if (bool != null) {
            mn0 mn0Var2 = ykfVar4.f;
            int i6 = ykfVar4.d;
            if (i6 != 0) {
                mn0Var2.r(1, null);
                Bundle bundle = ykfVar4.e;
                ykfVar4.b(new h42(i6, bundle != null ? (PendingIntent) bundle.getParcelable("pendingIntent") : null, null));
            } else if (!ykfVar4.a()) {
                mn0Var2.r(1, null);
                ykfVar4.b(new h42(8, null, null));
            }
        }
        synchronized (ykfVar4) {
            ykfVar4.b = true;
        }
        ykfVar4.c();
    }
}
