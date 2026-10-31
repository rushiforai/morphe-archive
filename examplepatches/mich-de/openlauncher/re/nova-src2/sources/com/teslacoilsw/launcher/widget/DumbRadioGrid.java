package com.teslacoilsw.launcher.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import je.f;
import kotlin.Metadata;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.SourceDebugExtension;
import l30.b;
import l30.c;
import l30.d;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\b\u0007\u0018\u00002\u00020\u0001:\u0004\b\t\n\u000bB\u0019\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\f"}, d2 = {"Lcom/teslacoilsw/launcher/widget/DumbRadioGrid;", "Lcom/teslacoilsw/launcher/widget/DumbGridLayout;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "l30/b", "l30/c", "l30/a", "l30/d", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class DumbRadioGrid extends DumbGridLayout {

    /* renamed from: f, reason: collision with root package name */
    public int f46404f;

    /* renamed from: g, reason: collision with root package name */
    public final l30.a f46405g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f46406h;

    /* renamed from: i, reason: collision with root package name */
    public c f46407i;

    /* renamed from: j, reason: collision with root package name */
    public final d f46408j;

    public DumbRadioGrid(@NotNull Context context, @NotNull AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f46404f = -1;
        d dVar = new d(this, 0);
        this.f46408j = dVar;
        this.f46405g = new l30.a(this, 0);
        super.setOnHierarchyChangeListener(dVar);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        if (view instanceof RadioButton) {
            RadioButton radioButton = (RadioButton) view;
            if (radioButton.isChecked()) {
                this.f46406h = true;
                int i11 = this.f46404f;
                if (i11 != -1) {
                    l(i11, false);
                }
                this.f46406h = false;
                int id2 = radioButton.getId();
                this.f46404f = id2;
                c cVar = this.f46407i;
                if (cVar != null) {
                    cVar.a(this, id2);
                }
            }
        }
        super.addView(view, i5, layoutParams);
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof RadioGroup.LayoutParams;
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new b(0);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new b(getContext(), attributeSet, 0);
    }

    public final void k(int i5) {
        if (i5 == -1 || i5 != this.f46404f) {
            int i11 = this.f46404f;
            if (i11 != -1) {
                l(i11, false);
            }
            if (i5 != -1) {
                l(i5, true);
            }
            this.f46404f = i5;
            c cVar = this.f46407i;
            if (cVar != null) {
                cVar.a(this, i5);
            }
        }
    }

    public final void l(int i5, boolean z11) {
        View viewFindViewById = findViewById(i5);
        if (viewFindViewById == null || !(viewFindViewById instanceof RadioButton)) {
            return;
        }
        ((RadioButton) viewFindViewById).setChecked(z11);
    }

    public final void m(Function2 function2) {
        this.f46407i = new f(function2, 11);
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        int i5 = this.f46404f;
        if (i5 != -1) {
            this.f46406h = true;
            l(i5, true);
            this.f46406h = false;
            int i11 = this.f46404f;
            this.f46404f = i11;
            c cVar = this.f46407i;
            if (cVar != null) {
                cVar.a(this, i11);
            }
        }
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        accessibilityEvent.setClassName("android.widget.RadioGroup");
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName("android.widget.RadioGroup");
    }

    @Override // android.view.View
    public final void setEnabled(boolean z11) {
        super.setEnabled(z11);
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            getChildAt(i5).setEnabled(z11);
        }
    }

    @Override // android.view.ViewGroup
    public final void setOnHierarchyChangeListener(ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener) {
        this.f46408j.f74637b = onHierarchyChangeListener;
    }
}
