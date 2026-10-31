package y8;

import android.view.ViewTreeObserver;
import kotlin.Result;
import t70.m;

/* loaded from: classes2.dex */
public final class h implements ViewTreeObserver.OnPreDrawListener {

    /* renamed from: a, reason: collision with root package name */
    public boolean f96847a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i f96848b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ViewTreeObserver f96849c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ m f96850d;

    public h(i iVar, ViewTreeObserver viewTreeObserver, m mVar) {
        this.f96848b = iVar;
        this.f96849c = viewTreeObserver;
        this.f96850d = mVar;
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        i iVar = this.f96848b;
        f size = iVar.getSize();
        if (size != null) {
            ViewTreeObserver viewTreeObserver = this.f96849c;
            if (viewTreeObserver.isAlive()) {
                viewTreeObserver.removeOnPreDrawListener(this);
            } else {
                ((e) iVar).b().getViewTreeObserver().removeOnPreDrawListener(this);
            }
            if (!this.f96847a) {
                this.f96847a = true;
                int i5 = Result.f71687b;
                this.f96850d.resumeWith(size);
            }
        }
        return true;
    }
}
