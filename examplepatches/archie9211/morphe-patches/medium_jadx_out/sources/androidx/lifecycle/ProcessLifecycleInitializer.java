package androidx.lifecycle;

import android.app.Application;
import android.content.Context;
import android.os.Handler;
import defpackage.c2a;
import defpackage.d2a;
import defpackage.ey3;
import defpackage.m50;
import defpackage.u16;
import defpackage.ux6;
import defpackage.ygf;
import defpackage.yx6;
import defpackage.zx6;
import java.util.HashSet;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Landroidx/lifecycle/ProcessLifecycleInitializer;", "Lu16;", "Liy6;", "<init>", "()V", "lifecycle-process"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class ProcessLifecycleInitializer implements u16 {
    @Override // defpackage.u16
    public final List a() {
        return ey3.a;
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        context.getClass();
        m50 m50VarZ = m50.z(context);
        m50VarZ.getClass();
        if (!((HashSet) m50VarZ.c).contains(ProcessLifecycleInitializer.class)) {
            ygf.f("ProcessLifecycleInitializer cannot be initialized lazily.\n               Please ensure that you have:\n               <meta-data\n                   android:name='androidx.lifecycle.ProcessLifecycleInitializer'\n                   android:value='androidx.startup' />\n               under InitializationProvider in your AndroidManifest.xml");
            return null;
        }
        if (!zx6.a.getAndSet(true)) {
            Context applicationContext = context.getApplicationContext();
            applicationContext.getClass();
            ((Application) applicationContext).registerActivityLifecycleCallbacks(new yx6());
        }
        d2a d2aVar = d2a.i;
        d2aVar.getClass();
        d2aVar.e = new Handler();
        d2aVar.f.e(ux6.ON_CREATE);
        Context applicationContext2 = context.getApplicationContext();
        applicationContext2.getClass();
        ((Application) applicationContext2).registerActivityLifecycleCallbacks(new c2a(d2aVar));
        return d2aVar;
    }
}
