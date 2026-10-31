package f50;

import ab.e0;
import h50.g1;
import java.util.Map;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;
import kotlin.reflect.KTypeProjection;

/* loaded from: classes.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final s50.a f54327a;

    static {
        KType kTypeMutableCollectionType;
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        KClass orCreateKotlinClass = reflectionFactory.getOrCreateKotlinClass(Map.class);
        try {
            KTypeProjection.Companion companion = KTypeProjection.INSTANCE;
            kTypeMutableCollectionType = reflectionFactory.mutableCollectionType(Reflection.e(companion.invariant(Reflection.c(g.class, companion.getSTAR())), companion.invariant(Reflection.b(Object.class))));
        } catch (Throwable unused) {
            kTypeMutableCollectionType = null;
        }
        f54327a = new s50.a("EngineCapabilities", new x50.a(orCreateKotlinClass, kTypeMutableCollectionType));
        e0.U(g1.f59194a);
    }
}
