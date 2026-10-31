package hq;

import com.stripe.android.cards.Bin;
import io.sentry.e3;
import java.util.List;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import w70.o1;

/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final e3 f59979a;

    /* renamed from: b, reason: collision with root package name */
    public final e f59980b;

    /* renamed from: c, reason: collision with root package name */
    public final io.sentry.internal.debugmeta.c f59981c;

    /* renamed from: d, reason: collision with root package name */
    public final t f59982d;

    /* renamed from: e, reason: collision with root package name */
    public final uw.c f59983e;

    public l(e3 e3Var, e eVar, io.sentry.internal.debugmeta.c cVar, t tVar) {
        this.f59979a = e3Var;
        this.f59980b = eVar;
        this.f59981c = cVar;
        this.f59982d = tVar;
        this.f59983e = ps.v.k((o1) e3Var.f67209c, eVar.b(), (o1) cVar.f67328b, new com.moloco.sdk.internal.publisher.nativead.ui.i(5));
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0083, code lost:
    
        if (r10 == r1) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0095, code lost:
    
        if (r10 == r1) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00b7, code lost:
    
        if (r10 != r1) goto L47;
     */
    /* JADX WARN: Removed duplicated region for block: B:37:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(f fVar, ContinuationImpl continuationImpl) {
        k kVar;
        l lVar;
        List list;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f59978x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f59978x = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuationImpl);
            }
        }
        Object objValueOf = kVar.f59976v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar.f59978x;
        if (i11 == 0) {
            ResultKt.b(objValueOf);
            Bin bin = fVar.f59967g;
            if (bin == null) {
                return null;
            }
            kVar.f59974t = this;
            kVar.f59975u = fVar;
            kVar.f59978x = 1;
            objValueOf = Boolean.valueOf(this.f59982d.f60021a.containsKey(bin));
            if (objValueOf != coroutineSingletons) {
                lVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            fVar = kVar.f59975u;
            lVar = kVar.f59974t;
            ResultKt.b(objValueOf);
        } else if (i11 == 2) {
            fVar = kVar.f59975u;
            lVar = kVar.f59974t;
            ResultKt.b(objValueOf);
            list = (List) objValueOf;
            if (list != null) {
            }
            io.sentry.internal.debugmeta.c cVar = lVar.f59981c;
            kVar.f59974t = null;
            kVar.f59975u = null;
            kVar.f59978x = 4;
            objValueOf = cVar.d(fVar, kVar);
        } else {
            if (i11 != 3) {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objValueOf);
                return (List) objValueOf;
            }
            fVar = kVar.f59975u;
            lVar = kVar.f59974t;
            ResultKt.b(objValueOf);
            list = (List) objValueOf;
            if (list != null) {
                if (list.isEmpty()) {
                    list = null;
                }
                if (list != null) {
                    return list;
                }
            }
            io.sentry.internal.debugmeta.c cVar2 = lVar.f59981c;
            kVar.f59974t = null;
            kVar.f59975u = null;
            kVar.f59978x = 4;
            objValueOf = cVar2.d(fVar, kVar);
        }
        if (((Boolean) objValueOf).booleanValue()) {
            e3 e3Var = lVar.f59979a;
            kVar.f59974t = lVar;
            kVar.f59975u = fVar;
            kVar.f59978x = 2;
            objValueOf = e3Var.d(fVar, kVar);
        } else {
            e eVar = lVar.f59980b;
            kVar.f59974t = lVar;
            kVar.f59975u = fVar;
            kVar.f59978x = 3;
            objValueOf = eVar.d(fVar, kVar);
        }
        return coroutineSingletons;
    }
}
