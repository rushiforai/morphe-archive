package k50;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;
import o50.b0;
import o50.r;

/* loaded from: classes.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final s50.a f71130a;

    static {
        KType kTypeB;
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(i.class);
        try {
            kTypeB = Reflection.b(i.class);
        } catch (Throwable unused) {
            kTypeB = null;
        }
        f71130a = new s50.a("ResponseAdapterAttributeKey", new x50.a(orCreateKotlinClass, kTypeB));
    }

    public static final void a(r rVar, Function1 block) {
        Intrinsics.g(rVar, "<this>");
        Intrinsics.g(block, "block");
        block.invoke(rVar.a());
    }

    public static final void b(c cVar, String urlString) {
        Intrinsics.g(urlString, "urlString");
        b0.b(cVar.f71117a, urlString);
    }
}
