package io.branch.search.internal;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class S2 extends Lambda implements Function0<Boolean> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ConnectivityManager f63317a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public S2(ConnectivityManager connectivityManager) {
        super(0);
        this.f63317a = connectivityManager;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        ConnectivityManager connectivityManager = this.f63317a;
        NetworkInfo activeNetworkInfo = connectivityManager != null ? connectivityManager.getActiveNetworkInfo() : null;
        return Boolean.valueOf(this.f63317a == null || (activeNetworkInfo != null && activeNetworkInfo.isConnected()));
    }
}
