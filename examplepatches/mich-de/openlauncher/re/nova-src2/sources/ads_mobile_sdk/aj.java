package ads_mobile_sdk;

import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t5.c1;

/* loaded from: classes2.dex */
public final class aj implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final aj f1002a = new aj();

    /* renamed from: b, reason: collision with root package name */
    public static final qi f1003b = qi.x();

    @Override // t5.c1
    public final Object getDefaultValue() {
        return f1003b;
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) {
        try {
            return qi.a(inputStream);
        } catch (Exception e3) {
            cz.b bVar = mu0.f7335a;
            mu0.c("Stored data has been corrupted: " + e3, null);
            qi qiVar = f1003b;
            Intrinsics.d(qiVar);
            return qiVar;
        }
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) {
        ((qi) obj).a(outputStream);
        return Unit.f71706a;
    }
}
