package dv;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.z2;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class k {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f49611a;

    static {
        int[] iArr = new int[PaymentMethod.Type.values().length];
        try {
            z2 z2Var = PaymentMethod.Type.f43637g;
            iArr[8] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            z2 z2Var2 = PaymentMethod.Type.f43637g;
            iArr[18] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            z2 z2Var3 = PaymentMethod.Type.f43637g;
            iArr[39] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            z2 z2Var4 = PaymentMethod.Type.f43637g;
            iArr[41] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        f49611a = iArr;
    }
}
