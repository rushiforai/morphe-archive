package androidx.fragment.app;

import android.graphics.Rect;
import android.transition.Transition;

/* loaded from: classes2.dex */
public final class s1 extends Transition.EpicenterCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14685a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Rect f14686b;

    public /* synthetic */ s1(int i5, Rect rect) {
        this.f14685a = i5;
        this.f14686b = rect;
    }

    @Override // android.transition.Transition.EpicenterCallback
    public final Rect onGetEpicenter(Transition transition) {
        switch (this.f14685a) {
            case 0:
                return this.f14686b;
            default:
                Rect rect = this.f14686b;
                if (rect == null || rect.isEmpty()) {
                    return null;
                }
                return rect;
        }
    }
}
