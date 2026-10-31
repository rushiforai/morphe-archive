package jx;

import android.content.Context;
import android.graphics.Typeface;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import q3.j0;
import q3.l0;

/* loaded from: classes.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public final Context f70429a;

    public v(Context context, int i5) {
        switch (i5) {
            case 1:
                this.f70429a = context.getApplicationContext();
                break;
            default:
                this.f70429a = context;
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(q3.n nVar, ContinuationImpl continuationImpl) {
        q3.b bVar;
        if (continuationImpl instanceof q3.b) {
            bVar = (q3.b) continuationImpl;
            int i5 = bVar.f83527w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f83527w = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new q3.b(this, continuationImpl);
            }
        }
        Object objF = bVar.f83525u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f83527w;
        Context context = this.f70429a;
        if (i11 == 0) {
            ResultKt.b(objF);
            if (nVar instanceof q3.a) {
                bVar.f83527w = 1;
                q3.e.f83547a.a();
                throw null;
            }
            if (!(nVar instanceof j0)) {
                throw new IllegalArgumentException("Unknown font type: " + nVar);
            }
            j0 j0Var = (j0) nVar;
            bVar.f83524t = j0Var;
            bVar.f83527w = 2;
            objF = pg.p.f(j0Var, context, bVar);
            if (objF == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 == 1) {
                ResultKt.b(objF);
                return objF;
            }
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            nVar = bVar.f83524t;
            ResultKt.b(objF);
        }
        return l0.a((Typeface) objF, ((j0) nVar).f83572c, context);
    }

    public Typeface b(q3.n nVar) {
        boolean z11 = nVar instanceof q3.a;
        Context context = this.f70429a;
        if (z11) {
            return q3.e.f83547a.c(context, (q3.a) nVar);
        }
        if (!(nVar instanceof j0)) {
            return null;
        }
        j0 j0Var = (j0) nVar;
        return l0.a(pg.p.e(j0Var, context), j0Var.f83572c, context);
    }
}
