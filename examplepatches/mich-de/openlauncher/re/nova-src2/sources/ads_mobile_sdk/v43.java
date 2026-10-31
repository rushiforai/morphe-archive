package ads_mobile_sdk;

import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t5.c1;

/* loaded from: classes2.dex */
public final class v43 implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final v43 f10574a = new v43();

    /* renamed from: b, reason: collision with root package name */
    public static final k43 f10575b = k43.o();

    @Override // t5.c1
    public final Object getDefaultValue() {
        return f10575b;
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) {
        try {
            return k43.a(inputStream);
        } catch (Exception e3) {
            cz.b bVar = mu0.f7335a;
            mu0.c("Stored shared settings data has been corrupted: " + e3, null);
            k43 k43Var = f10575b;
            Intrinsics.d(k43Var);
            return k43Var;
        }
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) {
        ((k43) obj).a(outputStream);
        return Unit.f71706a;
    }
}
