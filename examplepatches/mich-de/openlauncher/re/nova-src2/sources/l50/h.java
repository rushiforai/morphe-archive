package l50;

import e10.z2;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import t70.q1;
import t70.s1;
import t70.t;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final k50.c f74744a;

    /* renamed from: b, reason: collision with root package name */
    public final c50.e f74745b;

    public h(k50.c cVar, c50.e client) {
        Intrinsics.g(client, "client");
        this.f74744a = cVar;
        this.f74745b = client;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(b bVar, ContinuationImpl continuationImpl) {
        f fVar;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i5 = fVar.f74739v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f74739v = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(this, continuationImpl);
            }
        }
        Object obj = fVar.f74737t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fVar.f74739v;
        if (i11 == 0) {
            ResultKt.b(obj);
            CoroutineContext.Element element = bVar.getCoroutineContext().get(q1.f88853a);
            Intrinsics.d(element);
            t tVar = (t) element;
            ((s1) tVar).j0();
            try {
                ul.b.p(bVar.c());
            } catch (Throwable unused) {
            }
            fVar.f74739v = 1;
            if (tVar.K(fVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0086 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(Continuation continuation) throws Throwable {
        g gVar;
        d50.b bVar;
        if (continuation instanceof g) {
            gVar = (g) continuation;
            int i5 = gVar.f74743w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f74743w = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, continuation);
            }
        }
        Object objA = gVar.f74741u;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = gVar.f74743w;
        try {
            if (i11 == 0) {
                ResultKt.b(objA);
                k50.c cVar = new k50.c();
                k50.c cVar2 = this.f74744a;
                cVar.f71121e = cVar2.f71121e;
                cVar.d(cVar2);
                c50.e eVar = this.f74745b;
                gVar.f74743w = 1;
                objA = eVar.a(cVar, gVar);
                if (objA == obj) {
                }
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    b bVar2 = (b) gVar.f74740t;
                    ResultKt.b(objA);
                    return bVar2;
                }
                bVar = (d50.b) gVar.f74740t;
                ResultKt.b(objA);
                b bVarD = ((d50.b) objA).d();
                b bVarD2 = bVar.d();
                gVar.f74740t = bVarD;
                gVar.f74743w = 3;
                return a(bVarD2, gVar) != obj ? obj : bVarD;
            }
            ResultKt.b(objA);
            bVar = (d50.b) objA;
            gVar.f74740t = bVar;
            gVar.f74743w = 2;
            objA = z2.G0(bVar, gVar);
            if (objA != obj) {
                b bVarD3 = ((d50.b) objA).d();
                b bVarD22 = bVar.d();
                gVar.f74740t = bVarD3;
                gVar.f74743w = 3;
                if (a(bVarD22, gVar) != obj) {
                }
            }
        } catch (CancellationException e3) {
            throw a.a.c0(e3);
        }
    }

    public final String toString() {
        return "HttpStatement[" + this.f74744a.f71117a + AbstractJsonLexerKt.END_LIST;
    }
}
