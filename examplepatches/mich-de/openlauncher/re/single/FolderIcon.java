package com.android.launcher3.folder;

import aa.g0;
import aa.k;
import aa.n;
import aa.w;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Process;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.android.launcher3.CellLayout;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.google.android.gms.internal.measurement.v6;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.icon.a;
import com.teslacoilsw.launcher.util.NamedIntent;
import e10.i0;
import e10.p0;
import e10.y2;
import e10.z2;
import ga.b;
import ga.c;
import ga.j;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Objects;
import java.util.function.Predicate;
import java.util.stream.Stream;
import mx.c0;
import mx.j0;
import mz.e;
import mz.g;
import nz.f;
import o9.b3;
import o9.g3;
import o9.n1;
import o9.v;
import org.xmlpull.v1.XmlPullParserException;
import y9.q;
import y9.r;
import y9.y;
import y9.z;
import za.d;

/* loaded from: classes.dex */
public class FolderIcon extends DoubleShadowBubbleTextView implements b {

    /* renamed from: f0, reason: collision with root package name */
    public static final n f21127f0 = new n(Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888), 0, false);
    public d G;
    public Folder H;
    public c I;
    public final FolderIcon J;
    public y K;
    public boolean L;
    public q M;
    public nz.c N;
    public final nz.d O;
    public z P;
    public final ArrayList Q;
    public final o9.b R;
    public w9.b S;
    public float T;
    public final Rect U;
    public final PointF V;
    public final PointF W;

    /* renamed from: a0, reason: collision with root package name */
    public final PointF f21128a0;

    /* renamed from: b0, reason: collision with root package name */
    public float f21129b0;

    /* renamed from: c0, reason: collision with root package name */
    public final v6 f21130c0;

    /* renamed from: d0, reason: collision with root package name */
    public i0 f21131d0;

    /* renamed from: e0, reason: collision with root package name */
    public g f21132e0;

    public FolderIcon(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.K = new y();
        this.L = true;
        this.P = new z(0.0f, 0.0f, 0.0f);
        this.Q = new ArrayList();
        this.R = new o9.b();
        this.S = new w9.b();
        this.U = new Rect();
        this.V = new PointF(0.0f, 0.0f);
        this.W = new PointF(0.0f, 0.0f);
        this.f21128a0 = new PointF(0.0f, 0.0f);
        this.f21129b0 = 1.0f;
        this.f21130c0 = new v6(this, 27);
        this.f21132e0 = null;
        this.J = this;
        i0 i0Var = (i0) y2.f51877a.i0().l();
        this.f21131d0 = i0Var;
        this.N = i0Var.f51586b.a(i0Var.f51591g);
        this.O = new nz.d(this);
        e eVar = this.f20879r;
        int i5 = this.K.f96981h;
        eVar.f77307a = i5;
        eVar.f77310d = i5;
        eVar.f77311e = i5;
    }

    public static BitmapInfo a0(Context context) throws XmlPullParserException, Resources.NotFoundException, IOException {
        BitmapInfo bitmapInfoD;
        g0 g0VarW = g0.w(context);
        y2 y2Var = y2.f51877a;
        fz.d dVarG = ((i0) y2Var.i0().l()).g();
        fz.d dVar = fz.d.f56197t;
        if (dVarG == dVar) {
            int color = context.getColor(2131099682);
            a aVar = new a(new ColorDrawable(color), new ColorDrawable(color), (fz.d) y2Var.i().l());
            aVar.m(dVar);
            LayerDrawable layerDrawable = new LayerDrawable(new Drawable[]{aVar, new InsetDrawable(context.getDrawable(2131231828), 0.1f)});
            int iD0 = y2Var.D0(context.getResources());
            bitmapInfoD = BitmapInfo.a(z2.A(layerDrawable, iD0, iD0));
        } else {
            a aVarF = a.f(context.getResources(), 2131231011, context.getTheme());
            aVarF.m(dVarG);
            bitmapInfoD = g0VarW.d(aVarF, Process.myUserHandle(), true);
        }
        g0VarW.D();
        return bitmapInfoD;
    }

    public static FolderIcon c0(int i5, n1 n1Var, ViewGroup viewGroup, c cVar) {
        Folder folderG1;
        if (cVar instanceof iz.a) {
            folderG1 = ((NovaLauncher) n1Var).g1(cVar.T0());
        } else {
            Rect rect = Folder.f21093j0;
            folderG1 = (Folder) LayoutInflater.from(n1Var).cloneInContext(n1Var).inflate(2131624443, (ViewGroup) null);
        }
        folderG1.f21114l = n1Var.Q;
        FolderIcon folderIcon = (FolderIcon) LayoutInflater.from(viewGroup != null ? viewGroup.getContext() : n1Var).inflate(i5, viewGroup, false);
        folderIcon.setTag(cVar);
        folderIcon.setOnClickListener(ua.g.f90762b);
        folderIcon.I = cVar;
        folderIcon.k0();
        folderIcon.G = n1Var;
        if (cVar != null) {
            folderIcon.J.setText(cVar.f57300l);
            folderIcon.setContentDescription(folderIcon.Z(cVar.f57300l));
        }
        w9.b bVar = new w9.b();
        if (cVar != null) {
            Iterator<E> it = cVar.H.iterator();
            while (it.hasNext()) {
                bVar.d(n1Var.f80005f0.m((j) it.next()));
            }
        }
        folderIcon.i0(bVar);
        NovaLauncher novaLauncher = (NovaLauncher) n1Var;
        folderIcon.f20879r.f77314h = novaLauncher.C().f90110m;
        folderIcon.setAccessibilityDelegate(novaLauncher.f80004e0);
        if (cVar != null) {
            cVar.H.f68416a.add(folderIcon);
        }
        folderIcon.W(novaLauncher);
        folderG1.k0(folderIcon);
        if (cVar != null) {
            folderG1.V(cVar);
        }
        folderIcon.j0(folderG1);
        return folderIcon;
    }

    @Override // com.android.launcher3.BubbleTextView
    public final void C(Canvas canvas) {
    }

    @Override // ga.b
    public final void D(List list) {
        n0(false);
        boolean zE = this.S.e();
        Stream stream = list.stream();
        d dVar = this.G;
        Objects.requireNonNull(dVar);
        Stream map = stream.map(new com.google.firebase.crashlytics.internal.persistence.d(dVar, 9));
        w9.b bVar = this.S;
        Objects.requireNonNull(bVar);
        map.forEach(new w(bVar, 12));
        l0(zE, this.S.e());
        setContentDescription(Z(this.I.f57300l));
        invalidate();
    }

    @Override // com.android.launcher3.BubbleTextView
    public final w9.a F() {
        return this.S;
    }

    @Override // com.android.launcher3.BubbleTextView
    public final float G() {
        return this.T;
    }

    @Override // com.android.launcher3.BubbleTextView
    public final boolean J() {
        w9.b bVar = this.S;
        return bVar != null && bVar.e();
    }

    @Override // com.android.launcher3.BubbleTextView
    public final void L(float f11) {
        this.T = f11;
        invalidate();
    }

    @Override // com.android.launcher3.BubbleTextView
    public final boolean Q(float f11, float f12) {
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int width = getWidth() - getPaddingRight();
        int height = getHeight() - getPaddingBottom();
        this.U.set(paddingLeft, paddingTop, width, height);
        return !r4.contains((int) f11, (int) f12);
    }

    @Override // com.android.launcher3.BubbleTextView
    public final void U() {
    }

    public final void X(iz.a aVar) {
        c cVar = this.I;
        if (cVar != null) {
            cVar.a1(this);
            this.I.a1(this.H);
        }
        this.J.setText(aVar.f57300l);
        setTag(aVar);
        setOnClickListener(ua.g.f90762b);
        this.I = aVar;
        setContentDescription(Z(aVar.f57300l));
        Folder folderG1 = ((NovaLauncher) this.G).g1(aVar.T0());
        this.H = folderG1;
        j0(folderG1);
        aVar.H.f68416a.add(this);
        g0();
        k0();
    }

    public final void Y() {
        if ((getLayoutParams() instanceof v) && (getParent() instanceof r)) {
            b3 b3Var = (b3) ((r) getParent());
            b3Var.getClass();
            v vVar = (v) getLayoutParams();
            vVar.f80185i = false;
            if (b3Var.f79776c == 1) {
                CellLayout cellLayout = (CellLayout) b3Var.getParent();
                int i5 = vVar.f80177a;
                int i11 = vVar.f80178b;
                y yVar = cellLayout.f20911q;
                Context context = cellLayout.getContext();
                d dVar = cellLayout.f20891a;
                int measuredWidth = getMeasuredWidth();
                int paddingTop = getPaddingTop();
                yVar.getClass();
                j0 j0VarP = dVar.P();
                yVar.k(context, dVar, null, measuredWidth, paddingTop, j0VarP.M, j0VarP.N);
                y yVar2 = cellLayout.f20911q;
                yVar2.f80127a = i5;
                yVar2.f80128b = i11;
                cellLayout.invalidate();
            }
        }
    }

    public final String Z(CharSequence charSequence) {
        c cVar = this.I;
        if (cVar == null) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        int size = cVar.H.size();
        return size < this.N.b() ? getContext().getString(2132017898, charSequence, Integer.valueOf(size)) : getContext().getString(2132017899, charSequence, Integer.valueOf(this.N.b()));
    }

    @Override // com.android.launcher3.BubbleTextView, za.q
    public final void a(boolean z11) {
        this.f20869f.setAlpha(z11 ? 255 : 0);
        this.L = z11;
        invalidate();
    }

    @Override // com.android.launcher3.BubbleTextView, o9.v2
    public final float b() {
        return this.f21129b0;
    }

    public final List b0(int i5) {
        q qVar;
        c cVar = this.I;
        if (cVar == null || (qVar = this.M) == null) {
            return Collections.EMPTY_LIST;
        }
        qVar.d(cVar);
        return qVar.b(i5, this.I.H);
    }

    @Override // com.android.launcher3.BubbleTextView, o9.v2
    public final View c() {
        return this;
    }

    public final boolean d0() {
        return this.f20869f == f21127f0;
    }

    /* JADX WARN: Removed duplicated region for block: B:65:0x01bf  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0247  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x024a  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0252  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x028b  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0291  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x02a4  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x02b0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e0(ga.j r26, o9.l0 r27, android.graphics.Rect r28, float r29, int r30, boolean r31) {
        /*
            Method dump skipped, instructions count: 714
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.launcher3.folder.FolderIcon.e0(ga.j, o9.l0, android.graphics.Rect, float, int, boolean):void");
    }

    @Override // ga.b
    public final void f(j jVar, int i5) {
        n0(false);
        boolean zE = this.S.e();
        this.S.d(this.G.w(jVar));
        l0(zE, this.S.e());
        setContentDescription(Z(this.I.f57300l));
        invalidate();
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0026  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x002f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void f0(o9.l0 r9, boolean r10) {
        /*
            r8 = this;
            ga.e r0 = r9.f79955g
            boolean r1 = r0 instanceof ga.a
            if (r1 == 0) goto Le
            ga.a r0 = (ga.a) r0
            ga.j r0 = r0.O0()
        Lc:
            r2 = r0
            goto L20
        Le:
            o9.k0 r1 = r9.f79957i
            boolean r1 = r1 instanceof x9.b
            if (r1 == 0) goto L1d
            ga.j r1 = new ga.j
            ga.j r0 = (ga.j) r0
            r1.<init>(r0)
            r2 = r1
            goto L20
        L1d:
            ga.j r0 = (ga.j) r0
            goto Lc
        L20:
            com.android.launcher3.folder.Folder r0 = r8.H
            boolean r1 = r0.E
            if (r1 == 0) goto L29
            r1 = 1
            r0.H = r1
        L29:
            if (r10 == 0) goto L2f
            int r0 = r2.f57299k
        L2d:
            r6 = r0
            goto L36
        L2f:
            ga.c r0 = r8.I
            int r0 = r0.W0(r2)
            goto L2d
        L36:
            r4 = 0
            r5 = 1065353216(0x3f800000, float:1.0)
            r1 = r8
            r3 = r9
            r7 = r10
            r1.e0(r2, r3, r4, r5, r6, r7)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.launcher3.folder.FolderIcon.f0(o9.l0, boolean):void");
    }

    public final void g0() {
        c cVar = this.I;
        if (cVar == null) {
            return;
        }
        w9.b bVar = new w9.b();
        Iterator<E> it = cVar.H.iterator();
        while (it.hasNext()) {
            bVar.d(this.G.w((j) it.next()));
        }
        i0(bVar);
    }

    @Override // com.android.launcher3.BubbleTextView, o9.v2
    public final void h(float f11) {
        this.f21129b0 = f11;
        super.setScaleX(f11);
        super.setScaleY(f11);
    }

    public final void h0() {
        c cVar = this.I;
        if (cVar != null) {
            cVar.a1(this);
            this.I.a1(this.H);
        }
    }

    @Override // com.android.launcher3.BubbleTextView, o9.v2
    public final void i(float f11, float f12) {
        this.W.set(f11, f12);
        o0();
    }

    public final void i0(w9.b bVar) {
        boolean zE = this.S.e();
        this.S = bVar;
        l0(zE, bVar.e());
    }

    @Override // com.android.launcher3.BubbleTextView, o9.v2
    public final void j(float f11, float f12) {
        this.f21128a0.set(f11, f12);
        o0();
    }

    public final void j0(Folder folder) {
        this.H = folder;
        q qVar = new q(this.G.P(), this.N, folder.T.f51677a == p0.f51735c);
        this.M = qVar;
        qVar.d(this.I);
        n0(false);
    }

    public final void k0() {
        NamedIntent namedIntent;
        c cVar = this.I;
        if (cVar != null && cVar.f57304r != BitmapInfo.f21150d) {
            O(new n(cVar.f57304r));
            return;
        }
        O(f21127f0);
        if (cVar != null) {
            c cVar2 = this.I;
            if (cVar2.f57304r == BitmapInfo.f21150d && cVar2.f57303q.f() && (namedIntent = this.I.f57308v) != null && c0.c(namedIntent.f46369b) == c0.FIRST_ITEM_IN_FOLDER) {
                this.f21131d0 = i0.f();
                this.K.f96983j = 0;
            } else {
                this.f21131d0 = (i0) y2.f51877a.i0().l();
                y yVar = this.K;
                yVar.f96983j = Math.min(255, yVar.f96992u * 3);
            }
            i0 i0Var = this.f21131d0;
            this.N = i0Var.f51586b.a(i0Var.f51591g);
            this.O.f96871d = -1.0f;
            if (this.M != null) {
                this.M = new q(this.G.P(), this.N, this.H.T.f51677a == p0.f51735c);
                n0(false);
            }
            l0(this.S.e(), this.S.e());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x004f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void l0(boolean r7, boolean r8) {
        /*
            Method dump skipped, instructions count: 258
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.launcher3.folder.FolderIcon.l0(boolean, boolean):void");
    }

    @Override // com.android.launcher3.BubbleTextView, x9.p
    public final int m() {
        return 0;
    }

    public final void m0(Predicate predicate) throws XmlPullParserException, Resources.NotFoundException, NumberFormatException, IOException {
        nz.d dVar = this.O;
        Iterator it = dVar.f96875h.iterator();
        boolean z11 = false;
        while (it.hasNext()) {
            z zVar = (z) it.next();
            if (predicate.test(zVar.f97003h)) {
                dVar.j(zVar, zVar.f97003h, null);
                z11 = true;
            }
        }
        Iterator it2 = dVar.f96876i.iterator();
        while (it2.hasNext()) {
            z zVar2 = (z) it2.next();
            if (predicate.test(zVar2.f97003h)) {
                dVar.j(zVar2, zVar2.f97003h, null);
                z11 = true;
            }
        }
        if (z11) {
            dVar.f96869b.invalidate();
        }
    }

    public final void n0(boolean z11) {
        nz.d dVar = this.O;
        if (dVar.f96871d != -1.0f) {
            dVar.a(0, dVar.f96875h, z11);
        }
        ArrayList arrayList = this.Q;
        arrayList.clear();
        arrayList.addAll(b0(0));
    }

    @Override // com.android.launcher3.BubbleTextView, o9.v2
    public final void o(PointF pointF) {
        pointF.set(this.f21128a0);
    }

    public final void o0() {
        PointF pointF = this.W;
        float f11 = pointF.x;
        PointF pointF2 = this.f21128a0;
        float f12 = f11 + pointF2.x;
        PointF pointF3 = this.V;
        super.setTranslationX(f12 + pointF3.x + 0.0f);
        super.setTranslationY(pointF.y + pointF2.y + pointF3.y);
    }

    @Override // com.android.launcher3.BubbleTextView, android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        c cVar = this.I;
        if (cVar != null && cVar.f57289a == -1 && (cVar instanceof iz.a)) {
            cVar.H.f68416a.add(this);
            g0();
            invalidate();
        }
    }

    @Override // android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        c cVar = this.I;
        if (cVar != null && cVar.f57289a == -1 && (cVar instanceof iz.a)) {
            cVar.a1(this);
        }
    }

    @Override // com.android.launcher3.views.DoubleShadowBubbleTextView, com.android.launcher3.BubbleTextView, android.widget.TextView, android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.L && this.f20876m) {
            canvas.translate(getScrollX(), getScrollY());
            this.O.i();
            if (d0()) {
                y yVar = this.K;
                if (yVar.f96987p == null) {
                    yVar.b(canvas);
                }
                if (this.Q.isEmpty()) {
                    return;
                }
                int iSave = canvas.save();
                boolean z11 = this.f21131d0.b() && !(this.N instanceof f);
                if (!this.f21131d0.b()) {
                    y yVar2 = this.K;
                    if (yVar2.f96987p == null) {
                        yVar2.c(canvas);
                    }
                }
                if (z11 && this.O.f96879l) {
                    canvas.clipPath(this.K.e());
                }
                this.O.e(canvas, !z11);
                canvas.restoreToCount(iSave);
                if (this.f21131d0.b()) {
                    y yVar3 = this.K;
                    if (yVar3.f96987p == null) {
                        yVar3.c(canvas);
                    }
                }
            }
            if (this.f20881t) {
                return;
            }
            if (this.S.e() || this.T > 0.0f) {
                float fMax = Math.max(0.0f, this.T - ((this.K.f96978e - 1.0f) / 0.20000005f));
                e eVar = this.f20879r;
                eVar.f77309c = fMax;
                Rect rect = eVar.f77308b;
                H(this.f20875l, rect);
                g3.t(fz.r.f56352b, rect);
                canvas.translate(getScrollX(), getScrollY());
                if (!d0() || this.f21131d0 == i0.f()) {
                    if (this.f21132e0 == null) {
                        this.f21132e0 = (g) this.G.P().i(this.f20875l);
                    }
                    this.f21132e0.b(canvas, eVar);
                } else {
                    if (this.f20878q == null) {
                        j0 j0VarP = this.G.P();
                        int i5 = this.f20875l;
                        LinkedHashMap linkedHashMap = j0VarP.J0;
                        Object gVar = (k) linkedHashMap.get(Integer.valueOf(i5));
                        if (gVar == null) {
                            gVar = new g(i5, ((i0) y2.f51877a.i0().l()).g().e(), null, null, null, 120);
                            linkedHashMap.put(Integer.valueOf(i5), gVar);
                        }
                        this.f20878q = (g) gVar;
                    }
                    this.f20878q.b(canvas, eVar);
                }
                canvas.translate(-r0, -r2);
            }
        }
    }

    @Override // com.android.launcher3.BubbleTextView, o9.v2
    public final void p(PointF pointF) {
        pointF.set(this.W);
    }

    @Override // ga.b
    public final void s(boolean z11) {
        n0(z11);
        invalidate();
    }

    @Override // android.widget.TextView, android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        ArrayList arrayList = this.O.f96875h;
        for (int i5 = 0; i5 < arrayList.size(); i5++) {
            if (((z) arrayList.get(i5)).f97002g == drawable) {
                return true;
            }
        }
        return super.verifyDrawable(drawable);
    }

    @Override // com.android.launcher3.BubbleTextView
    public final void w(j jVar) {
        throw new IllegalStateException("FolderIcon cannot apply WorkspaceItemInfo");
    }

    @Override // com.android.launcher3.BubbleTextView
    public final void x(j jVar, boolean z11) {
        throw new IllegalStateException("FolderIcon cannot apply WorkspaceItemInfo");
    }
}
