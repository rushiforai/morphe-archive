package ww;

import android.content.Context;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.widget.RelativeLayout;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatImageView;

/* loaded from: classes4.dex */
public final class r0 extends RelativeLayout {

    /* renamed from: a, reason: collision with root package name */
    public final int f94831a;

    /* renamed from: b, reason: collision with root package name */
    public final int f94832b;

    /* renamed from: c, reason: collision with root package name */
    public final int f94833c;

    /* renamed from: d, reason: collision with root package name */
    public final pr.e f94834d;

    public r0(Context context) {
        super(context, null, 0);
        s0 s0Var = new s0(context);
        LayoutInflater.from(context).inflate(2131624429, this);
        int i5 = 2131427850;
        TextView textView = (TextView) ab.e0.x(2131427850, this);
        if (textView != null) {
            i5 = 2131428412;
            TextView textView2 = (TextView) ab.e0.x(2131428412, this);
            if (textView2 != null) {
                i5 = 2131428640;
                TextView textView3 = (TextView) ab.e0.x(2131428640, this);
                if (textView3 != null) {
                    i5 = 2131428801;
                    AppCompatImageView appCompatImageView = (AppCompatImageView) ab.e0.x(2131428801, this);
                    if (appCompatImageView != null) {
                        this.f94834d = new pr.e(this, textView, textView2, textView3, appCompatImageView);
                        int i11 = s0Var.f94838b;
                        this.f94831a = Color.alpha(i11) < 16 ? context.getColor(2131101133) : i11;
                        int i12 = s0Var.f94840d;
                        this.f94833c = Color.alpha(i12) < 16 ? context.getColor(2131101147) : i12;
                        int i13 = s0Var.f94841e;
                        this.f94832b = Color.alpha(i13) < 16 ? context.getColor(2131101148) : i13;
                        return;
                    }
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(getResources().getResourceName(i5)));
    }

    @Override // android.view.View
    public final void setSelected(boolean z11) {
        pr.e eVar = this.f94834d;
        if (z11) {
            TextView textView = (TextView) eVar.f82837d;
            int i5 = this.f94831a;
            textView.setTextColor(i5);
            eVar.f82836c.setTextColor(i5);
            eVar.f82838e.setTextColor(i5);
            ((AppCompatImageView) eVar.f82839f).setVisibility(0);
            return;
        }
        TextView textView2 = (TextView) eVar.f82837d;
        int i11 = this.f94833c;
        textView2.setTextColor(i11);
        eVar.f82836c.setTextColor(this.f94832b);
        eVar.f82838e.setTextColor(i11);
        ((AppCompatImageView) eVar.f82839f).setVisibility(4);
    }
}
