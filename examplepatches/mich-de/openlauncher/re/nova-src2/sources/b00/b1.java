package b00;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import com.android.launcher3.AppWidgetResizeFrame;
import com.android.launcher3.notification.NotificationMainView;
import com.teslacoilsw.launcher.NovaLauncher;
import kotlin.jvm.internal.Intrinsics;
import o9.l2;

/* loaded from: classes4.dex */
public final /* synthetic */ class b1 implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16307a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f16308b;

    public /* synthetic */ b1(Object obj, int i5) {
        this.f16307a = i5;
        this.f16308b = obj;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        int i5 = this.f16307a;
        Object obj = this.f16308b;
        switch (i5) {
            case 0:
                Object animatedValue = valueAnimator.getAnimatedValue();
                Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Float");
                ((d1) obj).onScrollChange(((Float) animatedValue).floatValue(), false);
                break;
            case 1:
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.w.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.w) obj, valueAnimator);
                break;
            case 2:
                eb.a aVar = ((eb.x) obj).f52527a;
                if (aVar != null) {
                    aVar.run();
                    break;
                }
                break;
            case 3:
                fk.i iVar = (fk.i) obj;
                iVar.getClass();
                iVar.f55223d.setAlpha(((Float) valueAnimator.getAnimatedValue()).floatValue());
                break;
            case 4:
                NotificationMainView notificationMainView = (NotificationMainView) obj;
                ga.e eVar = NotificationMainView.n;
                int iIntValue = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                notificationMainView.f21187b = iIntValue;
                notificationMainView.f21198m.setColor(iIntValue);
                ha.c cVar = notificationMainView.f21186a;
                if (cVar != null) {
                    View view = notificationMainView.f21190e;
                    Context context = notificationMainView.getContext();
                    int iJ = r4.a.j(notificationMainView.f21187b, ((g30.b) g30.b.f57016l.h(notificationMainView.getContext())).f57020d);
                    Drawable drawableMutate = cVar.f59574i;
                    if (!cVar.f59576k) {
                        int color = cVar.f59575j;
                        if (color == 0) {
                            color = context.getColor(2131100650);
                        }
                        cVar.f59575j = v30.e.e(color, iJ);
                        drawableMutate = drawableMutate.mutate();
                        drawableMutate.setTintList(null);
                        drawableMutate.setTint(cVar.f59575j);
                    }
                    view.setBackground(drawableMutate);
                    break;
                }
                break;
            case 5:
                ij.a aVar2 = (ij.a) obj;
                aVar2.getClass();
                float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                aVar2.f61616j.setAlpha((int) (255.0f * fFloatValue));
                aVar2.f61628x = fFloatValue;
                break;
            case 6:
                ka.c cVar2 = (ka.c) obj;
                cVar2.getClass();
                float fFloatValue2 = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                cVar2.f71263u.setAlpha(fFloatValue2);
                cVar2.setAlpha(fFloatValue2);
                break;
            case 7:
                Rect rect = AppWidgetResizeFrame.S;
                ((AppWidgetResizeFrame) obj).requestLayout();
                break;
            case 8:
                uf.d dVar = (uf.d) obj;
                dVar.getClass();
                dVar.F = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                dVar.invalidate(dVar.f91100a);
                break;
            case 9:
                xy.a aVar3 = (xy.a) obj;
                Object animatedValue2 = valueAnimator.getAnimatedValue();
                Intrinsics.e(animatedValue2, "null cannot be cast to non-null type kotlin.Int");
                aVar3.f96477c = ((Integer) animatedValue2).intValue();
                aVar3.invalidateSelf();
                break;
            case 10:
                ((y9.p) obj).f96930a.invalidate();
                break;
            default:
                NovaLauncher novaLauncher = (NovaLauncher) obj;
                float fFloatValue3 = 1.0f - ((Float) valueAnimator.getAnimatedValue()).floatValue();
                if (((ra.a) novaLauncher.M.f85765g) == l2.o) {
                    novaLauncher.V.setAlpha(s9.k.f86790c.getInterpolation(fFloatValue3));
                }
                novaLauncher.X.setAlpha(fFloatValue3);
                break;
        }
    }
}
