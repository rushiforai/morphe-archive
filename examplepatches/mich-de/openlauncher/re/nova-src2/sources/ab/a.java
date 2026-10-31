package ab;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Build;
import android.view.View;
import android.view.ViewOutlineProvider;
import com.google.android.material.chip.Chip;
import com.teslacoilsw.launcher.launcher3.pageindicators.WorkspacePageIndicatorDots;

/* loaded from: classes2.dex */
public final class a extends ViewOutlineProvider {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f672a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f673b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f672a = i5;
        this.f673b = obj;
    }

    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        int i5 = this.f672a;
        Object obj = this.f673b;
        switch (i5) {
            case 0:
                b bVar = (b) obj;
                if (!bVar.f682k.isEmpty()) {
                    float f11 = bVar.f683l;
                    if (f11 > 0.0f) {
                        outline.setRoundRect(bVar.f682k, f11);
                        break;
                    }
                }
                outline.setEmpty();
                break;
            case 1:
                outline.setRoundRect(new Rect(0, 0, view.getMeasuredWidth(), view.getMeasuredHeight()), bh.g.M((Context) obj, 8));
                break;
            case 2:
                outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), ((ka.c) obj).f71257m);
                break;
            case 3:
                lj.d dVar = ((Chip) obj).f34174e;
                if (dVar == null) {
                    outline.setAlpha(0.0f);
                    break;
                } else {
                    dVar.getOutline(outline);
                    break;
                }
            case 4:
                int iMin = Math.min(view.getWidth(), view.getHeight());
                if (iMin > 0) {
                    Path path = new Path(((fz.d) obj).e());
                    float f12 = iMin / 100.0f;
                    Matrix matrix = new Matrix();
                    matrix.setScale(f12, f12);
                    path.transform(matrix);
                    try {
                        if (Build.VERSION.SDK_INT >= 30) {
                            outline.setPath(path);
                        } else {
                            outline.setConvexPath(path);
                        }
                        break;
                    } catch (IllegalArgumentException unused) {
                        return;
                    }
                }
                break;
            case 5:
                WorkspacePageIndicatorDots workspacePageIndicatorDots = (WorkspacePageIndicatorDots) obj;
                RectF rectF = WorkspacePageIndicatorDots.E;
                workspacePageIndicatorDots.getClass();
                RectF rectFL = workspacePageIndicatorDots.l();
                outline.setRoundRect((int) rectFL.left, (int) rectFL.top, (int) rectFL.right, (int) rectFL.bottom, workspacePageIndicatorDots.f45863t);
                break;
            default:
                za.l lVar = (za.l) obj;
                outline.setRoundRect(lVar.f98459k, lVar.f98458j);
                break;
        }
    }
}
