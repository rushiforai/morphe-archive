package defpackage;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xc extends Handler {
    public final /* synthetic */ int a;
    public Object b;

    public xc(pc5 pc5Var) {
        this.a = 3;
        this.b = pc5Var;
    }

    private final void a(Message message) {
        wm7 wm7Var;
        ms msVar;
        xc xcVar;
        if (message.what == 1) {
            synchronized (((ms) this.b).c) {
                wm7Var = (wm7) ((WeakReference) ((ms) this.b).b).get();
                msVar = (ms) this.b;
                xcVar = (xc) msVar.e;
            }
            if (wm7Var == null || msVar != wm7Var.b() || xcVar == null) {
                return;
            }
            wm7Var.d((an7) message.obj);
            ms msVar2 = (ms) this.b;
            if (msVar2.a) {
                msVar2.a = false;
                xcVar.removeMessages(1);
            }
            wm7Var.d(null);
        }
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        int size;
        gg5[] gg5VarArr;
        switch (this.a) {
            case 0:
                int i = message.what;
                if (i == -3 || i == -2 || i == -1) {
                    ((DialogInterface.OnClickListener) message.obj).onClick((DialogInterface) ((WeakReference) this.b).get(), message.what);
                    return;
                } else {
                    if (i != 1) {
                        return;
                    }
                    ((DialogInterface) message.obj).dismiss();
                    return;
                }
            case 1:
                if (message.what != 1) {
                    super.handleMessage(message);
                    return;
                }
                iq1 iq1Var = (iq1) this.b;
                while (true) {
                    synchronized (((HashMap) iq1Var.f)) {
                        try {
                            size = ((ArrayList) iq1Var.d).size();
                            if (size <= 0) {
                                return;
                            }
                            gg5VarArr = new gg5[size];
                            ((ArrayList) iq1Var.d).toArray(gg5VarArr);
                            ((ArrayList) iq1Var.d).clear();
                        } finally {
                        }
                    }
                    for (int i2 = 0; i2 < size; i2++) {
                        gg5 gg5Var = gg5VarArr[i2];
                        int size2 = ((ArrayList) gg5Var.c).size();
                        for (int i3 = 0; i3 < size2; i3++) {
                            w57 w57Var = (w57) ((ArrayList) gg5Var.c).get(i3);
                            if (!w57Var.d) {
                                w57Var.b.onReceive((Context) iq1Var.b, (Intent) gg5Var.b);
                            }
                        }
                    }
                }
                break;
            case 2:
                a(message);
                return;
            default:
                if (ec2.a.contains(this)) {
                    return;
                }
                try {
                    message.getClass();
                    pc5 pc5Var = (pc5) this.b;
                    if (message.what == pc5Var.g) {
                        Bundle data = message.getData();
                        if (data.getString("com.facebook.platform.status.ERROR_TYPE") != null) {
                            pc5Var.a(null);
                        } else {
                            pc5Var.a(data);
                        }
                        try {
                            pc5Var.a.unbindService(pc5Var);
                            return;
                        } catch (IllegalArgumentException unused) {
                            return;
                        }
                    }
                    return;
                } catch (Throwable th) {
                    ec2.a(this, th);
                    return;
                }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xc(Object obj, Looper looper, int i) {
        super(looper);
        this.a = i;
        this.b = obj;
    }

    public /* synthetic */ xc() {
        this.a = 0;
    }
}
