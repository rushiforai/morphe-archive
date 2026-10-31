package com.moloco.sdk.internal.services;

import android.content.Context;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.moloco.sdk.internal.services.AbstractC2955c;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* renamed from: com.moloco.sdk.internal.services.e, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public final class C2957e implements InterfaceC2956d {

    /* renamed from: b, reason: collision with root package name */
    public static final int f37946b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f37947a;

    public C2957e(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f37947a = context;
    }

    @Override // com.moloco.sdk.internal.services.InterfaceC2956d
    @NotNull
    public AbstractC2955c a() {
        Object objA;
        try {
            int i5 = Result.f71687b;
            objA = AdvertisingIdClient.getAdvertisingIdInfo(this.f37947a);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        AbstractC2955c aVar = null;
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        AdvertisingIdClient.Info info = (AdvertisingIdClient.Info) objA;
        if (info != null) {
            if (info.isLimitAdTrackingEnabled()) {
                aVar = AbstractC2955c.b.f37938b;
            } else {
                String id2 = info.getId();
                if (id2 != null) {
                    aVar = new AbstractC2955c.a(id2);
                }
            }
            if (aVar != null) {
                return aVar;
            }
        }
        return AbstractC2955c.b.f37938b;
    }
}
