package lz;

import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.util.IntProperty;
import android.view.View;
import android.view.ViewGroup;
import com.teslacoilsw.launcher.launcher3.appprediction.PredictionRowView;

/* loaded from: classes.dex */
public final class e extends IntProperty {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75170a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(String str, int i5) {
        super(str);
        this.f75170a = i5;
    }

    @Override // android.util.Property
    public final Integer get(Object obj) {
        switch (this.f75170a) {
            case 0:
                return Integer.valueOf(((PredictionRowView) obj).f45849m);
            case 1:
                return Integer.valueOf(((Drawable) obj).getAlpha());
            case 2:
                return Integer.valueOf(((ViewGroup.LayoutParams) obj).width);
            case 3:
                return Integer.valueOf(((ViewGroup.LayoutParams) obj).height);
            case 4:
                View view = (View) obj;
                if (view.getBackground() instanceof ColorDrawable) {
                    return Integer.valueOf(((ColorDrawable) view.getBackground()).getColor());
                }
                return 0;
            default:
                return Integer.valueOf(((sy.e) obj).f87861v);
        }
    }

    @Override // android.util.IntProperty
    public final void setValue(Object obj, int i5) {
        switch (this.f75170a) {
            case 0:
                PredictionRowView predictionRowView = (PredictionRowView) obj;
                predictionRowView.f45849m = i5;
                predictionRowView.getAlpha();
                break;
            case 1:
                ((Drawable) obj).setAlpha(i5);
                break;
            case 2:
                ((ViewGroup.LayoutParams) obj).width = i5;
                break;
            case 3:
                ((ViewGroup.LayoutParams) obj).height = i5;
                break;
            case 4:
                ((View) obj).setBackgroundColor(i5);
                break;
            default:
                sy.e eVar = (sy.e) obj;
                if (i5 != eVar.f87861v) {
                    eVar.f87861v = i5;
                    Drawable drawable = eVar.f87860u;
                    if (drawable != null) {
                        drawable.setAlpha(i5);
                        eVar.invalidate();
                        break;
                    }
                }
                break;
        }
    }
}
