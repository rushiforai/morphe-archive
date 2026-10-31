package com.amplitude;

import java.util.ArrayList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class D3 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ArrayList f20214a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ P3 f20215b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public D3(ArrayList arrayList, P3 p32) {
        super(0);
        this.f20214a = arrayList;
        this.f20215b = p32;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return h6.c1.n(this.f20214a.size(), "Uploaded ", " rrweb events, ", this.f20215b.f20361c, " bytes uploaded.");
    }
}
