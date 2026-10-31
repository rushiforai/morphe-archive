package ads_mobile_sdk;

import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t5.c1;

/* loaded from: classes2.dex */
public final class b70 implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final b70 f1289a = new b70();

    /* renamed from: b, reason: collision with root package name */
    public static final a70 f1290b = a70.p();

    @Override // t5.c1
    public final Object getDefaultValue() {
        return f1290b;
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) {
        try {
            return a70.a(inputStream);
        } catch (Exception e3) {
            cz.b bVar = mu0.f7335a;
            mu0.c("Stored CSRB data has been corrupted: " + e3, null);
            a70 a70Var = f1290b;
            Intrinsics.d(a70Var);
            return a70Var;
        }
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) {
        ((a70) obj).a(outputStream);
        return Unit.f71706a;
    }
}
