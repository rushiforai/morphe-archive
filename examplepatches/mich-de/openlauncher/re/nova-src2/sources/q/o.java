package q;

import android.view.CollapsibleActionView;
import android.view.View;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public final class o extends FrameLayout implements androidx.appcompat.view.c {

    /* renamed from: a, reason: collision with root package name */
    public final CollapsibleActionView f83284a;

    /* JADX WARN: Multi-variable type inference failed */
    public o(View view) {
        super(view.getContext());
        this.f83284a = (CollapsibleActionView) view;
        addView(view);
    }
}
