package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.v1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0526v1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f20791a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0526v1(String str) {
        super(0);
        this.f20791a = str;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.k("Clear data block - Unable to locate stored data for ", this.f20791a);
    }
}
