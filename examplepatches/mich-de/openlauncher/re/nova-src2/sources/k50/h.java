package k50;

import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;

/* loaded from: classes.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final s50.a f71148a;

    static {
        KType kTypeB;
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(x50.a.class);
        try {
            kTypeB = Reflection.b(x50.a.class);
        } catch (Throwable unused) {
            kTypeB = null;
        }
        f71148a = new s50.a("BodyTypeAttributeKey", new x50.a(orCreateKotlinClass, kTypeB));
    }
}
