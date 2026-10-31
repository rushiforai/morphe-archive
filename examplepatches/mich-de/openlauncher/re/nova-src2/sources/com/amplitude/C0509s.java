package com.amplitude;

import android.view.View;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Reflection;

/* renamed from: com.amplitude.s, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0509s extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f20743a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0509s(View view) {
        super(0);
        this.f20743a = view;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.k("ComposeView root node is null. Skipping. ", Reflection.f71864a.getOrCreateKotlinClass(this.f20743a.getClass()).getSimpleName());
    }
}
