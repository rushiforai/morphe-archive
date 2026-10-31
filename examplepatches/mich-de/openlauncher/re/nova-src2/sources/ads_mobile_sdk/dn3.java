package ads_mobile_sdk;

import android.net.Uri;
import androidx.compose.ui.node.LayoutNode;
import b.e6;
import java.net.URL;
import java.util.Map;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import v70.i;
import v70.o;

/* loaded from: classes2.dex */
public final class dn3 extends c61 {

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f2571c;

    /* renamed from: d, reason: collision with root package name */
    public final e6 f2572d;

    /* renamed from: e, reason: collision with root package name */
    public final i f2573e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dn3(t70.j0 backgroundScope, e6 httpClient) {
        super((wv0) null, 3);
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(httpClient, "httpClient");
        this.f2571c = backgroundScope;
        this.f2572d = httpClient;
        this.f2573e = o.b(LayoutNode.NotPlacedPlaceOrder, 6, null);
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        a60.a aVar = new a60.a(this, null, 4);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f2571c;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(aVar, null), 2);
        return new xu0(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0078, code lost:
    
        if (r11 != r1) goto L29;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0078 -> B:29:0x007b). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(Continuation continuation) {
        bn3 bn3Var;
        dn3 dn3Var;
        dn3 dn3Var2;
        Uri uri;
        Object objQ;
        if (continuation instanceof bn3) {
            bn3Var = (bn3) continuation;
            int i5 = bn3Var.f1476e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bn3Var.f1476e = i5 - Integer.MIN_VALUE;
            } else {
                bn3Var = new bn3(this, (ContinuationImpl) continuation);
            }
        }
        Object objB = bn3Var.f1474c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bn3Var.f1476e;
        if (i11 == 0) {
            ResultKt.b(objB);
            dn3Var = this;
            i iVar = dn3Var.f2573e;
            bn3Var.f1472a = dn3Var;
            bn3Var.f1473b = null;
            bn3Var.f1476e = 1;
            objQ = iVar.q(bn3Var);
            if (objQ != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            uri = bn3Var.f1473b;
            dn3Var2 = bn3Var.f1472a;
            try {
                ResultKt.b(objB);
            } catch (Exception e3) {
                cz.b bVar = mu0.f7335a;
                mu0.b("Error while pinging URL: " + uri + ": " + e3.getMessage(), null);
            }
            b.a1 a1Var = (b.a1) objB;
            if (a1Var instanceof xu0) {
                ((a21) ((xu0) a1Var).f11834b).getClass();
            }
            dn3Var = dn3Var2;
            i iVar2 = dn3Var.f2573e;
            bn3Var.f1472a = dn3Var;
            bn3Var.f1473b = null;
            bn3Var.f1476e = 1;
            objQ = iVar2.q(bn3Var);
            if (objQ != coroutineSingletons) {
                dn3Var2 = dn3Var;
                objB = objQ;
                Pair pair = (Pair) objB;
                uri = (Uri) pair.f71683a;
                Map map = (Map) pair.f71684b;
                e6 e6Var = dn3Var2.f2572d;
                URL url = new URL(uri.toString());
                bn3Var.f1472a = dn3Var2;
                bn3Var.f1473b = uri;
                bn3Var.f1476e = 2;
                objB = e6.b(e6Var, url, map, bn3Var, 26);
            }
            return coroutineSingletons;
        }
        dn3 dn3Var3 = bn3Var.f1472a;
        ResultKt.b(objB);
        dn3Var2 = dn3Var3;
        Pair pair2 = (Pair) objB;
        uri = (Uri) pair2.f71683a;
        Map map2 = (Map) pair2.f71684b;
        e6 e6Var2 = dn3Var2.f2572d;
        URL url2 = new URL(uri.toString());
        bn3Var.f1472a = dn3Var2;
        bn3Var.f1473b = uri;
        bn3Var.f1476e = 2;
        objB = e6.b(e6Var2, url2, map2, bn3Var, 26);
    }
}
