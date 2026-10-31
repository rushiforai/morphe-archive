package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.v, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0524v extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C0529w f20786a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0524v(C0529w c0529w) {
        super(0);
        this.f20786a = c0529w;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        C0529w c0529w = this.f20786a;
        return h6.c1.n(c0529w.f20795b, "Bandwidth limit of ", " bytes reached, already sent ", c0529w.f20798e, " today");
    }
}
