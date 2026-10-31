package pr;

import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatImageView;
import ww.r0;

/* loaded from: classes4.dex */
public final class e implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f82834a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final ViewGroup f82835b;

    /* renamed from: c, reason: collision with root package name */
    public final TextView f82836c;

    /* renamed from: d, reason: collision with root package name */
    public final View f82837d;

    /* renamed from: e, reason: collision with root package name */
    public final TextView f82838e;

    /* renamed from: f, reason: collision with root package name */
    public final View f82839f;

    public e(r0 r0Var, TextView textView, TextView textView2, TextView textView3, AppCompatImageView appCompatImageView) {
        this.f82835b = r0Var;
        this.f82836c = textView;
        this.f82837d = textView2;
        this.f82838e = textView3;
        this.f82839f = appCompatImageView;
    }

    @Override // l7.a
    public final View getRoot() {
        switch (this.f82834a) {
            case 0:
                return (r0) this.f82835b;
            default:
                return (LinearLayout) this.f82835b;
        }
    }

    public e(LinearLayout linearLayout, Button button, Button button2, ImageView imageView, EditText editText, EditText editText2) {
        this.f82835b = linearLayout;
        this.f82836c = button2;
        this.f82837d = imageView;
        this.f82838e = editText;
        this.f82839f = editText2;
    }
}
