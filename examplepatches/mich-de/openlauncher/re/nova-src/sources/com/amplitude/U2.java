package com.amplitude;

import android.view.View;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class U2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f20399a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public U2(View view) {
        super(0);
        this.f20399a = view;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return "[detachFromView] view=" + this.f20399a;
    }
}
