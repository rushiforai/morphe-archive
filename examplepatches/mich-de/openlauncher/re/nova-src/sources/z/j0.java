package z;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class j0 extends u0 {

    /* renamed from: c, reason: collision with root package name */
    public i0 f97782c;

    public j0(int i5) {
        this.f97840a = i5 == 0 ? v0.f97846a : new Object[i5];
    }

    public final void g(Object obj) {
        int i5 = this.f97841b + 1;
        Object[] objArr = this.f97840a;
        if (objArr.length < i5) {
            m(i5, objArr);
        }
        Object[] objArr2 = this.f97840a;
        int i11 = this.f97841b;
        objArr2[i11] = obj;
        this.f97841b = i11 + 1;
    }

    public final void h(List elements) {
        Intrinsics.g(elements, "elements");
        if (elements.isEmpty()) {
            return;
        }
        int i5 = this.f97841b;
        int size = elements.size() + i5;
        Object[] objArr = this.f97840a;
        if (objArr.length < size) {
            m(size, objArr);
        }
        Object[] objArr2 = this.f97840a;
        int size2 = elements.size();
        for (int i11 = 0; i11 < size2; i11++) {
            objArr2[i11 + i5] = elements.get(i11);
        }
        this.f97841b = elements.size() + this.f97841b;
    }

    public final void i() {
        u90.b.B(0, this.f97841b, null, this.f97840a);
        this.f97841b = 0;
    }

    public final boolean j(Object obj) {
        int iC = c(obj);
        if (iC < 0) {
            return false;
        }
        k(iC);
        return true;
    }

    public final Object k(int i5) {
        int i11;
        if (i5 < 0 || i5 >= (i11 = this.f97841b)) {
            f(i5);
            throw null;
        }
        Object[] objArr = this.f97840a;
        Object obj = objArr[i5];
        if (i5 != i11 - 1) {
            u90.b.t(objArr, i5, objArr, i5 + 1, i11);
        }
        int i12 = this.f97841b - 1;
        this.f97841b = i12;
        objArr[i12] = null;
        return obj;
    }

    public final void l(int i5, int i11) {
        int i12;
        if (i5 < 0 || i5 > (i12 = this.f97841b) || i11 < 0 || i11 > i12) {
            StringBuilder sbT = b.c0.t(i5, "Start (", ") and end (", i11, ") must be in 0..");
            sbT.append(this.f97841b);
            android.support.v4.media.session.b.m0(sbT.toString());
            throw null;
        }
        if (i11 < i5) {
            android.support.v4.media.session.b.k0("Start (" + i5 + ") is more than end (" + i11 + ')');
            throw null;
        }
        if (i11 != i5) {
            if (i11 < i12) {
                Object[] objArr = this.f97840a;
                u90.b.t(objArr, i5, objArr, i11, i12);
            }
            int i13 = this.f97841b;
            int i14 = i13 - (i11 - i5);
            u90.b.B(i14, i13, null, this.f97840a);
            this.f97841b = i14;
        }
    }

    public final void m(int i5, Object[] oldContent) {
        Intrinsics.g(oldContent, "oldContent");
        int length = oldContent.length;
        Object[] objArr = new Object[Math.max(i5, (length * 3) / 2)];
        u90.b.t(oldContent, 0, objArr, 0, length);
        this.f97840a = objArr;
    }

    public /* synthetic */ j0() {
        this(16);
    }
}
