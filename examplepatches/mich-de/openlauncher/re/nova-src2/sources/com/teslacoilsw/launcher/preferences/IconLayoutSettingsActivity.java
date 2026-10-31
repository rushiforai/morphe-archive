package com.teslacoilsw.launcher.preferences;

import aa.n;
import ab.e0;
import android.content.ComponentName;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.LightingColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Size;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import bu.l;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefColorView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefDisabledSegmentSeekBarView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPreviewLayout;
import com.teslacoilsw.launcher.widget.DisabledSegmentSeekBar;
import com.tiktok.util.TTConst;
import d00.t;
import dy.k;
import e10.a1;
import e10.b1;
import e10.d0;
import e10.n0;
import e10.p0;
import e10.s2;
import e10.y0;
import e10.y2;
import e10.z2;
import f10.q;
import fz.h0;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.math.MathKt;
import l7.a;
import lx.d;
import mx.f;
import mx.g;
import mx.g0;
import mx.j;
import mx.j0;
import o9.c2;
import o9.t1;
import o9.z0;
import tz.v;
import v30.e;
import v9.c;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/IconLayoutSettingsActivity;", "Lf10/q;", "Lv9/c;", "<init>", "()V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class IconLayoutSettingsActivity extends q {
    public static final /* synthetic */ int B = 0;
    public final Paint A;

    /* renamed from: t, reason: collision with root package name */
    public final Object f45957t;

    /* renamed from: u, reason: collision with root package name */
    public f f45958u;

    /* renamed from: v, reason: collision with root package name */
    public float f45959v;

    /* renamed from: w, reason: collision with root package name */
    public String f45960w;

    /* renamed from: x, reason: collision with root package name */
    public s2 f45961x;

    /* renamed from: y, reason: collision with root package name */
    public v f45962y;

    /* renamed from: z, reason: collision with root package name */
    public g f45963z;

    public IconLayoutSettingsActivity() {
        t tVar = new t(this, 13);
        k kVar = d.f75158a;
        this.f45957t = LazyKt.b(LazyThreadSafetyMode.f71681c, tVar);
        this.f45959v = 10.0f;
        this.f45960w = b.f42142b;
        this.A = new Paint();
    }

    public static /* synthetic */ void c0(IconLayoutSettingsActivity iconLayoutSettingsActivity) throws Throwable {
        Unit unit = Unit.f71706a;
        iconLayoutSettingsActivity.b0();
    }

    @Override // f10.q
    public final a a0() {
        View viewInflate = getLayoutInflater().inflate(2131623972, (ViewGroup) null, false);
        int i5 = 2131427531;
        ImageView imageView = (ImageView) e0.x(2131427531, viewInflate);
        if (imageView != null) {
            i5 = 2131428146;
            TextView textView = (TextView) e0.x(2131428146, viewInflate);
            if (textView != null) {
                i5 = 2131428210;
                FancyPrefDisabledSegmentSeekBarView fancyPrefDisabledSegmentSeekBarView = (FancyPrefDisabledSegmentSeekBarView) e0.x(2131428210, viewInflate);
                if (fancyPrefDisabledSegmentSeekBarView != null) {
                    i5 = 2131428211;
                    FancyPrefCheckableView fancyPrefCheckableView = (FancyPrefCheckableView) e0.x(2131428211, viewInflate);
                    if (fancyPrefCheckableView != null) {
                        i5 = 2131428249;
                        FancyPrefColorView fancyPrefColorView = (FancyPrefColorView) e0.x(2131428249, viewInflate);
                        if (fancyPrefColorView != null) {
                            i5 = 2131428250;
                            Spinner spinner = (Spinner) e0.x(2131428250, viewInflate);
                            if (spinner != null) {
                                i5 = 2131428251;
                                TextView textView2 = (TextView) e0.x(2131428251, viewInflate);
                                if (textView2 != null) {
                                    i5 = 2131428253;
                                    FancyPrefCheckableView fancyPrefCheckableView2 = (FancyPrefCheckableView) e0.x(2131428253, viewInflate);
                                    if (fancyPrefCheckableView2 != null) {
                                        i5 = 2131428254;
                                        FancyPrefCheckableView fancyPrefCheckableView3 = (FancyPrefCheckableView) e0.x(2131428254, viewInflate);
                                        if (fancyPrefCheckableView3 != null) {
                                            i5 = 2131428255;
                                            TextView textView3 = (TextView) e0.x(2131428255, viewInflate);
                                            if (textView3 != null) {
                                                i5 = 2131428256;
                                                SeekBar seekBar = (SeekBar) e0.x(2131428256, viewInflate);
                                                if (seekBar != null) {
                                                    i5 = 2131428257;
                                                    FancyPrefCheckableView fancyPrefCheckableView4 = (FancyPrefCheckableView) e0.x(2131428257, viewInflate);
                                                    if (fancyPrefCheckableView4 != null) {
                                                        i5 = 2131428303;
                                                        if (((ScrollView) e0.x(2131428303, viewInflate)) != null) {
                                                            i5 = 2131428626;
                                                            if (((RelativeLayout) e0.x(2131428626, viewInflate)) != null) {
                                                                i5 = 2131428632;
                                                                DoubleShadowBubbleTextView doubleShadowBubbleTextView = (DoubleShadowBubbleTextView) e0.x(2131428632, viewInflate);
                                                                if (doubleShadowBubbleTextView != null) {
                                                                    i5 = 2131428633;
                                                                    LinearLayout linearLayout = (LinearLayout) e0.x(2131428633, viewInflate);
                                                                    if (linearLayout != null) {
                                                                        i5 = 2131428875;
                                                                        View viewX = e0.x(2131428875, viewInflate);
                                                                        if (viewX != null) {
                                                                            return new c((FancyPreviewLayout) viewInflate, imageView, textView, fancyPrefDisabledSegmentSeekBarView, fancyPrefCheckableView, fancyPrefColorView, spinner, textView2, fancyPrefCheckableView2, fancyPrefCheckableView3, textView3, seekBar, fancyPrefCheckableView4, doubleShadowBubbleTextView, linearLayout, viewX);
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i5)));
    }

    /* JADX WARN: Removed duplicated region for block: B:105:0x031a  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x01aa  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x01ad  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x01b2  */
    /* JADX WARN: Type inference failed for: r6v1, types: [java.lang.Object, kotlin.Lazy] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b0() throws Throwable {
        Throwable th2;
        int i5;
        int i11;
        int iD;
        f fVar;
        boolean zIsChecked = ((c) Z()).f92291m.isChecked();
        ((c) Z()).f92285g.setEnabled(zIsChecked);
        ((c) Z()).f92290l.setEnabled(zIsChecked);
        ((c) Z()).f92284f.setEnabled(zIsChecked);
        ((c) Z()).f92287i.setEnabled(zIsChecked);
        ((c) Z()).f92288j.setEnabled(zIsChecked);
        ((c) Z()).f92289k.setEnabled(zIsChecked);
        ((c) Z()).f92286h.setEnabled(zIsChecked);
        int iE = 1;
        ((c) Z()).f92282d.setEnabled((((c) Z()).f92283e.getVisibility() == 0 && ((c) Z()).f92283e.isChecked()) ? false : true);
        int dimensionPixelSize = getResources().getDimensionPixelSize(2131165300);
        float fK = ((c) Z()).f92282d.K() / 100.0f;
        j jVar = new j(fK, ((c) Z()).f92291m.isChecked(), this.f45959v, ((c) Z()).f92287i.isChecked(), this.f45960w, ((c) Z()).f92288j.isChecked(), ((c) Z()).f92283e.isChecked(), 8);
        g gVar = this.f45963z;
        if (gVar == null) {
            Intrinsics.m(TTConst.TRACK_TYPE);
            throw null;
        }
        this.f45958u = new f(gVar, jVar, false);
        if (jVar.f77129g) {
            ((c) Z()).n.setText("Nova Settings");
        } else {
            ((c) Z()).n.setText("Nova\nSettings");
        }
        f fVar2 = this.f45958u;
        if (fVar2 == null) {
            Intrinsics.m("cellSpecs");
            throw null;
        }
        ?? r62 = this.f45957t;
        fVar2.b((DisplayMetrics) r62.getValue(), dimensionPixelSize, 1.0f);
        j0 j0VarP = P();
        Resources resources = getResources();
        g gVar2 = this.f45963z;
        if (gVar2 == null) {
            Intrinsics.m(TTConst.TRACK_TYPE);
            throw null;
        }
        f fVar3 = this.f45958u;
        if (fVar3 == null) {
            Intrinsics.m("cellSpecs");
            throw null;
        }
        int iOrdinal = gVar2.ordinal();
        if (iOrdinal != 0) {
            if (iOrdinal != 1) {
                if (iOrdinal == 2) {
                    th2 = null;
                    if (y2.f51877a.W().l() != d0.f51460c) {
                        iE = j0VarP.e();
                        iD = j0VarP.d();
                    }
                } else {
                    if (iOrdinal != 3) {
                        throw new NoWhenBranchMatchedException();
                    }
                    n0 n0Var = (n0) y2.f51877a.j0().l();
                    th2 = null;
                    if (n0Var.f51677a == p0.f51735c) {
                        i5 = n0Var.f51683g;
                        i11 = n0Var.f51684h;
                    } else {
                        iE = 2;
                    }
                }
                iD = iE;
            } else {
                th2 = null;
                iD = j0VarP.W;
            }
            Size sizeF = j0VarP.f(resources, gVar2);
            int i12 = j0VarP.f77170u0;
            float fMin = Math.min((sizeF.getWidth() / iD) / i12, io.sentry.config.a.z(fVar3, sizeF.getHeight() / iE, i12));
            float f11 = fMin >= fK ? fMin / fK : 1.0f;
            fVar = this.f45958u;
            if (fVar != null) {
                Intrinsics.m("cellSpecs");
                throw th2;
            }
            fVar.b((DisplayMetrics) r62.getValue(), dimensionPixelSize, f11);
            f fVar4 = this.f45958u;
            if (fVar4 == null) {
                Intrinsics.m("cellSpecs");
                throw th2;
            }
            v vVar = this.f45962y;
            if (vVar == null) {
                Intrinsics.m("surfaceScheme");
                throw th2;
            }
            fVar4.f77077j = vVar.f90179b;
            int iB = MathKt.b(fMin * 100);
            int i13 = ((c) Z()).f92282d.Q;
            if (iB > i13) {
                iB = i13;
            }
            FancyPrefDisabledSegmentSeekBarView fancyPrefDisabledSegmentSeekBarView = ((c) Z()).f92282d;
            int iT = x7.f.t((iB - fancyPrefDisabledSegmentSeekBarView.P) / fancyPrefDisabledSegmentSeekBarView.R);
            View view = (View) fancyPrefDisabledSegmentSeekBarView.K.f67327a;
            Intrinsics.e(view, "null cannot be cast to non-null type com.teslacoilsw.launcher.widget.DisabledSegmentSeekBar");
            DisabledSegmentSeekBar disabledSegmentSeekBar = (DisabledSegmentSeekBar) view;
            if (disabledSegmentSeekBar.T != iT) {
                disabledSegmentSeekBar.T = iT;
                disabledSegmentSeekBar.invalidate();
            }
            fancyPrefDisabledSegmentSeekBarView.U = iB;
            fancyPrefDisabledSegmentSeekBarView.P(fancyPrefDisabledSegmentSeekBarView.K());
            if (iB >= ((c) Z()).f92282d.Q || ((c) Z()).f92282d.K() < iB) {
                ((c) Z()).f92281c.setVisibility(8);
            } else {
                ((c) Z()).f92281c.setText(2132018015);
                ((c) Z()).f92281c.setVisibility(0);
            }
            int childCount = ((c) Z()).o.getChildCount();
            for (int i14 = 0; i14 < childCount; i14++) {
                View childAt = ((c) Z()).o.getChildAt(i14);
                Intrinsics.e(childAt, "null cannot be cast to non-null type com.android.launcher3.BubbleTextView");
                BubbleTextView bubbleTextView = (BubbleTextView) childAt;
                f fVar5 = this.f45958u;
                if (fVar5 == null) {
                    Intrinsics.m("cellSpecs");
                    throw th2;
                }
                bubbleTextView.r(fVar5);
            }
            g gVar3 = this.f45963z;
            if (gVar3 == null) {
                Intrinsics.m(TTConst.TRACK_TYPE);
                throw th2;
            }
            if (gVar3 == g.f77084b && ((sy.c) y2.f51877a.B().l()).f87828c) {
                int dimensionPixelSize2 = getResources().getDimensionPixelSize(2131165450);
                int dimensionPixelSize3 = getResources().getDimensionPixelSize(2131165447);
                f fVar6 = this.f45958u;
                if (fVar6 == null) {
                    Intrinsics.m("cellSpecs");
                    throw th2;
                }
                float f12 = fVar6.f77076i;
                Paint paint = this.A;
                paint.setTextSize(f12);
                Paint.FontMetrics fontMetrics = paint.getFontMetrics();
                f fVar7 = this.f45958u;
                if (fVar7 == null) {
                    Intrinsics.m("cellSpecs");
                    throw th2;
                }
                int iCeil = (int) Math.ceil(Math.ceil(fontMetrics.bottom - fontMetrics.top) * (fVar7.f77069b.f77129g ? 1.0f : 2.02f));
                f fVar8 = this.f45958u;
                if (fVar8 != null) {
                    ((c) Z()).o.getLayoutParams().height = (dimensionPixelSize3 * 4) + fVar8.f77071d + (fVar8.f77069b.f77124b ? dimensionPixelSize2 + iCeil : 0);
                    return;
                } else {
                    Intrinsics.m("cellSpecs");
                    throw th2;
                }
            }
            return;
        }
        th2 = null;
        z0 z0Var = j0VarP.f77131a;
        i5 = z0Var.f80268a;
        i11 = z0Var.f80269b;
        int i15 = i5;
        iD = i11;
        iE = i15;
        Size sizeF2 = j0VarP.f(resources, gVar2);
        int i122 = j0VarP.f77170u0;
        float fMin2 = Math.min((sizeF2.getWidth() / iD) / i122, io.sentry.config.a.z(fVar3, sizeF2.getHeight() / iE, i122));
        if (fMin2 >= fK) {
        }
        fVar = this.f45958u;
        if (fVar != null) {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:93:0x03fb  */
    /* JADX WARN: Type inference failed for: r0v21, types: [java.lang.Object, kotlin.Lazy] */
    @Override // f10.q, androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onCreate(Bundle bundle) throws Throwable {
        s2 s2VarS;
        super.onCreate(bundle);
        if (getIntent() == null || !getIntent().hasExtra("category")) {
            finish();
            return;
        }
        String stringExtra = getIntent().getStringExtra("category");
        if (stringExtra == null) {
            stringExtra = "DESKTOP";
        }
        g gVarValueOf = g.valueOf(stringExtra);
        this.f45963z = gVarValueOf;
        if (gVarValueOf == null) {
            Intrinsics.m(TTConst.TRACK_TYPE);
            throw null;
        }
        int iOrdinal = gVarValueOf.ordinal();
        int i5 = 3;
        int i11 = 1;
        if (iOrdinal == 0) {
            s2VarS = y2.f51877a.s();
        } else if (iOrdinal == 1) {
            y2.f51877a.getClass();
            s2VarS = y2.C();
        } else if (iOrdinal == 2) {
            s2VarS = y2.f51877a.K();
        } else {
            if (iOrdinal != 3) {
                throw new NoWhenBranchMatchedException();
            }
            y2.f51877a.getClass();
            s2VarS = y2.h0();
        }
        this.f45961x = s2VarS;
        g gVar = this.f45963z;
        if (gVar == null) {
            Intrinsics.m(TTConst.TRACK_TYPE);
            throw null;
        }
        s2 s2Var = this.f45961x;
        if (s2Var == null) {
            Intrinsics.m("cellSpecsPref");
            throw null;
        }
        int i12 = 0;
        this.f45958u = new f(gVar, j.a((j) s2Var.l(), 0.0f, false, 0.0f, false, null, false, false, 255), false);
        ((c) Z()).f92279a.setOnApplyWindowInsetsListener(new e10.j(this, i11));
        ((c) Z()).f92292p.setOnTouchListener(new y0(0));
        ((c) Z()).f92280b.setOnClickListener(new ay.k(this, 15));
        int iN = bh.g.N((DisplayMetrics) this.f45957t.getValue(), 16);
        g gVar2 = this.f45963z;
        if (gVar2 == null) {
            Intrinsics.m(TTConst.TRACK_TYPE);
            throw null;
        }
        int iOrdinal2 = gVar2.ordinal();
        if (iOrdinal2 == 0) {
            this.f45962y = C().f90098a;
            ((c) Z()).f92283e.setVisibility(8);
        } else if (iOrdinal2 == 1) {
            this.f45962y = C().f90100c;
            if (((sy.c) y2.f51877a.B().l()).f87828c) {
                getResources();
                ((c) Z()).o.setBackground(new sy.d());
                ViewGroup.LayoutParams layoutParams = ((c) Z()).o.getLayoutParams();
                Intrinsics.e(layoutParams, "null cannot be cast to non-null type android.widget.RelativeLayout.LayoutParams");
                ((RelativeLayout.LayoutParams) layoutParams).addRule(15, 1);
            }
        } else if (iOrdinal2 == 2) {
            this.f45962y = C().f90099b;
            View viewFindViewById = findViewById(2131428626);
            v vVar = this.f45962y;
            if (vVar == null) {
                Intrinsics.m("surfaceScheme");
                throw null;
            }
            viewFindViewById.setBackgroundColor(vVar.f90178a);
            ((c) Z()).f92280b.setColorFilter(e.n((g30.b) g30.b.f57016l.h(this), -1, -16777216, 0, -16777216));
            Window window = getWindow();
            v vVar2 = this.f45962y;
            if (vVar2 == null) {
                Intrinsics.m("surfaceScheme");
                throw null;
            }
            window.setStatusBarColor(r4.a.j(1023410176, vVar2.f90178a));
        } else {
            if (iOrdinal2 != 3) {
                throw new NoWhenBranchMatchedException();
            }
            this.f45962y = C().f90102e;
            v vVar3 = this.f45962y;
            if (vVar3 == null) {
                Intrinsics.m("surfaceScheme");
                throw null;
            }
            LightingColorFilter lightingColorFilter = new LightingColorFilter(vVar3.f90178a, Color.rgb(0, 0, 0));
            Drawable drawable = getDrawable(2131232105);
            Intrinsics.d(drawable);
            drawable.setColorFilter(lightingColorFilter);
            drawable.setAlpha(((n0) y2.f51877a.j0().l()).b());
            ((c) Z()).o.setBackground(drawable);
            ((c) Z()).o.setPadding(iN, 0, iN, 0);
        }
        FancyPrefDisabledSegmentSeekBarView fancyPrefDisabledSegmentSeekBarView = ((c) Z()).f92282d;
        s2 s2Var2 = this.f45961x;
        if (s2Var2 == null) {
            Intrinsics.m("cellSpecsPref");
            throw null;
        }
        fancyPrefDisabledSegmentSeekBarView.M(MathKt.b(((j) s2Var2.l()).b() * 100));
        FancyPrefCheckableView fancyPrefCheckableView = ((c) Z()).f92291m;
        s2 s2Var3 = this.f45961x;
        if (s2Var3 == null) {
            Intrinsics.m("cellSpecsPref");
            throw null;
        }
        fancyPrefCheckableView.setChecked(((j) s2Var3.l()).f77124b);
        s2 s2Var4 = this.f45961x;
        if (s2Var4 == null) {
            Intrinsics.m("cellSpecsPref");
            throw null;
        }
        this.f45960w = ((j) s2Var4.l()).f77128f;
        s2 s2Var5 = this.f45961x;
        if (s2Var5 == null) {
            Intrinsics.m("cellSpecsPref");
            throw null;
        }
        this.f45959v = ((j) s2Var5.l()).f77125c;
        FancyPrefColorView fancyPrefColorView = ((c) Z()).f92284f;
        v vVar4 = this.f45962y;
        if (vVar4 == null) {
            Intrinsics.m("surfaceScheme");
            throw null;
        }
        fancyPrefColorView.L(vVar4.f90179b);
        FancyPrefCheckableView fancyPrefCheckableView2 = ((c) Z()).f92287i;
        s2 s2Var6 = this.f45961x;
        if (s2Var6 == null) {
            Intrinsics.m("cellSpecsPref");
            throw null;
        }
        fancyPrefCheckableView2.setChecked(((j) s2Var6.l()).f77127e);
        FancyPrefCheckableView fancyPrefCheckableView3 = ((c) Z()).f92288j;
        s2 s2Var7 = this.f45961x;
        if (s2Var7 == null) {
            Intrinsics.m("cellSpecsPref");
            throw null;
        }
        fancyPrefCheckableView3.setChecked(((j) s2Var7.l()).f77129g);
        Context context = g0.f77088a;
        h0 h0VarO = g0.g().O();
        gz.f fVar = (gz.f) h0VarO.f56253h.f56363e;
        gz.k kVar = gz.k.f58657b;
        if (fVar.isEmpty()) {
            fVar = kVar;
        }
        int childCount = ((c) Z()).o.getChildCount();
        for (int i13 = 0; i13 < childCount; i13++) {
            BubbleTextView bubbleTextView = (BubbleTextView) z2.V(((c) Z()).o, i13);
            Object tag = bubbleTextView.getTag();
            Intrinsics.e(tag, "null cannot be cast to non-null type kotlin.String");
            ComponentName componentNameUnflattenFromString = ComponentName.unflattenFromString((String) tag);
            Intrinsics.d(componentNameUnflattenFromString);
            Bitmap bitmapC = fVar.c(this, h0VarO, componentNameUnflattenFromString);
            if (bitmapC == null) {
                Object tag2 = bubbleTextView.getTag();
                Intrinsics.e(tag2, "null cannot be cast to non-null type kotlin.String");
                ComponentName componentNameUnflattenFromString2 = ComponentName.unflattenFromString((String) tag2);
                Intrinsics.d(componentNameUnflattenFromString2);
                bitmapC = kVar.c(this, h0VarO, componentNameUnflattenFromString2);
                Intrinsics.d(bitmapC);
            }
            bubbleTextView.O(new n(bitmapC, 0, false));
        }
        ((c) Z()).f92282d.C = new l(2, this, IconLayoutSettingsActivity.class, "updateSpecs", "updateSpecs(Ljava/lang/Object;Ljava/lang/Object;)V", 0, 9);
        FancyPrefCheckableView fancyPrefCheckableView4 = ((c) Z()).f92283e;
        f fVar2 = this.f45958u;
        if (fVar2 == null) {
            Intrinsics.m("cellSpecs");
            throw null;
        }
        fancyPrefCheckableView4.setChecked(fVar2.f77069b.f77130h);
        ((c) Z()).f92283e.C = new bu.k(this, 17);
        int i14 = 0;
        int i15 = 2;
        ((c) Z()).f92291m.C = new l(i15, this, IconLayoutSettingsActivity.class, "updateSpecs", "updateSpecs(Ljava/lang/Object;Ljava/lang/Object;)V", i14, 10);
        ((c) Z()).f92287i.C = new l(i15, this, IconLayoutSettingsActivity.class, "updateSpecs", "updateSpecs(Ljava/lang/Object;Ljava/lang/Object;)V", i14, 11);
        ((c) Z()).f92284f.C = new l(i15, this, IconLayoutSettingsActivity.class, "updateSpecs", "updateSpecs(Ljava/lang/Object;Ljava/lang/Object;)V", i14, 12);
        ((c) Z()).f92288j.C = new l(i15, this, IconLayoutSettingsActivity.class, "updateSpecs", "updateSpecs(Ljava/lang/Object;Ljava/lang/Object;)V", i14, 13);
        String[] stringArray = getResources().getStringArray(2130903093);
        b1 b1Var = new b1(this, stringArray, getResources().getTextArray(2130903092));
        b1Var.setDropDownViewResource(17367049);
        ((c) Z()).f92285g.setAdapter((SpinnerAdapter) b1Var);
        int length = stringArray.length;
        int i16 = 0;
        while (true) {
            if (i16 >= length) {
                break;
            }
            if (Intrinsics.b(this.f45960w, stringArray[i16])) {
                ((c) Z()).f92285g.setSelection(i16);
                break;
            }
            i16++;
        }
        ((c) Z()).f92285g.setOnItemSelectedListener(new e10.z0(stringArray, this));
        SeekBar seekBar = ((c) Z()).f92290l;
        float f11 = this.f45959v;
        if (f11 <= 11.0f) {
            i5 = 0;
        } else if (f11 <= 12.0f) {
            i5 = 1;
        } else if (f11 > 13.0f) {
            if (f11 > 14.4f) {
                i5 = f11 <= 16.0f ? 4 : f11 <= 18.0f ? 5 : f11 <= 21.0f ? 6 : 2;
            }
        }
        seekBar.setProgress(i5);
        ((c) Z()).f92290l.setOnSeekBarChangeListener(new a1(this, i12));
        c0(this);
    }

    @Override // android.app.Activity
    public final boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332) {
            return super.onOptionsItemSelected(menuItem);
        }
        onBackPressed();
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0036  */
    @Override // f10.q, androidx.fragment.app.m0, android.app.Activity
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onPause() {
        c2 c2Var;
        super.onPause();
        s2 s2Var = this.f45961x;
        if (s2Var == null) {
            Intrinsics.m("cellSpecsPref");
            throw null;
        }
        f fVar = this.f45958u;
        if (fVar == null) {
            Intrinsics.m("cellSpecs");
            throw null;
        }
        s2Var.h(fVar.f77069b);
        s2 s2Var2 = this.f45961x;
        if (s2Var2 == null) {
            Intrinsics.m("cellSpecsPref");
            throw null;
        }
        y2 y2Var = y2.f51877a;
        if (s2Var2.equals(y2Var.s())) {
            g0.a(null);
            t1 t1VarD = t1.d();
            if (t1VarD != null && (c2Var = t1VarD.f80133b) != null) {
                c2Var.n();
            }
        } else {
            s2 s2Var3 = this.f45961x;
            if (s2Var3 == null) {
                Intrinsics.m("cellSpecsPref");
                throw null;
            }
            if (s2Var3.equals(y2Var.K())) {
            }
        }
        ComponentName componentName = NovaLauncher.f45646r1;
        e0.O();
        Context context = g0.f77088a;
        g0.k(this);
        g0.p();
    }
}
