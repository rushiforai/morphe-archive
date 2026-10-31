package com.fyber.inneractive.sdk.player.exoplayer2.source;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class z {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ int f30247d = 0;

    /* renamed from: a, reason: collision with root package name */
    public final int f30248a;

    /* renamed from: b, reason: collision with root package name */
    public final y[] f30249b;

    /* renamed from: c, reason: collision with root package name */
    public int f30250c;

    static {
        new z(new y[0]);
    }

    public z(y... yVarArr) {
        this.f30249b = yVarArr;
        this.f30248a = yVarArr.length;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && z.class == obj.getClass()) {
            z zVar = (z) obj;
            if (this.f30248a == zVar.f30248a && Arrays.equals(this.f30249b, zVar.f30249b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        if (this.f30250c == 0) {
            this.f30250c = Arrays.hashCode(this.f30249b);
        }
        return this.f30250c;
    }
}
