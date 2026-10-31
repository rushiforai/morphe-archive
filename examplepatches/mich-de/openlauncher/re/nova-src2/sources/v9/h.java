package v9;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.teslacoilsw.launcher.search.TouchPositionLinearLayout;

/* loaded from: classes2.dex */
public final class h implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final TouchPositionLinearLayout f92351a;

    /* renamed from: b, reason: collision with root package name */
    public final LinearLayout f92352b;

    /* renamed from: c, reason: collision with root package name */
    public final TextView f92353c;

    public h(TouchPositionLinearLayout touchPositionLinearLayout, LinearLayout linearLayout, TextView textView) {
        this.f92351a = touchPositionLinearLayout;
        this.f92352b = linearLayout;
        this.f92353c = textView;
    }

    public static h b(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        View viewInflate = layoutInflater.inflate(2131624053, viewGroup, false);
        int i5 = 2131427441;
        LinearLayout linearLayout = (LinearLayout) ab.e0.x(2131427441, viewInflate);
        if (linearLayout != null) {
            TouchPositionLinearLayout touchPositionLinearLayout = (TouchPositionLinearLayout) viewInflate;
            TextView textView = (TextView) ab.e0.x(16908310, viewInflate);
            if (textView != null) {
                return new h(touchPositionLinearLayout, linearLayout, textView);
            }
            i5 = 16908310;
        }
        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i5)));
    }

    public final TouchPositionLinearLayout a() {
        return this.f92351a;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92351a;
    }
}
