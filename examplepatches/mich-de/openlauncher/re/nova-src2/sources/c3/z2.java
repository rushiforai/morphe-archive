package c3;

import androidx.compose.ui.node.Owner;
import b.c9;
import kotlin.KotlinNothingValueException;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public abstract class z2 {

    /* renamed from: a, reason: collision with root package name */
    public static final p1.z2 f19511a = new p1.z2(w2.f19459j);

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(c1.n nVar, androidx.room.p pVar, ContinuationImpl continuationImpl) {
        x2 x2Var;
        if (continuationImpl instanceof x2) {
            x2Var = (x2) continuationImpl;
            int i5 = x2Var.f19469u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x2Var.f19469u = i5 - Integer.MIN_VALUE;
            } else {
                x2Var = new x2(continuationImpl);
            }
        }
        Object obj = x2Var.f19468t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x2Var.f19469u;
        if (i11 != 0) {
            if (i11 == 1) {
                throw c9.o(obj);
            }
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        if (!nVar.getNode().getIsAttached()) {
            throw new IllegalArgumentException("establishTextInputSession called from an unattached node");
        }
        Owner ownerG = b3.o.g(nVar);
        x1.j jVar = (x1.j) b3.o.f(nVar).getCompositionLocalMap();
        jVar.getClass();
        if (p1.a0.h(jVar, f19511a) != null) {
            throw new ClassCastException();
        }
        x2Var.f19469u = 1;
        b(ownerG, pVar, x2Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(Owner owner, Function2 function2, ContinuationImpl continuationImpl) {
        y2 y2Var;
        if (continuationImpl instanceof y2) {
            y2Var = (y2) continuationImpl;
            int i5 = y2Var.f19479u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                y2Var.f19479u = i5 - Integer.MIN_VALUE;
            } else {
                y2Var = new y2(continuationImpl);
            }
        }
        Object obj = y2Var.f19478t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = y2Var.f19479u;
        if (i11 == 0) {
            ResultKt.b(obj);
            y2Var.f19479u = 1;
            if (owner.textInputSession(function2, y2Var) == obj2) {
                return;
            }
        } else {
            if (i11 != 1) {
                if (i11 == 2) {
                    throw c9.o(obj);
                }
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        throw new KotlinNothingValueException();
    }
}
