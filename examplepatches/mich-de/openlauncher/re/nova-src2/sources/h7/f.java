package h7;

import ae.i;
import android.view.View;
import android.view.animation.Animation;
import android.webkit.WebView;
import android.widget.ProgressBar;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import com.teslacoilsw.launcher.novamobile.NovaMobileActivity;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class f implements Animation.AnimationListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59529a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f59530b;

    public /* synthetic */ f(View view, int i5) {
        this.f59529a = i5;
        this.f59530b = view;
    }

    private final void a(Animation animation) {
    }

    private final void b(Animation animation) {
    }

    private final void c(Animation animation) {
    }

    private final void d(Animation animation) {
    }

    private final void e(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        i iVar;
        switch (this.f59529a) {
            case 0:
                SwipeRefreshLayout swipeRefreshLayout = (SwipeRefreshLayout) this.f59530b;
                if (!swipeRefreshLayout.f15285c) {
                    swipeRefreshLayout.l();
                    return;
                }
                swipeRefreshLayout.f15305y.setAlpha(255);
                swipeRefreshLayout.f15305y.start();
                if (swipeRefreshLayout.D && (iVar = swipeRefreshLayout.f15284b) != null) {
                    NovaMobileActivity novaMobileActivity = (NovaMobileActivity) iVar.f12762b;
                    ProgressBar progressBar = novaMobileActivity.f45914r;
                    if (progressBar == null) {
                        Intrinsics.m("progressBar");
                        throw null;
                    }
                    progressBar.setVisibility(0);
                    WebView webView = novaMobileActivity.f45913q;
                    if (webView == null) {
                        Intrinsics.m("webView");
                        throw null;
                    }
                    webView.reload();
                }
                swipeRefreshLayout.n = swipeRefreshLayout.f15300t.getTop();
                return;
            case 1:
                SwipeRefreshLayout swipeRefreshLayout2 = (SwipeRefreshLayout) this.f59530b;
                g gVar = new g(swipeRefreshLayout2, 1);
                swipeRefreshLayout2.A = gVar;
                gVar.setDuration(150L);
                a aVar = swipeRefreshLayout2.f15300t;
                aVar.f59495a = null;
                aVar.clearAnimation();
                swipeRefreshLayout2.f15300t.startAnimation(swipeRefreshLayout2.A);
                return;
            default:
                this.f59530b.setVisibility(4);
                return;
        }
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationRepeat(Animation animation) {
        int i5 = this.f59529a;
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationStart(Animation animation) {
        switch (this.f59529a) {
            case 0:
            case 1:
                break;
            default:
                this.f59530b.setVisibility(0);
                break;
        }
    }
}
