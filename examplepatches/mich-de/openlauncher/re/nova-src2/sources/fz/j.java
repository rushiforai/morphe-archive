package fz;

import a5.a1;
import android.animation.ValueAnimator;
import android.content.ComponentName;
import android.graphics.Path;
import android.util.FloatProperty;
import android.view.View;
import b00.d1;
import com.android.launcher3.dragndrop.DragLayer;
import com.teslacoilsw.launcher.NovaLauncher;
import java.util.WeakHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class j implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f56263a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f56264b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f56265c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f56266d;

    public /* synthetic */ j(int i5, Object obj, Object obj2, Object obj3) {
        this.f56263a = i5;
        this.f56264b = obj;
        this.f56266d = obj2;
        this.f56265c = obj3;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        int i5 = this.f56263a;
        Object obj = this.f56265c;
        Object obj2 = this.f56266d;
        Object obj3 = this.f56264b;
        switch (i5) {
            case 0:
                Path path = (Path) obj3;
                path.rewind();
                ((k) obj2).onAnimationUpdate(valueAnimator);
                ((za.m) ((View) obj)).A(path);
                break;
            case 1:
                Path path2 = (Path) obj3;
                path2.rewind();
                ((m0) obj2).onAnimationUpdate(valueAnimator);
                ((za.m) ((View) obj)).A(path2);
                break;
            case 2:
                d1 d1Var = (d1) obj2;
                ComponentName componentName = NovaLauncher.f45646r1;
                Object animatedValue = ((ValueAnimator) obj3).getAnimatedValue();
                Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Float");
                float fFloatValue = ((Float) animatedValue).floatValue();
                DragLayer dragLayer = ((NovaLauncher) obj).P;
                WeakHashMap weakHashMap = a1.f250a;
                d1Var.onScrollChange(fFloatValue, dragLayer.getLayoutDirection() == 1);
                break;
            default:
                s9.s sVar = (s9.s) obj3;
                double animatedFraction = sVar.f86843p * valueAnimator.getAnimatedFraction();
                double dPow = Math.pow(2.718281828459045d, ((-sVar.f86837h) * animatedFraction) / 2.0d);
                double d5 = sVar.f86839j;
                double d11 = sVar.f86840k;
                double d12 = animatedFraction * sVar.f86838i;
                ((FloatProperty) obj2).set((FloatProperty) obj, Float.valueOf(((float) (((Math.sin(d12) * d11) + (Math.cos(d12) * d5)) * dPow)) + sVar.f86832c));
                break;
        }
    }
}
