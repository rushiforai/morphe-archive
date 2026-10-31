package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.nc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3286nc extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ boolean f65391a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3286nc(boolean z11) {
        super(0);
        this.f65391a = z11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return "Initializing SSML? " + this.f65391a;
    }
}
