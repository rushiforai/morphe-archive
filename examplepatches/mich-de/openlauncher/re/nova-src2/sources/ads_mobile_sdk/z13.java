package ads_mobile_sdk;

import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t5.c1;

/* loaded from: classes2.dex */
public final class z13 implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final z13 f12417a = new z13();

    /* renamed from: b, reason: collision with root package name */
    public static final y13 f12418b = y13.p();

    @Override // t5.c1
    public final Object getDefaultValue() {
        return f12418b;
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) {
        try {
            return y13.a(inputStream);
        } catch (Exception e3) {
            cz.b bVar = mu0.f7335a;
            mu0.c("Stored data has been corrupted: " + e3, null);
            y13 y13Var = f12418b;
            Intrinsics.d(y13Var);
            return y13Var;
        }
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) {
        ((y13) obj).a(outputStream);
        return Unit.f71706a;
    }
}
