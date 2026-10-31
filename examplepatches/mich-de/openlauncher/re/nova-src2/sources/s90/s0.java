package s90;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.location.Location;
import android.os.Handler;
import android.os.Looper;
import android.view.Surface;
import android.view.inputmethod.CompletionInfo;
import android.view.inputmethod.InputMethodManager;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.folder.FolderNameEditText;
import com.android.launcher3.logging.InstanceId;
import com.android.launcher3.logging.StatsLogManager;
import com.google.firebase.messaging.FirebaseMessaging;
import e10.y2;
import e10.z2;
import io.branch.search.internal.AbstractC3080b9;
import io.branch.search.internal.N6;
import java.util.Iterator;
import kotlin.Unit;
import o9.g3;
import o9.l2;
import o9.n1;

/* loaded from: classes5.dex */
public final /* synthetic */ class s0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f87012a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f87013b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f87014c;

    public /* synthetic */ s0(int i5, Object obj, Object obj2) {
        this.f87012a = i5;
        this.f87013b = obj;
        this.f87014c = obj2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Drawable aVar;
        int i5 = 0;
        switch (this.f87012a) {
            case 0:
                a1 a1Var = (a1) this.f87013b;
                a1Var.d("read", new o0(a1Var, (q10.d) this.f87014c, 2));
                return;
            case 1:
                FirebaseMessaging firebaseMessaging = (FirebaseMessaging) this.f87013b;
                fi.j jVar = (fi.j) this.f87014c;
                t5.d0 d0Var = FirebaseMessaging.f34752m;
                try {
                    jVar.a(firebaseMessaging.a());
                    return;
                } catch (Exception e3) {
                    jVar.f55135a.v(e3);
                    return;
                }
            case 2:
                tm.m mVar = (tm.m) this.f87013b;
                fi.j jVar2 = (fi.j) this.f87014c;
                try {
                    jVar2.a(mVar.a());
                    return;
                } catch (Exception e11) {
                    jVar2.f55135a.v(e11);
                    return;
                }
            case 3:
                ((k30.z) this.f87013b).accept((Location) this.f87014c);
                return;
            case 4:
                ((z4.a) this.f87013b).accept((Location) this.f87014c);
                return;
            case 5:
                ((t70.m) this.f87013b).E((u70.d) this.f87014c, Unit.f71706a);
                return;
            case 6:
                ua.a aVar2 = (ua.a) this.f87013b;
                l2 l2Var = (l2) this.f87014c;
                aVar2.f90719i = null;
                aVar2.f90720j = true;
                ua.i iVar = aVar2.f90712b;
                iVar.h(1);
                iVar.f90770u = 0;
                iVar.o = false;
                if (aVar2.f90720j || aVar2.f90718h != l2Var) {
                    n1 n1Var = aVar2.f90711a;
                    if (!n1Var.t0(l2Var)) {
                        n1Var.M.i(l2Var, false);
                    }
                    z9.h hVar = n1Var.L.f20972f;
                    hVar.getClass();
                    ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(hVar, z9.h.f98386t, 1.0f);
                    objectAnimatorOfFloat.setAutoCancel(true);
                    objectAnimatorOfFloat.setDuration(0L).start();
                    return;
                }
                return;
            case 7:
                ((vf.n) this.f87014c).a(((wf.o) this.f87013b).d());
                return;
            case 8:
                x9.u uVar = (x9.u) this.f87013b;
                ga.e eVar = (ga.e) this.f87014c;
                y2 y2Var = y2.f51877a;
                fz.d dVar = (fz.d) y2Var.i().l();
                Object[] objArr = new Object[1];
                int i11 = uVar.f95673e;
                int i12 = uVar.f95674f;
                Context context = uVar.o;
                Drawable drawableB0 = z2.B0(g3.k(context, eVar, i11, i12, objArr), (fz.d) y2Var.i().l());
                if (drawableB0 instanceof com.teslacoilsw.launcher.icon.a) {
                    int dimension = ((int) context.getResources().getDimension(2131165314)) / 2;
                    Rect rect = new Rect(0, 0, i11, i12);
                    rect.inset(dimension, dimension);
                    Rect rect2 = new Rect(rect);
                    Drawable drawableH = g3.h(context, eVar, objArr[0]);
                    uVar.B = drawableH;
                    drawableH.setBounds(rect2);
                    boolean z11 = drawableB0 instanceof x9.s;
                    aa.g0 g0VarW = aa.g0.w(context);
                    if (z11) {
                        try {
                            aVar = new com.teslacoilsw.launcher.icon.a(new ColorDrawable(-16777216), (Drawable) null, dVar);
                        } catch (Throwable th2) {
                            try {
                                g0VarW.D();
                            } catch (Throwable th3) {
                                th2.addSuppressed(th3);
                            }
                            throw th2;
                        }
                    } else {
                        aVar = drawableB0;
                    }
                    g3.t(((mx.k0) g0VarW).f77191y.e(aVar), rect);
                    g0VarW.D();
                    com.teslacoilsw.launcher.icon.a aVar3 = (com.teslacoilsw.launcher.icon.a) drawableB0;
                    Rect rect3 = new Rect(rect);
                    g3.t(0.98f, rect3);
                    aVar3.setBounds(rect3);
                    Path pathJ = aVar3.j();
                    uVar.f95691y = new x9.m(uVar, AdaptiveIconDrawable.getExtraInsetFraction() * i11);
                    uVar.f95692z = new x9.m(uVar, AdaptiveIconDrawable.getExtraInsetFraction() * i12);
                    rect.inset((int) (AdaptiveIconDrawable.getExtraInsetFraction() * (-rect.width())), (int) (AdaptiveIconDrawable.getExtraInsetFraction() * (-rect.height())));
                    Drawable drawableH2 = aVar3.h();
                    uVar.f95689w = drawableH2;
                    if (drawableH2 == null) {
                        uVar.f95689w = new ColorDrawable(0);
                    }
                    uVar.f95689w.setBounds(rect);
                    Drawable drawableI = aVar3.i();
                    uVar.f95690x = drawableI;
                    if (drawableI == null) {
                        uVar.f95690x = new ColorDrawable(0);
                    }
                    uVar.f95690x.setBounds(rect);
                    new Handler(Looper.getMainLooper()).post(new x9.k(uVar, pathJ, eVar, i5));
                    return;
                }
                return;
            case 9:
                he.k kVar = (he.k) this.f87013b;
                xf.p pVar = (xf.p) this.f87014c;
                fe.x xVar = kVar.f59745b;
                int i13 = wf.v.f94376a;
                fe.a0 a0Var = xVar.f55061a;
                a0Var.f54687h0 = pVar;
                a0Var.f54694l.d(25, new fe.w(pVar));
                return;
            case 10:
                he.k kVar2 = (he.k) this.f87013b;
                ie.e eVar2 = (ie.e) this.f87014c;
                synchronized (eVar2) {
                }
                fe.x xVar2 = kVar2.f59745b;
                int i14 = wf.v.f94376a;
                ge.f fVar = xVar2.f55061a.f54699r;
                ge.a aVarC = fVar.c((gf.w) fVar.f57396d.f18213e);
                fVar.g(aVarC, 1020, new f10.o(aVarC, (Object) eVar2, 13));
                return;
            case 11:
                FolderIcon folderIcon = (FolderIcon) this.f87013b;
                c00.d dVar2 = (c00.d) this.f87014c;
                aa.n nVar = FolderIcon.f21127f0;
                if (u9.b.f90695h.f90687d && b.c0.b(folderIcon.I.V0(), 1)) {
                    if (!dVar2.s()) {
                        StatsLogManager.b(folderIcon.getContext()).a().a(folderIcon.I).b(ea.d.LAUNCHER_FOLDER_AUTO_LABELING_SKIPPED_EMPTY_SUGGESTIONS);
                    } else if (dVar2.r()) {
                        CharSequence charSequence = ((CharSequence[]) dVar2.f19045c)[0];
                        folderIcon.I.U0();
                        folderIcon.I.a0(charSequence, folderIcon.H.f21112j.k());
                        CharSequence charSequence2 = folderIcon.I.f57300l;
                        folderIcon.J.setText(charSequence2);
                        folderIcon.setContentDescription(folderIcon.Z(charSequence2));
                        folderIcon.H.f21118r.setText(folderIcon.I.f57300l);
                        ea.e eVarA = StatsLogManager.b(folderIcon.getContext()).a().a(folderIcon.I);
                        charSequence.toString();
                        eVarA.b(ea.d.LAUNCHER_FOLDER_AUTO_LABELED);
                    } else {
                        StatsLogManager.b(folderIcon.getContext()).a().a(folderIcon.I).b(ea.d.LAUNCHER_FOLDER_AUTO_LABELING_SKIPPED_EMPTY_PRIMARY);
                    }
                }
                folderIcon.invalidate();
                return;
            case 12:
                FolderNameEditText folderNameEditText = (FolderNameEditText) this.f87013b;
                CompletionInfo[] completionInfoArr = (CompletionInfo[]) this.f87014c;
                int i15 = FolderNameEditText.f21133e;
                ((InputMethodManager) folderNameEditText.getContext().getSystemService(InputMethodManager.class)).displayCompletions(folderNameEditText, completionInfoArr);
                return;
            case 13:
                yf.k kVar3 = (yf.k) this.f87013b;
                SurfaceTexture surfaceTexture = (SurfaceTexture) this.f87014c;
                SurfaceTexture surfaceTexture2 = kVar3.f97299g;
                Surface surface = kVar3.f97300h;
                Surface surface2 = new Surface(surfaceTexture);
                kVar3.f97299g = surfaceTexture;
                kVar3.f97300h = surface2;
                Iterator it = kVar3.f97293a.iterator();
                while (it.hasNext()) {
                    ((fe.x) it.next()).f55061a.l0(surface2);
                }
                if (surfaceTexture2 != null) {
                    surfaceTexture2.release();
                }
                if (surface != null) {
                    surface.release();
                    return;
                }
                return;
            case 14:
                yx.f.f97697a.post(new he.j((b10.y) this.f87014c, yx.f.a((Context) this.f87013b), 3));
                return;
            default:
                N6.a((N6) this.f87013b, (AbstractC3080b9) this.f87014c);
                return;
        }
    }

    public /* synthetic */ s0(FolderIcon folderIcon, c00.d dVar, InstanceId instanceId) {
        this.f87012a = 11;
        this.f87013b = folderIcon;
        this.f87014c = dVar;
    }
}
