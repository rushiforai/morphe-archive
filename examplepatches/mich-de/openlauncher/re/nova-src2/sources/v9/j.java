package v9;

import android.view.View;
import android.widget.EditText;
import android.widget.ScrollView;
import android.widget.TextView;
import com.teslacoilsw.launcher.preferences.fragments.ContactSupportSubjectSpinnerView;
import com.teslacoilsw.launcher.widget.DumbRadioGrid;

/* loaded from: classes2.dex */
public final class j implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final ScrollView f92395a;

    /* renamed from: b, reason: collision with root package name */
    public final EditText f92396b;

    /* renamed from: c, reason: collision with root package name */
    public final TextView f92397c;

    /* renamed from: d, reason: collision with root package name */
    public final DumbRadioGrid f92398d;

    /* renamed from: e, reason: collision with root package name */
    public final TextView f92399e;

    /* renamed from: f, reason: collision with root package name */
    public final EditText f92400f;

    /* renamed from: g, reason: collision with root package name */
    public final TextView f92401g;

    /* renamed from: h, reason: collision with root package name */
    public final TextView f92402h;

    /* renamed from: i, reason: collision with root package name */
    public final ContactSupportSubjectSpinnerView f92403i;

    public j(ScrollView scrollView, EditText editText, TextView textView, DumbRadioGrid dumbRadioGrid, TextView textView2, TextView textView3, EditText editText2, TextView textView4, TextView textView5, ContactSupportSubjectSpinnerView contactSupportSubjectSpinnerView) {
        this.f92395a = scrollView;
        this.f92396b = editText;
        this.f92397c = textView;
        this.f92398d = dumbRadioGrid;
        this.f92399e = textView3;
        this.f92400f = editText2;
        this.f92401g = textView4;
        this.f92402h = textView5;
        this.f92403i = contactSupportSubjectSpinnerView;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92395a;
    }
}
