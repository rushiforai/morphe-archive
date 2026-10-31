package g;

import android.view.View;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class c0 extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final c0 f56406k;

    /* renamed from: l, reason: collision with root package name */
    public static final c0 f56407l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f56408j;

    static {
        int i5 = 1;
        f56406k = new c0(i5, 0);
        f56407l = new c0(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c0(int i5, int i11) {
        super(i5);
        this.f56408j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f56408j) {
            case 0:
                View it = (View) obj;
                Intrinsics.g(it, "it");
                Object parent = it.getParent();
                if (parent instanceof View) {
                    return (View) parent;
                }
                return null;
            default:
                View it2 = (View) obj;
                Intrinsics.g(it2, "it");
                Object tag = it2.getTag(2131429159);
                if (tag instanceof b0) {
                    return (b0) tag;
                }
                return null;
        }
    }
}
