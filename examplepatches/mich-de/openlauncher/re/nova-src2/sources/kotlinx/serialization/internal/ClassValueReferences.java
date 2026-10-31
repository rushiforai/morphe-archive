package kotlinx.serialization.internal;

import com.amplitude.android.migration.DatabaseConstants;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\b\u0003\u0018\u0000*\u0004\b\u0000\u0010\u00012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00010\u00030\u0002B\u0007¢\u0006\u0004\b\u0004\u0010\u0005J\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00000\u00032\n\u0010\u0007\u001a\u0006\u0012\u0002\b\u00030\bH\u0014J-\u0010\t\u001a\u00028\u00002\n\u0010\n\u001a\u0006\u0012\u0002\b\u00030\b2\u000e\b\u0004\u0010\u000b\u001a\b\u0012\u0004\u0012\u00028\u00000\fH\u0086\bø\u0001\u0000¢\u0006\u0002\u0010\rJ\u0012\u0010\u000e\u001a\u00020\u000f2\n\u0010\n\u001a\u0006\u0012\u0002\b\u00030\b\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u0010"}, d2 = {"Lkotlinx/serialization/internal/ClassValueReferences;", "T", "Ljava/lang/ClassValue;", "Lkotlinx/serialization/internal/MutableSoftReference;", "<init>", "()V", "computeValue", TTConst.TRACK_TYPE, "Ljava/lang/Class;", "getOrSet", DatabaseConstants.KEY_FIELD, "factory", "Lkotlin/Function0;", "(Ljava/lang/Class;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "isStored", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
@SuppressAnimalSniffer
/* loaded from: classes.dex */
final class ClassValueReferences<T> extends ClassValue<MutableSoftReference<T>> {
    @Override // java.lang.ClassValue
    public /* bridge */ /* synthetic */ Object computeValue(Class cls) {
        return computeValue((Class<?>) cls);
    }

    public final T getOrSet(@NotNull Class<?> key, @NotNull final Function0<? extends T> factory) {
        Intrinsics.g(key, "key");
        Intrinsics.g(factory, "factory");
        Object obj = get(key);
        Intrinsics.f(obj, "get(...)");
        MutableSoftReference mutableSoftReference = (MutableSoftReference) obj;
        T t6 = mutableSoftReference.reference.get();
        return t6 != null ? t6 : (T) mutableSoftReference.getOrSetWithLock(new Function0<T>() { // from class: kotlinx.serialization.internal.ClassValueReferences.getOrSet.2
            @Override // kotlin.jvm.functions.Function0
            public final T invoke() {
                return (T) factory.invoke();
            }
        });
    }

    public final boolean isStored(@NotNull Class<?> key) {
        Intrinsics.g(key, "key");
        return ((MutableSoftReference) get(key)).reference.get() != null;
    }

    @Override // java.lang.ClassValue
    @NotNull
    public MutableSoftReference<T> computeValue(@NotNull Class<?> type) {
        Intrinsics.g(type, "type");
        return new MutableSoftReference<>();
    }
}
