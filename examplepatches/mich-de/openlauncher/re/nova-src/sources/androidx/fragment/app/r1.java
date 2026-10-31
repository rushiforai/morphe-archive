package androidx.fragment.app;

import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class r1 {

    /* renamed from: a, reason: collision with root package name */
    public static final w1 f14678a = new w1();

    /* renamed from: b, reason: collision with root package name */
    public static final w1 f14679b;

    static {
        w1 w1Var = null;
        try {
            w1Var = (w1) Class.forName("androidx.transition.FragmentTransitionSupport").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        f14679b = w1Var;
    }

    public static final void a(ArrayList views, int i5) {
        Intrinsics.g(views, "views");
        Iterator it = views.iterator();
        while (it.hasNext()) {
            ((View) it.next()).setVisibility(i5);
        }
    }
}
