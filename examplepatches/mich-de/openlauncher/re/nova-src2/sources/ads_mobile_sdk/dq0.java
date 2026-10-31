package ads_mobile_sdk;

import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t5.c1;

/* loaded from: classes2.dex */
public final class dq0 implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final dq0 f2585a = new dq0();

    /* renamed from: b, reason: collision with root package name */
    public static final cq0 f2586b = cq0.q();

    @Override // t5.c1
    public final Object getDefaultValue() {
        return f2586b;
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) {
        try {
            return cq0.a(inputStream);
        } catch (Exception e3) {
            cz.b bVar = mu0.f7335a;
            mu0.c("Stored data has been corrupted: " + e3, null);
            cq0 cq0Var = f2586b;
            Intrinsics.d(cq0Var);
            return cq0Var;
        }
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) {
        ((cq0) obj).a(outputStream);
        return Unit.f71706a;
    }
}
