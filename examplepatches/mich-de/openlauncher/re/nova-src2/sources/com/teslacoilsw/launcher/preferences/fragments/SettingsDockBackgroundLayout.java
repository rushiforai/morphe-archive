package com.teslacoilsw.launcher.preferences.fragments;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import o9.r0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fragments/SettingsDockBackgroundLayout;", "Landroid/widget/LinearLayout;", "Lo9/r0;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class SettingsDockBackgroundLayout extends LinearLayout implements r0 {

    /* renamed from: a, reason: collision with root package name */
    public SettingsDockBackground f46086a;

    /* renamed from: b, reason: collision with root package name */
    public final Rect f46087b;

    /* renamed from: c, reason: collision with root package name */
    public View f46088c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f46089d;

    public SettingsDockBackgroundLayout(@NotNull Context context, @NotNull AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f46087b = new Rect();
    }

    public final void a() {
        View view = this.f46088c;
        if (view == null) {
            Intrinsics.m("previewFrame");
            throw null;
        }
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        View view2 = this.f46088c;
        if (view2 == null) {
            Intrinsics.m("previewFrame");
            throw null;
        }
        int minimumHeight = view2.getMinimumHeight();
        int i5 = this.f46087b.bottom;
        layoutParams.height = minimumHeight + i5;
        View view3 = this.f46088c;
        if (view3 == null) {
            Intrinsics.m("previewFrame");
            throw null;
        }
        if (!this.f46089d) {
            i5 = 0;
        }
        view3.setPadding(view3.getPaddingLeft(), view3.getPaddingTop(), view3.getPaddingRight(), i5);
    }

    @Override // o9.r0
    public final void h(Rect rect) {
        this.f46087b.set(rect);
        a();
        SettingsDockBackground settingsDockBackground = this.f46086a;
        if (settingsDockBackground != null) {
            settingsDockBackground.z();
        }
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.f46088c = findViewById(2131428626);
    }
}
