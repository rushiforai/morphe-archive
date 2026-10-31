package cz;

import android.view.MotionEvent;
import androidx.compose.ui.node.LayoutNode;
import b00.d1;
import com.android.launcher3.Workspace;
import com.android.systemui.plugins.shared.LauncherOverlayManager;
import com.google.android.gms.common.Feature;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.y2;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import o9.l2;
import o9.n1;
import rg.l;
import rg.y;
import sg.w;
import t5.d0;
import vk.r;
import vk.s;
import vk.t;
import ya.f0;
import ya.k0;

/* loaded from: classes.dex */
public final class b implements k0, ua.h {

    /* renamed from: a, reason: collision with root package name */
    public boolean f48573a;

    /* renamed from: b, reason: collision with root package name */
    public int f48574b;

    /* renamed from: c, reason: collision with root package name */
    public Object f48575c;

    /* renamed from: d, reason: collision with root package name */
    public Object f48576d;

    public b(t tVar, boolean z11, vk.b bVar, int i5) {
        this.f48576d = tVar;
        this.f48573a = z11;
        this.f48575c = bVar;
        this.f48574b = i5;
    }

    public static b b(char c11) {
        return new b(new d0(new vk.c(c11), 16));
    }

    public y a() {
        w.a("execute parameter required", ((l) this.f48575c) != null);
        return new y(this, (Feature[]) this.f48576d, this.f48573a, this.f48574b);
    }

    public r c(CharSequence charSequence) {
        charSequence.getClass();
        return new r(this, charSequence);
    }

    @Override // ua.h
    public void d(float f11, float f12) {
        ua.i iVar = (ua.i) this.f48576d;
        f0 f0Var = ((n1) this.f48575c).O.S0;
        if (f0Var != null) {
            f0Var.onRelease();
        }
        iVar.c();
        iVar.f90770u = 0;
        iVar.o = false;
    }

    public List e(CharSequence charSequence) {
        charSequence.getClass();
        Iterator itW = ((t) this.f48576d).w(this, charSequence);
        ArrayList arrayList = new ArrayList();
        while (true) {
            s sVar = (s) itW;
            if (!sVar.hasNext()) {
                return Collections.unmodifiableList(arrayList);
            }
            arrayList.add((String) sVar.next());
        }
    }

    @Override // ua.h
    public boolean g(float f11) {
        n1 n1Var = (n1) this.f48575c;
        float fMin = n1Var.O.G ? Math.min(0.0f, f11) : Math.max(0.0f, f11);
        Workspace workspace = n1Var.O;
        if (workspace.S0 == null) {
            return true;
        }
        float fAbs = Math.abs(fMin / workspace.getMeasuredWidth());
        f0 f0Var = workspace.S0;
        f0Var.onPullDistance(fAbs - f0Var.f97128c, 0.5f);
        return true;
    }

    @Override // ya.k0
    public boolean k(MotionEvent motionEvent) {
        ((ua.i) this.f48576d).g(motionEvent);
        return true;
    }

    @Override // ya.k0
    public boolean l(MotionEvent motionEvent) {
        throw new IllegalStateException();
    }

    @Override // ua.h
    public void m(float f11, boolean z11) {
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x007d  */
    @Override // ya.k0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int n(MotionEvent motionEvent) {
        boolean z11;
        n1 n1Var = (n1) this.f48575c;
        ua.i iVar = (ua.i) this.f48576d;
        if (motionEvent.getAction() == 0) {
            int i5 = this.f48574b;
            if (y2.f51877a.H1()) {
                Intrinsics.e(n1Var, "null cannot be cast to non-null type com.teslacoilsw.launcher.NovaLauncher");
                NovaLauncher novaLauncher = (NovaLauncher) n1Var;
                LauncherOverlayManager launcherOverlayManager = novaLauncher.f80014o0;
                boolean z12 = ((launcherOverlayManager instanceof dz.g) || (launcherOverlayManager instanceof d1)) && !novaLauncher.Q.o() && o9.a.P(n1Var, 7471103) == null && n1Var.t0(l2.f79974m) && ((!(z11 = novaLauncher.O.G) && motionEvent.getX() < ((float) i5)) || (z11 && motionEvent.getX() > ((float) (novaLauncher.P.getWidth() - i5))));
                this.f48573a = z12;
                iVar.f90770u = n1Var.O.G ? 2 : 1;
                iVar.o = true;
                if (z12) {
                    if (iVar.d()) {
                        return 1;
                    }
                    if (this.f48573a) {
                        iVar.g(motionEvent);
                        return 3;
                    }
                }
            }
        }
        return 0;
    }

    public b(t tVar) {
        this(tVar, false, vk.d.f92806a, LayoutNode.NotPlacedPlaceOrder);
    }
}
