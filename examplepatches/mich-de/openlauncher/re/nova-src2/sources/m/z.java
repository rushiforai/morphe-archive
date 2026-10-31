package m;

import android.window.OnBackInvokedCallback;
import java.lang.reflect.InvocationTargetException;

/* loaded from: classes2.dex */
public final /* synthetic */ class z implements OnBackInvokedCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75380a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f75381b;

    public /* synthetic */ z(Object obj, int i5) {
        this.f75380a = i5;
        this.f75381b = obj;
    }

    public final void onBackInvoked() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        switch (this.f75380a) {
            case 0:
                ((f0) this.f75381b).U();
                break;
            case 1:
                com.vungle.ads.internal.ui.l.b((com.vungle.ads.internal.ui.l) this.f75381b);
                break;
            case 2:
                ((Runnable) this.f75381b).run();
                break;
            default:
                ((vj.b) this.f75381b).d();
                break;
        }
    }
}
