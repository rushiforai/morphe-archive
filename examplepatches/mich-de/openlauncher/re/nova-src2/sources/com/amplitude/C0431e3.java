package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.e3, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0431e3 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f20554a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0431e3(String str) {
        super(0);
        this.f20554a = str;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.k("View Hierarchy:\n", this.f20554a);
    }
}
