package com.teslacoilsw.launcher.ads;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import androidx.compose.ui.platform.ComposeView;
import com.android.launcher3.allapps.FloatingHeaderView;
import d20.f;
import dx.i0;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import q9.v;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B\u001d\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\f²\u0006\f\u0010\t\u001a\u00020\b8\nX\u008a\u0084\u0002²\u0006\f\u0010\u000b\u001a\u00020\n8\nX\u008a\u0084\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/ads/DrawerAdFloatingHeaderView;", "Ld20/f;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "Ldx/b0;", "state", "Le10/d0;", "drawerStyle", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class DrawerAdFloatingHeaderView extends f {

    /* renamed from: f, reason: collision with root package name */
    public boolean f45680f;

    /* renamed from: g, reason: collision with root package name */
    public FloatingHeaderView f45681g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f45682h;

    /* renamed from: i, reason: collision with root package name */
    public FrameLayout f45683i;

    /* renamed from: j, reason: collision with root package name */
    public ComposeView f45684j;

    /* renamed from: k, reason: collision with root package name */
    public i0 f45685k;

    @JvmOverloads
    public DrawerAdFloatingHeaderView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        setVisibility(8);
    }

    @Override // q9.v
    /* renamed from: a, reason: from getter */
    public final boolean getF45680f() {
        return this.f45680f;
    }

    @Override // d20.f, q9.v
    public final void f(FloatingHeaderView floatingHeaderView, v[] vVarArr, boolean z11) {
        this.f45681g = floatingHeaderView;
    }

    @Override // q9.v
    public final int getExpectedHeight() {
        if (this.f45680f) {
            return getMeasuredHeight() > 0 ? getMeasuredHeight() : (int) (160 * getResources().getDisplayMetrics().density);
        }
        return 0;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ComposeView composeView = this.f45684j;
        if (composeView != null) {
            removeView(composeView);
        }
        this.f45684j = null;
        i0 i0Var = this.f45685k;
        if (i0Var != null) {
            i0Var.a();
        }
        this.f45685k = null;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        FloatingHeaderView floatingHeaderView;
        int measuredHeight = getMeasuredHeight();
        super.onMeasure(i5, i11);
        if (measuredHeight == getMeasuredHeight() || (floatingHeaderView = this.f45681g) == null) {
            return;
        }
        floatingHeaderView.onHeightUpdated();
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        FloatingHeaderView floatingHeaderView;
        super.onSizeChanged(i5, i11, i12, i13);
        if (i11 == i13 || (floatingHeaderView = this.f45681g) == null) {
            return;
        }
        floatingHeaderView.onHeightUpdated();
    }
}
