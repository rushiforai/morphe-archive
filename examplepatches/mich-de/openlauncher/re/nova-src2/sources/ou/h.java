package ou;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.z2;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class h {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f80896a;

    static {
        int[] iArr = new int[PaymentMethod.Type.values().length];
        try {
            z2 z2Var = PaymentMethod.Type.f43637g;
            iArr[1] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            z2 z2Var2 = PaymentMethod.Type.f43637g;
            iArr[32] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            z2 z2Var3 = PaymentMethod.Type.f43637g;
            iArr[5] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            z2 z2Var4 = PaymentMethod.Type.f43637g;
            iArr[0] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        f80896a = iArr;
    }
}
