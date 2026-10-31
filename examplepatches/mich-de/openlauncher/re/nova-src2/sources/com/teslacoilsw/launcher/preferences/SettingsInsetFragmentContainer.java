package com.teslacoilsw.launcher.preferences;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCardBorderView;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import lx.e;
import o9.r0;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u001d\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/SettingsInsetFragmentContainer;", "Landroid/widget/FrameLayout;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class SettingsInsetFragmentContainer extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public final Rect f45988a;

    @JvmOverloads
    public SettingsInsetFragmentContainer(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f45988a = new Rect();
    }

    public static FancyPrefCardBorderView b(View view) {
        if (view == null) {
            return null;
        }
        View viewB = e.b(view);
        FancyPrefCardBorderView fancyPrefCardBorderView = viewB instanceof FancyPrefCardBorderView ? (FancyPrefCardBorderView) viewB : null;
        return fancyPrefCardBorderView == null ? b(viewB) : fancyPrefCardBorderView;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void a() {
        if (getChildCount() == 0) {
            return;
        }
        View childAt = getChildAt(0);
        ViewGroup.LayoutParams layoutParams = childAt.getLayoutParams();
        Intrinsics.e(layoutParams, "null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams");
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        Rect rect = this.f45988a;
        marginLayoutParams.leftMargin = rect.left;
        marginLayoutParams.rightMargin = rect.right;
        if (childAt instanceof r0) {
            if (childAt.getId() != 2131428816) {
                ((r0) childAt).h(rect);
                return;
            }
            Rect rect2 = new Rect(rect);
            rect2.top = 0;
            ((r0) childAt).h(rect2);
            ViewGroup.LayoutParams layoutParams2 = childAt.getLayoutParams();
            Intrinsics.e(layoutParams2, "null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams");
            ((ViewGroup.MarginLayoutParams) layoutParams2).topMargin = getContext().getResources().getDimensionPixelSize(2131166387) + rect.top;
            return;
        }
        marginLayoutParams.topMargin = getContext().getResources().getDimensionPixelSize(2131166387) + rect.top;
        FancyPrefCardBorderView fancyPrefCardBorderViewB = b(this);
        if (fancyPrefCardBorderViewB != null) {
            fancyPrefCardBorderViewB.setMinimumHeight(w20.e.k(32) + rect.bottom);
            return;
        }
        View viewB = e.b(this);
        ViewGroup.LayoutParams layoutParams3 = viewB != null ? viewB.getLayoutParams() : null;
        ViewGroup.MarginLayoutParams marginLayoutParams2 = layoutParams3 instanceof ViewGroup.MarginLayoutParams ? (ViewGroup.MarginLayoutParams) layoutParams3 : null;
        if (marginLayoutParams2 != null) {
            marginLayoutParams2.bottomMargin = rect.bottom;
        }
    }

    @Override // android.view.ViewGroup
    public final void addView(View view) {
        super.addView(view);
        a();
    }
}
