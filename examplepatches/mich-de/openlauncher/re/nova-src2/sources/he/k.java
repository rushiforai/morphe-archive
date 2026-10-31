package he;

import android.os.Handler;
import fa.l0;

/* loaded from: classes3.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final Handler f59744a;

    /* renamed from: b, reason: collision with root package name */
    public final fe.x f59745b;

    public /* synthetic */ k(Handler handler, fe.x xVar) {
        this.f59744a = handler;
        this.f59745b = xVar;
    }

    public void a(ie.e eVar) {
        synchronized (eVar) {
        }
        Handler handler = this.f59744a;
        if (handler != null) {
            handler.post(new l0(9, this, eVar));
        }
    }
}
