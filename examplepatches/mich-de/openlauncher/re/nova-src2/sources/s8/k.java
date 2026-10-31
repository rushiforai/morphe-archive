package s8;

import android.content.Context;
import java.util.List;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x8.l;
import x8.m;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final x8.k f86758a;

    /* renamed from: b, reason: collision with root package name */
    public final List f86759b;

    /* renamed from: c, reason: collision with root package name */
    public final int f86760c;

    /* renamed from: d, reason: collision with root package name */
    public final x8.k f86761d;

    /* renamed from: e, reason: collision with root package name */
    public final y8.f f86762e;

    /* renamed from: f, reason: collision with root package name */
    public final m8.c f86763f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f86764g;

    public k(x8.k kVar, List list, int i5, x8.k kVar2, y8.f fVar, m8.c cVar, boolean z11) {
        this.f86758a = kVar;
        this.f86759b = list;
        this.f86760c = i5;
        this.f86761d = kVar2;
        this.f86762e = fVar;
        this.f86763f = cVar;
        this.f86764g = z11;
    }

    public final void a(x8.k kVar, i iVar) {
        Context context = kVar.f95326a;
        x8.k kVar2 = this.f86758a;
        if (context != kVar2.f95326a) {
            throw new IllegalStateException(("Interceptor '" + iVar + "' cannot modify the request's context.").toString());
        }
        if (kVar.f95327b == m.f95350b) {
            throw new IllegalStateException(("Interceptor '" + iVar + "' cannot set the request's data to null.").toString());
        }
        if (kVar.f95328c != kVar2.f95328c) {
            throw new IllegalStateException(("Interceptor '" + iVar + "' cannot modify the request's target.").toString());
        }
        if (kVar.f95341r != kVar2.f95341r) {
            throw new IllegalStateException(("Interceptor '" + iVar + "' cannot modify the request's lifecycle.").toString());
        }
        if (kVar.f95342s == kVar2.f95342s) {
            return;
        }
        throw new IllegalStateException(("Interceptor '" + iVar + "' cannot modify the request's size resolver. Use `Interceptor.Chain.withSize` instead.").toString());
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(x8.k kVar, ContinuationImpl continuationImpl) throws Throwable {
        j jVar;
        k kVar2;
        i iVar;
        if (continuationImpl instanceof j) {
            jVar = (j) continuationImpl;
            int i5 = jVar.f86757x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f86757x = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, continuationImpl);
            }
        }
        Object objD = jVar.f86755v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar.f86757x;
        if (i11 == 0) {
            ResultKt.b(objD);
            List list = this.f86759b;
            int i12 = this.f86760c;
            if (i12 > 0) {
                a(kVar, (i) list.get(i12 - 1));
            }
            i iVar2 = (i) list.get(i12);
            k kVar3 = new k(this.f86758a, this.f86759b, i12 + 1, kVar, this.f86762e, this.f86763f, this.f86764g);
            jVar.f86753t = this;
            jVar.f86754u = iVar2;
            jVar.f86757x = 1;
            h hVar = (h) iVar2;
            objD = hVar.d(kVar3, jVar);
            if (objD == coroutineSingletons) {
                return coroutineSingletons;
            }
            kVar2 = this;
            iVar = hVar;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i iVar3 = jVar.f86754u;
            k kVar4 = jVar.f86753t;
            ResultKt.b(objD);
            kVar2 = kVar4;
            iVar = iVar3;
        }
        l lVar = (l) objD;
        kVar2.a(lVar.b(), iVar);
        return lVar;
    }
}
