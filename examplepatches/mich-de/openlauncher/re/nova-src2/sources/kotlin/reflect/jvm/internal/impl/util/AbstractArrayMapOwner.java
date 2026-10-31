package kotlin.reflect.jvm.internal.impl.util;

import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.reflect.KClass;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public abstract class AbstractArrayMapOwner<K, V> implements Iterable<V>, KMappedMarker {

    public static abstract class AbstractArrayMapAccessor<K, V, T extends V> {

        /* renamed from: id, reason: collision with root package name */
        private final int f71944id;

        public AbstractArrayMapAccessor(int i5) {
            this.f71944id = i5;
        }

        @Nullable
        public final T extractValue(@NotNull AbstractArrayMapOwner<K, V> thisRef) {
            Intrinsics.g(thisRef, "thisRef");
            return thisRef.getArrayMap().get(this.f71944id);
        }
    }

    @NotNull
    public abstract ArrayMap<V> getArrayMap();

    @NotNull
    public abstract TypeRegistry<K, V> getTypeRegistry();

    public final boolean isEmpty() {
        return getArrayMap().getSize() == 0;
    }

    @Override // java.lang.Iterable
    @NotNull
    public final Iterator<V> iterator() {
        return getArrayMap().iterator();
    }

    public abstract void registerComponent(@NotNull String str, @NotNull V v11);

    public final void registerComponent(@NotNull KClass<? extends K> tClass, @NotNull V value) {
        Intrinsics.g(tClass, "tClass");
        Intrinsics.g(value, "value");
        String qualifiedName = tClass.getQualifiedName();
        Intrinsics.d(qualifiedName);
        registerComponent(qualifiedName, (String) value);
    }
}
