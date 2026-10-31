package v9;

import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import androidx.constraintlayout.widget.ConstraintLayout;

/* loaded from: classes2.dex */
public final class q implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f92504a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final ConstraintLayout f92505b;

    /* renamed from: c, reason: collision with root package name */
    public final EditText f92506c;

    public q(ConstraintLayout constraintLayout, EditText editText, TextView textView, TextView textView2) {
        this.f92505b = constraintLayout;
        this.f92506c = editText;
    }

    @Override // l7.a
    public final View getRoot() {
        switch (this.f92504a) {
        }
        return this.f92505b;
    }

    public q(ConstraintLayout constraintLayout, EditText editText) {
        this.f92505b = constraintLayout;
        this.f92506c = editText;
    }
}
