package x70;

import androidx.compose.ui.node.LayoutNode;
import b0.b0;
import h6.c1;
import java.util.ArrayList;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import t70.j0;
import t70.k0;
import t70.l0;

/* loaded from: classes.dex */
public abstract class d implements s {

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f95219a;

    /* renamed from: b, reason: collision with root package name */
    public final int f95220b;

    /* renamed from: c, reason: collision with root package name */
    public final v70.a f95221c;

    public d(CoroutineContext coroutineContext, int i5, v70.a aVar) {
        this.f95219a = coroutineContext;
        this.f95220b = i5;
        this.f95221c = aVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0015  */
    @Override // x70.s
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final w70.m a(CoroutineContext coroutineContext, int i5, v70.a aVar) {
        CoroutineContext coroutineContext2 = this.f95219a;
        CoroutineContext coroutineContextPlus = coroutineContext.plus(coroutineContext2);
        v70.a aVar2 = v70.a.f92141a;
        v70.a aVar3 = this.f95221c;
        int i11 = this.f95220b;
        if (aVar == aVar2) {
            if (i11 != -3) {
                if (i5 != -3) {
                    if (i11 != -2) {
                        if (i5 == -2) {
                            i5 = i11;
                        } else {
                            i5 += i11;
                            if (i5 < 0) {
                                i5 = LayoutNode.NotPlacedPlaceOrder;
                            }
                        }
                    }
                }
            }
            aVar = aVar3;
        }
        return (Intrinsics.b(coroutineContextPlus, coroutineContext2) && i5 == i11 && aVar == aVar3) ? this : f(coroutineContextPlus, i5, aVar);
    }

    public String b() {
        return null;
    }

    @Override // w70.m
    public Object collect(w70.n nVar, Continuation continuation) {
        Object objD = k0.d(new b0(nVar, this, (Continuation) null, 25), continuation);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }

    public abstract Object e(v70.x xVar, Continuation continuation);

    public abstract d f(CoroutineContext coroutineContext, int i5, v70.a aVar);

    public w70.m g() {
        return null;
    }

    public v70.z h(j0 j0Var) {
        int i5 = this.f95220b;
        if (i5 == -3) {
            i5 = -2;
        }
        l0 l0Var = l0.f88815c;
        Function2 qVar = new g20.q(this, null, 9);
        v70.w wVar = new v70.w(t70.z.b(j0Var, this.f95219a), v70.o.b(i5, 4, this.f95221c));
        wVar.l0(l0Var, wVar, qVar);
        return wVar;
    }

    public String toString() {
        ArrayList arrayList = new ArrayList(4);
        String strB = b();
        if (strB != null) {
            arrayList.add(strB);
        }
        EmptyCoroutineContext emptyCoroutineContext = EmptyCoroutineContext.f71803a;
        CoroutineContext coroutineContext = this.f95219a;
        if (coroutineContext != emptyCoroutineContext) {
            arrayList.add("context=" + coroutineContext);
        }
        int i5 = this.f95220b;
        if (i5 != -3) {
            arrayList.add("capacity=" + i5);
        }
        v70.a aVar = v70.a.f92141a;
        v70.a aVar2 = this.f95221c;
        if (aVar2 != aVar) {
            arrayList.add("onBufferOverflow=" + aVar2);
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(getClass().getSimpleName());
        sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
        return c1.t(sb2, b70.g.f1(arrayList, ", ", null, null, 0, null, 62), AbstractJsonLexerKt.END_LIST);
    }
}
