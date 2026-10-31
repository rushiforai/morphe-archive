package androidx.fragment.app;

import android.view.View;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class l {

    /* renamed from: a, reason: collision with root package name */
    public final d2 f14609a;

    public l(d2 operation) {
        Intrinsics.g(operation, "operation");
        this.f14609a = operation;
    }

    public final boolean a() {
        int i5;
        d2 d2Var = this.f14609a;
        View view = d2Var.f14518c.mView;
        if (view != null) {
            i5 = 4;
            if (view.getAlpha() != 0.0f || view.getVisibility() != 0) {
                int visibility = view.getVisibility();
                if (visibility == 0) {
                    i5 = 2;
                } else if (visibility != 4) {
                    if (visibility != 8) {
                        throw new IllegalArgumentException(b.c0.h(visibility, "Unknown visibility "));
                    }
                    i5 = 3;
                }
            }
        } else {
            i5 = 0;
        }
        int i11 = d2Var.f14516a;
        if (i5 != i11) {
            return (i5 == 2 || i11 == 2) ? false : true;
        }
        return true;
    }
}
