package ads_mobile_sdk;

import android.content.Context;
import b.x3;
import java.lang.reflect.Method;
import java.util.Map;
import vk.b0;

/* loaded from: classes.dex */
public final class t13 extends t93 {

    /* renamed from: f, reason: collision with root package name */
    public final sb3 f9759f;

    /* renamed from: g, reason: collision with root package name */
    public final Context f9760g;

    /* renamed from: h, reason: collision with root package name */
    public final Map f9761h;

    public t13(x3 x3Var, rp1 rp1Var, sb3 sb3Var, Context context, Map map, vi3 vi3Var) {
        super("CE5tOv+A3M/hiYupoeeMea7pTAoLkqAWSIWorcc4Mn4bGBP7QNA+DiAmYsyGdi77", "zRuqYvyllHMHZUJ/EPl1E7kaCO145iOH7MbVT0Nbt24=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_SCREEN_SIGNALS_TASK));
        this.f9759f = sb3Var;
        this.f9760g = context;
        this.f9761h = map;
    }

    @Override // ads_mobile_sdk.t93
    public final void a(Method method, x3 x3Var) {
        Object[] objArr = (Object[]) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, Integer.valueOf(this.f9759f.ordinal()), this.f9760g, b0.n(this.f9761h.get("up"), Boolean.TRUE));
        objArr.getClass();
        synchronized (x3Var) {
            try {
                if (this.f9759f == sb3.f9506a) {
                    x3Var.e(((Long) b0.n(objArr[0], -1L)).longValue());
                    x3Var.d(((Long) b0.n(objArr[1], -1L)).longValue());
                }
                x3Var.t(((Long) objArr[2]).longValue());
                x3Var.x(((Long) objArr[3]).longValue());
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
