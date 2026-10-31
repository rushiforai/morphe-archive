package com.amplitude;

import java.util.ArrayList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class C3 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ArrayList f20200a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3(ArrayList arrayList) {
        super(0);
        this.f20200a = arrayList;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.i(this.f20200a.size(), "Uploading ", " rrweb events.");
    }
}
