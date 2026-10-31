package com.google.android.gms.internal.measurement;

import com.google.android.gms.common.api.ApiException;
import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes3.dex */
public final /* synthetic */ class gc implements cl.d0 {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ gc f32569b = new gc(0);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ gc f32570c = new gc(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32571a;

    public /* synthetic */ gc(int i5) {
        this.f32571a = i5;
    }

    @Override // cl.d0
    public final ListenableFuture apply(Object obj) {
        switch (this.f32571a) {
            case 0:
                ApiException apiException = (ApiException) obj;
                throw new zzmk(apiException.f31794a.f31810f, apiException.getMessage(), apiException);
            case 1:
                throw null;
            default:
                return cl.w0.b(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
    }
}
