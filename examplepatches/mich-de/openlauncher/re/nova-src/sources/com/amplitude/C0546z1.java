package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.z1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0546z1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f20833a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f20834b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0546z1(String str, String str2) {
        super(0);
        this.f20833a = str;
        this.f20834b = str2;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.m("New Current file ", this.f20833a, " is full, switching to new file ", this.f20834b);
    }
}
