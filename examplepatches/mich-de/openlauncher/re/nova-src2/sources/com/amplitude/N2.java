package com.amplitude;

import android.view.View;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class N2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f20335a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public N2(View view) {
        super(0);
        this.f20335a = view;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        View view = this.f20335a;
        return "[attachToView] view=" + view + ". Visible: " + (view.getVisibility() == 0);
    }
}
