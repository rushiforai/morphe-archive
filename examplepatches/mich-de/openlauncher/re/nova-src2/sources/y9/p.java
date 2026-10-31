package y9;

import a5.h1;
import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.util.Property;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import b00.b1;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.CellLayout;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.android.launcher3.folder.Folder;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.folder.FolderPagedView;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.pageindicators.PageIndicatorDots;
import com.google.android.gms.internal.measurement.v6;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.p0;
import e10.y2;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import o9.b3;
import o9.g3;
import o9.l2;
import o9.n1;
import o9.p1;

/* loaded from: classes2.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final Folder f96930a;

    /* renamed from: b, reason: collision with root package name */
    public final FolderPagedView f96931b;

    /* renamed from: c, reason: collision with root package name */
    public final GradientDrawable f96932c;

    /* renamed from: d, reason: collision with root package name */
    public final FolderIcon f96933d;

    /* renamed from: e, reason: collision with root package name */
    public final y f96934e;

    /* renamed from: f, reason: collision with root package name */
    public final Context f96935f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f96936g;

    /* renamed from: h, reason: collision with root package name */
    public final int f96937h;

    /* renamed from: i, reason: collision with root package name */
    public final int f96938i;

    /* renamed from: j, reason: collision with root package name */
    public final Interpolator f96939j;

    /* renamed from: k, reason: collision with root package name */
    public final z f96940k = new z(0.0f, 0.0f, 0.0f);

    /* renamed from: l, reason: collision with root package name */
    public final q f96941l;

    /* renamed from: m, reason: collision with root package name */
    public ObjectAnimator f96942m;

    public p(Folder folder, boolean z11) {
        this.f96930a = folder;
        FolderPagedView folderPagedView = folder.f21117q;
        this.f96931b = folderPagedView;
        this.f96932c = folder.P;
        FolderIcon folderIcon = folder.f21116p;
        this.f96933d = folderIcon;
        this.f96934e = folderIcon.K;
        Context context = folder.getContext();
        this.f96935f = context;
        this.f96941l = new q(folder.f21113k.P(), folderIcon.N, folder.T.f51677a == p0.f51735c);
        this.f96936g = z11;
        Resources resources = folderPagedView.getResources();
        this.f96937h = resources.getInteger(2131492877);
        this.f96938i = resources.getInteger(2131492876);
        if (folderIcon.d0()) {
            this.f96939j = AnimationUtils.loadInterpolator(context, 2131558409);
        } else {
            this.f96939j = z11 ? s9.k.f86792e : s9.k.f86789b;
        }
    }

    public static void d(AnimatorSet animatorSet, Animator animator, long j11, int i5) {
        animator.setStartDelay(j11);
        animator.setDuration(i5);
        animatorSet.play(animator);
    }

    public final AnimatorSet a() {
        float fI;
        float f11;
        float f12;
        int iF;
        int iG;
        int i5;
        int i11;
        int i12;
        float f13;
        int i13;
        boolean z11;
        float f14;
        boolean z12;
        float f15;
        CellLayout cellLayout;
        boolean z13;
        Interpolator interpolator;
        q qVar;
        List listB;
        Folder folder;
        boolean z14;
        final List list;
        nz.c cVar;
        int i14;
        final p pVar;
        Folder folderF0;
        ValueAnimator valueAnimatorOfFloat;
        ra.a aVar;
        float f16;
        int i15;
        int i16;
        Iterator it;
        p pVar2 = this;
        Folder folder2 = pVar2.f96930a;
        za.d dVar = folder2.f21113k;
        za.h hVar = (za.h) folder2.getLayoutParams();
        FolderIcon folderIcon = pVar2.f96933d;
        folderIcon.O.i();
        nz.c cVar2 = folderIcon.N;
        ga.c cVar3 = folder2.f21115m;
        q qVar2 = pVar2.f96941l;
        qVar2.d(cVar3);
        ArrayList arrayListB = qVar2.b(0, folder2.d0());
        Rect rect = new Rect();
        if (folderIcon.getParent() == null) {
            dVar.u().i(folder2, rect);
            int width = folderIcon.getWidth();
            int height = folderIcon.getHeight();
            if (rect.left != 0 || rect.top != 0 || rect.right != 0 || rect.bottom != 0) {
                int i17 = width / 2;
                int i18 = height / 2;
                rect.set(rect.centerX() - i17, rect.centerY() - i18, rect.centerX() + i17, rect.centerY() + i18);
            }
            fI = 0.5f;
        } else {
            fI = dVar.u().i(folderIcon, rect);
            rect.offset(-((int) folderIcon.getTranslationX()), -((int) folderIcon.getTranslationY()));
        }
        float f17 = fI;
        y yVar = pVar2.f96934e;
        int iH = yVar.h();
        float f18 = iH * 2 * f17;
        float fG = cVar2.g() * cVar2.h(1, arrayListB.size());
        int i19 = 1;
        float f19 = ((folder2.T.f51682f || arrayListB.size() > 2) ? 1.0f : 1.5f) * fG;
        if (arrayListB.isEmpty()) {
            f12 = fG;
            f11 = 1.0f;
        } else {
            f11 = 1.0f;
            f12 = ((BubbleTextView) arrayListB.get(0)).f20875l;
        }
        float f21 = (f19 / f12) * f17;
        boolean z15 = pVar2.f96936g;
        float f22 = z15 ? f21 : f11;
        folder2.setPivotX(0.0f);
        folder2.setPivotY(0.0f);
        folder2.c0().setScaleX(f22);
        folder2.c0().setScaleY(f22);
        folder2.c0().setPivotX(0.0f);
        folder2.c0().setPivotY(0.0f);
        folder2.f21120t.setScaleX(f22);
        folder2.f21120t.setScaleY(f22);
        folder2.f21120t.setPivotX(0.0f);
        folder2.f21120t.setPivotY(0.0f);
        int i21 = (int) (fG / 2.0f);
        Context context = pVar2.f96935f;
        if (g3.p(context.getResources())) {
            i21 = (int) (((((FrameLayout.LayoutParams) hVar).width * f21) - f18) - i21);
        }
        FolderPagedView folderPagedView = pVar2.f96931b;
        int paddingLeft = (int) (folderPagedView.getPaddingLeft() * f21);
        int paddingTop = (int) (folderPagedView.getPaddingTop() * f21);
        int i22 = rect.left;
        if (i22 == 0 && rect.top == 0 && rect.right == 0 && rect.bottom == 0) {
            int i23 = hVar.f98431b;
            iG = hVar.f98432c;
            iF = i23;
        } else {
            iF = ((yVar.f() + (folder2.getPaddingLeft() + i22)) - paddingLeft) - i21;
            iG = (yVar.g() + (folder2.getPaddingTop() + rect.top)) - paddingTop;
        }
        float f23 = iF - hVar.f98431b;
        float f24 = iG - hVar.f98432c;
        int i24 = i21;
        int iD = yVar.d();
        int i25 = folder2.f21109h0;
        GradientDrawable gradientDrawable = pVar2.f96932c;
        gradientDrawable.mutate();
        gradientDrawable.setColor(z15 ? iD : i25);
        int i26 = paddingLeft + i24;
        Rect rect2 = new Rect(i26, paddingTop, Math.round(i26 + f18), Math.round(paddingTop + f18));
        Rect rect3 = new Rect(0, 0, ((FrameLayout.LayoutParams) hVar).width, ((FrameLayout.LayoutParams) hVar).height);
        float cornerRadius = gradientDrawable.getCornerRadius();
        AnimatorSet animatorSet = new AnimatorSet();
        aa.l lVar = BubbleTextView.A;
        Float fValueOf = Float.valueOf(f11);
        h1 h1Var = new h1();
        h1Var.f294c = lVar;
        h1Var.f293b = fValueOf;
        int i27 = folder2.f21117q.f80106f;
        ArrayList arrayListD0 = folder2.d0();
        int childCount = folder2.f21117q.getChildCount() - 1;
        int size = arrayListD0.size();
        int i28 = folder2.f21117q.W.f96946d;
        int i29 = i27 == childCount ? size - (i28 * i27) : i28;
        int i31 = i27 * i28;
        ArrayList arrayList = new ArrayList(i29);
        int i32 = i31;
        for (int iMin = Math.min(i31 + i29, arrayListD0.size()); i32 < iMin; iMin = iMin) {
            arrayList.add((BubbleTextView) arrayListD0.get(i32));
            i32++;
        }
        Iterator it2 = arrayList.iterator();
        BitmapInfo bitmapInfoA0 = null;
        while (true) {
            boolean zHasNext = it2.hasNext();
            i5 = pVar2.f96937h;
            if (!zHasNext) {
                break;
            }
            BubbleTextView bubbleTextView = (BubbleTextView) it2.next();
            if (z15) {
                bubbleTextView.getClass();
                it = it2;
                bubbleTextView.P(0.0f);
            } else {
                it = it2;
            }
            float f25 = (bubbleTextView.R() && z15) ? f11 : 0.0f;
            aa.l lVar2 = BubbleTextView.A;
            BitmapInfo bitmapInfo = bitmapInfoA0;
            int i33 = i19;
            float f26 = f24;
            float[] fArr = new float[i33];
            fArr[0] = f25;
            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(bubbleTextView, lVar2, fArr);
            objectAnimatorOfFloat.addListener(h1Var);
            Folder folder3 = folder2;
            d(animatorSet, objectAnimatorOfFloat, objectAnimatorOfFloat.getStartDelay(), i5);
            if (!z15 && folderIcon.d0() && (bubbleTextView instanceof FolderIcon) && ((FolderIcon) bubbleTextView).d0() && arrayListB.contains(bubbleTextView)) {
                bitmapInfoA0 = bitmapInfo == null ? FolderIcon.a0(context) : bitmapInfo;
                objectAnimatorOfFloat.addListener(new h1(6, bubbleTextView, bitmapInfoA0));
            } else {
                bitmapInfoA0 = bitmapInfo;
            }
            folder2 = folder3;
            f24 = f26;
            it2 = it;
            i19 = 1;
        }
        float f27 = f24;
        folder2.setAnimationStrokeColor(0);
        folder2.f21097b0.setStrokeWidth(yVar.f96982i);
        int iD2 = yVar.f96994w ? aa.p.d(yVar.f96980g, yVar.f96983j) : 0;
        boolean z16 = cVar2 instanceof nz.f;
        if (!z16) {
            if (folder2.T.d()) {
                int iN = r4.a.n(iD2, 0);
                pVar2.c(animatorSet, z15 ? ObjectAnimator.ofArgb(folder2, "animationStrokeColor", iD2, iN) : ObjectAnimator.ofArgb(folder2, "animationStrokeColor", iN, iD2));
            } else {
                int iN2 = r4.a.n(iD2, 0);
                d(animatorSet, z15 ? ObjectAnimator.ofArgb(folder2, "animationStrokeColor", iD2, iN2) : ObjectAnimator.ofArgb(folder2, "animationStrokeColor", iN2, iD2), z15 ? 0L : i5 / 2, i5 / 2);
            }
        }
        if (folder2.T.f51677a == p0.f51735c) {
            pVar2.c(animatorSet, z15 ? ObjectAnimator.ofFloat(folder2, "immersiveAlpha", 0.0f, 1.0f) : ObjectAnimator.ofFloat(folder2, "immersiveAlpha", 1.0f, 0.0f));
        }
        ObjectAnimator objectAnimatorOfArgb = z15 ? ObjectAnimator.ofArgb(gradientDrawable, "color", iD, i25) : ObjectAnimator.ofArgb(gradientDrawable, "color", i25, iD);
        pVar2.f96942m = objectAnimatorOfArgb;
        objectAnimatorOfArgb.addUpdateListener(new b1(pVar2, 10));
        pVar2.c(animatorSet, pVar2.f96942m);
        pVar2.c(animatorSet, pVar2.b(folder2, View.TRANSLATION_X, f23, 0.0f));
        Property property = View.TRANSLATION_Y;
        pVar2.c(animatorSet, pVar2.b(folder2, property, f27, 0.0f));
        ViewGroup viewGroupC0 = folder2.c0();
        ca.c cVar4 = p1.f80062a;
        float f28 = f11;
        pVar2.c(animatorSet, pVar2.b(viewGroupC0, cVar4, f21, f28));
        pVar2.c(animatorSet, pVar2.b(folder2.f21120t, cVar4, f21, f28));
        FolderIcon folderIcon2 = folderIcon;
        if (folder2.e0() <= folderIcon2.N.b()) {
            i11 = i5;
            i12 = 0;
        } else if (z15) {
            i12 = i5 - 128;
            i11 = 128;
        } else {
            i12 = 0;
            i11 = 0;
        }
        View view = folder2.f21120t;
        Property property2 = View.ALPHA;
        d(animatorSet, pVar2.b(view, property2, 0.0f, 1.0f), i12, i11);
        if (z16) {
            f13 = f21;
            i13 = i25;
            z11 = z15;
            f14 = 1.0f;
            z12 = true;
            pVar2.c(animatorSet, fz.d.n.f56204a.c(folder2, rect2, rect3, cornerRadius, !z15, true));
        } else {
            f13 = f21;
            i13 = i25;
            z11 = z15;
            f14 = 1.0f;
            z12 = true;
            pVar2.c(animatorSet, folderIcon2.K.f96993v.f56204a.c(folder2, rect2, rect3, cornerRadius, !z11, !folderIcon2.f21131d0.b()));
        }
        folder2.f21118r.setAlpha(z11 ? 0.0f : f14);
        d(animatorSet, pVar2.b(folder2.f21118r, property2, 0.0f, f14), z11 ? 32L : 0L, z11 ? i5 - 32 : 32);
        if (!folderIcon2.f21131d0.b()) {
            View viewFindViewById = folder2.findViewById(2131428077);
            viewFindViewById.setAlpha(z11 ? 0.0f : f14);
            d(animatorSet, pVar2.b(viewFindViewById, property2, 0.0f, f14), z11 ? 32L : 0L, z11 ? i5 - 32 : 32);
            PageIndicatorDots pageIndicatorDots = folder2.f21119s;
            pageIndicatorDots.setAlpha(z11 ? 0.0f : f14);
            d(animatorSet, pVar2.b(pageIndicatorDots, property2, 0.0f, f14), z11 ? 32L : 0L, z11 ? i5 - 32 : 32);
        }
        if (folderIcon2.getParent() != null || z11) {
            f15 = 0.0f;
        } else {
            f15 = 0.0f;
            pVar2.c(animatorSet, pVar2.b(folder2, property2, 0.0f, f14));
        }
        float fB0 = folder2.b0();
        pVar2.c(animatorSet, pVar2.b(folder2.f21120t, property, -(fB0 - (fB0 * f13)), f15));
        if (z11 && Color.alpha(i13) >= 255) {
            if (z11) {
                i15 = i5 / 2;
                i16 = i15;
            } else {
                i15 = i5 / 6;
                i16 = 0;
            }
            d(animatorSet, pVar2.b(folder2, View.TRANSLATION_Z, -folder2.getElevation(), 0.0f), i16, i15);
        }
        CellLayout cellLayoutA0 = folderPagedView.A0();
        if (cellLayoutA0 == null) {
            int i34 = folderPagedView.f80106f;
            folderPagedView.g0(0);
            CellLayout cellLayoutA02 = folderPagedView.A0();
            if (cellLayoutA02 == null) {
                throw new IllegalStateException("Trying to open folder with " + folderPagedView.getChildCount() + " could not access page " + i34 + " or page 0. Folder has " + folder2.f21115m.H.size() + " items");
            }
            cellLayout = cellLayoutA02;
        } else {
            cellLayout = cellLayoutA0;
        }
        boolean clipChildren = folder2.getClipChildren();
        boolean clipToPadding = folder2.getClipToPadding();
        boolean clipChildren2 = folderPagedView.getClipChildren();
        boolean clipToPadding2 = folderPagedView.getClipToPadding();
        boolean clipChildren3 = cellLayout.getClipChildren();
        boolean clipToPadding3 = cellLayout.getClipToPadding();
        if (folderIcon2.f21131d0.b()) {
            z13 = false;
            folder2.setClipChildren(false);
            folder2.setClipToPadding(false);
        } else {
            z13 = false;
        }
        folderPagedView.setClipChildren(z13);
        folderPagedView.setClipToPadding(z13);
        cellLayout.setClipChildren(z13);
        cellLayout.setClipToPadding(z13);
        Folder folder4 = folder2;
        animatorSet.addListener(new l(pVar2, clipChildren, clipToPadding, clipChildren2, clipToPadding2, cellLayout, clipChildren3, clipToPadding3));
        Iterator<Animator> it3 = animatorSet.getChildAnimations().iterator();
        while (true) {
            boolean zHasNext2 = it3.hasNext();
            interpolator = pVar2.f96939j;
            if (!zHasNext2) {
                break;
            }
            it3.next().setInterpolator(interpolator);
        }
        int i35 = iH - (yVar.f96986m / 2);
        float f29 = f13 / f17;
        int i36 = i24 + i35;
        nz.c cVar5 = folderIcon2.N;
        int iB = cVar5.b();
        boolean z17 = folder4.f21117q.f80106f == 0 ? z12 : false;
        if (folderIcon2.d0()) {
            int i37 = z17 ? 0 : folder4.f21117q.f80106f;
            qVar = qVar2;
            qVar.d(folder4.f21115m);
            listB = qVar.b(i37, folder4.d0());
        } else {
            qVar = qVar2;
            listB = Collections.EMPTY_LIST;
        }
        int size2 = z17 ? listB.size() : iB;
        int iE0 = folder4.e0();
        Context context2 = context;
        TimeInterpolator timeInterpolatorD = cVar5.d(context2, z11, iE0, interpolator);
        b3 b3Var = ((CellLayout) folderPagedView.getChildAt(0)).P;
        q qVar3 = qVar;
        int i38 = 0;
        while (i38 < listB.size()) {
            BubbleTextView bubbleTextView2 = (BubbleTextView) listB.get(i38);
            Context context3 = context2;
            FolderIcon folderIcon3 = folderIcon2;
            ((o9.v) bubbleTextView2.getLayoutParams()).f80184h = z12;
            b3Var.e(bubbleTextView2);
            float fG2 = ((cVar5.g() * cVar5.h(i38, size2)) / ((BubbleTextView) listB.get(i38)).f20875l) / f29;
            List list2 = listB;
            float f31 = z11 ? fG2 : 1.0f;
            b3 b3Var2 = b3Var;
            bubbleTextView2.setPivotX(((ViewGroup.MarginLayoutParams) r13).width / 2.0f);
            bubbleTextView2.setPivotY((bubbleTextView2.f20875l / 2.0f) + bubbleTextView2.getPaddingTop());
            bubbleTextView2.setScaleX(f31);
            bubbleTextView2.setScaleY(f31);
            float fH = cVar5.h(i38, size2);
            z zVar = pVar2.f96940k;
            cVar5.e(i38, size2, zVar, fH);
            int i39 = i36;
            float fG3 = ((((cVar5.g() * zVar.f96999d) / 2.0f) + (zVar.f96997b + i36)) / f29) - ((((ViewGroup.MarginLayoutParams) r13).width / 2.0f) + r13.f80186j);
            float fG4 = ((((cVar5.g() * zVar.f96999d) / 2.0f) + (zVar.f96998c + i35)) / f29) - ((bubbleTextView2.f20875l / 2.0f) + (bubbleTextView2.getPaddingTop() + r13.f80187k));
            ObjectAnimator objectAnimatorB = pVar2.b(bubbleTextView2, View.TRANSLATION_X, fG3, 0.0f);
            objectAnimatorB.setInterpolator(timeInterpolatorD);
            int i40 = i38;
            int i41 = size2;
            d(animatorSet, objectAnimatorB, objectAnimatorB.getStartDelay(), i5);
            ObjectAnimator objectAnimatorB2 = pVar2.b(bubbleTextView2, View.TRANSLATION_Y, fG4, 0.0f);
            objectAnimatorB2.setInterpolator(timeInterpolatorD);
            int i42 = i35;
            d(animatorSet, objectAnimatorB2, objectAnimatorB2.getStartDelay(), i5);
            ObjectAnimator objectAnimatorB3 = pVar2.b(bubbleTextView2, p1.f80062a, fG2, 1.0f);
            objectAnimatorB3.setInterpolator(timeInterpolatorD);
            d(animatorSet, objectAnimatorB3, objectAnimatorB3.getStartDelay(), i5);
            if (folder4.e0() > iB) {
                int iF2 = cVar5.f(pVar2.f96938i, z11);
                f16 = fG3;
                if (z11) {
                    long j11 = iF2;
                    objectAnimatorB.setStartDelay(j11);
                    objectAnimatorB2.setStartDelay(j11);
                    objectAnimatorB3.setStartDelay(j11);
                }
                long j12 = iF2;
                objectAnimatorB.setDuration(objectAnimatorB.getDuration() - j12);
                objectAnimatorB2.setDuration(objectAnimatorB2.getDuration() - j12);
                objectAnimatorB3.setDuration(objectAnimatorB3.getDuration() - j12);
            } else {
                f16 = fG3;
            }
            size2 = i41;
            animatorSet.addListener(new m(this, bubbleTextView2, f16, fG4, fG2, cVar5, i40, size2));
            i38 = i40 + 1;
            z12 = true;
            pVar2 = this;
            iB = iB;
            listB = list2;
            timeInterpolatorD = timeInterpolatorD;
            folderIcon2 = folderIcon3;
            b3Var = b3Var2;
            i36 = i39;
            context2 = context3;
            i35 = i42;
        }
        TimeInterpolator timeInterpolator = timeInterpolatorD;
        FolderIcon folderIcon4 = folderIcon2;
        Context context4 = context2;
        b3 b3Var3 = b3Var;
        List list3 = listB;
        if (folderIcon4.d0() && folderIcon4.f21131d0.b() && !(cVar5 instanceof nz.f)) {
            pVar = this;
            list = list3;
            folder = folder4;
            cVar = cVar5;
            z14 = z11;
            i14 = i5;
        } else {
            final ArrayList arrayListD02 = folder4.d0();
            int i43 = folder4.f21117q.f80106f;
            int i44 = qVar3.f96948f * qVar3.f96949g;
            final int i45 = i44 * i43;
            final int iMin2 = Math.min(i44 + i45, arrayListD02.size());
            ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(100);
            folder4.S = !z11;
            if (z11) {
                for (int i46 = i45; i46 < iMin2; i46++) {
                    View view2 = (View) arrayListD02.get(i46);
                    if (!list3.contains(view2)) {
                        view2.setAlpha(0.0f);
                    }
                }
            }
            final Path path = new Path();
            final int[] iArr = new int[2];
            final int[] iArr2 = new int[2];
            final float fD = ((fz.d) y2.f51877a.i().l()).d();
            final NovaLauncher novaLauncher = (NovaLauncher) o9.k.Y(context4);
            folder = folder4;
            z14 = z11;
            list = list3;
            cVar = cVar5;
            i14 = i5;
            pVar = this;
            valueAnimatorOfInt.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: y9.k
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    boolean z18;
                    boolean z19;
                    p pVar3 = this.f96897a;
                    Folder folder5 = pVar3.f96930a;
                    Path path2 = folder5.f21125y;
                    if (path2 == null) {
                        return;
                    }
                    n1 n1Var = novaLauncher;
                    n1Var.P.j(folder5, iArr2);
                    List list4 = list;
                    Iterator it4 = list4.iterator();
                    while (true) {
                        if (!it4.hasNext()) {
                            z18 = true;
                            z19 = true;
                            break;
                        }
                        BubbleTextView bubbleTextView3 = (BubbleTextView) it4.next();
                        Path path3 = path;
                        path3.rewind();
                        n1Var.P.j(bubbleTextView3, iArr);
                        float f32 = bubbleTextView3.f20875l;
                        float f33 = fD;
                        z18 = true;
                        float f34 = (int) (f32 * f33);
                        path3.addRect((int) ((((bubbleTextView3.getMeasuredWidth() / 2.0f) + (r14[0] - r6[0])) - (f34 / 2.0f)) * folder5.c0().getScaleX()), (int) (folder5.c0().getScaleY() * a2.c.a(1.0f, f33, f34, bubbleTextView3.getPaddingTop() + (r14[1] - r6[1]))), r11 + r13, r8 + r13, Path.Direction.CW);
                        if (!path3.isEmpty()) {
                            path3.op(path2, Path.Op.DIFFERENCE);
                            if (!path3.isEmpty()) {
                                z19 = false;
                                break;
                            }
                        }
                    }
                    boolean z21 = pVar3.f96936g;
                    int i47 = i45;
                    int i48 = iMin2;
                    ArrayList arrayList2 = arrayListD02;
                    if (z21 && !folder5.S) {
                        if (z19) {
                            folder5.S = z18;
                            while (i47 < i48) {
                                View view3 = (View) arrayList2.get(i47);
                                if (!list4.contains(view3)) {
                                    view3.setAlpha(1.0f);
                                }
                                i47++;
                            }
                            return;
                        }
                        return;
                    }
                    if (z21 || !folder5.S || z19) {
                        return;
                    }
                    folder5.S = false;
                    while (i47 < i48) {
                        View view4 = (View) arrayList2.get(i47);
                        if (!list4.contains(view4)) {
                            view4.setAlpha(0.0f);
                        }
                        i47++;
                    }
                }
            });
            valueAnimatorOfInt.addListener(new n(pVar, i45, iMin2, arrayListD02));
            d(animatorSet, valueAnimatorOfInt, 0L, i14);
        }
        if (cVar instanceof nz.e) {
            View viewA = b3Var3.a(0, 1);
            BubbleTextView bubbleTextView3 = viewA instanceof BubbleTextView ? (BubbleTextView) viewA : null;
            if (bubbleTextView3 != null && !list.contains(bubbleTextView3)) {
                for (int i47 = 0; i47 < 3; i47++) {
                    View viewA2 = b3Var3.a(i47, 1);
                    if (!(viewA2 instanceof BubbleTextView) || list.contains(viewA2)) {
                        break;
                    }
                    BubbleTextView bubbleTextView4 = (BubbleTextView) viewA2;
                    float f32 = bubbleTextView4.f20875l / 4.0f;
                    ObjectAnimator objectAnimatorB4 = pVar.b(bubbleTextView4, View.TRANSLATION_Y, f32, 0.0f);
                    objectAnimatorB4.setInterpolator(timeInterpolator);
                    d(animatorSet, objectAnimatorB4, objectAnimatorB4.getStartDelay(), i14);
                    animatorSet.addListener(new o(pVar, bubbleTextView4, f32));
                }
            }
        }
        NovaLauncher novaLauncher2 = (NovaLauncher) o9.k.Y(context4);
        Folder folder5 = folder;
        if (folder5.W == null) {
            if (folder5.h0() && ((folderF0 = Folder.f0(novaLauncher2)) == null || folderF0 == folder5)) {
                AllAppsContainerView allAppsContainerView = novaLauncher2.V;
                d(animatorSet, pVar.b(allAppsContainerView, AllAppsContainerView.U, z14 ? allAppsContainerView.R : 0.0f, 1.0f), 0L, i14);
            }
            return animatorSet;
        }
        if (!folder5.T.d()) {
            novaLauncher2.P.f21088w.b(folder5.T.c());
        }
        Folder folderF02 = Folder.f0(novaLauncher2);
        if (folderF02 == null || folderF02 == folder5) {
            ra.f fVar = novaLauncher2.M;
            ra.a aVar2 = (ra.a) fVar.f85765g;
            if (aVar2 == l2.o || aVar2 == l2.f79978s) {
                float alpha = 1.0f - novaLauncher2.X.getAlpha();
                float[] fArr2 = {1.0f, 0.0f};
                if (z14) {
                    fArr2[0] = alpha;
                    fArr2[1] = 1.0f;
                    valueAnimatorOfFloat = ValueAnimator.ofFloat(fArr2);
                } else {
                    valueAnimatorOfFloat = ValueAnimator.ofFloat(fArr2);
                }
                valueAnimatorOfFloat.addUpdateListener(new b1(novaLauncher2, 11));
                d(animatorSet, valueAnimatorOfFloat, valueAnimatorOfFloat.getStartDelay(), i14);
            } else {
                if (z14) {
                    aVar = l2.f79979t;
                } else {
                    aVar = (novaLauncher2.Q.o() && ((Boolean) y2.f51877a.v1().l()).booleanValue()) ? l2.n : l2.f79974m;
                }
                sa.d dVar2 = new sa.d();
                s9.m mVar = new s9.m(dVar2.f87094a);
                ((v6) fVar.f85768j).getClass();
                for (ra.d dVar3 : ((n1) fVar.f85762d).M.f()) {
                    dVar3.e(aVar, dVar2, mVar);
                }
                AnimatorSet animatorSetF = mVar.f();
                animatorSetF.setInterpolator(z14 ? s9.k.f86797j : s9.k.f86788a);
                d(animatorSet, animatorSetF, animatorSetF.getStartDelay(), i14);
            }
        }
        if (z14) {
            ((LinearLayout) folder5.W.f82824b).setAlpha(0.0f);
        }
        int i48 = i14 / 3;
        LinearLayout linearLayout = (LinearLayout) folder5.W.f82824b;
        ObjectAnimator objectAnimatorB5 = pVar.b(linearLayout, View.ALPHA, 0.0f, z14 ? 1.0f : linearLayout.getAlpha());
        objectAnimatorB5.setInterpolator(s9.k.f86794g);
        objectAnimatorB5.addListener(new h1(pVar, novaLauncher2, false, 7));
        d(animatorSet, objectAnimatorB5, z14 ? i14 - i48 : 0L, i48);
        return animatorSet;
    }

    public final ObjectAnimator b(View view, Property property, float f11, float f12) {
        if (Float.isFinite(f11) && Float.isFinite(f12)) {
            return this.f96936g ? ObjectAnimator.ofFloat(view, (Property<View, Float>) property, f11, f12) : ObjectAnimator.ofFloat(view, (Property<View, Float>) property, f12, f11);
        }
        throw new IllegalArgumentException("float values must be finite " + f11 + " " + f12);
    }

    public final void c(AnimatorSet animatorSet, Animator animator) {
        d(animatorSet, animator, animator.getStartDelay(), this.f96937h);
    }
}
