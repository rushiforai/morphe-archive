package ry;

import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import com.teslacoilsw.launcher.desktoppreview.DesktopLockBottomSheet;
import kotlin.jvm.internal.Intrinsics;
import s9.k;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86490a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ DesktopLockBottomSheet f86491b;

    public /* synthetic */ a(DesktopLockBottomSheet desktopLockBottomSheet, int i5) {
        this.f86490a = i5;
        this.f86491b = desktopLockBottomSheet;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = this.f86490a;
        DesktopLockBottomSheet desktopLockBottomSheet = this.f86491b;
        int i11 = 1;
        switch (i5) {
            case 0:
                int i12 = DesktopLockBottomSheet.f45718z;
                desktopLockBottomSheet.K(true);
                break;
            case 1:
                int i13 = DesktopLockBottomSheet.f45718z;
                desktopLockBottomSheet.f70511d.start();
                ViewGroup viewGroup = desktopLockBottomSheet.f70513f;
                Intrinsics.d(viewGroup);
                viewGroup.animate().alpha(1.0f).setDuration(150L);
                break;
            case 2:
                ObjectAnimator objectAnimator = desktopLockBottomSheet.f70511d;
                if (!desktopLockBottomSheet.f79742a && !objectAnimator.isRunning()) {
                    desktopLockBottomSheet.f79742a = true;
                    objectAnimator.setValues(PropertyValuesHolder.ofFloat(jz.c.f70509u, 0.0f));
                    objectAnimator.setInterpolator(k.f86799l);
                    objectAnimator.start();
                    break;
                }
                break;
            default:
                int i14 = DesktopLockBottomSheet.f45718z;
                if (desktopLockBottomSheet.f70514g >= desktopLockBottomSheet.a0()) {
                    ObjectAnimator objectAnimator2 = desktopLockBottomSheet.f70511d;
                    desktopLockBottomSheet.f70518k = true;
                    if (desktopLockBottomSheet.f70510c.P.f20960a.bottom > 0) {
                        ViewGroup viewGroup2 = desktopLockBottomSheet.f70513f;
                        Intrinsics.d(viewGroup2);
                        viewGroup2.setAlpha(0.0f);
                        desktopLockBottomSheet.f0(1.0f);
                    }
                    objectAnimator2.setValues(PropertyValuesHolder.ofFloat(jz.c.f70509u, desktopLockBottomSheet.a0()));
                    objectAnimator2.setDuration(200L).setInterpolator(AnimationUtils.loadInterpolator(desktopLockBottomSheet.getContext(), 17563662));
                    desktopLockBottomSheet.post(new a(desktopLockBottomSheet, i11));
                    break;
                }
                break;
        }
    }
}
