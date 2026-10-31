package com.fyber.inneractive.sdk.player.exoplayer2.source;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final int f30244a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.o[] f30245b;

    /* renamed from: c, reason: collision with root package name */
    public int f30246c;

    public y(com.fyber.inneractive.sdk.player.exoplayer2.o... oVarArr) {
        if (oVarArr.length <= 0) {
            throw new IllegalStateException();
        }
        this.f30245b = oVarArr;
        this.f30244a = oVarArr.length;
    }

    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.o oVar) {
        int i5 = 0;
        while (true) {
            com.fyber.inneractive.sdk.player.exoplayer2.o[] oVarArr = this.f30245b;
            if (i5 >= oVarArr.length) {
                return -1;
            }
            if (oVar == oVarArr[i5]) {
                return i5;
            }
            i5++;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && y.class == obj.getClass()) {
            y yVar = (y) obj;
            if (this.f30244a == yVar.f30244a && Arrays.equals(this.f30245b, yVar.f30245b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        if (this.f30246c == 0) {
            this.f30246c = Arrays.hashCode(this.f30245b) + 527;
        }
        return this.f30246c;
    }
}
