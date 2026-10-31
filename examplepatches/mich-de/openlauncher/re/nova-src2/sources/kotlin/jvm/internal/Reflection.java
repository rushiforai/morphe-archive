package kotlin.jvm.internal;

import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import kotlin.reflect.KClass;
import kotlin.reflect.KProperty1;
import kotlin.reflect.KType;
import kotlin.reflect.KTypeProjection;
import kotlin.reflect.jvm.internal.ReflectionFactoryImpl;

/* loaded from: classes.dex */
public class Reflection {

    /* renamed from: a, reason: collision with root package name */
    public static final ReflectionFactory f71864a;

    /* renamed from: b, reason: collision with root package name */
    public static final KClass[] f71865b;

    static {
        ReflectionFactory reflectionFactory = null;
        try {
            reflectionFactory = (ReflectionFactory) ReflectionFactoryImpl.class.newInstance();
        } catch (ClassCastException | ClassNotFoundException | IllegalAccessException | InstantiationException unused) {
        }
        if (reflectionFactory == null) {
            reflectionFactory = new ReflectionFactory();
        }
        f71864a = reflectionFactory;
        f71865b = new KClass[0];
    }

    public static KProperty1 a(PropertyReference1Impl propertyReference1Impl) {
        return f71864a.property1(propertyReference1Impl);
    }

    public static KType b(Class cls) {
        ReflectionFactory reflectionFactory = f71864a;
        return reflectionFactory.typeOf(reflectionFactory.getOrCreateKotlinClass(cls), Collections.EMPTY_LIST, false);
    }

    public static KType c(Class cls, KTypeProjection kTypeProjection) {
        ReflectionFactory reflectionFactory = f71864a;
        return reflectionFactory.typeOf(reflectionFactory.getOrCreateKotlinClass(cls), Collections.singletonList(kTypeProjection), false);
    }

    public static KType d(Class cls, KTypeProjection... kTypeProjectionArr) {
        ReflectionFactory reflectionFactory = f71864a;
        return reflectionFactory.typeOf(reflectionFactory.getOrCreateKotlinClass(cls), kotlin.collections.c.b1(kTypeProjectionArr), false);
    }

    public static KType e(KTypeProjection kTypeProjection, KTypeProjection kTypeProjection2) {
        ReflectionFactory reflectionFactory = f71864a;
        return reflectionFactory.typeOf(reflectionFactory.getOrCreateKotlinClass(Map.class), Arrays.asList(kTypeProjection, kTypeProjection2), false);
    }
}
