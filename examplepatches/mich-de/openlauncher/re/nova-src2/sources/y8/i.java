package y8;

import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import t70.m;

/* loaded from: classes.dex */
public interface i extends g {
    static v4.a d(int i5, int i11, int i12) {
        if (i5 == -2) {
            return b.f96840d;
        }
        int i13 = i5 - i12;
        if (i13 > 0) {
            return new a(i13);
        }
        int i14 = i11 - i12;
        if (i14 > 0) {
            return new a(i14);
        }
        return null;
    }

    @Override // y8.g
    default Object a(m8.h hVar) {
        f size = getSize();
        if (size != null) {
            return size;
        }
        m mVar = new m(1, IntrinsicsKt.b(hVar));
        mVar.t();
        ViewTreeObserver viewTreeObserver = ((e) this).b().getViewTreeObserver();
        h hVar2 = new h(this, viewTreeObserver, mVar);
        viewTreeObserver.addOnPreDrawListener(hVar2);
        mVar.v(new b0.i(9, this, viewTreeObserver, hVar2));
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    default f getSize() {
        e eVar = (e) this;
        ViewGroup.LayoutParams layoutParams = eVar.b().getLayoutParams();
        v4.a aVarD = d(layoutParams != null ? layoutParams.width : -1, eVar.b().getWidth(), eVar.b().getPaddingRight() + eVar.b().getPaddingLeft());
        if (aVarD == null) {
            return null;
        }
        ViewGroup.LayoutParams layoutParams2 = eVar.b().getLayoutParams();
        v4.a aVarD2 = d(layoutParams2 != null ? layoutParams2.height : -1, eVar.b().getHeight(), eVar.b().getPaddingBottom() + eVar.b().getPaddingTop());
        if (aVarD2 == null) {
            return null;
        }
        return new f(aVarD, aVarD2);
    }
}
