package com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache;

import java.util.Comparator;
import java.util.TreeSet;

/* loaded from: classes3.dex */
public final class j implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final TreeSet f30324a = new TreeSet(this);

    /* renamed from: b, reason: collision with root package name */
    public long f30325b;

    public final void a(l lVar, long j11) {
        while (this.f30325b + j11 > 10485760) {
            try {
                g gVar = (g) this.f30324a.first();
                synchronized (lVar) {
                    lVar.a(gVar, true);
                }
            } catch (a unused) {
            }
        }
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        g gVar = (g) obj;
        g gVar2 = (g) obj2;
        long j11 = gVar.f30312f;
        long j12 = gVar2.f30312f;
        if (j11 - j12 != 0) {
            return j11 < j12 ? -1 : 1;
        }
        if (!gVar.f30307a.equals(gVar2.f30307a)) {
            return gVar.f30307a.compareTo(gVar2.f30307a);
        }
        long j13 = gVar.f30308b - gVar2.f30308b;
        if (j13 == 0) {
            return 0;
        }
        return j13 < 0 ? -1 : 1;
    }
}
