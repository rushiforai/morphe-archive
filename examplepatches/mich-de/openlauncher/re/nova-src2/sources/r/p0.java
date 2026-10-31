package r;

import androidx.appcompat.widget.AppCompatTextView;

/* loaded from: classes2.dex */
public class p0 extends q.c {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ AppCompatTextView f84835c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p0(AppCompatTextView appCompatTextView) {
        super(appCompatTextView, 9);
        this.f84835c = appCompatTextView;
    }

    @Override // q.c, r.o0
    public final void d(int i5) {
        super/*android.widget.TextView*/.setLastBaselineToBottomHeight(i5);
    }

    @Override // q.c, r.o0
    public final void g(int i5) {
        super/*android.widget.TextView*/.setFirstBaselineToTopHeight(i5);
    }
}
