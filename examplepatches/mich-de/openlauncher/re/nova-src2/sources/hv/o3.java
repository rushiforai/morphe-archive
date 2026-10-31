package hv;

import com.stripe.android.model.PaymentMethod;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class o3 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f60461a;

    static {
        int[] iArr = new int[PaymentMethod.Type.values().length];
        try {
            com.stripe.android.model.z2 z2Var = PaymentMethod.Type.f43637g;
            iArr[1] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            com.stripe.android.model.z2 z2Var2 = PaymentMethod.Type.f43637g;
            iArr[0] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            com.stripe.android.model.z2 z2Var3 = PaymentMethod.Type.f43637g;
            iArr[5] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            com.stripe.android.model.z2 z2Var4 = PaymentMethod.Type.f43637g;
            iArr[32] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        f60461a = iArr;
    }
}
