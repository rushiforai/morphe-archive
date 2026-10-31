package uv;

import com.stripe.android.stripe3ds2.exceptions.SDKRuntimeException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.spec.ECGenParameterSpec;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: b, reason: collision with root package name */
    public static final String f91577b;

    /* renamed from: a, reason: collision with root package name */
    public final tv.c f91578a;

    static {
        a[] aVarArr = a.f91563b;
        f91577b = "EC";
    }

    public g(tv.c cVar) {
        this.f91578a = cVar;
    }

    public final KeyPair a() {
        Object objA;
        try {
            int i5 = Result.f71687b;
            KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance(f91577b);
            keyPairGenerator.initialize(new ECGenParameterSpec(bp.a.f18344c.f18354b));
            objA = keyPairGenerator.generateKeyPair();
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            this.f91578a.c(thA);
        }
        Throwable thA2 = Result.a(objA);
        if (thA2 != null) {
            throw new SDKRuntimeException(thA2);
        }
        Intrinsics.f(objA, "getOrElse(...)");
        return (KeyPair) objA;
    }
}
