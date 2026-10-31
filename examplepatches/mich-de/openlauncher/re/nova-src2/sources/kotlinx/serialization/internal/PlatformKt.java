package kotlinx.serialization.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.UByte;
import kotlin.UByteArray;
import kotlin.UInt;
import kotlin.UIntArray;
import kotlin.ULong;
import kotlin.ULongArray;
import kotlin.UShort;
import kotlin.UShortArray;
import kotlin.Unit;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.BooleanCompanionObject;
import kotlin.jvm.internal.ByteCompanionObject;
import kotlin.jvm.internal.CharCompanionObject;
import kotlin.jvm.internal.DoubleCompanionObject;
import kotlin.jvm.internal.FloatCompanionObject;
import kotlin.jvm.internal.IntCompanionObject;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.LongCompanionObject;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.jvm.internal.ShortCompanionObject;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.reflect.KClass;
import kotlin.time.Duration;
import kotlin.uuid.Uuid;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Polymorphic;
import kotlinx.serialization.PolymorphicSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;

@Metadata(d1 = {"\u0000`\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010\u0018\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a&\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u0001*\b\u0012\u0004\u0012\u0002H\u00010\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0080\b¢\u0006\u0002\u0010\u0005\u001a\u0015\u0010\u0000\u001a\u00020\u0006*\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u0004H\u0080\b\u001a\u001c\u0010\b\u001a\u00020\u0006\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\nH\u0000\u001a$\u0010\u000b\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\nH\u0000\u001aK\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\u000e0\u0002\"\b\b\u0000\u0010\u0001*\u00020\t\"\n\b\u0001\u0010\u000e*\u0004\u0018\u0001H\u0001*\u0012\u0012\u0004\u0012\u0002H\u000e0\u000fj\b\u0012\u0004\u0012\u0002H\u000e`\u00102\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u0002H\u00010\nH\u0000¢\u0006\u0002\u0010\u0012\u001a\u0010\u0010\u0013\u001a\u00020\u0014*\u0006\u0012\u0002\b\u00030\nH\u0000\u001a\u0010\u0010\u0015\u001a\u00020\u0014*\u0006\u0012\u0002\b\u00030\u0016H\u0000\u001aM\u0010\u0017\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\n2\"\u0010\u0018\u001a\u0012\u0012\u000e\b\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\f0\u0002\"\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\fH\u0000¢\u0006\u0002\u0010\u0019\u001aM\u0010\u0017\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u00162\"\u0010\u0018\u001a\u0012\u0012\u000e\b\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\f0\u0002\"\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\fH\u0000¢\u0006\u0002\u0010\u001a\u001aM\u0010\u001b\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u00162\"\u0010\u0018\u001a\u0012\u0012\u000e\b\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\f0\u0002\"\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\fH\u0002¢\u0006\u0002\u0010\u001a\u001a\u001e\u0010\u001c\u001a\u0004\u0018\u00010\t\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u0016H\u0002\u001a\u001c\u0010\u001d\u001a\u00020\u0006\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u0016H\u0002\u001a\u001c\u0010\u001e\u001a\u00020\u0006\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u0016H\u0002\u001aO\u0010\u001f\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t2\n\u0010 \u001a\u0006\u0012\u0002\b\u00030\u00162\"\u0010\u0018\u001a\u0012\u0012\u000e\b\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\f0\u0002\"\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\fH\u0002¢\u0006\u0002\u0010\u001a\u001aK\u0010!\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t2\u0006\u0010\"\u001a\u00020\t2\"\u0010\u0018\u001a\u0012\u0012\u000e\b\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\f0\u0002\"\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\fH\u0002¢\u0006\u0002\u0010#\u001a\u001a\u0010$\u001a\u0004\u0018\u00010\t*\u0006\u0012\u0002\b\u00030\u00162\u0006\u0010%\u001a\u00020&H\u0002\u001a\"\u0010'\u001a\b\u0012\u0004\u0012\u0002H\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u0016H\u0002\u001a$\u0010(\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u0016H\u0002\u001a\u0016\u0010)\u001a\u00020\u00062\f\u0010*\u001a\b\u0012\u0004\u0012\u00020\t0\nH\u0000\u001a\u001c\u0010+\u001a\u0016\u0012\b\u0012\u0006\u0012\u0002\b\u00030\n\u0012\b\u0012\u0006\u0012\u0002\b\u00030\f0,H\u0000\u001a\u0017\u0010-\u001a\u00020.2\f\u0010/\u001a\b\u0012\u0004\u0012\u00020.00H\u0082\b¨\u00061"}, d2 = {"getChecked", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "([Ljava/lang/Object;I)Ljava/lang/Object;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isInterface", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/reflect/KClass;", "compiledSerializerImpl", "Lkotlinx/serialization/KSerializer;", "toNativeArrayImpl", "E", "Ljava/util/ArrayList;", "Lkotlin/collections/ArrayList;", "eClass", "(Ljava/util/ArrayList;Lkotlin/reflect/KClass;)[Ljava/lang/Object;", "platformSpecificSerializerNotRegistered", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serializerNotRegistered", "Ljava/lang/Class;", "constructSerializerForGivenTypeArgs", "args", "(Lkotlin/reflect/KClass;[Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;", "(Ljava/lang/Class;[Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;", "findInNamedCompanion", "findNamedCompanionByAnnotation", "isNotAnnotated", "isPolymorphicSerializer", "invokeSerializerOnDefaultCompanion", "jClass", "invokeSerializerOnCompanion", "companion", "(Ljava/lang/Object;[Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;", "companionOrNull", "companionName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "createEnumSerializer", "findObjectSerializer", "isReferenceArray", "rootClass", "initBuiltins", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "loadSafe", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "block", "Lkotlin/Function0;", "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class PlatformKt {
    private static final Object companionOrNull(Class<?> cls, String str) {
        try {
            Field declaredField = cls.getDeclaredField(str);
            declaredField.setAccessible(true);
            return declaredField.get(null);
        } catch (Throwable unused) {
            return null;
        }
    }

    @Nullable
    public static final <T> KSerializer<T> compiledSerializerImpl(@NotNull KClass<T> kClass) {
        Intrinsics.g(kClass, "<this>");
        return constructSerializerForGivenTypeArgs(kClass, (KSerializer<Object>[]) new KSerializer[0]);
    }

    @Nullable
    public static final <T> KSerializer<T> constructSerializerForGivenTypeArgs(@NotNull KClass<T> kClass, @NotNull KSerializer<Object>... args) {
        Intrinsics.g(kClass, "<this>");
        Intrinsics.g(args, "args");
        return constructSerializerForGivenTypeArgs(JvmClassMappingKt.b(kClass), (KSerializer<Object>[]) Arrays.copyOf(args, args.length));
    }

    private static final <T> KSerializer<T> createEnumSerializer(Class<T> cls) {
        T[] enumConstants = cls.getEnumConstants();
        String canonicalName = cls.getCanonicalName();
        Intrinsics.f(canonicalName, "getCanonicalName(...)");
        Intrinsics.e(enumConstants, "null cannot be cast to non-null type kotlin.Array<out kotlin.Enum<*>>");
        return new EnumSerializer(canonicalName, (Enum[]) enumConstants);
    }

    private static final <T> KSerializer<T> findInNamedCompanion(Class<T> cls, KSerializer<Object>... kSerializerArr) {
        Field field;
        KSerializer<T> kSerializerInvokeSerializerOnCompanion;
        Object objFindNamedCompanionByAnnotation = findNamedCompanionByAnnotation(cls);
        if (objFindNamedCompanionByAnnotation != null && (kSerializerInvokeSerializerOnCompanion = invokeSerializerOnCompanion(objFindNamedCompanionByAnnotation, (KSerializer[]) Arrays.copyOf(kSerializerArr, kSerializerArr.length))) != null) {
            return kSerializerInvokeSerializerOnCompanion;
        }
        try {
            Class<?>[] declaredClasses = cls.getDeclaredClasses();
            Intrinsics.f(declaredClasses, "getDeclaredClasses(...)");
            int length = declaredClasses.length;
            int i5 = 0;
            Class<?> cls2 = null;
            boolean z11 = false;
            while (true) {
                if (i5 < length) {
                    Class<?> cls3 = declaredClasses[i5];
                    if (cls3.getSimpleName().equals("$serializer")) {
                        if (z11) {
                            break;
                        }
                        z11 = true;
                        cls2 = cls3;
                    }
                    i5++;
                } else if (!z11) {
                }
            }
            cls2 = null;
            Object obj = (cls2 == null || (field = cls2.getField("INSTANCE")) == null) ? null : field.get(null);
            if (obj instanceof KSerializer) {
                return (KSerializer) obj;
            }
        } catch (NoSuchFieldException unused) {
        }
        return null;
    }

    private static final <T> Object findNamedCompanionByAnnotation(Class<T> cls) {
        Class<?> cls2;
        Class<?>[] declaredClasses = cls.getDeclaredClasses();
        Intrinsics.f(declaredClasses, "getDeclaredClasses(...)");
        int length = declaredClasses.length;
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                cls2 = null;
                break;
            }
            cls2 = declaredClasses[i5];
            if (cls2.getAnnotation(NamedCompanion.class) != null) {
                break;
            }
            i5++;
        }
        if (cls2 == null) {
            return null;
        }
        return companionOrNull(cls, cls2.getSimpleName());
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x0095, code lost:
    
        r5 = null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static final <T> KSerializer<T> findObjectSerializer(Class<T> cls) throws IllegalAccessException, SecurityException, IllegalArgumentException, InvocationTargetException {
        String canonicalName = cls.getCanonicalName();
        if (canonicalName != null) {
            int i5 = 0;
            if (!j.I0(canonicalName, "java.", false) && !j.I0(canonicalName, "kotlin.", false)) {
                Field[] declaredFields = cls.getDeclaredFields();
                Intrinsics.f(declaredFields, "getDeclaredFields(...)");
                int length = declaredFields.length;
                Field field = null;
                int i11 = 0;
                boolean z11 = false;
                while (true) {
                    if (i11 >= length) {
                        if (!z11) {
                            break;
                        }
                    } else {
                        Field field2 = declaredFields[i11];
                        if (Intrinsics.b(field2.getName(), "INSTANCE") && Intrinsics.b(field2.getType(), cls) && Modifier.isStatic(field2.getModifiers())) {
                            if (z11) {
                                break;
                            }
                            z11 = true;
                            field = field2;
                        }
                        i11++;
                    }
                }
                field = null;
                if (field != null) {
                    Object obj = field.get(null);
                    Method[] methods = cls.getMethods();
                    Intrinsics.f(methods, "getMethods(...)");
                    int length2 = methods.length;
                    Method method = null;
                    boolean z12 = false;
                    while (true) {
                        if (i5 >= length2) {
                            if (!z12) {
                                break;
                            }
                        } else {
                            Method method2 = methods[i5];
                            if (Intrinsics.b(method2.getName(), "serializer")) {
                                Class<?>[] parameterTypes = method2.getParameterTypes();
                                Intrinsics.f(parameterTypes, "getParameterTypes(...)");
                                if (parameterTypes.length == 0 && Intrinsics.b(method2.getReturnType(), KSerializer.class)) {
                                    if (z12) {
                                        break;
                                    }
                                    method = method2;
                                    z12 = true;
                                }
                            }
                            i5++;
                        }
                    }
                    if (method != null) {
                        Object objInvoke = method.invoke(obj, null);
                        if (objInvoke instanceof KSerializer) {
                            return (KSerializer) objInvoke;
                        }
                    }
                }
            }
        }
        return null;
    }

    public static final <T> T getChecked(@NotNull T[] tArr, int i5) {
        Intrinsics.g(tArr, "<this>");
        return tArr[i5];
    }

    @NotNull
    public static final Map<KClass<?>, KSerializer<?>> initBuiltins() {
        MapBuilder mapBuilder = new MapBuilder();
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(String.class), BuiltinSerializersKt.serializer(StringCompanionObject.f71868a));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(Character.TYPE), BuiltinSerializersKt.serializer(CharCompanionObject.f71847a));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(char[].class), BuiltinSerializersKt.CharArraySerializer());
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(Double.TYPE), BuiltinSerializersKt.serializer(DoubleCompanionObject.f71854a));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(double[].class), BuiltinSerializersKt.DoubleArraySerializer());
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(Float.TYPE), BuiltinSerializersKt.serializer(FloatCompanionObject.f71855a));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(float[].class), BuiltinSerializersKt.FloatArraySerializer());
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(Long.TYPE), BuiltinSerializersKt.serializer(LongCompanionObject.f71857a));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(long[].class), BuiltinSerializersKt.LongArraySerializer());
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(ULong.class), BuiltinSerializersKt.serializer(ULong.f71699b));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(Integer.TYPE), BuiltinSerializersKt.serializer(IntCompanionObject.f71856a));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(int[].class), BuiltinSerializersKt.IntArraySerializer());
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(UInt.class), BuiltinSerializersKt.serializer(UInt.f71696b));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(Short.TYPE), BuiltinSerializersKt.serializer(ShortCompanionObject.f71866a));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(short[].class), BuiltinSerializersKt.ShortArraySerializer());
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(UShort.class), BuiltinSerializersKt.serializer(UShort.f71703b));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(Byte.TYPE), BuiltinSerializersKt.serializer(ByteCompanionObject.f71846a));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(byte[].class), BuiltinSerializersKt.ByteArraySerializer());
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(UByte.class), BuiltinSerializersKt.serializer(UByte.f71693b));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(Boolean.TYPE), BuiltinSerializersKt.serializer(BooleanCompanionObject.f71845a));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(boolean[].class), BuiltinSerializersKt.BooleanArraySerializer());
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(Unit.class), BuiltinSerializersKt.serializer(Unit.f71706a));
        mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(Void.class), BuiltinSerializersKt.NothingSerializer());
        try {
            mapBuilder.put(reflectionFactory.getOrCreateKotlinClass(Duration.class), BuiltinSerializersKt.serializer(Duration.f72038b));
        } catch (ClassNotFoundException | NoClassDefFoundError unused) {
        }
        try {
            mapBuilder.put(Reflection.f71864a.getOrCreateKotlinClass(ULongArray.class), BuiltinSerializersKt.ULongArraySerializer());
        } catch (ClassNotFoundException | NoClassDefFoundError unused2) {
        }
        try {
            mapBuilder.put(Reflection.f71864a.getOrCreateKotlinClass(UIntArray.class), BuiltinSerializersKt.UIntArraySerializer());
        } catch (ClassNotFoundException | NoClassDefFoundError unused3) {
        }
        try {
            mapBuilder.put(Reflection.f71864a.getOrCreateKotlinClass(UShortArray.class), BuiltinSerializersKt.UShortArraySerializer());
        } catch (ClassNotFoundException | NoClassDefFoundError unused4) {
        }
        try {
            mapBuilder.put(Reflection.f71864a.getOrCreateKotlinClass(UByteArray.class), BuiltinSerializersKt.UByteArraySerializer());
        } catch (ClassNotFoundException | NoClassDefFoundError unused5) {
        }
        try {
            mapBuilder.put(Reflection.f71864a.getOrCreateKotlinClass(Uuid.class), BuiltinSerializersKt.serializer(Uuid.f72055c));
        } catch (ClassNotFoundException | NoClassDefFoundError unused6) {
        }
        return mapBuilder.b();
    }

    private static final <T> KSerializer<T> invokeSerializerOnCompanion(Object obj, KSerializer<Object>... kSerializerArr) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Class[] clsArr;
        try {
            if (kSerializerArr.length == 0) {
                clsArr = new Class[0];
            } else {
                int length = kSerializerArr.length;
                Class[] clsArr2 = new Class[length];
                for (int i5 = 0; i5 < length; i5++) {
                    clsArr2[i5] = KSerializer.class;
                }
                clsArr = clsArr2;
            }
            Object objInvoke = obj.getClass().getDeclaredMethod("serializer", (Class[]) Arrays.copyOf(clsArr, clsArr.length)).invoke(obj, Arrays.copyOf(kSerializerArr, kSerializerArr.length));
            if (objInvoke instanceof KSerializer) {
                return (KSerializer) objInvoke;
            }
            return null;
        } catch (NoSuchMethodException unused) {
            return null;
        } catch (InvocationTargetException e3) {
            Throwable cause = e3.getCause();
            if (cause == null) {
                throw e3;
            }
            String message = cause.getMessage();
            if (message == null) {
                message = e3.getMessage();
            }
            throw new InvocationTargetException(cause, message);
        }
    }

    private static final <T> KSerializer<T> invokeSerializerOnDefaultCompanion(Class<?> cls, KSerializer<Object>... kSerializerArr) {
        Object objCompanionOrNull = companionOrNull(cls, k.O);
        if (objCompanionOrNull == null) {
            return null;
        }
        return invokeSerializerOnCompanion(objCompanionOrNull, (KSerializer[]) Arrays.copyOf(kSerializerArr, kSerializerArr.length));
    }

    public static final <T> boolean isInterface(@NotNull KClass<T> kClass) {
        Intrinsics.g(kClass, "<this>");
        return JvmClassMappingKt.b(kClass).isInterface();
    }

    private static final <T> boolean isNotAnnotated(Class<T> cls) {
        return cls.getAnnotation(Serializable.class) == null && cls.getAnnotation(Polymorphic.class) == null;
    }

    private static final <T> boolean isPolymorphicSerializer(Class<T> cls) {
        if (cls.getAnnotation(Polymorphic.class) != null) {
            return true;
        }
        Serializable serializable = (Serializable) cls.getAnnotation(Serializable.class);
        if (serializable == null) {
            return false;
        }
        Class<? extends KSerializer<?>> clsWith = serializable.with();
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        return Intrinsics.b(reflectionFactory.getOrCreateKotlinClass(clsWith), reflectionFactory.getOrCreateKotlinClass(PolymorphicSerializer.class));
    }

    public static final boolean isReferenceArray(@NotNull KClass<Object> rootClass) {
        Intrinsics.g(rootClass, "rootClass");
        return JvmClassMappingKt.b(rootClass).isArray();
    }

    private static final void loadSafe(Function0<Unit> function0) {
        try {
            function0.invoke();
        } catch (ClassNotFoundException | NoClassDefFoundError unused) {
        }
    }

    @NotNull
    public static final Void platformSpecificSerializerNotRegistered(@NotNull KClass<?> kClass) {
        Intrinsics.g(kClass, "<this>");
        Platform_commonKt.serializerNotRegistered(kClass);
        throw new KotlinNothingValueException();
    }

    @NotNull
    public static final Void serializerNotRegistered(@NotNull Class<?> cls) {
        Intrinsics.g(cls, "<this>");
        throw new SerializationException(Platform_commonKt.notRegisteredMessage((KClass<?>) JvmClassMappingKt.e(cls)));
    }

    @NotNull
    public static final <T, E extends T> E[] toNativeArrayImpl(@NotNull ArrayList<E> arrayList, @NotNull KClass<T> eClass) throws NegativeArraySizeException {
        Intrinsics.g(arrayList, "<this>");
        Intrinsics.g(eClass, "eClass");
        Object objNewInstance = Array.newInstance((Class<?>) JvmClassMappingKt.b(eClass), arrayList.size());
        Intrinsics.e(objNewInstance, "null cannot be cast to non-null type kotlin.Array<E of kotlinx.serialization.internal.PlatformKt.toNativeArrayImpl>");
        E[] eArr = (E[]) arrayList.toArray((Object[]) objNewInstance);
        Intrinsics.f(eArr, "toArray(...)");
        return eArr;
    }

    @Nullable
    public static final <T> KSerializer<T> constructSerializerForGivenTypeArgs(@NotNull Class<T> cls, @NotNull KSerializer<Object>... args) throws IllegalAccessException, SecurityException, IllegalArgumentException, InvocationTargetException {
        Intrinsics.g(cls, "<this>");
        Intrinsics.g(args, "args");
        if (cls.isEnum() && isNotAnnotated(cls)) {
            return createEnumSerializer(cls);
        }
        KSerializer<T> kSerializerInvokeSerializerOnDefaultCompanion = invokeSerializerOnDefaultCompanion(cls, (KSerializer[]) Arrays.copyOf(args, args.length));
        if (kSerializerInvokeSerializerOnDefaultCompanion != null) {
            return kSerializerInvokeSerializerOnDefaultCompanion;
        }
        KSerializer<T> kSerializerFindObjectSerializer = findObjectSerializer(cls);
        if (kSerializerFindObjectSerializer != null) {
            return kSerializerFindObjectSerializer;
        }
        KSerializer<T> kSerializerFindInNamedCompanion = findInNamedCompanion(cls, (KSerializer[]) Arrays.copyOf(args, args.length));
        if (kSerializerFindInNamedCompanion != null) {
            return kSerializerFindInNamedCompanion;
        }
        if (isPolymorphicSerializer(cls)) {
            return new PolymorphicSerializer(JvmClassMappingKt.e(cls));
        }
        return null;
    }

    public static final boolean getChecked(@NotNull boolean[] zArr, int i5) {
        Intrinsics.g(zArr, "<this>");
        return zArr[i5];
    }
}
