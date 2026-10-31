package io.branch.search.internal;

import android.app.usage.NetworkStats;
import android.net.Network;
import android.net.NetworkCapabilities;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class B9 implements A9 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F2 f62138a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC3401u9 f62139b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Ye f62140c;

    /* renamed from: d, reason: collision with root package name */
    public long f62141d;

    public B9(@NotNull G2 remoteConfigManager, @NotNull C3418v9 networkDataSource, @NotNull Ze transferDataSource, @NotNull I analyticalBufferRepository) {
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(networkDataSource, "networkDataSource");
        Intrinsics.g(transferDataSource, "transferDataSource");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        this.f62138a = remoteConfigManager;
        this.f62139b = networkDataSource;
        this.f62140c = transferDataSource;
        this.f62141d = System.currentTimeMillis();
    }

    @Override // io.branch.search.internal.A9
    @NotNull
    public final Set<Integer> a() {
        return this.f62139b.a();
    }

    @Override // io.branch.search.internal.A9
    public final boolean b() {
        if (this.f62139b.c() != null) {
            return !r0.hasCapability(11);
        }
        return false;
    }

    @Override // io.branch.search.internal.A9
    @NotNull
    public final String c() {
        Network networkB = this.f62139b.b();
        if (networkB == null) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String strE = (String) a(this.f62139b.a(networkB)).f71683a;
        if (b()) {
            strE = b.c0.E(strE, ":metered");
        }
        return strE == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strE;
    }

    @Override // io.branch.search.internal.A9
    public final void d() {
        this.f62141d = System.currentTimeMillis();
    }

    @Override // io.branch.search.internal.A9
    public final boolean e() {
        NetworkCapabilities networkCapabilitiesC = this.f62139b.c();
        if (networkCapabilitiesC == null) {
            return false;
        }
        boolean zHasCapability = networkCapabilitiesC.hasCapability(12);
        boolean zHasCapability2 = networkCapabilitiesC.hasCapability(16);
        if (!networkCapabilitiesC.hasTransport(4) || zHasCapability) {
            return zHasCapability && zHasCapability2;
        }
        for (Network network : this.f62139b.d()) {
            NetworkCapabilities networkCapabilitiesA = this.f62139b.a(network);
            if (networkCapabilitiesA == null || !networkCapabilitiesA.hasCapability(12) || !networkCapabilitiesA.hasCapability(16)) {
            }
        }
    }

    @Override // io.branch.search.internal.A9
    public final boolean isConnected() {
        NetworkCapabilities networkCapabilitiesC = this.f62139b.c();
        return networkCapabilitiesC != null && networkCapabilitiesC.hasCapability(12) && networkCapabilitiesC.hasCapability(16);
    }

    @Override // io.branch.search.internal.A9
    @NotNull
    public final C3435w9 a(@NotNull C3262m5 dateProvider) {
        Intrinsics.g(dateProvider, "dateProvider");
        long jCurrentTimeMillis = System.currentTimeMillis();
        long j11 = jCurrentTimeMillis - this.f62141d;
        Network[] networkArrD = this.f62139b.d();
        ArrayList arrayList = new ArrayList(networkArrD.length);
        for (Network network : networkArrD) {
            arrayList.add(a(this.f62139b.a(network)));
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Pair pair = (Pair) it.next();
            String str = (String) pair.f71683a;
            Integer num = (Integer) pair.f71684b;
            Pair pair2 = (str == null || num == null) ? null : new Pair(str, num);
            if (pair2 != null) {
                arrayList2.add(pair2);
            }
        }
        int iD0 = b70.k.d0(b70.c.u0(arrayList2, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            Pair pair3 = (Pair) it2.next();
            String str2 = (String) pair3.f71683a;
            NetworkStats.Bucket bucketA = this.f62140c.a(((Number) pair3.f71684b).intValue(), this.f62141d, jCurrentTimeMillis);
            linkedHashMap.put(str2, new C9(bucketA.getRxBytes(), bucketA.getTxBytes(), bucketA.getRxPackets(), bucketA.getTxPackets()));
        }
        List<C3383t8> list = this.f62138a.a().f65375r;
        ArrayList arrayList3 = new ArrayList(b70.c.u0(list, 10));
        for (C3383t8 c3383t8 : list) {
            arrayList3.add(new C3417v8(c3383t8, this.f62140c.a(c3383t8, dateProvider)));
        }
        return new C3435w9(j11, new C3384t9(linkedHashMap, arrayList3));
    }

    public static Pair a(NetworkCapabilities networkCapabilities) {
        if (networkCapabilities != null) {
            if (networkCapabilities.hasTransport(1)) {
                return new Pair("wifi", 1);
            }
            if (networkCapabilities.hasTransport(0)) {
                return new Pair("cellular", 0);
            }
            if (networkCapabilities.hasTransport(3)) {
                return new Pair("ethernet", 3);
            }
            if (networkCapabilities.hasTransport(2)) {
                return new Pair("bluetooth", 2);
            }
        }
        return new Pair(null, null);
    }
}
