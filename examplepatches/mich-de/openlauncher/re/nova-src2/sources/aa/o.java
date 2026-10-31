package aa;

import android.content.Context;
import android.os.Handler;
import com.teslacoilsw.launcher.NovaApplication;
import e10.a3;
import e10.g2;
import mx.h1;

/* loaded from: classes.dex */
public final /* synthetic */ class o implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f638a;

    public /* synthetic */ o(int i5) {
        this.f638a = i5;
    }

    private final void a() {
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f638a) {
            case 0:
                break;
            case 1:
                Context context = mx.g0.f77088a;
                mx.g0.b();
                break;
            case 2:
                Boolean bool = NovaApplication.f45635g;
                break;
            case 3:
                g2 g2Var = a3.f51435a;
                g2Var.f51552h = false;
                g2Var.b(0);
                break;
            case 4:
                Context context2 = mx.g0.f77088a;
                h1.c(mx.g0.e());
                break;
            default:
                Handler handler = yx.f.f97697a;
                a10.a aVar = yx.f.f97698b;
                if (aVar != null) {
                    yx.f.f97697a.removeCallbacks(aVar);
                }
                yx.f.f97698b = null;
                break;
        }
    }
}
