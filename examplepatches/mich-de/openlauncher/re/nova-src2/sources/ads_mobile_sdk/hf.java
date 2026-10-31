package ads_mobile_sdk;

import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t5.c1;

/* loaded from: classes.dex */
public final class hf implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final hf f4370a = new hf();

    /* renamed from: b, reason: collision with root package name */
    public static final ze f4371b = ze.o();

    @Override // t5.c1
    public final Object getDefaultValue() {
        return f4371b;
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) {
        try {
            return ze.a(inputStream);
        } catch (Exception unused) {
            ze zeVar = f4371b;
            Intrinsics.d(zeVar);
            return zeVar;
        }
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) {
        ((ze) obj).a(outputStream);
        return Unit.f71706a;
    }
}
