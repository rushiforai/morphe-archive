package v2;

import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import androidx.compose.ui.input.pointer.PointerInputResetException;
import b3.l2;
import c3.n3;
import java.util.ArrayList;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.SafeContinuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function2;
import t70.g2;
import t70.m0;

/* loaded from: classes.dex */
public final class l0 extends Modifier$Node implements x, y3.c, l2 {

    /* renamed from: a, reason: collision with root package name */
    public Object f91965a;

    /* renamed from: b, reason: collision with root package name */
    public Object f91966b;

    /* renamed from: c, reason: collision with root package name */
    public PointerInputEventHandler f91967c;

    /* renamed from: d, reason: collision with root package name */
    public g2 f91968d;

    /* renamed from: e, reason: collision with root package name */
    public m f91969e = f0.f91929a;

    /* renamed from: f, reason: collision with root package name */
    public final r1.e f91970f;

    /* renamed from: g, reason: collision with root package name */
    public final r1.e f91971g;

    /* renamed from: h, reason: collision with root package name */
    public final r1.e f91972h;

    /* renamed from: i, reason: collision with root package name */
    public m f91973i;

    /* renamed from: j, reason: collision with root package name */
    public long f91974j;

    public l0(Object obj, Object obj2, PointerInputEventHandler pointerInputEventHandler) {
        this.f91965a = obj;
        this.f91966b = obj2;
        this.f91967c = pointerInputEventHandler;
        r1.e eVar = new r1.e(new j0[16]);
        this.f91970f = eVar;
        this.f91971g = eVar;
        this.f91972h = new r1.e(new j0[16]);
        this.f91974j = 0L;
    }

    public final Object B(Function2 function2, Continuation continuation) {
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        j0 j0Var = new j0(this, mVar);
        synchronized (this.f91971g) {
            this.f91970f.b(j0Var);
            SafeContinuation safeContinuation = new SafeContinuation(IntrinsicsKt.b(IntrinsicsKt.a(j0Var, j0Var, function2)), CoroutineSingletons.f71806a);
            int i5 = Result.f71687b;
            safeContinuation.resumeWith(Unit.f71706a);
        }
        mVar.v(new k0(j0Var, 0));
        return mVar.s();
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x004e A[Catch: all -> 0x0021, TryCatch #1 {all -> 0x0021, blocks: (B:6:0x000d, B:13:0x001b, B:14:0x0020, B:17:0x0023, B:20:0x002f, B:22:0x0037, B:24:0x003b, B:25:0x0042, B:26:0x0045, B:28:0x004e, B:30:0x0056, B:32:0x005a), top: B:43:0x000d }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void D(m mVar, n nVar) {
        int i5;
        int i11;
        t70.m mVar2;
        t70.m mVar3;
        synchronized (this.f91971g) {
            r1.e eVar = this.f91972h;
            eVar.d(eVar.f85079c, this.f91970f);
        }
        try {
            int iOrdinal = nVar.ordinal();
            if (iOrdinal == 0) {
                r1.e eVar2 = this.f91972h;
                Object[] objArr = eVar2.f85077a;
                i5 = eVar2.f85079c;
                for (i11 = 0; i11 < i5; i11++) {
                    j0 j0Var = (j0) objArr[i11];
                    if (nVar == j0Var.f91950d && (mVar2 = j0Var.f91949c) != null) {
                        j0Var.f91949c = null;
                        int i12 = Result.f71687b;
                        mVar2.resumeWith(mVar);
                    }
                }
            } else if (iOrdinal == 1) {
                r1.e eVar3 = this.f91972h;
                int i13 = eVar3.f85079c - 1;
                Object[] objArr2 = eVar3.f85077a;
                if (i13 < objArr2.length) {
                    while (i13 >= 0) {
                        j0 j0Var2 = (j0) objArr2[i13];
                        if (nVar == j0Var2.f91950d && (mVar3 = j0Var2.f91949c) != null) {
                            j0Var2.f91949c = null;
                            int i14 = Result.f71687b;
                            mVar3.resumeWith(mVar);
                        }
                        i13--;
                    }
                }
            } else {
                if (iOrdinal != 2) {
                    throw new NoWhenBranchMatchedException();
                }
                r1.e eVar22 = this.f91972h;
                Object[] objArr3 = eVar22.f85077a;
                i5 = eVar22.f85079c;
                while (i11 < i5) {
                }
            }
            this.f91972h.g();
        } catch (Throwable th2) {
            this.f91972h.g();
            throw th2;
        }
    }

    public final n3 E() {
        return b3.o.f(this).getViewConfiguration();
    }

    public final void F() {
        g2 g2Var = this.f91968d;
        if (g2Var != null) {
            g2Var.B(new PointerInputResetException());
            this.f91968d = null;
        }
    }

    @Override // y3.c
    public final float getDensity() {
        return b3.o.f(this).getDensity().getDensity();
    }

    @Override // y3.c
    public final float getFontScale() {
        return b3.o.f(this).getDensity().getFontScale();
    }

    @Override // b3.l2
    public final void onCancelPointerInput() {
        m mVar = this.f91973i;
        if (mVar == null) {
            return;
        }
        List list = mVar.f91975a;
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (((t) list.get(i5)).f()) {
                ArrayList arrayList = new ArrayList(list.size());
                int size2 = list.size();
                for (int i11 = 0; i11 < size2; i11++) {
                    t tVar = (t) list.get(i11);
                    arrayList.add(new t(tVar.d(), tVar.k(), tVar.e(), tVar.g(), tVar.k(), tVar.e(), tVar.f(), tVar.f(), tVar.j()));
                }
                m mVar2 = new m(arrayList, null);
                this.f91969e = mVar2;
                D(mVar2, n.f91980a);
                D(mVar2, n.f91981b);
                D(mVar2, n.f91982c);
                this.f91973i = null;
                return;
            }
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDensityChange() {
        F();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        F();
        super.onDetach();
    }

    @Override // b3.l2
    /* renamed from: onPointerEvent-H0pRuoY */
    public final void mo26onPointerEventH0pRuoY(m mVar, n nVar, long j11) {
        this.f91974j = j11;
        if (nVar == n.f91980a) {
            this.f91969e = mVar;
        }
        Continuation continuation = null;
        if (this.f91968d == null) {
            this.f91968d = m0.t(getCoroutineScope(), null, t70.l0.f88816d, new u6.a(this, continuation, 4), 1);
        }
        D(mVar, nVar);
        List list = mVar.f91975a;
        int size = list.size();
        int i5 = 0;
        while (true) {
            if (i5 >= size) {
                mVar = null;
                break;
            } else if (!g0.d((t) list.get(i5))) {
                break;
            } else {
                i5++;
            }
        }
        this.f91973i = mVar;
    }

    @Override // b3.l2
    public final void onViewConfigurationChange() {
        F();
    }
}
