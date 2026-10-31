package e20;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import t5.c1;
import t70.y0;

/* loaded from: classes.dex */
public final class y implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final y f52092a = new y();

    /* renamed from: b, reason: collision with root package name */
    public static final KSerializer f52093b = BuiltinSerializersKt.ListSerializer(v.Companion.serializer());

    /* renamed from: c, reason: collision with root package name */
    public static final EmptyList f52094c = EmptyList.f71733a;

    @Override // t5.c1
    public final Object getDefaultValue() {
        return f52094c;
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new w(inputStream, null), continuationImpl);
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) throws Throwable {
        a80.e eVar = y0.f88884a;
        Object objY = t70.m0.y(a80.d.f488c, new x(outputStream, (List) obj, null), continuationImpl);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }
}
