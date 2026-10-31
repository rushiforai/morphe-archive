package b;

import ads_mobile_sdk.t93;
import java.lang.reflect.Method;

/* loaded from: classes2.dex */
public final class ya extends t93 {
    @Override // ads_mobile_sdk.t93
    public final void a(Method method, x3 x3Var) {
        synchronized (x3Var) {
            x3Var.b();
            ((ads_mobile_sdk.pd) x3Var.f1095b).j("E");
            x3Var.b();
            ads_mobile_sdk.pd pdVar = (ads_mobile_sdk.pd) x3Var.f1095b;
            pdVar.bitField1_ |= 32;
            pdVar.cpuSignal_ = 0L;
            x3Var.b();
            ((ads_mobile_sdk.pd) x3Var.f1095b).g("D");
        }
        Object[] objArr = (Object[]) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null);
        objArr.getClass();
        synchronized (x3Var) {
            String str = (String) objArr[0];
            x3Var.b();
            ((ads_mobile_sdk.pd) x3Var.f1095b).j(str);
            long jLongValue = ((Long) objArr[1]).longValue();
            x3Var.b();
            ads_mobile_sdk.pd pdVar2 = (ads_mobile_sdk.pd) x3Var.f1095b;
            pdVar2.bitField1_ |= 32;
            pdVar2.cpuSignal_ = jLongValue;
            String str2 = (String) objArr[2];
            x3Var.b();
            ((ads_mobile_sdk.pd) x3Var.f1095b).g(str2);
        }
    }
}
