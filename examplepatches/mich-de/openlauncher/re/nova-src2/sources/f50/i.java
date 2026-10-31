package f50;

import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;
import kotlin.reflect.KTypeProjection;
import t70.i0;

/* loaded from: classes.dex */
public abstract class i {

    /* renamed from: a, reason: collision with root package name */
    public static final i0 f54328a = new i0("call-context");

    /* renamed from: b, reason: collision with root package name */
    public static final s50.a f54329b;

    static {
        KType kTypeC;
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(c50.g.class);
        try {
            kTypeC = Reflection.c(c50.g.class, KTypeProjection.INSTANCE.getSTAR());
        } catch (Throwable unused) {
            kTypeC = null;
        }
        f54329b = new s50.a("client-config", new x50.a(orCreateKotlinClass, kTypeC));
    }
}
