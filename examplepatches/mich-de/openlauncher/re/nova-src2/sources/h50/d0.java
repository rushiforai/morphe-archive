package h50;

import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;

/* loaded from: classes.dex */
public abstract class d0 {

    /* renamed from: a, reason: collision with root package name */
    public static final s50.a f59169a;

    static {
        KType kTypeB;
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(s50.d.class);
        try {
            kTypeB = Reflection.b(s50.d.class);
        } catch (Throwable unused) {
            kTypeB = null;
        }
        f59169a = new s50.a("ApplicationPluginRegistry", new x50.a(orCreateKotlinClass, kTypeB));
    }
}
