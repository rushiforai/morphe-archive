package b5;

import android.os.Bundle;
import android.text.style.ClickableSpan;
import android.view.View;

/* loaded from: classes2.dex */
public final class a extends ClickableSpan {

    /* renamed from: a, reason: collision with root package name */
    public final int f17531a;

    /* renamed from: b, reason: collision with root package name */
    public final g f17532b;

    /* renamed from: c, reason: collision with root package name */
    public final int f17533c;

    public a(int i5, g gVar, int i11) {
        this.f17531a = i5;
        this.f17532b = gVar;
        this.f17533c = i11;
    }

    @Override // android.text.style.ClickableSpan
    public final void onClick(View view) {
        Bundle bundle = new Bundle();
        bundle.putInt("ACCESSIBILITY_CLICKABLE_SPAN_ID", this.f17531a);
        this.f17532b.f17551a.performAction(this.f17533c, bundle);
    }
}
