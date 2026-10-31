package io.branch.search.internal;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import java.util.HashSet;
import java.util.Set;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.v9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3418v9 implements InterfaceC3401u9 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final ConnectivityManager f66177a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final int[] f66178b;

    public C3418v9(@NotNull Context context) {
        Intrinsics.g(context, "context");
        Object systemService = context.getSystemService("connectivity");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
        this.f66177a = (ConnectivityManager) systemService;
        this.f66178b = new int[]{2, 0, 3, 1};
    }

    @Override // io.branch.search.internal.InterfaceC3401u9
    @NotNull
    public final Set<Integer> a() {
        Network activeNetwork = this.f66177a.getActiveNetwork();
        if (activeNetwork == null) {
            return EmptySet.f71734a;
        }
        NetworkCapabilities networkCapabilities = this.f66177a.getNetworkCapabilities(activeNetwork);
        if (networkCapabilities == null) {
            return EmptySet.f71734a;
        }
        HashSet hashSet = new HashSet();
        for (int i5 : this.f66178b) {
            if (networkCapabilities.hasTransport(i5)) {
                hashSet.add(Integer.valueOf(i5));
            }
        }
        return hashSet;
    }

    @Override // io.branch.search.internal.InterfaceC3401u9
    @Nullable
    public final Network b() {
        return this.f66177a.getActiveNetwork();
    }

    @Override // io.branch.search.internal.InterfaceC3401u9
    @Nullable
    public final NetworkCapabilities c() {
        Network activeNetwork = this.f66177a.getActiveNetwork();
        if (activeNetwork == null) {
            return null;
        }
        return this.f66177a.getNetworkCapabilities(activeNetwork);
    }

    @Override // io.branch.search.internal.InterfaceC3401u9
    @NotNull
    public final Network[] d() {
        Network[] allNetworks = this.f66177a.getAllNetworks();
        Intrinsics.f(allNetworks, "connectivityManager.getAllNetworks()");
        return allNetworks;
    }

    @Override // io.branch.search.internal.InterfaceC3401u9
    @Nullable
    public final NetworkCapabilities a(@NotNull Network network) {
        Intrinsics.g(network, "network");
        return this.f66177a.getNetworkCapabilities(network);
    }
}
