package ads_mobile_sdk;

import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t5.c1;

/* loaded from: classes.dex */
public final class mv1 implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final mv1 f7337a = new mv1();

    /* renamed from: b, reason: collision with root package name */
    public static final zu1 f7338b = zu1.q();

    @Override // t5.c1
    public final Object getDefaultValue() {
        return f7338b;
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) {
        try {
            return zu1.a(inputStream);
        } catch (Exception e3) {
            cz.b bVar = mu0.f7335a;
            mu0.c("Stored data has been corrupted: " + e3, null);
            zu1 zu1Var = f7338b;
            Intrinsics.d(zu1Var);
            return zu1Var;
        }
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) {
        ((zu1) obj).a(outputStream);
        return Unit.f71706a;
    }
}
