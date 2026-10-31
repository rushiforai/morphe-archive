package kotlinx.serialization.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KType;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0002\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002B\u0007¢\u0006\u0004\b\u0003\u0010\u0004JE\u0010\u000b\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\n0\t2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\r0\u00072\u0014\u0010\u000e\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\n0\u000fH\u0086\bø\u0001\u0000¢\u0006\u0004\b\u0010\u0010\u0011R.\u0010\u0005\u001a\"\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u0007\u0012\u0012\u0012\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\n0\t0\u0006X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u0012"}, d2 = {"Lkotlinx/serialization/internal/ParametrizedCacheEntry;", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "serializers", "Ljava/util/concurrent/ConcurrentHashMap;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlinx/serialization/internal/KTypeWrapper;", "Lkotlin/Result;", "Lkotlinx/serialization/KSerializer;", "computeIfAbsent", "types", "Lkotlin/reflect/KType;", "producer", "Lkotlin/Function0;", "computeIfAbsent-gIAlu-s", "(Ljava/util/List;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
final class ParametrizedCacheEntry<T> {

    @NotNull
    private final ConcurrentHashMap<List<KTypeWrapper>, Result<KSerializer<T>>> serializers = new ConcurrentHashMap<>();

    @NotNull
    /* renamed from: computeIfAbsent-gIAlu-s, reason: not valid java name */
    public final Object m370computeIfAbsentgIAlus(@NotNull List<? extends KType> types, @NotNull Function0<? extends KSerializer<T>> producer) {
        Object objA;
        Intrinsics.g(types, "types");
        Intrinsics.g(producer, "producer");
        List<? extends KType> list = types;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(new KTypeWrapper((KType) it.next()));
        }
        ConcurrentHashMap concurrentHashMap = this.serializers;
        Object result = concurrentHashMap.get(arrayList);
        if (result == null) {
            try {
                int i5 = Result.f71687b;
                objA = (KSerializer) producer.invoke();
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            result = new Result(objA);
            Object objPutIfAbsent = concurrentHashMap.putIfAbsent(arrayList, result);
            if (objPutIfAbsent != null) {
                result = objPutIfAbsent;
            }
        }
        return ((Result) result).f71688a;
    }
}
