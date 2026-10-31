package b00;

import android.widget.FrameLayout;
import com.android.launcher3.allapps.FloatingHeaderView;
import com.teslacoilsw.launcher.ads.DrawerAdFloatingHeaderView;
import java.lang.ref.WeakReference;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class j0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f16376t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ WeakReference f16377u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f16378v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j0(WeakReference weakReference, p1.e1 e1Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f16376t = i5;
        this.f16377u = weakReference;
        this.f16378v = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f16376t) {
            case 0:
                return new j0(this.f16377u, this.f16378v, continuation, 0);
            case 1:
                return new j0(this.f16377u, this.f16378v, continuation, 1);
            default:
                return new j0(this.f16377u, this.f16378v, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f16376t) {
        }
        return ((j0) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f16376t;
        p1.e1 e1Var = this.f16378v;
        WeakReference weakReference = this.f16377u;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                FrameLayout frameLayout = (FrameLayout) weakReference.get();
                if (frameLayout != null) {
                    frameLayout.setVisibility(((dx.b0) e1Var.getValue()) instanceof dx.a0 ? 0 : 8);
                    break;
                } else {
                    break;
                }
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                DrawerAdFloatingHeaderView drawerAdFloatingHeaderView = (DrawerAdFloatingHeaderView) weakReference.get();
                if (drawerAdFloatingHeaderView != null) {
                    boolean z11 = ((dx.b0) e1Var.getValue()) instanceof dx.a0;
                    if (z11 && drawerAdFloatingHeaderView.getVisibility() != 0) {
                        drawerAdFloatingHeaderView.f45680f = true;
                        drawerAdFloatingHeaderView.setVisibility(0);
                        FloatingHeaderView floatingHeaderView = drawerAdFloatingHeaderView.f45681g;
                        if (floatingHeaderView != null) {
                            floatingHeaderView.onHeightUpdated();
                        }
                    } else if (!z11 && drawerAdFloatingHeaderView.getVisibility() == 0) {
                        drawerAdFloatingHeaderView.f45680f = false;
                        drawerAdFloatingHeaderView.setVisibility(8);
                        FloatingHeaderView floatingHeaderView2 = drawerAdFloatingHeaderView.f45681g;
                        if (floatingHeaderView2 != null) {
                            floatingHeaderView2.onHeightUpdated();
                        }
                    }
                    break;
                } else {
                    break;
                }
                break;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ox.p pVar = (ox.p) weakReference.get();
                if (pVar != null) {
                    pVar.setVisibility(((dx.b0) e1Var.getValue()) instanceof dx.a0 ? 0 : 8);
                    break;
                } else {
                    break;
                }
        }
        return Unit.f71706a;
    }
}
