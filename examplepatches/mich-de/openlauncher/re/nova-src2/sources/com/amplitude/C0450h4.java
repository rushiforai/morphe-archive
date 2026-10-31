package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.h4, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0450h4 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ G3 f20607a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0450h4(G3 g32) {
        super(0);
        this.f20607a = g32;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return "Upload already in progress. Waiting for pending upload to complete. uri=" + this.f20607a.f20718e;
    }
}
