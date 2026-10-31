package h50;

import e10.h2;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;

/* loaded from: classes.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final s50.a f59173a;

    /* renamed from: b, reason: collision with root package name */
    public static final s50.a f59174b;

    /* renamed from: c, reason: collision with root package name */
    public static final i50.c f59175c;

    static {
        KType kTypeB;
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(e50.a.class);
        KType kTypeB2 = null;
        try {
            kTypeB = Reflection.b(e50.a.class);
        } catch (Throwable unused) {
            kTypeB = null;
        }
        f59173a = new s50.a("UploadProgressListenerAttributeKey", new x50.a(orCreateKotlinClass, kTypeB));
        KClass orCreateKotlinClass2 = Reflection.f71864a.getOrCreateKotlinClass(e50.a.class);
        try {
            kTypeB2 = Reflection.b(e50.a.class);
        } catch (Throwable unused2) {
        }
        f59174b = new s50.a("DownloadProgressListenerAttributeKey", new x50.a(orCreateKotlinClass2, kTypeB2));
        f59175c = fg.a.j("BodyProgress", new q(3), new h2(21));
    }
}
