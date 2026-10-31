package kotlin.reflect.jvm.internal;

import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.ref.SoftReference;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\b\u0003\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002B\u001d\u0012\u0016\u0010\u0003\u001a\u0012\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0005\u0012\u0004\u0012\u00028\u00000\u0004¢\u0006\u0002\u0010\u0006J\b\u0010\t\u001a\u00020\nH\u0016J\u0019\u0010\u000b\u001a\u00028\u00002\n\u0010\f\u001a\u0006\u0012\u0002\b\u00030\u0005H\u0016¢\u0006\u0002\u0010\rR\u0014\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00000\bX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u000e"}, d2 = {"Lkotlin/reflect/jvm/internal/ClassValueCache;", "V", "Lkotlin/reflect/jvm/internal/CacheByClass;", "compute", "Lkotlin/Function1;", "Ljava/lang/Class;", "(Lkotlin/jvm/functions/Function1;)V", "classValue", "Lkotlin/reflect/jvm/internal/ComputableClassValue;", "clear", b.f42142b, "get", DatabaseConstants.KEY_FIELD, "(Ljava/lang/Class;)Ljava/lang/Object;", "kotlin-reflection"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
final class ClassValueCache<V> extends CacheByClass<V> {

    @NotNull
    private volatile ComputableClassValue<V> classValue;

    public ClassValueCache(@NotNull Function1<? super Class<?>, ? extends V> compute) {
        Intrinsics.g(compute, "compute");
        this.classValue = new ComputableClassValue<>(compute);
    }

    @Override // kotlin.reflect.jvm.internal.CacheByClass
    public void clear() {
        this.classValue = this.classValue.createNewCopy();
    }

    @Override // kotlin.reflect.jvm.internal.CacheByClass
    public V get(@NotNull Class<?> key) {
        Intrinsics.g(key, "key");
        ComputableClassValue<V> computableClassValue = this.classValue;
        V v11 = (V) ((SoftReference) computableClassValue.get(key)).get();
        if (v11 != null) {
            return v11;
        }
        computableClassValue.remove(key);
        V v12 = (V) ((SoftReference) computableClassValue.get(key)).get();
        return v12 != null ? v12 : (V) computableClassValue.compute.invoke(key);
    }
}
