package com.google.android.play.core.appupdate;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.google.android.gms.tasks.Tasks;
import com.google.android.play.core.common.PlayCoreDialogWrapperActivity;
import com.google.android.play.core.install.InstallException;
import fi.j;
import fi.t;
import jk.f;
import jk.h;
import kk.m;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final h f34543a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f34544b;

    /* renamed from: c, reason: collision with root package name */
    public final Handler f34545c = new Handler(Looper.getMainLooper());

    public a(h hVar, Context context) {
        this.f34543a = hVar;
        this.f34544b = context;
    }

    public final t a() {
        String packageName = this.f34544b.getPackageName();
        ex.a aVar = h.f69586e;
        h hVar = this.f34543a;
        m mVar = hVar.f69588a;
        if (mVar == null) {
            Object[] objArr = {-9};
            if (Log.isLoggable("PlayCore", 6)) {
                Log.e("PlayCore", ex.a.m(aVar.f53057b, "onError(%d)", objArr));
            } else {
                aVar.getClass();
            }
            return Tasks.c(new InstallException(-9));
        }
        aVar.i("requestUpdateInfo(%s)", packageName);
        j jVar = new j();
        mVar.a().post(new f(mVar, jVar, jVar, new f(hVar, jVar, packageName, jVar)));
        return jVar.f55135a;
    }

    public final t b(jk.a aVar, Activity activity, jk.j jVar) {
        PendingIntent pendingIntent = aVar.f69570b;
        if (aVar.f69571c) {
            return Tasks.c(new InstallException(-4));
        }
        if ((pendingIntent != null ? pendingIntent : null) == null) {
            return Tasks.c(new InstallException(-6));
        }
        aVar.f69571c = true;
        Intent intent = new Intent(activity, (Class<?>) PlayCoreDialogWrapperActivity.class);
        if (pendingIntent == null) {
            pendingIntent = null;
        }
        intent.putExtra("confirmation_intent", pendingIntent);
        j jVar2 = new j();
        intent.putExtra("result_receiver", new zze(this.f34545c, jVar2));
        activity.startActivity(intent);
        return jVar2.f55135a;
    }
}
