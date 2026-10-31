package g30;

import android.content.Context;
import android.os.Build;
import android.os.IBinder;

/* loaded from: classes.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static final Object f57033a = new Object();

    /* renamed from: b, reason: collision with root package name */
    public static f f57034b;

    public static f b(Context context) {
        f fVar;
        synchronized (f57033a) {
            try {
                if (f57034b == null) {
                    Context applicationContext = context.getApplicationContext();
                    int i5 = Build.VERSION.SDK_INT;
                    if (i5 >= 27) {
                        try {
                            if (i5 >= 30) {
                                l lVar = new l(applicationContext);
                                lVar.f57052h = 1.0f;
                                f57034b = lVar;
                            } else {
                                f57034b = new j(applicationContext);
                            }
                        } catch (Throwable th2) {
                            th2.printStackTrace();
                        }
                    }
                    if (f57034b == null) {
                        f57034b = new h(applicationContext);
                    }
                }
                fVar = f57034b;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return fVar;
    }

    public abstract void a(d dVar);

    public abstract c c();

    public float d() {
        return 1.0f;
    }

    public abstract void e(d dVar);

    public void f(IBinder iBinder, y70.d dVar, float f11) {
    }
}
