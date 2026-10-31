package h50;

import kotlin.Unit;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;

/* loaded from: classes.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final s50.a f59216a;

    /* renamed from: b, reason: collision with root package name */
    public static final za0.b f59217b;

    static {
        KType kTypeB;
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(Unit.class);
        try {
            kTypeB = Reflection.b(Unit.class);
        } catch (Throwable unused) {
            kTypeB = null;
        }
        f59216a = new s50.a("ValidateMark", new x50.a(orCreateKotlinClass, kTypeB));
        f59217b = za0.d.b("io.ktor.client.plugins.DefaultResponseValidation");
    }
}
