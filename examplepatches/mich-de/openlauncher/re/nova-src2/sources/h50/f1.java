package h50;

import java.util.ArrayList;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;

/* loaded from: classes.dex */
public final class f1 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f59185b = new a(8);

    /* renamed from: c, reason: collision with root package name */
    public static final s50.a f59186c;

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f59187a = new ArrayList();

    static {
        KType kTypeB;
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(f1.class);
        try {
            kTypeB = Reflection.b(f1.class);
        } catch (Throwable unused) {
            kTypeB = null;
        }
        f59186c = new s50.a("HttpSend", new x50.a(orCreateKotlinClass, kTypeB));
    }
}
