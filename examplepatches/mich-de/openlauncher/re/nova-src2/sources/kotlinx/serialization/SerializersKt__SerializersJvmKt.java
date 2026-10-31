package kotlinx.serialization;

import com.tiktok.util.TTConst;
import h6.c1;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Triple;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KClass;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.internal.PlatformKt;
import kotlinx.serialization.internal.PrimitivesKt;
import kotlinx.serialization.modules.SerializersModule;
import kotlinx.serialization.modules.SerializersModuleBuildersKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000:\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\u001a\u0014\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u0004\u001a\u0016\u0010\u0005\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u00012\u0006\u0010\u0003\u001a\u00020\u0004\u001a\u0018\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u0004\u001a\u001a\u0010\u0005\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0001*\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u0004\u001a+\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0001*\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00042\b\b\u0002\u0010\b\u001a\u00020\tH\u0002¢\u0006\u0002\b\n\u001a-\u0010\u000b\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0001*\u00020\u00062\n\u0010\u0003\u001a\u0006\u0012\u0002\b\u00030\f2\u0006\u0010\b\u001a\u00020\tH\u0002¢\u0006\u0002\b\r\u001aG\u0010\u000e\u001a\n\u0012\u0004\u0012\u0002H\u000f\u0018\u00010\u0001\"\b\b\u0000\u0010\u000f*\u00020\u0002*\u00020\u00062\f\u0010\u0010\u001a\b\u0012\u0004\u0012\u0002H\u000f0\f2\u0014\u0010\u0011\u001a\u0010\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u00010\u0012H\u0002¢\u0006\u0002\b\u0013\u001a)\u0010\u0014\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0001*\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00152\u0006\u0010\b\u001a\u00020\tH\u0002¢\u0006\u0002\b\u0016\u001a\u0015\u0010\u0017\u001a\u0006\u0012\u0002\b\u00030\f*\u00020\u0004H\u0002¢\u0006\u0002\b\u0018¨\u0006\u0019"}, d2 = {"serializer", "Lkotlinx/serialization/KSerializer;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTConst.TRACK_TYPE, "Ljava/lang/reflect/Type;", "serializerOrNull", "Lkotlinx/serialization/modules/SerializersModule;", "serializerByJavaTypeImpl", "failOnMissingTypeArgSerializer", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serializerByJavaTypeImpl$SerializersKt__SerializersJvmKt", "typeSerializer", "Ljava/lang/Class;", "typeSerializer$SerializersKt__SerializersJvmKt", "reflectiveOrContextual", "T", "jClass", "typeArgumentsSerializers", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "reflectiveOrContextual$SerializersKt__SerializersJvmKt", "genericArraySerializer", "Ljava/lang/reflect/GenericArrayType;", "genericArraySerializer$SerializersKt__SerializersJvmKt", "prettyClass", "prettyClass$SerializersKt__SerializersJvmKt", "kotlinx-serialization-core"}, k = 5, mv = {2, 1, 0}, xi = 48, xs = "kotlinx/serialization/SerializersKt")
@SourceDebugExtension
/* loaded from: classes5.dex */
final /* synthetic */ class SerializersKt__SerializersJvmKt {
    private static final KSerializer<Object> genericArraySerializer$SerializersKt__SerializersJvmKt(SerializersModule serializersModule, GenericArrayType genericArrayType, boolean z11) {
        KSerializer<Object> kSerializerSerializerOrNull;
        KClass kClassE;
        Type genericComponentType = genericArrayType.getGenericComponentType();
        if (genericComponentType instanceof WildcardType) {
            Type[] upperBounds = ((WildcardType) genericComponentType).getUpperBounds();
            Intrinsics.f(upperBounds, "getUpperBounds(...)");
            genericComponentType = (Type) kotlin.collections.c.x0(upperBounds);
        }
        Intrinsics.d(genericComponentType);
        if (z11) {
            kSerializerSerializerOrNull = SerializersKt.serializer(serializersModule, genericComponentType);
        } else {
            kSerializerSerializerOrNull = SerializersKt.serializerOrNull(serializersModule, genericComponentType);
            if (kSerializerSerializerOrNull == null) {
                return null;
            }
        }
        if (genericComponentType instanceof ParameterizedType) {
            Type rawType = ((ParameterizedType) genericComponentType).getRawType();
            Intrinsics.e(rawType, "null cannot be cast to non-null type java.lang.Class<*>");
            kClassE = JvmClassMappingKt.e((Class) rawType);
        } else {
            if (!(genericComponentType instanceof KClass)) {
                StringBuilder sb2 = new StringBuilder("unsupported type in GenericArray: ");
                throw new IllegalStateException(c1.u(Reflection.f71864a, genericComponentType.getClass(), sb2));
            }
            kClassE = (KClass) genericComponentType;
        }
        Intrinsics.e(kClassE, "null cannot be cast to non-null type kotlin.reflect.KClass<kotlin.Any>");
        KSerializer<Object> kSerializerArraySerializer = BuiltinSerializersKt.ArraySerializer(kClassE, kSerializerSerializerOrNull);
        Intrinsics.e(kSerializerArraySerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<kotlin.Any>");
        return kSerializerArraySerializer;
    }

    private static final Class<?> prettyClass$SerializersKt__SerializersJvmKt(Type type) {
        if (type instanceof Class) {
            return (Class) type;
        }
        if (type instanceof ParameterizedType) {
            Type rawType = ((ParameterizedType) type).getRawType();
            Intrinsics.f(rawType, "getRawType(...)");
            return prettyClass$SerializersKt__SerializersJvmKt(rawType);
        }
        if (type instanceof WildcardType) {
            Type[] upperBounds = ((WildcardType) type).getUpperBounds();
            Intrinsics.f(upperBounds, "getUpperBounds(...)");
            Object objX0 = kotlin.collections.c.x0(upperBounds);
            Intrinsics.f(objX0, "first(...)");
            return prettyClass$SerializersKt__SerializersJvmKt((Type) objX0);
        }
        if (type instanceof GenericArrayType) {
            Type genericComponentType = ((GenericArrayType) type).getGenericComponentType();
            Intrinsics.f(genericComponentType, "getGenericComponentType(...)");
            return prettyClass$SerializersKt__SerializersJvmKt(genericComponentType);
        }
        StringBuilder sb2 = new StringBuilder("type should be an instance of Class<?>, GenericArrayType, ParametrizedType or WildcardType, but actual argument ");
        sb2.append(type);
        sb2.append(" has type ");
        throw new IllegalArgumentException(c1.u(Reflection.f71864a, type.getClass(), sb2));
    }

    private static final <T> KSerializer<T> reflectiveOrContextual$SerializersKt__SerializersJvmKt(SerializersModule serializersModule, Class<T> cls, List<? extends KSerializer<Object>> list) throws IllegalAccessException, SecurityException, IllegalArgumentException, InvocationTargetException {
        KSerializer[] kSerializerArr = (KSerializer[]) list.toArray(new KSerializer[0]);
        KSerializer<T> kSerializerConstructSerializerForGivenTypeArgs = PlatformKt.constructSerializerForGivenTypeArgs(cls, (KSerializer<Object>[]) Arrays.copyOf(kSerializerArr, kSerializerArr.length));
        if (kSerializerConstructSerializerForGivenTypeArgs != null) {
            return kSerializerConstructSerializerForGivenTypeArgs;
        }
        KClass<T> kClassE = JvmClassMappingKt.e(cls);
        KSerializer<T> kSerializerBuiltinSerializerOrNull = PrimitivesKt.builtinSerializerOrNull(kClassE);
        if (kSerializerBuiltinSerializerOrNull != null) {
            return kSerializerBuiltinSerializerOrNull;
        }
        KSerializer<T> contextual = serializersModule.getContextual(kClassE, list);
        if (contextual != null) {
            return contextual;
        }
        if (cls.isInterface()) {
            return new PolymorphicSerializer(JvmClassMappingKt.e(cls));
        }
        return null;
    }

    @NotNull
    public static final KSerializer<Object> serializer(@NotNull Type type) {
        Intrinsics.g(type, "type");
        return SerializersKt.serializer(SerializersModuleBuildersKt.EmptySerializersModule(), type);
    }

    private static final KSerializer<Object> serializerByJavaTypeImpl$SerializersKt__SerializersJvmKt(SerializersModule serializersModule, Type type, boolean z11) {
        ArrayList<KSerializer> arrayList;
        if (type instanceof GenericArrayType) {
            return genericArraySerializer$SerializersKt__SerializersJvmKt(serializersModule, (GenericArrayType) type, z11);
        }
        if (type instanceof Class) {
            return typeSerializer$SerializersKt__SerializersJvmKt(serializersModule, (Class) type, z11);
        }
        if (!(type instanceof ParameterizedType)) {
            if (type instanceof WildcardType) {
                Type[] upperBounds = ((WildcardType) type).getUpperBounds();
                Intrinsics.f(upperBounds, "getUpperBounds(...)");
                Object objX0 = kotlin.collections.c.x0(upperBounds);
                Intrinsics.f(objX0, "first(...)");
                return serializerByJavaTypeImpl$SerializersKt__SerializersJvmKt$default(serializersModule, (Type) objX0, false, 2, null);
            }
            StringBuilder sb2 = new StringBuilder("type should be an instance of Class<?>, GenericArrayType, ParametrizedType or WildcardType, but actual argument ");
            sb2.append(type);
            sb2.append(" has type ");
            throw new IllegalArgumentException(c1.u(Reflection.f71864a, type.getClass(), sb2));
        }
        ParameterizedType parameterizedType = (ParameterizedType) type;
        Type rawType = parameterizedType.getRawType();
        Intrinsics.e(rawType, "null cannot be cast to non-null type java.lang.Class<*>");
        Class cls = (Class) rawType;
        Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
        Intrinsics.d(actualTypeArguments);
        if (z11) {
            arrayList = new ArrayList(actualTypeArguments.length);
            for (Type type2 : actualTypeArguments) {
                Intrinsics.d(type2);
                arrayList.add(SerializersKt.serializer(serializersModule, type2));
            }
        } else {
            arrayList = new ArrayList(actualTypeArguments.length);
            for (Type type3 : actualTypeArguments) {
                Intrinsics.d(type3);
                KSerializer<Object> kSerializerSerializerOrNull = SerializersKt.serializerOrNull(serializersModule, type3);
                if (kSerializerSerializerOrNull == null) {
                    return null;
                }
                arrayList.add(kSerializerSerializerOrNull);
            }
        }
        if (Set.class.isAssignableFrom(cls)) {
            KSerializer<Object> kSerializerSetSerializer = BuiltinSerializersKt.SetSerializer((KSerializer) arrayList.get(0));
            Intrinsics.e(kSerializerSetSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<kotlin.Any>");
            return kSerializerSetSerializer;
        }
        if (List.class.isAssignableFrom(cls) || Collection.class.isAssignableFrom(cls)) {
            KSerializer<Object> kSerializerListSerializer = BuiltinSerializersKt.ListSerializer((KSerializer) arrayList.get(0));
            Intrinsics.e(kSerializerListSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<kotlin.Any>");
            return kSerializerListSerializer;
        }
        if (Map.class.isAssignableFrom(cls)) {
            KSerializer<Object> kSerializerMapSerializer = BuiltinSerializersKt.MapSerializer((KSerializer) arrayList.get(0), (KSerializer) arrayList.get(1));
            Intrinsics.e(kSerializerMapSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<kotlin.Any>");
            return kSerializerMapSerializer;
        }
        if (Map.Entry.class.isAssignableFrom(cls)) {
            KSerializer<Object> kSerializerMapEntrySerializer = BuiltinSerializersKt.MapEntrySerializer((KSerializer) arrayList.get(0), (KSerializer) arrayList.get(1));
            Intrinsics.e(kSerializerMapEntrySerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<kotlin.Any>");
            return kSerializerMapEntrySerializer;
        }
        if (Pair.class.isAssignableFrom(cls)) {
            KSerializer<Object> kSerializerPairSerializer = BuiltinSerializersKt.PairSerializer((KSerializer) arrayList.get(0), (KSerializer) arrayList.get(1));
            Intrinsics.e(kSerializerPairSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<kotlin.Any>");
            return kSerializerPairSerializer;
        }
        if (Triple.class.isAssignableFrom(cls)) {
            KSerializer<Object> kSerializerTripleSerializer = BuiltinSerializersKt.TripleSerializer((KSerializer) arrayList.get(0), (KSerializer) arrayList.get(1), (KSerializer) arrayList.get(2));
            Intrinsics.e(kSerializerTripleSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<kotlin.Any>");
            return kSerializerTripleSerializer;
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        for (KSerializer kSerializer : arrayList) {
            Intrinsics.e(kSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<kotlin.Any?>");
            arrayList2.add(kSerializer);
        }
        return reflectiveOrContextual$SerializersKt__SerializersJvmKt(serializersModule, cls, arrayList2);
    }

    public static /* synthetic */ KSerializer serializerByJavaTypeImpl$SerializersKt__SerializersJvmKt$default(SerializersModule serializersModule, Type type, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = true;
        }
        return serializerByJavaTypeImpl$SerializersKt__SerializersJvmKt(serializersModule, type, z11);
    }

    @Nullable
    public static final KSerializer<Object> serializerOrNull(@NotNull Type type) {
        Intrinsics.g(type, "type");
        return SerializersKt.serializerOrNull(SerializersModuleBuildersKt.EmptySerializersModule(), type);
    }

    private static final KSerializer<Object> typeSerializer$SerializersKt__SerializersJvmKt(SerializersModule serializersModule, Class<?> cls, boolean z11) {
        KSerializer<Object> kSerializerSerializerOrNull;
        if (!cls.isArray() || cls.getComponentType().isPrimitive()) {
            return reflectiveOrContextual$SerializersKt__SerializersJvmKt(serializersModule, cls, EmptyList.f71733a);
        }
        Class<?> componentType = cls.getComponentType();
        Intrinsics.f(componentType, "getComponentType(...)");
        if (z11) {
            kSerializerSerializerOrNull = SerializersKt.serializer(serializersModule, componentType);
        } else {
            kSerializerSerializerOrNull = SerializersKt.serializerOrNull(serializersModule, componentType);
            if (kSerializerSerializerOrNull == null) {
                return null;
            }
        }
        KClass kClassE = JvmClassMappingKt.e(componentType);
        Intrinsics.e(kClassE, "null cannot be cast to non-null type kotlin.reflect.KClass<kotlin.Any>");
        KSerializer<Object> kSerializerArraySerializer = BuiltinSerializersKt.ArraySerializer(kClassE, kSerializerSerializerOrNull);
        Intrinsics.e(kSerializerArraySerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<kotlin.Any>");
        return kSerializerArraySerializer;
    }

    @NotNull
    public static final KSerializer<Object> serializer(@NotNull SerializersModule serializersModule, @NotNull Type type) {
        Intrinsics.g(serializersModule, "<this>");
        Intrinsics.g(type, "type");
        KSerializer<Object> kSerializerSerializerByJavaTypeImpl$SerializersKt__SerializersJvmKt = serializerByJavaTypeImpl$SerializersKt__SerializersJvmKt(serializersModule, type, true);
        if (kSerializerSerializerByJavaTypeImpl$SerializersKt__SerializersJvmKt != null) {
            return kSerializerSerializerByJavaTypeImpl$SerializersKt__SerializersJvmKt;
        }
        PlatformKt.serializerNotRegistered(prettyClass$SerializersKt__SerializersJvmKt(type));
        throw new KotlinNothingValueException();
    }

    @Nullable
    public static final KSerializer<Object> serializerOrNull(@NotNull SerializersModule serializersModule, @NotNull Type type) {
        Intrinsics.g(serializersModule, "<this>");
        Intrinsics.g(type, "type");
        return serializerByJavaTypeImpl$SerializersKt__SerializersJvmKt(serializersModule, type, false);
    }
}
