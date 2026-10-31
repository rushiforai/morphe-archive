package ads_mobile_sdk;

import android.content.Context;
import android.net.NetworkCapabilities;
import b.c0;
import b.x3;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class a32 extends t93 {

    /* renamed from: f, reason: collision with root package name */
    public final Object f821f;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f822l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a32(x3 x3Var, rp1 rp1Var, Context context, vi3 vi3Var) {
        super("DuE5+y9p56NZeYfGLhoxt0vxV1yd8CTBwk0NIgcJ+5d3wkbDyqX/WPtxlfm0oyLY", "o1bzjIN6n+CUyG9pPZD3I5gMNg4pgPs6Q9EO/JousEA=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_PROCESS_INFO_SIGNALS_TASK));
        this.f822l = 2;
        this.f821f = context;
    }

    @Override // ads_mobile_sdk.t93
    public final void a(Method method, x3 x3Var) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Object obj;
        switch (this.f822l) {
            case 0:
                Object[] objArr = (Object[]) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (NetworkCapabilities) ((Map) this.f821f).get("ntc"), (Long) ((Map) this.f821f).get("vs"), (Long) ((Map) this.f821f).get("vf"));
                objArr.getClass();
                synchronized (x3Var) {
                    try {
                        x3Var.r(((Long) objArr[0]).longValue());
                        long jLongValue = ((Long) objArr[1]).longValue();
                        if (jLongValue >= 0) {
                            x3Var.c(jLongValue);
                        }
                        long jLongValue2 = ((Long) objArr[2]).longValue();
                        if (jLongValue2 >= 0) {
                            x3Var.k(jLongValue2);
                        }
                        if (objArr.length > 3 && (obj = objArr[3]) != null) {
                            int i_a$1 = a80.m._a$1(((Long) obj).intValue());
                            c0.a(i_a$1);
                            x3Var.n(i_a$1);
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return;
            case 1:
                List list = (List) ((Map) this.f821f).get("vst");
                if (list == null) {
                    return;
                }
                Object objInvoke = method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, list);
                objInvoke.getClass();
                Long l9 = (Long) objInvoke;
                synchronized (x3Var) {
                    int i_a = a80.m._a(l9.intValue());
                    c0.a(i_a);
                    x3Var.h(i_a);
                }
                return;
            default:
                Object[] objArr2 = (Object[]) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (Context) this.f821f);
                objArr2.getClass();
                synchronized (x3Var) {
                    x3Var.o(((Long) objArr2[0]).longValue());
                    x3Var.u(((Long) objArr2[1]).longValue());
                }
                return;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a32(x3 x3Var, rp1 rp1Var, Map map, vi3 vi3Var, int i5) {
        super("3SWPPciYi5aHoI1OBERhDipvlPpAtbhfeYDZhMqijRWqAxjBiv72prN8AzcVA5J9", "qGPJHMLFunr1AVkW6Fhi9ZzRNPJl3SeBnAUGHmixXQ0=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_NETWORK_SIGNALS_TASK));
        this.f822l = i5;
        switch (i5) {
            case 1:
                super("sAX/3/HOCTeahXhFfASNpd/c1hPgxO8Q5YUuIxnLYaEKGrUg4RvUMR7m2gTrRspl", "tw44Pm8L1hyUidMqnQUhLFu8E6wuFVyExTmoxz14Zrw=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_NAVIGATION_SIGNALS_TASK));
                this.f821f = map;
                break;
            default:
                this.f821f = map;
                break;
        }
    }
}
