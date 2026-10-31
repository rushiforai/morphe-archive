package z5;

import android.view.View;
import ps.j;

/* loaded from: classes2.dex */
public final class b extends j {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f98217b;

    public /* synthetic */ b(int i5) {
        this.f98217b = i5;
    }

    @Override // ps.j
    public final float h(Object obj) {
        switch (this.f98217b) {
            case 0:
                return ((View) obj).getAlpha();
            case 1:
                return ((View) obj).getTranslationX();
            case 2:
                return ((View) obj).getTranslationY();
            case 3:
                return ((View) obj).getScaleX();
            case 4:
                return ((View) obj).getScaleY();
            case 5:
                return ((View) obj).getRotation();
            case 6:
                return ((View) obj).getRotationX();
            default:
                return ((View) obj).getRotationY();
        }
    }

    @Override // ps.j
    public final void n(Object obj, float f11) {
        switch (this.f98217b) {
            case 0:
                ((View) obj).setAlpha(f11);
                break;
            case 1:
                ((View) obj).setTranslationX(f11);
                break;
            case 2:
                ((View) obj).setTranslationY(f11);
                break;
            case 3:
                ((View) obj).setScaleX(f11);
                break;
            case 4:
                ((View) obj).setScaleY(f11);
                break;
            case 5:
                ((View) obj).setRotation(f11);
                break;
            case 6:
                ((View) obj).setRotationX(f11);
                break;
            default:
                ((View) obj).setRotationY(f11);
                break;
        }
    }
}
