package dv;

import e10.s2;
import e10.y2;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import p1.l0;

/* loaded from: classes4.dex */
public final /* synthetic */ class z implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49666a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f49667b;

    public /* synthetic */ z(Function0 function0, int i5) {
        this.f49666a = i5;
        this.f49667b = function0;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f49666a) {
            case 0:
                this.f49667b.invoke();
                break;
            case 1:
                ((Boolean) obj).booleanValue();
                this.f49667b.invoke();
                break;
            case 2:
                this.f49667b.invoke();
                break;
            case 3:
                break;
            case 4:
                this.f49667b.invoke();
                break;
            case 5:
                j3.b0 semantics = (j3.b0) obj;
                Intrinsics.g(semantics, "$this$semantics");
                j3.y.d(semantics, new b20.v(this.f49667b, 11));
                break;
            case 6:
                g2.v state = (g2.v) obj;
                Intrinsics.g(state, "state");
                if (((g2.w) state).a()) {
                    this.f49667b.invoke();
                }
                break;
            case 7:
                ((Boolean) obj).booleanValue();
                this.f49667b.invoke();
                break;
            case 8:
                l0 DisposableEffect = (l0) obj;
                Intrinsics.g(DisposableEffect, "$this$DisposableEffect");
                break;
            case 9:
                if (!((Boolean) obj).booleanValue()) {
                    this.f49667b.invoke();
                }
                break;
            case 10:
                ps.l0 it = (ps.l0) obj;
                Intrinsics.g(it, "it");
                this.f49667b.invoke();
                break;
            case 11:
                this.f49667b.invoke();
                break;
            case 12:
                this.f49667b.invoke();
                break;
            default:
                w00.n nVar = (w00.n) obj;
                y2.f51877a.getClass();
                s2 s2VarJ1 = y2.j1();
                nVar.getClass();
                s2VarJ1.i(w00.m.f93587a[nVar.ordinal()] == 1 ? ":ICON" : nVar.name());
                this.f49667b.invoke();
                break;
        }
        return Unit.f71706a;
    }
}
