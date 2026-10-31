package ads_mobile_sdk;

import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t5.c1;

/* loaded from: classes.dex */
public final class ha1 implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final ha1 f4268a = new ha1();

    /* renamed from: b, reason: collision with root package name */
    public static final ba1 f4269b = ba1.p();

    @Override // t5.c1
    public final Object getDefaultValue() {
        return f4269b;
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) {
        try {
            return ba1.a(inputStream);
        } catch (Exception unused) {
            mu0.c("Stored data has been corrupted", null);
            ba1 ba1Var = f4269b;
            Intrinsics.d(ba1Var);
            return ba1Var;
        }
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) {
        ((ba1) obj).a(outputStream);
        return Unit.f71706a;
    }
}
