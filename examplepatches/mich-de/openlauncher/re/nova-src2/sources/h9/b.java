package h9;

import a5.a1;
import a5.h2;
import a5.t0;
import android.view.ViewTreeObserver;
import com.teslacoilsw.launcher.EditShortcutFloatingView;
import com.vungle.ads.internal.ui.view.d;
import java.util.WeakHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class b implements ViewTreeObserver.OnGlobalLayoutListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59544a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f59545b;

    public /* synthetic */ b(Object obj, int i5) {
        this.f59544a = i5;
        this.f59545b = obj;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        int i5 = this.f59544a;
        Object obj = this.f59545b;
        switch (i5) {
            case 0:
                com.amplitude.android.sessionreplay.a.b((com.amplitude.android.sessionreplay.a) obj);
                break;
            case 1:
                EditShortcutFloatingView editShortcutFloatingView = (EditShortcutFloatingView) obj;
                int i11 = EditShortcutFloatingView.f45599v;
                if (editShortcutFloatingView.isAttachedToWindow()) {
                    WeakHashMap weakHashMap = a1.f250a;
                    h2 h2VarA = t0.a(editShortcutFloatingView);
                    Intrinsics.d(h2VarA);
                    editShortcutFloatingView.g0(h2VarA);
                    break;
                }
                break;
            default:
                d.a((d) obj);
                break;
        }
    }
}
