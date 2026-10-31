package h50;

import e10.h2;
import java.util.Iterator;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;

/* loaded from: classes.dex */
public abstract class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final za0.b f59160a = za0.d.b("io.ktor.client.plugins.HttpCallValidator");

    /* renamed from: b, reason: collision with root package name */
    public static final i50.c f59161b = fg.a.j("HttpResponseValidator", u.f59285d, new h2(25));

    /* renamed from: c, reason: collision with root package name */
    public static final s50.a f59162c;

    static {
        KType kTypeB;
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(Boolean.class);
        try {
            kTypeB = Reflection.b(Boolean.TYPE);
        } catch (Throwable unused) {
            kTypeB = null;
        }
        f59162c = new s50.a("ExpectSuccessAttributeKey", new x50.a(orCreateKotlinClass, kTypeB));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Unit a(List list, Throwable th2, k50.b bVar, ContinuationImpl continuationImpl) {
        y yVar;
        Iterator it;
        if (continuationImpl instanceof y) {
            yVar = (y) continuationImpl;
            int i5 = yVar.f59318u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yVar.f59318u = i5 - Integer.MIN_VALUE;
            } else {
                yVar = new y(continuationImpl);
            }
        }
        Object obj = yVar.f59317t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yVar.f59318u;
        if (i11 == 0) {
            ResultKt.b(obj);
            f59160a.h("Processing exception " + th2 + " for request " + bVar.getUrl());
            it = list.iterator();
        } else {
            if (i11 != 1 && i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            it = null;
        }
        if (!it.hasNext()) {
            return Unit.f71706a;
        }
        b.c0.y(it.next());
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(List list, l50.b bVar, ContinuationImpl continuationImpl) {
        z zVar;
        Iterator it;
        if (continuationImpl instanceof z) {
            zVar = (z) continuationImpl;
            int i5 = zVar.f59323w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zVar.f59323w = i5 - Integer.MIN_VALUE;
            } else {
                zVar = new z(continuationImpl);
            }
        }
        Object obj = zVar.f59322v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zVar.f59323w;
        if (i11 == 0) {
            ResultKt.b(obj);
            f59160a.h("Validating response for request " + bVar.b().c().getUrl());
            it = list.iterator();
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            it = zVar.f59321u;
            bVar = zVar.f59320t;
            ResultKt.b(obj);
        }
        while (it.hasNext()) {
            Function2 function2 = (Function2) it.next();
            zVar.f59320t = bVar;
            zVar.f59321u = it;
            zVar.f59323w = 1;
            if (function2.invoke(bVar, zVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        return Unit.f71706a;
    }
}
