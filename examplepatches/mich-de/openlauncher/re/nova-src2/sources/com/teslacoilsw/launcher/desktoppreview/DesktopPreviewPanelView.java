package com.teslacoilsw.launcher.desktoppreview;

import ab.e0;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Checkable;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Space;
import android.widget.TextView;
import b00.z0;
import bh.g;
import com.android.launcher3.Workspace;
import com.android.launcher3.views.OptionsPopupView;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.desktoppreview.DesktopPreviewPanelView;
import com.teslacoilsw.launcher.widget.PressedAlphaCheckedTextView;
import e10.s2;
import e10.y2;
import g30.a;
import g30.b;
import java.util.List;
import kl.q0;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.math.MathKt;
import l30.q;
import o9.k;
import o9.l2;
import o9.n1;
import o9.r0;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import ry.c;
import ry.d;
import v30.e;
import v9.l;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003¨\u0006\u0004"}, d2 = {"Lcom/teslacoilsw/launcher/desktoppreview/DesktopPreviewPanelView;", "Landroid/widget/FrameLayout;", "Lg30/a;", "Lo9/r0;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class DesktopPreviewPanelView extends FrameLayout implements a, r0 {

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ int f45723i = 0;

    /* renamed from: a, reason: collision with root package name */
    public final b f45724a;

    /* renamed from: b, reason: collision with root package name */
    public l f45725b;

    /* renamed from: c, reason: collision with root package name */
    public List f45726c;

    /* renamed from: d, reason: collision with root package name */
    public NovaLauncher f45727d;

    /* renamed from: e, reason: collision with root package name */
    public final z0 f45728e;

    /* renamed from: f, reason: collision with root package name */
    public final Paint f45729f;

    /* renamed from: g, reason: collision with root package name */
    public final Paint f45730g;

    /* renamed from: h, reason: collision with root package name */
    public final RectF f45731h;

    @JvmOverloads
    public DesktopPreviewPanelView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f45724a = (b) b.f57016l.h(context);
        this.f45728e = new z0(this, 20);
        Paint paint = new Paint(1);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OUT));
        paint.setColor(-1593835521);
        this.f45729f = paint;
        this.f45730g = new Paint(1);
        this.f45731h = new RectF();
    }

    @Override // g30.a
    public final void a(b bVar) {
        int color = getContext().getColor(2131100990);
        Context context = getContext();
        q0 q0Var = n1.C0;
        int iA = ((NovaLauncher) k.Y(getContext())).P.f21088w.a();
        l lVar = this.f45725b;
        if (lVar == null) {
            Intrinsics.m("binding");
            throw null;
        }
        Drawable drawable = lVar.f92441d.getCompoundDrawables()[1];
        int i5 = (drawable instanceof q ? (q) drawable : null) != null ? 149 : 255;
        l2.f79978s.getClass();
        int iN = e.n(bVar, -1, color, r4.a.n(iA, MathKt.b(255 * 0.3f)), -16777216);
        ColorStateList colorStateList = new ColorStateList(new int[][]{new int[]{16842919}, new int[0]}, new int[]{r4.a.n(iN, i5), iN});
        ColorStateList colorStateListValueOf = ColorStateList.valueOf(iN);
        l lVar2 = this.f45725b;
        if (lVar2 == null) {
            Intrinsics.m("binding");
            throw null;
        }
        PressedAlphaCheckedTextView pressedAlphaCheckedTextView = lVar2.f92439b;
        if (lVar2 == null) {
            Intrinsics.m("binding");
            throw null;
        }
        PressedAlphaCheckedTextView pressedAlphaCheckedTextView2 = lVar2.f92441d;
        if (lVar2 == null) {
            Intrinsics.m("binding");
            throw null;
        }
        PressedAlphaCheckedTextView[] pressedAlphaCheckedTextViewArr = {pressedAlphaCheckedTextView, pressedAlphaCheckedTextView2, lVar2.f92443f};
        for (int i11 = 0; i11 < 3; i11++) {
            PressedAlphaCheckedTextView pressedAlphaCheckedTextView3 = pressedAlphaCheckedTextViewArr[i11];
            pressedAlphaCheckedTextView3.setCompoundDrawableTintList(colorStateListValueOf);
            pressedAlphaCheckedTextView3.setTextColor(colorStateList);
        }
    }

    public final void b(Canvas canvas, TextView textView) {
        float fM = g.M(getContext(), 12);
        float fM2 = g.M(getContext(), 16);
        l lVar = this.f45725b;
        if (lVar == null) {
            Intrinsics.m("binding");
            throw null;
        }
        float left = textView.getLeft() + lVar.f92440c.getLeft();
        RectF rectF = this.f45731h;
        rectF.left = left;
        if (this.f45725b == null) {
            Intrinsics.m("binding");
            throw null;
        }
        rectF.top = textView.getTop() + r2.f92440c.getTop();
        rectF.right = rectF.left + textView.getWidth();
        rectF.bottom = textView.getTextSize() + rectF.top + textView.getCompoundDrawablePadding() + textView.getCompoundDrawables()[1].getBounds().height() + (textView.getPaddingTop() * 2) + g.M(getContext(), 8);
        rectF.inset(fM, fM);
        canvas.drawRoundRect(rectF, fM2, fM2, this.f45729f);
        Context context = getContext();
        q0 q0Var = n1.C0;
        int iA = ((NovaLauncher) k.Y(context)).P.f21088w.a();
        l2.f79978s.getClass();
        int iN = r4.a.n(iA, MathKt.b(255 * 0.3f));
        Paint paint = this.f45730g;
        paint.setColor(iN);
        paint.setAlpha(MathKt.b(paint.getAlpha() * 0.57f));
        canvas.drawRoundRect(rectF, fM2, fM2, paint);
    }

    public final void c(boolean z11) {
        if (z11) {
            l lVar = this.f45725b;
            if (lVar == null) {
                Intrinsics.m("binding");
                throw null;
            }
            lVar.f92440c.setOrientation(1);
            l lVar2 = this.f45725b;
            if (lVar2 == null) {
                Intrinsics.m("binding");
                throw null;
            }
            ViewGroup.LayoutParams layoutParams = lVar2.f92440c.getLayoutParams();
            Intrinsics.e(layoutParams, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams");
            FrameLayout.LayoutParams layoutParams2 = (FrameLayout.LayoutParams) layoutParams;
            layoutParams2.width = -2;
            layoutParams2.height = -1;
            layoutParams2.gravity = 8388611;
            l lVar3 = this.f45725b;
            if (lVar3 == null) {
                Intrinsics.m("binding");
                throw null;
            }
            ViewGroup.LayoutParams layoutParams3 = lVar3.f92443f.getLayoutParams();
            Intrinsics.e(layoutParams3, "null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams");
            LinearLayout.LayoutParams layoutParams4 = (LinearLayout.LayoutParams) layoutParams3;
            layoutParams4.width = -2;
            layoutParams4.height = -2;
            layoutParams4.weight = 0.0f;
            l lVar4 = this.f45725b;
            if (lVar4 == null) {
                Intrinsics.m("binding");
                throw null;
            }
            ViewGroup.LayoutParams layoutParams5 = lVar4.f92441d.getLayoutParams();
            Intrinsics.e(layoutParams5, "null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams");
            LinearLayout.LayoutParams layoutParams6 = (LinearLayout.LayoutParams) layoutParams5;
            layoutParams6.width = -2;
            layoutParams6.height = -2;
            layoutParams6.weight = 0.0f;
            l lVar5 = this.f45725b;
            if (lVar5 == null) {
                Intrinsics.m("binding");
                throw null;
            }
            ViewGroup.LayoutParams layoutParams7 = lVar5.f92442e.getLayoutParams();
            Intrinsics.e(layoutParams7, "null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams");
            LinearLayout.LayoutParams layoutParams8 = (LinearLayout.LayoutParams) layoutParams7;
            layoutParams8.width = -1;
            layoutParams8.height = 0;
            layoutParams8.weight = 1.0f;
            return;
        }
        l lVar6 = this.f45725b;
        if (lVar6 == null) {
            Intrinsics.m("binding");
            throw null;
        }
        lVar6.f92440c.setOrientation(0);
        l lVar7 = this.f45725b;
        if (lVar7 == null) {
            Intrinsics.m("binding");
            throw null;
        }
        ViewGroup.LayoutParams layoutParams9 = lVar7.f92440c.getLayoutParams();
        Intrinsics.e(layoutParams9, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams");
        FrameLayout.LayoutParams layoutParams10 = (FrameLayout.LayoutParams) layoutParams9;
        layoutParams10.width = g.M(getContext(), 256);
        layoutParams10.height = -2;
        layoutParams10.gravity = 81;
        l lVar8 = this.f45725b;
        if (lVar8 == null) {
            Intrinsics.m("binding");
            throw null;
        }
        ViewGroup.LayoutParams layoutParams11 = lVar8.f92443f.getLayoutParams();
        Intrinsics.e(layoutParams11, "null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams");
        LinearLayout.LayoutParams layoutParams12 = (LinearLayout.LayoutParams) layoutParams11;
        layoutParams12.width = 0;
        layoutParams12.height = -2;
        layoutParams12.weight = 1.0f;
        l lVar9 = this.f45725b;
        if (lVar9 == null) {
            Intrinsics.m("binding");
            throw null;
        }
        ViewGroup.LayoutParams layoutParams13 = lVar9.f92441d.getLayoutParams();
        Intrinsics.e(layoutParams13, "null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams");
        LinearLayout.LayoutParams layoutParams14 = (LinearLayout.LayoutParams) layoutParams13;
        layoutParams14.width = 0;
        layoutParams14.height = -2;
        layoutParams14.weight = 1.0f;
        l lVar10 = this.f45725b;
        if (lVar10 == null) {
            Intrinsics.m("binding");
            throw null;
        }
        ViewGroup.LayoutParams layoutParams15 = lVar10.f92442e.getLayoutParams();
        Intrinsics.e(layoutParams15, "null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams");
        LinearLayout.LayoutParams layoutParams16 = (LinearLayout.LayoutParams) layoutParams15;
        layoutParams16.width = 0;
        layoutParams16.height = 0;
        layoutParams16.weight = 0.0f;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        l lVar = this.f45725b;
        if (lVar == null) {
            Intrinsics.m("binding");
            throw null;
        }
        if (lVar.f92440c.getOrientation() == 1) {
            l lVar2 = this.f45725b;
            if (lVar2 == null) {
                Intrinsics.m("binding");
                throw null;
            }
            b(canvas, lVar2.f92443f);
            l lVar3 = this.f45725b;
            if (lVar3 == null) {
                Intrinsics.m("binding");
                throw null;
            }
            b(canvas, lVar3.f92441d);
        }
        super.dispatchDraw(canvas);
    }

    @Override // o9.r0
    public final void h(Rect rect) {
        Context context = getContext();
        q0 q0Var = n1.C0;
        NovaLauncher novaLauncher = (NovaLauncher) k.Y(context);
        l lVar = this.f45725b;
        if (lVar == null) {
            Intrinsics.m("binding");
            throw null;
        }
        PressedAlphaCheckedTextView pressedAlphaCheckedTextView = lVar.f92439b;
        pressedAlphaCheckedTextView.measure(0, 0);
        ViewGroup.LayoutParams layoutParams = pressedAlphaCheckedTextView.getLayoutParams();
        Intrinsics.e(layoutParams, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams");
        ((FrameLayout.LayoutParams) layoutParams).topMargin = (novaLauncher.getResources().getDimensionPixelSize(2131165419) + rect.top) - (pressedAlphaCheckedTextView.getMeasuredHeight() / 2);
        l lVar2 = this.f45725b;
        if (lVar2 == null) {
            Intrinsics.m("binding");
            throw null;
        }
        ViewGroup.LayoutParams layoutParams2 = lVar2.f92440c.getLayoutParams();
        Intrinsics.e(layoutParams2, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams");
        FrameLayout.LayoutParams layoutParams3 = (FrameLayout.LayoutParams) layoutParams2;
        if (!novaLauncher.f79934x.o()) {
            layoutParams3.bottomMargin = novaLauncher.getResources().getDimensionPixelSize(2131165420) + rect.bottom;
            l lVar3 = this.f45725b;
            if (lVar3 != null) {
                lVar3.f92440c.setLayoutParams(layoutParams3);
                return;
            } else {
                Intrinsics.m("binding");
                throw null;
            }
        }
        ry.e eVar = l2.f79978s;
        eVar.getClass();
        int dimensionPixelSize = novaLauncher.getResources().getDimensionPixelSize(2131165419) + novaLauncher.P.f20960a.top;
        int iB = MathKt.b((novaLauncher.f79934x.f77162q0.bottom * eVar.l(novaLauncher).f16154a) + ry.e.o(novaLauncher));
        layoutParams3.topMargin = dimensionPixelSize;
        layoutParams3.bottomMargin = Math.max(dimensionPixelSize, iB);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        b bVar = this.f45724a;
        bVar.f57018b.add(this);
        a(bVar);
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        Context context = getContext();
        q0 q0Var = n1.C0;
        c(configuration.orientation == 2 && ((NovaLauncher) k.Y(context)).f79934x.f77141f);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.f45724a.f57018b.remove(this);
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        int i5 = 2131427845;
        PressedAlphaCheckedTextView pressedAlphaCheckedTextView = (PressedAlphaCheckedTextView) e0.x(2131427845, this);
        if (pressedAlphaCheckedTextView != null) {
            i5 = 2131428509;
            LinearLayout linearLayout = (LinearLayout) e0.x(2131428509, this);
            if (linearLayout != null) {
                i5 = 2131428815;
                PressedAlphaCheckedTextView pressedAlphaCheckedTextView2 = (PressedAlphaCheckedTextView) e0.x(2131428815, this);
                if (pressedAlphaCheckedTextView2 != null) {
                    i5 = 2131428886;
                    Space space = (Space) e0.x(2131428886, this);
                    if (space != null) {
                        i5 = 2131429171;
                        PressedAlphaCheckedTextView pressedAlphaCheckedTextView3 = (PressedAlphaCheckedTextView) e0.x(2131429171, this);
                        if (pressedAlphaCheckedTextView3 != null) {
                            this.f45725b = new l(this, pressedAlphaCheckedTextView, linearLayout, pressedAlphaCheckedTextView2, space, pressedAlphaCheckedTextView3);
                            this.f45726c = ul.b.Q(pressedAlphaCheckedTextView, pressedAlphaCheckedTextView2, pressedAlphaCheckedTextView3);
                            l lVar = this.f45725b;
                            if (lVar == null) {
                                Intrinsics.m("binding");
                                throw null;
                            }
                            final int i11 = 1;
                            lVar.f92439b.setChecked(true);
                            l lVar2 = this.f45725b;
                            if (lVar2 == null) {
                                Intrinsics.m("binding");
                                throw null;
                            }
                            final int i12 = 0;
                            lVar2.f92439b.setOnClickListener(new View.OnClickListener(this) { // from class: ry.b

                                /* renamed from: b, reason: collision with root package name */
                                public final /* synthetic */ DesktopPreviewPanelView f86493b;

                                {
                                    this.f86493b = this;
                                }

                                /* JADX WARN: Multi-variable type inference failed */
                                @Override // android.view.View.OnClickListener
                                public final void onClick(View view) {
                                    int i13 = i12;
                                    DesktopPreviewPanelView desktopPreviewPanelView = this.f86493b;
                                    switch (i13) {
                                        case 0:
                                            int i14 = DesktopPreviewPanelView.f45723i;
                                            if (view.getAlpha() == 1.0f) {
                                                ((Checkable) view).setChecked(true);
                                                s2 s2VarT = y2.f51877a.t();
                                                Workspace workspace = ((NovaLauncher) k.Y(desktopPreviewPanelView.getContext())).O;
                                                s2VarT.h(Integer.valueOf(workspace.J(workspace.f80118t.g(workspace))));
                                                break;
                                            }
                                            break;
                                        default:
                                            int i15 = DesktopPreviewPanelView.f45723i;
                                            Context context = desktopPreviewPanelView.getContext();
                                            q0 q0Var = n1.C0;
                                            ((NovaLauncher) k.Y(context)).M.h(l2.f79974m);
                                            OptionsPopupView.s0(view);
                                            break;
                                    }
                                }
                            });
                            l lVar3 = this.f45725b;
                            if (lVar3 == null) {
                                Intrinsics.m("binding");
                                throw null;
                            }
                            lVar3.f92443f.setOnClickListener(new c(i12));
                            l lVar4 = this.f45725b;
                            if (lVar4 == null) {
                                Intrinsics.m("binding");
                                throw null;
                            }
                            lVar4.f92443f.setOnLongClickListener(new d(i12));
                            l lVar5 = this.f45725b;
                            if (lVar5 == null) {
                                Intrinsics.m("binding");
                                throw null;
                            }
                            lVar5.f92441d.setOnClickListener(new View.OnClickListener(this) { // from class: ry.b

                                /* renamed from: b, reason: collision with root package name */
                                public final /* synthetic */ DesktopPreviewPanelView f86493b;

                                {
                                    this.f86493b = this;
                                }

                                /* JADX WARN: Multi-variable type inference failed */
                                @Override // android.view.View.OnClickListener
                                public final void onClick(View view) {
                                    int i13 = i11;
                                    DesktopPreviewPanelView desktopPreviewPanelView = this.f86493b;
                                    switch (i13) {
                                        case 0:
                                            int i14 = DesktopPreviewPanelView.f45723i;
                                            if (view.getAlpha() == 1.0f) {
                                                ((Checkable) view).setChecked(true);
                                                s2 s2VarT = y2.f51877a.t();
                                                Workspace workspace = ((NovaLauncher) k.Y(desktopPreviewPanelView.getContext())).O;
                                                s2VarT.h(Integer.valueOf(workspace.J(workspace.f80118t.g(workspace))));
                                                break;
                                            }
                                            break;
                                        default:
                                            int i15 = DesktopPreviewPanelView.f45723i;
                                            Context context = desktopPreviewPanelView.getContext();
                                            q0 q0Var = n1.C0;
                                            ((NovaLauncher) k.Y(context)).M.h(l2.f79974m);
                                            OptionsPopupView.s0(view);
                                            break;
                                    }
                                }
                            });
                            l lVar6 = this.f45725b;
                            if (lVar6 == null) {
                                Intrinsics.m("binding");
                                throw null;
                            }
                            lVar6.f92441d.setOnLongClickListener(new d(i11));
                            Context context = getContext();
                            q0 q0Var = n1.C0;
                            NovaLauncher novaLauncher = (NovaLauncher) k.Y(context);
                            this.f45727d = novaLauncher;
                            if (novaLauncher != null) {
                                c(novaLauncher.f79934x.o());
                                return;
                            } else {
                                Intrinsics.m("launcher");
                                throw null;
                            }
                        }
                    }
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(getResources().getResourceName(i5)));
    }
}
