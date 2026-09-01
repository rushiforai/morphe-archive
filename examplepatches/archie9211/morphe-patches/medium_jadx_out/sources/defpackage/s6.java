package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class s6 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ long b;
    public final /* synthetic */ String c;

    public /* synthetic */ s6(String str, int i, long j) {
        this.a = i;
        this.b = j;
        this.c = str;
    }

    private final void a() {
        long j = this.b;
        String str = this.c;
        if (u6.g == null) {
            u6.g = new e8(Long.valueOf(j), null);
        }
        e8 e8Var = u6.g;
        if (e8Var != null) {
            e8Var.c = Long.valueOf(j);
        }
        int i = 1;
        if (u6.f.get() <= 0) {
            s6 s6Var = new s6(str, i, j);
            synchronized (u6.e) {
                u6.d = u6.b.schedule(s6Var, af4.b(f94.b()) == null ? 60 : r7.b, TimeUnit.SECONDS);
            }
        }
        long j2 = u6.j;
        long j3 = j2 > 0 ? (j - j2) / 1000 : 0L;
        md5 md5Var = wk0.a;
        Context contextA = f94.a();
        xe4 xe4VarK = af4.k(f94.b(), false);
        if (xe4VarK != null && xe4VarK.d && j3 > 0) {
            g50 g50Var = new g50(contextA, (String) null);
            Bundle bundle = new Bundle(1);
            bundle.putCharSequence("fb_aa_time_spent_view_name", str);
            double d = j3;
            if (mme.c() && !ec2.a.contains(g50Var)) {
                try {
                    g50.f(g50Var, "fb_aa_time_spent_on_view", Double.valueOf(d), bundle, false, u6.b());
                } catch (Throwable th) {
                    ec2.a(g50Var, th);
                }
            }
        }
        e8 e8Var2 = u6.g;
        if (e8Var2 != null) {
            e8Var2.v();
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.a) {
            case 0:
                a();
                return;
            default:
                long j = this.b;
                String str = this.c;
                if (u6.g == null) {
                    u6.g = new e8(Long.valueOf(j), null);
                }
                if (u6.f.get() <= 0) {
                    h1c.b1(str, u6.g, u6.i);
                    SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(f94.a()).edit();
                    editorEdit.remove("com.facebook.appevents.SessionInfo.sessionStartTime");
                    editorEdit.remove("com.facebook.appevents.SessionInfo.sessionEndTime");
                    editorEdit.remove("com.facebook.appevents.SessionInfo.interruptionCount");
                    editorEdit.remove("com.facebook.appevents.SessionInfo.sessionId");
                    editorEdit.apply();
                    SharedPreferences.Editor editorEdit2 = PreferenceManager.getDefaultSharedPreferences(f94.a()).edit();
                    editorEdit2.remove("com.facebook.appevents.SourceApplicationInfo.callingApplicationPackage");
                    editorEdit2.remove("com.facebook.appevents.SourceApplicationInfo.openedByApplink");
                    editorEdit2.apply();
                    u6.g = null;
                }
                synchronized (u6.e) {
                    u6.d = null;
                }
                return;
        }
    }
}
