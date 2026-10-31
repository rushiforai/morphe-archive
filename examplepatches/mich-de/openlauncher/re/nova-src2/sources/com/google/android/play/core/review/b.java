package com.google.android.play.core.review;

import android.app.Activity;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import com.google.android.gms.tasks.Tasks;
import com.google.android.play.core.common.PlayCoreDialogWrapperActivity;
import fi.j;
import fi.t;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final qk.b f34556a;

    /* renamed from: b, reason: collision with root package name */
    public final Handler f34557b = new Handler(Looper.getMainLooper());

    public b(qk.b bVar) {
        this.f34556a = bVar;
    }

    public final t a(Activity activity, ReviewInfo reviewInfo) {
        zza zzaVar = (zza) reviewInfo;
        if (zzaVar.f34562b) {
            return Tasks.d(null);
        }
        Intent intent = new Intent(activity, (Class<?>) PlayCoreDialogWrapperActivity.class);
        intent.putExtra("confirmation_intent", zzaVar.f34561a);
        intent.putExtra("window_flags", activity.getWindow().getDecorView().getWindowSystemUiVisibility());
        j jVar = new j();
        intent.putExtra("result_receiver", new zzc(this.f34557b, jVar));
        activity.startActivity(intent);
        return jVar.f55135a;
    }
}
