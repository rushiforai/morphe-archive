package ads_mobile_sdk;

import android.content.Context;
import android.os.Build;
import android.util.Base64;
import b.c0;
import b.x3;
import com.google.common.util.concurrent.ListenableFuture;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import zk.d;

/* loaded from: classes.dex */
public final class ng extends t93 {

    /* renamed from: f, reason: collision with root package name */
    public final Map f7553f;

    /* renamed from: g, reason: collision with root package name */
    public final Context f7554g;

    /* renamed from: h, reason: collision with root package name */
    public final sb3 f7555h;

    /* renamed from: i, reason: collision with root package name */
    public final vi3 f7556i;

    /* renamed from: j, reason: collision with root package name */
    public final long f7557j;

    /* renamed from: k, reason: collision with root package name */
    public final long f7558k;

    public ng(x3 x3Var, rp1 rp1Var, Map map, Context context, sb3 sb3Var, j7 j7Var, vi3 vi3Var) {
        super("4P/F1RcDzGo5UDXZnJw4RMFeX971efDML+7xgh52XcslPWh3smbCiPfsLz3h8Upc", "J8oapsE5KyWFFBPtOWkKQ2mD+NOHxkFD9IjL+qyYEP0=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_APP_INFO_SIGNALS_TASK));
        this.f7554g = context;
        this.f7553f = map;
        this.f7555h = sb3Var;
        this.f7556i = vi3Var;
        this.f7557j = j7Var.D();
        this.f7558k = j7Var.H();
    }

    @Override // ads_mobile_sdk.t93
    public final void a(Method method, x3 x3Var) {
        pd pdVar;
        Object[] objArr = (Object[]) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, this.f7554g, Integer.valueOf(this.f7555h.ordinal()));
        objArr.getClass();
        String strP = "E";
        try {
            ListenableFuture listenableFuture = (ListenableFuture) this.f7553f.get("gs");
            if (listenableFuture != null && ((Build.VERSION.SDK_INT < 31 || listenableFuture.isDone()) && (pdVar = (pd) listenableFuture.get(this.f7557j, TimeUnit.MILLISECONDS)) != null && pdVar.p().length() > 1)) {
                strP = pdVar.p();
            }
        } catch (ClassCastException | ExecutionException unused) {
        } catch (InterruptedException unused2) {
            Thread.currentThread().interrupt();
        } catch (TimeoutException unused3) {
            this.f7556i.b(yk0.EVENT_ID_APP_INFO_SIGNALS_TASK_GASS_TIMEOUT);
        }
        if (strP.equals("E")) {
            try {
                ListenableFuture listenableFuture2 = (ListenableFuture) this.f7553f.get("ai");
                if (listenableFuture2 != null) {
                    String str = (String) listenableFuture2.get(this.f7558k, TimeUnit.MILLISECONDS);
                    if (!vk.l.a(str)) {
                        strP = str;
                    }
                }
            } catch (ClassCastException | ExecutionException unused4) {
            } catch (InterruptedException unused5) {
                Thread.currentThread().interrupt();
            } catch (TimeoutException unused6) {
                this.f7556i.b(yk0.EVENT_ID_APP_INFO_SIGNALS_TASK_LOCAL_INT_TIMEOUT);
            }
        }
        Boolean bool = (Boolean) objArr[5];
        Long l9 = (Long) objArr[6];
        synchronized (x3Var) {
            try {
                Object obj = objArr[4];
                String strEncodeToString = obj instanceof byte[] ? Base64.encodeToString(d.f98549f.f().c((byte[]) obj).getBytes(StandardCharsets.UTF_8), 11) : (String) obj;
                x3Var.f(((Long) objArr[0]).longValue());
                String str2 = (String) objArr[1];
                x3Var.b();
                ((pd) x3Var.f1095b).k(str2);
                String str3 = (String) objArr[2];
                x3Var.b();
                ((pd) x3Var.f1095b).e(str3);
                String str4 = (String) objArr[3];
                x3Var.b();
                ((pd) x3Var.f1095b).h(str4);
                x3Var.b();
                ((pd) x3Var.f1095b).f(strEncodeToString);
                x3Var.b();
                ((pd) x3Var.f1095b).i(strP);
                if (bool != null) {
                    x3Var.m(bool.booleanValue() ? 2 : 1);
                }
                if (l9 != null) {
                    int i_a$1 = a80.m._a$1(l9.intValue());
                    c0.a(i_a$1);
                    x3Var.j(i_a$1);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
