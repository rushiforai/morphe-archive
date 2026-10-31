package og;

import android.app.BroadcastOptions;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.util.Log;
import b.c0;
import com.google.android.gms.cloudmessaging.zzd;
import fi.j;
import fi.t;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import m.r;
import o7.g0;
import z.c1;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: h, reason: collision with root package name */
    public static int f80378h;

    /* renamed from: i, reason: collision with root package name */
    public static PendingIntent f80379i;

    /* renamed from: j, reason: collision with root package name */
    public static final Pattern f80380j = Pattern.compile("\\|ID\\|([^|]+)\\|:?+(.*)");

    /* renamed from: b, reason: collision with root package name */
    public final Context f80382b;

    /* renamed from: c, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f80383c;

    /* renamed from: d, reason: collision with root package name */
    public final ScheduledThreadPoolExecutor f80384d;

    /* renamed from: f, reason: collision with root package name */
    public Messenger f80386f;

    /* renamed from: g, reason: collision with root package name */
    public zzd f80387g;

    /* renamed from: a, reason: collision with root package name */
    public final c1 f80381a = new c1(0);

    /* renamed from: e, reason: collision with root package name */
    public final Messenger f80385e = new Messenger(new h(this, Looper.getMainLooper()));

    public a(Context context) {
        this.f80382b = context;
        this.f80383c = new com.google.android.gms.internal.consent_sdk.a(context);
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1, new yg.a("fcm-rpc-timeout-executor"));
        scheduledThreadPoolExecutor.setKeepAliveTime(60L, TimeUnit.SECONDS);
        scheduledThreadPoolExecutor.allowCoreThreadTimeOut(true);
        this.f80384d = scheduledThreadPoolExecutor;
    }

    public final void a(String str, Bundle bundle) {
        c1 c1Var = this.f80381a;
        synchronized (c1Var) {
            try {
                j jVar = (j) c1Var.remove(str);
                if (jVar != null) {
                    jVar.a(bundle);
                    return;
                }
                StringBuilder sb2 = new StringBuilder(String.valueOf(str).length() + 21);
                sb2.append("Missing callback for ");
                sb2.append(str);
                Log.w("Rpc", sb2.toString());
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final t b(Bundle bundle) throws RemoteException {
        String string;
        synchronized (a.class) {
            int i5 = f80378h;
            f80378h = i5 + 1;
            string = Integer.toString(i5);
        }
        j jVar = new j();
        c1 c1Var = this.f80381a;
        synchronized (c1Var) {
            c1Var.put(string, jVar);
        }
        Intent intent = new Intent();
        intent.setPackage("com.google.android.gms");
        if (this.f80383c.a0() == 2) {
            intent.setAction("com.google.iid.TOKEN_REQUEST");
        } else {
            intent.setAction("com.google.android.c2dm.intent.REGISTER");
        }
        intent.putExtras(bundle);
        Context context = this.f80382b;
        synchronized (a.class) {
            try {
                if (f80379i == null) {
                    Intent intent2 = new Intent();
                    intent2.setPackage("com.google.example.invalidpackage");
                    f80379i = PendingIntent.getBroadcast(context, 0, intent2, kh.d.f71526a);
                }
                intent.putExtra("app", f80379i);
            } finally {
            }
        }
        intent.putExtra("kid", c0.r(new StringBuilder(String.valueOf(string).length() + 5), "|ID|", string, "|"));
        if (Log.isLoggable("Rpc", 3)) {
            intent.getExtras();
        }
        intent.putExtra("google.messenger", this.f80385e);
        if (this.f80386f != null || this.f80387g != null) {
            Message messageObtain = Message.obtain();
            messageObtain.obj = intent;
            try {
                Messenger messenger = this.f80386f;
                if (messenger != null) {
                    messenger.send(messageObtain);
                } else {
                    this.f80387g.f31776a.send(messageObtain);
                }
            } catch (RemoteException unused) {
            }
        } else if (this.f80383c.a0() == 2) {
            Context context2 = this.f80382b;
            if (Build.VERSION.SDK_INT < 34) {
                context2.sendBroadcast(intent);
            } else {
                context2.sendBroadcast(intent, null, BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
            }
        } else {
            this.f80382b.startService(intent);
        }
        jVar.f55135a.c(r.f75330b, new mh.c(this, string, this.f80384d.schedule(new g0(jVar, 5), 30L, TimeUnit.SECONDS)));
        return jVar.f55135a;
    }
}
