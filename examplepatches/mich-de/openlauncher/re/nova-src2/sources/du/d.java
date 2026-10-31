package du;

import com.stripe.android.model.StripeIntent;
import com.stripe.android.model.j6;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class d {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f49531a;

    static {
        int[] iArr = new int[StripeIntent.Status.values().length];
        try {
            j6 j6Var = StripeIntent.Status.f43980b;
            iArr[5] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            j6 j6Var2 = StripeIntent.Status.f43980b;
            iArr[6] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        f49531a = iArr;
    }
}
