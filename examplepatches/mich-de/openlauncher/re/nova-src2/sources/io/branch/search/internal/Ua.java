package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Ua extends Lambda implements Function0<Long> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Va f63454a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Ua(Va va2) {
        super(0);
        this.f63454a = va2;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        long length;
        try {
            length = this.f63454a.f63538b.length();
        } catch (Exception unused) {
            length = -1;
        }
        return Long.valueOf(length);
    }
}
