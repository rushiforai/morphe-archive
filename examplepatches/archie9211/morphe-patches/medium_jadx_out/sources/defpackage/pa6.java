package defpackage;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Log;
import java.util.Locale;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;
import org.chromium.net.InlineExecutionProhibitedException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pa6 implements Runnable {
    public final /* synthetic */ int a;
    public Object b;
    public Object c;
    public Object d;

    public pa6(x5b x5bVar, wh0 wh0Var, wfd wfdVar) {
        this.a = 1;
        this.d = x5bVar;
        this.b = wh0Var;
        this.c = wfdVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i;
        jrg jrgVarI;
        Object objCall = null;
        switch (this.a) {
            case 0:
                if (Thread.currentThread() == ((Thread) this.c)) {
                    this.d = new InlineExecutionProhibitedException();
                    return;
                } else {
                    ((Runnable) this.b).run();
                    return;
                }
            case 1:
                x5b x5bVar = (x5b) this.d;
                wh0 wh0Var = (wh0) this.b;
                x5bVar.b(wh0Var, (wfd) this.c);
                ((AtomicInteger) x5bVar.i.c).set(0);
                double dMin = Math.min(3600000.0d, Math.pow(x5bVar.b, x5bVar.a()) * (60000.0d / x5bVar.a));
                String str = "Delay for: " + String.format(Locale.US, "%.2f", Double.valueOf(dMin / 1000.0d)) + " s for report: " + wh0Var.b;
                if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                    Log.d("FirebaseCrashlytics", str, null);
                }
                try {
                    Thread.sleep((long) dMin);
                    return;
                } catch (InterruptedException unused) {
                    return;
                }
            case 2:
                try {
                    objCall = ((oz4) this.b).call();
                    break;
                } catch (Exception unused2) {
                }
                ((Handler) this.d).post(new p0g((pz4) this.c, 13, objCall));
                return;
            case 3:
                x51 x51Var = (x51) this.b;
                try {
                    g01.U(x51Var.e.T(wz7.d), new rna((elb) this.c, x51Var, (nx9) this.d, null, 13));
                    return;
                } catch (Throwable th) {
                    x51Var.l(th);
                    return;
                }
            case 4:
                ((bof) this.c).c((wfd) this.d, (hnf) ((d2f) this.b).b);
                return;
            default:
                ip1 ip1Var = (ip1) this.c;
                Intent intent = ip1Var.a;
                String stringExtra = intent.getStringExtra("google.message_id");
                if (stringExtra == null) {
                    stringExtra = intent.getStringExtra("message_id");
                }
                if (TextUtils.isEmpty(stringExtra)) {
                    jrgVarI = vp7.x(null);
                } else {
                    Bundle bundle = new Bundle();
                    Intent intent2 = ip1Var.a;
                    String stringExtra2 = intent2.getStringExtra("google.message_id");
                    if (stringExtra2 == null) {
                        stringExtra2 = intent2.getStringExtra("message_id");
                    }
                    bundle.putString("google.message_id", stringExtra2);
                    Intent intent3 = ip1Var.a;
                    Integer numValueOf = intent3.hasExtra("google.product_id") ? Integer.valueOf(intent3.getIntExtra("google.product_id", 0)) : null;
                    if (numValueOf != null) {
                        bundle.putInt("google.product_id", numValueOf.intValue());
                    }
                    Context context = (Context) this.b;
                    bundle.putBoolean("supports_message_handled", true);
                    opg opgVarD = opg.d(context);
                    synchronized (opgVarD) {
                        i = opgVarD.a;
                        opgVarD.a = i + 1;
                    }
                    jrgVarI = opgVarD.i(new ojg(i, 2, bundle, 0));
                }
                jrgVarI.b(bf3.c, new blf((CountDownLatch) this.d));
                return;
        }
    }

    public /* synthetic */ pa6(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    public pa6(Runnable runnable, Thread thread) {
        this.a = 0;
        this.b = runnable;
        this.c = thread;
    }

    public /* synthetic */ pa6(int i) {
        this.a = i;
    }
}
