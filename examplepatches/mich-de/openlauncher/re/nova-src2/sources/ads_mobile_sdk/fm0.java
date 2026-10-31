package ads_mobile_sdk;

import b.d2;
import b.i;
import cl.p1;
import cl.w0;
import java.io.File;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public final class fm0 {

    /* renamed from: a, reason: collision with root package name */
    public final File f3427a;

    /* renamed from: b, reason: collision with root package name */
    public final ExecutorService f3428b;

    /* renamed from: c, reason: collision with root package name */
    public final d2 f3429c;

    /* renamed from: d, reason: collision with root package name */
    public final vk.g f3430d;

    public fm0(File file, ExecutorService executorService, d2 d2Var, vk.g gVar) {
        this.f3427a = file;
        this.f3428b = executorService;
        this.f3429c = d2Var;
        this.f3430d = gVar;
    }

    public final p1 a(Object obj) {
        return w0.d(new i(2, this, obj), this.f3428b);
    }
}
