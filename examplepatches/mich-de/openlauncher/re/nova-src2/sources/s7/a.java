package s7;

import android.content.ComponentName;
import android.content.Context;
import androidx.work.impl.background.systemjob.SystemJobService;
import o7.r;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final ComponentName f86698a;

    /* renamed from: b, reason: collision with root package name */
    public final br.a f86699b;

    static {
        r.e("SystemJobInfoConverter");
    }

    public a(Context context, br.a aVar) {
        this.f86699b = aVar;
        this.f86698a = new ComponentName(context.getApplicationContext(), (Class<?>) SystemJobService.class);
    }
}
