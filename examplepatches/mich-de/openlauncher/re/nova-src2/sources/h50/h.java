package h50;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: b, reason: collision with root package name */
    public static final a f59195b = new a(6);

    /* renamed from: c, reason: collision with root package name */
    public static final s50.a f59196c;

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f59197a;

    static {
        KType kTypeB;
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(h.class);
        try {
            kTypeB = Reflection.b(h.class);
        } catch (Throwable unused) {
            kTypeB = null;
        }
        f59196c = new s50.a("DefaultRequest", new x50.a(orCreateKotlinClass, kTypeB));
    }

    public h(Function1 function1) {
        this.f59197a = function1;
    }
}
