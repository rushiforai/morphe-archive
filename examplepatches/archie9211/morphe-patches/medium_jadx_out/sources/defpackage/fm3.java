package defpackage;

import android.util.Log;
import com.google.firebase.concurrent.ExecutorsRegistrar;
import java.io.FileNotFoundException;
import java.util.concurrent.ScheduledExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fm3 implements yn3, qrd, dz1, ha4, o92, br8 {
    public final /* synthetic */ int a;

    public /* synthetic */ fm3(h34 h34Var) {
        this.a = 8;
    }

    public static /* synthetic */ void d(String str, Object obj) {
        throw new RuntimeException(str + obj);
    }

    public static /* synthetic */ void e(String str, Object[] objArr) {
        throw new IllegalArgumentException(String.format(str, objArr));
    }

    public static /* synthetic */ void g(String str, Object obj) throws FileNotFoundException {
        throw new FileNotFoundException(str + obj);
    }

    @Override // defpackage.yn3
    public float a(float f) {
        float f2;
        float f3;
        switch (this.a) {
            case 3:
                if (f < 0.36363637f) {
                    return 7.5625f * f * f;
                }
                if (f < 0.72727275f) {
                    float f4 = f - 0.54545456f;
                    f2 = 7.5625f * f4 * f4;
                    f3 = 0.75f;
                } else if (f < 0.90909094f) {
                    float f5 = f - 0.8181818f;
                    f2 = 7.5625f * f5 * f5;
                    f3 = 0.9375f;
                } else {
                    float f6 = f - 0.95454544f;
                    f2 = 7.5625f * f6 * f6;
                    f3 = 0.984375f;
                }
                return f2 + f3;
            default:
                return f;
        }
    }

    @Override // defpackage.qrd
    public Object apply(Object obj) {
        z0c z0cVar = (z0c) obj;
        String strI = a1c.b.I(z0cVar);
        strI.getClass();
        Log.d("FirebaseSessions", "Session Event Type: " + z0cVar.a.name());
        byte[] bytes = strI.getBytes(wk1.a);
        bytes.getClass();
        return bytes;
    }

    @Override // defpackage.ha4
    public void c(boolean z) {
        switch (this.a) {
            case 14:
                if (z && mme.c()) {
                    na4.a(new ik4(23), ka4.CrashReport);
                    na4.a(new ik4(24), ka4.ErrorReport);
                    na4.a(new ik4(25), ka4.AnrReport);
                    break;
                }
                break;
            case 15:
                if (z && !ec2.a.contains(k50.class)) {
                    try {
                        af4.e.add(new j50());
                        af4.d();
                    } catch (Throwable th) {
                        ec2.a(k50.class, th);
                        return;
                    }
                    break;
                }
                break;
            case 16:
                if (z) {
                    f94.n = true;
                }
                break;
            case 17:
                if (z) {
                    f94.o = true;
                }
                break;
            default:
                if (z) {
                    f94.p = true;
                }
                break;
        }
    }

    @Override // defpackage.dz1
    public Object f(iq1 iq1Var) {
        switch (this.a) {
            case 9:
                return (ScheduledExecutorService) ExecutorsRegistrar.a.get();
            case 10:
                return (ScheduledExecutorService) ExecutorsRegistrar.c.get();
            case 11:
                return (ScheduledExecutorService) ExecutorsRegistrar.b.get();
            default:
                wq6 wq6Var = ExecutorsRegistrar.a;
                return pzd.INSTANCE;
        }
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) {
        int i;
        switch (this.a) {
            case 19:
                i = 403;
                break;
            default:
                i = -1;
                break;
        }
        return Integer.valueOf(i);
    }

    @Override // defpackage.br8
    public void onFailure(Exception exc) {
        Log.e("FirebaseCrashlytics", "Error fetching settings.", exc);
    }

    public /* synthetic */ fm3(int i) {
        this.a = i;
    }
}
