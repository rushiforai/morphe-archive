package gy;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import g0.u2;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes4.dex */
public final class d0 implements PointerInputEventHandler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f58270a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f58271b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ float f58272c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f58273d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f58274e;

    public d0(long j11, boolean z11, float f11, long j12, p1.e1 e1Var) {
        this.f58270a = j11;
        this.f58271b = z11;
        this.f58272c = f11;
        this.f58273d = j12;
        this.f58274e = e1Var;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(v2.x xVar, Continuation continuation) {
        Object objC = u2.c(xVar, new c0(this.f58270a, this.f58271b, this.f58272c, this.f58273d, this.f58274e, null), continuation);
        return objC == CoroutineSingletons.f71806a ? objC : Unit.f71706a;
    }
}
