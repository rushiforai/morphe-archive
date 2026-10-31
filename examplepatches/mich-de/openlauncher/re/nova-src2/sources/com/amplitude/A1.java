package com.amplitude;

import java.io.File;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class A1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f20180a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public A1(Ref.ObjectRef objectRef) {
        super(0);
        this.f20180a = objectRef;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return "Wrote to file: " + ((File) this.f20180a.f71863a).getPath() + " size=" + ((File) this.f20180a.f71863a).length();
    }
}
