package h50;

import io.ktor.client.plugins.SendCountExceedException;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d1 implements o1 {

    /* renamed from: a, reason: collision with root package name */
    public final c50.e f59170a;

    /* renamed from: b, reason: collision with root package name */
    public int f59171b;

    /* renamed from: c, reason: collision with root package name */
    public d50.b f59172c;

    public d1(c50.e client) {
        Intrinsics.g(client, "client");
        this.f59170a = client;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // h50.o1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(k50.c cVar, ContinuationImpl continuationImpl) {
        c1 c1Var;
        if (continuationImpl instanceof c1) {
            c1Var = (c1) continuationImpl;
            int i5 = c1Var.f59166v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c1Var.f59166v = i5 - Integer.MIN_VALUE;
            } else {
                c1Var = new c1(this, continuationImpl);
            }
        }
        Object objA = c1Var.f59164t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c1Var.f59166v;
        if (i11 == 0) {
            ResultKt.b(objA);
            d50.b bVar = this.f59172c;
            if (bVar != null) {
                t70.k0.c(bVar, null);
            }
            int i12 = this.f59171b;
            if (i12 >= 20) {
                throw new SendCountExceedException("Max send count 20 exceeded. Consider increasing the property maxSendCount if more is required.");
            }
            this.f59171b = i12 + 1;
            k50.f fVar = this.f59170a.f19689g;
            Object obj = cVar.f71120d;
            c1Var.f59166v = 1;
            objA = fVar.a(cVar, obj, c1Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        d50.b bVar2 = objA instanceof d50.b ? (d50.b) objA : null;
        if (bVar2 != null) {
            this.f59172c = bVar2;
            return bVar2;
        }
        throw new IllegalStateException(("Failed to execute send pipeline. Expected [HttpClientCall], but received " + objA).toString());
    }
}
