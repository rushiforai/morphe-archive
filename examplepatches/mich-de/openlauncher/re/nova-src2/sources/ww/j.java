package ww;

import com.stripe.android.view.CardMultilineWidget;

/* loaded from: classes4.dex */
public final /* synthetic */ class j implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94787a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ CardMultilineWidget f94788b;

    public /* synthetic */ j(int i5, CardMultilineWidget cardMultilineWidget) {
        this.f94787a = i5;
        this.f94788b = cardMultilineWidget;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f94787a) {
            case 0:
                this.f94788b.f45451e.requestFocus();
                break;
            case 1:
                this.f94788b.f45452f.requestFocus();
                break;
            default:
                this.f94788b.f45450d.requestFocus();
                break;
        }
    }
}
