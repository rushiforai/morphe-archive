package defpackage;

import android.app.Activity;
import android.content.res.Resources;
import com.medium.android.donkey.launcher.LauncherActivity;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.donkey.onboarding.OnboardingFlowActivity;
import com.medium.android.donkey.push.TrampolineActivity;
import com.medium.android.donkey.read.carousel.ImageCarouselActivity;
import com.medium.android.donkey.read.web.ExternalWebViewActivity;
import com.medium.android.donkey.susi.SusiActivity;
import com.medium.android.donkey.write.publicationflow.PublicationFlowActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class h10 implements zq8 {
    public final /* synthetic */ int a;
    public final /* synthetic */ n1 b;

    public /* synthetic */ h10(n1 n1Var, int i) {
        this.a = i;
        this.b = n1Var;
    }

    @Override // defpackage.zq8
    public final void a(xy1 xy1Var) {
        int i = this.a;
        n1 n1Var = this.b;
        switch (i) {
            case 0:
                t10 t10VarO = n1Var.o();
                t10VarO.a();
                n1Var.getSavedStateRegistry().a("androidx:appcompat");
                t10VarO.c();
                break;
            case 1:
                ExternalWebViewActivity externalWebViewActivity = (ExternalWebViewActivity) n1Var;
                if (!externalWebViewActivity.n) {
                    externalWebViewActivity.n = true;
                    ko2 ko2Var = ((xm2) ((d84) externalWebViewActivity.c())).b;
                    externalWebViewActivity.g = (pz2) ko2Var.H.get();
                    externalWebViewActivity.h = true;
                    externalWebViewActivity.i = (pu7) ko2Var.w.get();
                    externalWebViewActivity.j = i03.a;
                    externalWebViewActivity.o = (zk2) ko2Var.r.get();
                    externalWebViewActivity.p = ko2Var.c();
                    externalWebViewActivity.q = "4.5.1784910415";
                }
                break;
            case 2:
                ImageCarouselActivity imageCarouselActivity = (ImageCarouselActivity) n1Var;
                if (!imageCarouselActivity.o) {
                    imageCarouselActivity.o = true;
                    xm2 xm2Var = (xm2) ((lw5) imageCarouselActivity.c());
                    ko2 ko2Var2 = xm2Var.b;
                    imageCarouselActivity.g = (pz2) ko2Var2.H.get();
                    imageCarouselActivity.h = true;
                    imageCarouselActivity.i = (pu7) ko2Var2.w.get();
                    imageCarouselActivity.j = i03.a;
                    imageCarouselActivity.p = (vm2) xm2Var.g.get();
                }
                break;
            case 3:
                LauncherActivity launcherActivity = (LauncherActivity) n1Var;
                if (!launcherActivity.o) {
                    launcherActivity.o = true;
                    ko2 ko2Var3 = ((xm2) ((io6) launcherActivity.c())).b;
                    launcherActivity.g = (pz2) ko2Var3.H.get();
                    launcherActivity.h = true;
                    launcherActivity.i = (pu7) ko2Var3.w.get();
                    launcherActivity.j = i03.a;
                    launcherActivity.p = new h1c();
                    launcherActivity.q = ko2Var3.s();
                    launcherActivity.r = ko2Var3.c();
                }
                break;
            case 4:
                MainActivity mainActivity = (MainActivity) n1Var;
                if (!mainActivity.p) {
                    mainActivity.p = true;
                    xm2 xm2Var2 = (xm2) ((ef7) mainActivity.c());
                    ko2 ko2Var4 = xm2Var2.b;
                    mainActivity.g = (pz2) ko2Var4.H.get();
                    mainActivity.h = true;
                    mainActivity.i = (pu7) ko2Var4.w.get();
                    mainActivity.j = i03.a;
                    Activity activity = xm2Var2.a;
                    activity.getClass();
                    Resources resources = activity.getResources();
                    resources.getClass();
                    Resources.Theme theme = activity.getTheme();
                    theme.getClass();
                    mainActivity.q = new mya(resources, 12, theme);
                    mainActivity.r = (o41) xm2Var2.e.get();
                    mainActivity.s = (n32) ko2Var4.q.get();
                    mainActivity.t = new ax2(ko2Var4.x(), 0);
                    mainActivity.u = ko2Var4.s();
                    mainActivity.v = ko2Var4.c();
                    mainActivity.w = "4.5.1784910415";
                    mainActivity.x = xm2Var2.f;
                }
                break;
            case 5:
                OnboardingFlowActivity onboardingFlowActivity = (OnboardingFlowActivity) n1Var;
                if (!onboardingFlowActivity.p) {
                    onboardingFlowActivity.p = true;
                    ko2 ko2Var5 = ((xm2) ((rr8) onboardingFlowActivity.c())).b;
                    onboardingFlowActivity.g = (pz2) ko2Var5.H.get();
                    onboardingFlowActivity.h = true;
                    onboardingFlowActivity.i = (pu7) ko2Var5.w.get();
                    onboardingFlowActivity.j = i03.a;
                }
                break;
            case 6:
                PublicationFlowActivity publicationFlowActivity = (PublicationFlowActivity) n1Var;
                if (!publicationFlowActivity.o) {
                    publicationFlowActivity.o = true;
                    ko2 ko2Var6 = ((xm2) ((kda) publicationFlowActivity.c())).b;
                    publicationFlowActivity.g = (pz2) ko2Var6.H.get();
                    publicationFlowActivity.h = true;
                    publicationFlowActivity.i = (pu7) ko2Var6.w.get();
                    publicationFlowActivity.j = i03.a;
                }
                break;
            case 7:
                SusiActivity susiActivity = (SusiActivity) n1Var;
                if (!susiActivity.o) {
                    susiActivity.o = true;
                    xm2 xm2Var3 = (xm2) ((k3d) susiActivity.c());
                    ko2 ko2Var7 = xm2Var3.b;
                    susiActivity.g = (pz2) ko2Var7.H.get();
                    susiActivity.h = true;
                    susiActivity.i = (pu7) ko2Var7.w.get();
                    susiActivity.j = i03.a;
                    new iu7();
                    ko2Var7.c();
                    susiActivity.p = ko2Var7.s();
                    susiActivity.q = "4.5.1784910415";
                    susiActivity.r = xm2Var3.c();
                    susiActivity.s = (o41) xm2Var3.e.get();
                }
                break;
            default:
                TrampolineActivity trampolineActivity = (TrampolineActivity) n1Var;
                if (!trampolineActivity.p) {
                    trampolineActivity.p = true;
                    ko2 ko2Var8 = ((xm2) ((frd) trampolineActivity.c())).b;
                    trampolineActivity.g = (pz2) ko2Var8.H.get();
                    trampolineActivity.h = true;
                    trampolineActivity.i = (pu7) ko2Var8.w.get();
                    trampolineActivity.j = i03.a;
                    trampolineActivity.q = ko2Var8.s();
                    trampolineActivity.r = ko2Var8.c();
                    trampolineActivity.s = new yx2(ko2Var8.x());
                    trampolineActivity.t = (zk2) ko2Var8.r.get();
                    trampolineActivity.u = (w50) ko2Var8.L.get();
                }
                break;
        }
    }
}
