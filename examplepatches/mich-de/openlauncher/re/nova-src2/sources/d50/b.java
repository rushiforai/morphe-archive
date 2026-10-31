package d50;

import h50.s;
import io.ktor.client.call.DoubleReceiveException;
import io.ktor.client.call.NoTransformationFoundException;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import t70.j0;
import t70.k0;

/* loaded from: classes.dex */
public class b implements j0 {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f48977d;

    /* renamed from: e, reason: collision with root package name */
    public static final s50.a f48978e;

    /* renamed from: a, reason: collision with root package name */
    public final c50.e f48979a;

    /* renamed from: b, reason: collision with root package name */
    public k50.b f48980b;

    /* renamed from: c, reason: collision with root package name */
    public l50.b f48981c;

    @NotNull
    private volatile /* synthetic */ int received = 0;

    static {
        KType kTypeB;
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(Object.class);
        try {
            kTypeB = Reflection.b(Object.class);
        } catch (Throwable unused) {
            kTypeB = null;
        }
        f48978e = new s50.a("CustomResponse", new x50.a(orCreateKotlinClass, kTypeB));
        f48977d = AtomicIntegerFieldUpdater.newUpdater(b.class, "received");
    }

    public b(c50.e eVar) {
        this.f48979a = eVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:42:0x00bb, code lost:
    
        if (r9 == r1) goto L43;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(x50.a aVar, ContinuationImpl continuationImpl) {
        a aVar2;
        if (continuationImpl instanceof a) {
            aVar2 = (a) continuationImpl;
            int i5 = aVar2.f48976w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar2.f48976w = i5 - Integer.MIN_VALUE;
            } else {
                aVar2 = new a(this, continuationImpl);
            }
        }
        Object objD = aVar2.f48974u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar2.f48976w;
        try {
            if (i11 == 0) {
                ResultKt.b(objD);
                l50.b bVarD = d();
                KClass type = aVar.f95106a;
                Intrinsics.g(type, "type");
                if (JvmClassMappingKt.b(type).isInstance(bVarD)) {
                    return d();
                }
                if (!b()) {
                    l50.b bVarD2 = d();
                    s50.a aVar3 = s.f59272a;
                    s50.d attributes = bVarD2.b().getAttributes();
                    s50.a key = s.f59273b;
                    attributes.getClass();
                    Intrinsics.g(key, "key");
                    if (!attributes.c().containsKey(key) && !f48977d.compareAndSet(this, 0, 1)) {
                        throw new DoubleReceiveException(this);
                    }
                }
                objD = getAttributes().d(f48978e);
                if (objD == null) {
                    aVar2.f48973t = aVar;
                    aVar2.f48976w = 1;
                    objD = e();
                    if (objD == coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    aVar = aVar2.f48973t;
                    ResultKt.b(objD);
                    Object obj = ((l50.c) objD).f74731b;
                    if (Intrinsics.b(obj, r50.a.f85525a)) {
                        obj = null;
                    }
                    if (obj != null) {
                        KClass type2 = aVar.f95106a;
                        Intrinsics.g(type2, "type");
                        if (!JvmClassMappingKt.b(type2).isInstance(obj)) {
                            throw new NoTransformationFoundException(d(), Reflection.f71864a.getOrCreateKotlinClass(obj.getClass()), aVar.f95106a);
                        }
                    }
                    return obj;
                }
                aVar = aVar2.f48973t;
                ResultKt.b(objD);
            }
            l50.c cVar = new l50.c(aVar, objD);
            l50.a aVar4 = this.f48979a.f19688f;
            aVar2.f48973t = aVar;
            aVar2.f48976w = 2;
            objD = aVar4.a(this, cVar, aVar2);
        } catch (Throwable th2) {
            k0.c(d(), ph.a.a("Receive failed", th2));
            throw th2;
        }
    }

    public boolean b() {
        return false;
    }

    public final k50.b c() {
        k50.b bVar = this.f48980b;
        if (bVar != null) {
            return bVar;
        }
        Intrinsics.m("request");
        throw null;
    }

    public final l50.b d() {
        l50.b bVar = this.f48981c;
        if (bVar != null) {
            return bVar;
        }
        Intrinsics.m("response");
        throw null;
    }

    public Object e() {
        return d().c();
    }

    public final s50.d getAttributes() {
        return c().getAttributes();
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return d().getCoroutineContext();
    }

    public final String toString() {
        return "HttpClientCall[" + c().getUrl() + ", " + d().f() + AbstractJsonLexerKt.END_LIST;
    }
}
