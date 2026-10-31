package ads_mobile_sdk;

import android.content.Context;
import b.x3;
import java.lang.reflect.Method;

/* loaded from: classes2.dex */
public final class qj0 extends t93 {

    /* renamed from: f, reason: collision with root package name */
    public final Object f8691f;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f8692l = 1;

    public qj0(x3 x3Var, rp1 rp1Var, j7 j7Var, vi3 vi3Var) {
        super("hnBCwtuP5R5SJ5F4x4TxEurUH9ekxtbt0orp9iG05UpBiWU25w8Om1d8AQSEyroz", "BQOK0OF7gUdXqvqzzdyNoaNQjSVn8TXR/sCzgQu1m/I=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_ENV_VERSION_SIGNALS_TASK));
        this.f8691f = j7Var;
    }

    @Override // ads_mobile_sdk.t93
    public final void a(Method method, x3 x3Var) {
        switch (this.f8692l) {
            case 0:
                Object[] objArr = (Object[]) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (Context) this.f8691f);
                objArr.getClass();
                synchronized (x3Var) {
                    long jIntValue = ((Integer) objArr[0]).intValue();
                    x3Var.b();
                    pd pdVar = (pd) x3Var.f1095b;
                    pdVar.bitField1_ |= 2097152;
                    pdVar.batteryTemperatureSignal_ = jIntValue;
                    long jIntValue2 = ((Integer) objArr[1]).intValue();
                    x3Var.b();
                    pd pdVar2 = (pd) x3Var.f1095b;
                    pdVar2.bitField0_ |= 16;
                    pdVar2.btsSignal_ = jIntValue2;
                    long jIntValue3 = ((Integer) objArr[2]).intValue();
                    x3Var.b();
                    pd pdVar3 = (pd) x3Var.f1095b;
                    pdVar3.bitField0_ |= 32;
                    pdVar3.btlSignal_ = jIntValue3;
                    long jIntValue4 = ((Integer) objArr[3]).intValue();
                    x3Var.b();
                    pd pdVar4 = (pd) x3Var.f1095b;
                    pdVar4.bitField2_ |= 8388608;
                    pdVar4.bootCountSignal_ = jIntValue4;
                    Boolean bool = (Boolean) objArr[4];
                    if (bool == null) {
                        x3Var.b();
                        pd pdVar5 = (pd) x3Var.f1095b;
                        pdVar5.getClass();
                        pdVar5.adbEnabledSignal_ = a80.m.c(3);
                        pdVar5.bitField1_ |= 2048;
                    } else {
                        int i5 = bool.booleanValue() ? 2 : 1;
                        x3Var.b();
                        pd pdVar6 = (pd) x3Var.f1095b;
                        pdVar6.getClass();
                        pdVar6.adbEnabledSignal_ = a80.m.c(i5);
                        pdVar6.bitField1_ |= 2048;
                    }
                    Boolean bool2 = (Boolean) objArr[5];
                    if (bool2 == null) {
                        x3Var.b();
                        pd pdVar7 = (pd) x3Var.f1095b;
                        pdVar7.getClass();
                        pdVar7.usbConnectedSignal_ = a80.m.c(3);
                        pdVar7.bitField1_ |= 1024;
                    } else {
                        int i11 = bool2.booleanValue() ? 2 : 1;
                        x3Var.b();
                        pd pdVar8 = (pd) x3Var.f1095b;
                        pdVar8.getClass();
                        pdVar8.usbConnectedSignal_ = a80.m.c(i11);
                        pdVar8.bitField1_ |= 1024;
                    }
                }
                return;
            default:
                Object[] objArr2 = (Object[]) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, ((j7) this.f8691f).F());
                objArr2.getClass();
                synchronized (x3Var) {
                    String str = (String) objArr2[0];
                    x3Var.b();
                    ((pd) x3Var.f1095b).d(str);
                    String str2 = (String) objArr2[1];
                    x3Var.b();
                    ((pd) x3Var.f1095b).c(str2);
                }
                return;
        }
    }

    public qj0(x3 x3Var, rp1 rp1Var, Context context, vi3 vi3Var) {
        super("wR2D10Xhd7AA6QN8obbV6bnwboYMhfn4dJdUcBEHzTV+bur/qJh3jt9MOYgb5vDn", "WAXQgXP0h6bZmwqISdWvILPB4MB4rx/XvC4l/Hdxir0=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_DYNAMIC_DEVICE_SIGNALS_TASK));
        this.f8691f = context;
    }
}
